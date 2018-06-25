# Events and EventHandlers

The `EventChart` class holds all of the fundamental manipulations we can do on the chart.

# Commands and Actions

An action is a group of commands that can be undone/ redone.

The `ComnandsResponseCache` caches the response for the last request committed to a chart so that if the client does not receive the response (i.e. there is a network error) then the response can be sent again. To tell whether a request is the same, it must have the same **chart state ID**, as well as the same controllerId, chartVersion and fields.

#

Notes on A4 paper TODO.
