# Ports

A port is an endpoint of communication in an operating system. A port is always associated with an IP address of a host and the protocol type of the communication, and this completes the destination or origination network address of a communication session. A port is identified for each address and protocol by a 16-bit number, commonly known as a port number.

## Scanning Ports on MacOS

```terminal
ifconfig | grep "inet " | grep -v 127.0.0.1
```

This returns the IP address, stripping out useless information and the localhost.

NB. 127.0.0.1 is the loopback Internet Protocol Address. It is used to establish an IP connection to the same machine being used by the end user.

One can go to Network Utility, in System Preferences, to perform a port scan and see what ports are in use.

Also, the following returns a summary of all the port usage:

`netstat`

  * `-n` : Show network addresses as numbers (as opposed to symbolically).
  * `-a` : With the default display, show the state of all sockets; normally sockets used by server processes are not shown.
  * `-p` : Show statistics about protocol, which is either a well-known name for a protocol or an alias for it.  A null response typically means that there are no interesting numbers to report.  The program will complain if protocol is unknown or if there is no statistics routine for it.

## Opening a port

* `nmap` (needs installing via brew)
  * `-p <port_number> localhost` : Check on the status of a port.
  * To open a port:
    `sudo vim /etc/pf.conf`

## Closing a port

To see what is occupying a specified port number, the following methods can be used:

```terminal
sudo lsof -i :<port_number>                     /interesting/ Will return the PID

netstat -nap | grep "80"                        

ps -aef | grep -i <pid>                         // Will return the name of the process
```

This will give you a **process ID (PID)** which can then be used to close the port:

```terminal
sudo kill -9 <PID>
```

The -9 refers to the **signal number**. These include, in order in which they should be tried (though note the only one that actually completely removes the bind is KILL, so this should be often be used):

* 15 - TERM (software termination signal)
* 1 - HUP (hang up)
* 2 - INT (interrupt)
* 9 - KILL (non-catchable, non-ignorable kill)
