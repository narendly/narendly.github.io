#include <papi.h>

long long threshold = 1000000000; /*1B*/
/* long long threshold = 1000000000; /\*100M*\/ */
long long values[4];
long long previous_cycle = 0;
long long previous_l3_miss = 0;
long long previous_l3_access = 0;
long long total_cycle = 0;
long long total_inst = 0;
int EventSet = PAPI_NULL;

void handler(int EventSet, void *address, long_long overflow_vector, void *context) {
  /* Option 1: PAPI_read: do not stop or reset counter*/ 
  /* PAPI_read(EventSet, values); */
  /* long long interval_cycle = values[1] - previous_cycle; */
  /* long long interval_l3_miss = values[2] - previous_l3_miss;  */
  /* long long interval_l3_access = values[3] - previous_l3_access; */
  /* double ipc = (double)threshold/interval_cycle; */
  /* double mpki = (double)interval_l3_miss/1000000; */
  /* double miss_rate = (double)interval_l3_miss/interval_l3_access; */
  /* fprintf(stderr, "IPC: %.4lf MPKI: %.4lf Miss_Rate: %.4lf\n", ipc, mpki, miss_rate); */

  /* Option 2: PAPI_stop & PAPI_start: stop and reset counter */
  PAPI_stop(EventSet, values);
  long long interval_cycle = values[1];
  long long l3_miss = values[2];
  long long l3_access = values[3];
  double ipc = (double)threshold/interval_cycle;
  double mpki = (double)l3_miss/threshold*1000;
  double miss_rate = (double)l3_miss/l3_access;
  total_cycle += interval_cycle;
  total_inst += threshold;
  fprintf(stderr, "IPC: %.4lf MPKI: %.4lf Miss_Rate: %.4lf\n", ipc, mpki, miss_rate);
  PAPI_start(EventSet);
}

void papi_start() {
  int retval;
  retval = PAPI_library_init(PAPI_VER_CURRENT);
  if (retval != PAPI_VER_CURRENT && retval > 0) {
    fprintf(stderr,"PAPI library version mismatch!\n");
    exit(1); 
  }

  /* EventSet = PAPI_NULL; */
  PAPI_create_eventset(&EventSet);
  /* Total Instruction */
  PAPI_add_event(EventSet, PAPI_TOT_INS);
  /* Total Cycle */
  PAPI_add_event(EventSet, PAPI_TOT_CYC);
  /* Level 3 cache misses */
  PAPI_add_event(EventSet, PAPI_L3_TCM);
  /* Level 3 total cache accesses */
  PAPI_add_event(EventSet, PAPI_L3_TCA);

  retval = PAPI_overflow(EventSet, PAPI_TOT_INS, threshold, 0, handler);
  PAPI_start(EventSet);

}

void papi_stop() {
  PAPI_stop(EventSet, values);
  total_inst += values[0];
  total_cycle += values[1];
  double total_ipc = (double)total_inst/total_cycle;
  fprintf(stderr, "Total_Cycle: %lld Total_Instruction: %lld Total_IPC: %.4lf\n", total_cycle, total_inst, total_ipc);  
}
