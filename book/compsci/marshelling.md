# Marshalling and Serialisation

## Marshalling

Marshalling is the process of transforming the memory representation of an object to a data format suitable for storage or transmission. It simplifies complex communication, using composite objects in order to communicate instead of primitives.

The inverse of marshalling is called unmarshalling.

It is possible for an object to the marshalled by reference, in which case the data 'on the wire' is simply location inforation for the original object.

## Serialisation

Marshalling is about getting parameters from here to there, whilst serialisation is about copying structured data to or from a primitive form such as a byte stream.
