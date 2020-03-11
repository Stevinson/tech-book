# Autoencoders

## Assignments

PCA can be seen as a special case opf an autoencoder where:

	* Encoder: X -> dense layer -> code
	* decoder: code -> dense layer -> X

**Transpose convolution** is when we take a number and produce a patch of an image (i.e. the opposite to a normal convolution) to 'undo' the convolutions done in the encoder. 
