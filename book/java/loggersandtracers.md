# Loggers and tracers

## Tracers

* All tracers have to have a class to achieve a fine level of filtering. Then change the log4j properties to decide the different locations that the messages get sent to (i.e. general logs or console logs).

* A tracer is essentially just context and info on where to log.
















Class loaders - used to find the jars referenced in the main method. Liberty is weird: as an application server it means there can be multiple wars. The class loader that loads the class is the thing that isolates and allows for process separation within a process. 
