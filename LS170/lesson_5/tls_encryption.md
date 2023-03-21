# **TLS Encryption**
Encryption is a major component of the security provided by TLS. The way in which TLS sets up an encrypted connection is via a process known as the TLS Handshake.

## **Symmetric Key Encryption**
Symmectric key encryption is a shared key system in which both the sender and receiver share a common encryption key. 

In order to work securely, this system relies on the sender and receiver both having access to the key and no one else being able to access it. The most secure way to exchange keys would be in person. If we want to use symmetric key encryption over the internet however, this isn't a feasible option. We also can't just send the key in a readable format to the other party in our message exchange; if the key was intercepted by a third-party, they could then use it to decrypt any subsequent messages between the sender and receiver.

We need is a mechanism whereby we can encrypt the encryption key itself, so that even if it is intercepted it can't be used.

## **Asymmetric Key Encryption**
`Asymmetric key encryption`, also known as `public key encryption`, uses a pair of keys: a `public key`, and a `private key`. Unlike the symmetric system where the same key is used to encrypt and decrypt messages, in the asymmetric system the keys in the pair are non-identical: the *public key is used to encrypt and the private key to decrypt.*
The public key is made openly available but the private key is kept in the sole possession of the message receiver.

An important thing to note here is that this encryption is primarily intended to work in one direction. Person "A" can send person "B" messages encrypted with the public key which person "B" can then decrypt with the private one. The same key pair would not be used in the other direction for secure communication, since anyone with access to the public key could decrypt the message.


## **The TLS Handshake**
To be able to send messages via HTTP securely, we want both the request and response to be encrypted in a way that they can only be decrypted by the inteded recipient.

TLS uses a combination of symmetric and asymmetric cryptography. *The bulk of the message exchange is conducted via symmetric key encryption*, but *the initial symmetric key exchange is conducted using asymmetric key encryption*. The process by which the initial secure connection is set up is conducted during what is known as the `TLS handshake`. TLS assumes TCP is being used at the Transport layer, and the TLS Handshake takes place after the TCP Handshake.

The `key points to remember about the TLS Handshake` process is that it is used to:

- Agree which version of TLS to be used in establishing a secure connection.
- Agree on the various algorithms that will be included in the cipher suite.
- Enable the exchange of symmetric keys that will be used for message encryption.

*Something to be aware of is that one of the implications of this complexity is its impact on performance.* The TLS handshake can add up to two round-trips of latency (depending on the TLS version) to the establishment of a connection between client and server prior to the point where any application data can be sent. This is on top of the initial round trip resulting from the TCP Handshake.

Note: there is a protocol called `Datagram Transport Layer Security (DTLS)`, which is based on TLS. This protocol is specifically for use with network connections which use UDP rather than TCP at the Transport layer.


## **Cipher Suites**

*A `cipher` is a cryptographic algorithm; in other words they are sets of steps for performing encryption, decryption, and other related tasks. A `cipher suite` is a suite, or set, of ciphers.*

TLS uses different ciphers for different aspects of establishing and maintaining a secure connection. There are many algorithms which can be used for performing the key exchange process, as well as for carrying out authentication, symmetric key encryption, and checking message integrity.The algorithms for performing each of these tasks, when combined, form the cipher suite. *The suite to be used is agreed as part of the TLS Handshake.*
As part of the `ClientHello` message, the client sends a list of algorithms it supports for each required task, and the server chooses from these according to which algorithms it also supports.