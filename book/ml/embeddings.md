# Word Embeddings

## Static Word Embeddings

In classic, static embeddings each distinct word gets one pre-computed embedding.

Eamples are GloVe and Komninos embeddings.

### Usage

The `flair` package can be used for static word embeddings. See (here)[https://github.com/flairNLP/flair/blob/master/resources/docs/embeddings/CLASSIC_WORD_EMBEDDINGS.md] for details.


---


## Document Embeddings

Document embeddings only give you one embedding for an entire text. They come in different flavours:

1. **Document Pool Embeddings**, which are an average over all the word embeddings in the sentence. 

1. **Document RNN Embeddings**, that train an RNN over all word embeddings in a sentence.

1. **Transformer Document Embeddings**

1. **Sentence Transformer Document Embeddings**. These both use a pre-trained transformer.


### Usage 

The `flair` package can also be used for document embeddings, see (here)[https://github.com/flairNLP/flair/blob/master/resources/docs/TUTORIAL_5_DOCUMENT_EMBEDDINGS.md].

