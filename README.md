#BCL Lab Research Journal By Hunter Lee
----------------------------


## Things to do ##

 - Set up Mesos and Marathon
 - Set up master and slaves
 - Install Spark on top of Mesos
 - Run SVMs in Spark
 - Find a dataset
 - Measure performance varying parameters (need to clarify--what changes? number of cores? number of slaves?)
 - Plot the performance data using R or Matlab ([quick plotting guide for R](http://www.statmethods.net/graphs/scatterplot.html))--already have RStudio/MATLAB installed.
 - Use Linux sed, vim text file processing, and UNIX reg. expressions
 - A good tutorial on using Spark mllib SVM ([here](https://github.com/mcapuccini/spark-tutorial))

## Things learned ##

 - Zookeeper is a Mesos dependency, so it comes with Mesos
 - Zookeeper adds fault-tolerance
 - Spark can sit on either Mesos or YARN
 - Spark is an improvement from MapReduce
 - Spark has a library called mllib that has machine learning features
 - RDD is a dataset format used by Apache Spark--data sharing is slow in MapReduce, but because of this new format, it is 10-100 times faster in Spark
 - Spark has built-in interactive shells for Scala and Python. Initially, I downloaded Eclipse for Scala, but decided to give the shell a try.
 - Big Data camp--Berkeley [AMP Camp](http://ampcamp.berkeley.edu/6/)

## Progress ##

 - Mesos is installed per instructions found [here](https://open.mesosphere.com/getting-started/install/)
 
 - Another source consulted was [this](https://www.digitalocean.com/community/tutorials/how-to-configure-a-production-ready-mesosphere-cluster-on-ubuntu-14-04)

    
    
 - So I switched gears, and installed Spark on a stand-alone mode
 - I spent an afternoon reading about SVMs--currently a little bit out of the scope of my academic knowledge, but will need to read up on this more
 - Came across a somewhat helpful tutorial [here](http://web.cs.ucla.edu/~mtgarip/linear.html)
 - Dataset I located is kddcup_challenge from 2010. At this point, my VM ran out of space so had to dig out for different datasets

## Difficulties ##

 - Ran into trouble: when I started mesos-master with zookeeper running in the background, it would shut off right away. Troubleshooting was not successful.
 
    `sudo service zookeeper start`
   `sudo service mesos-master start`
 - When trying to set up HDFS, I followed instructions found [here](http://www.michael-noll.com/tutorials/running-hadoop-on-ubuntu-linux-single-node-cluster/), but terminal would throw an error when I ran this: 
`sudo addgroup hadoop`
`sudo adduser --ingroup hadoop hduser`
 - Performed reboot after each install
 - Dataset that I downloaded had a different format from Spark's `sample_libsvm_data.txt`. I need to figure out a way to convert a particular dataset into a format that SVM library can read. (Converting it to RDD)


## Deliverables ##

- [Here](https://docs.google.com/spreadsheets/d/1-mFhtp_NncUUs5-h-z6MeQCSnZJQvV9UDCOnsH6N1ZY/edit?usp=sharing) is elapsed time measured by using  `System.nanoTime()` command.

![Elapsed Time (ns) vs Number of Cores](https://github.com/narendly/narendly.github.io/blob/master/Plot.png?raw=true)


## Script and Dataset ##

- Simple MATLAB Code used to plot
    cores = [1 2 3 4]; 
    times = [60009873189 50254953753 44273464774 42287467148]; 
    plot(cores, times); 
    xlabel('Number of Cores'); 
    ylabel('Elapsed Time (ns)'); 
    title('Performance Plot: Spark Standalone, Worker = 1, Memory = 1024MB');

