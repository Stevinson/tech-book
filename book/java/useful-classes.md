## I/O Streams

There are three ways to write to a file - byte streams, character streams and buffered streams.

1. Byte streams:

All byte stream classes are descended from **InputStream** and **OutputStream**.

1.  Character Streams:

Similar to the above but work on characters and not bytes.

1. Buffered Streams:

The above two streams are examples of unbuffered I/O. This means that each read or write is handled directly by the underlying OS. To reduce the overhead caused by this inefficient process the Java platform implemets buffered I/O streams. These read data depm a memory area known as the buffer and the native input API is called only when the buffer is empty

1. Data streams:

1. Object streams:

### FileWriter

Class used for writing character files. It assumes that the default character encosing and byte-buffer size are acceptable, though to specify these yourself one needs to construct an OutputStreamWriter on a FileOutputStream.

### BufferedWriter

Writes test to a character-output stream, buffering so as to provide for the efficient writing of single characters, arrays and strings.

### UUID

`UUID.randomUUID().toString()`

This gives a random UUID.


### Matcher

An engine that performs match operations on a character sequence by interpreting a Pattern.
