The `Transport Layer Security (TLS) protocol` started life as a protocol called SSL (Secure Sockets Layer). This was a proprietary protocol developed by Netscape. Although it was standardized and renamed as TLS in 1999 by the IETF, the terms are often still used interchangeably. 

There are three important security services that are provided by TLS: Encryption, Authentication, and Integrity.

- *Encryption:* a process of encoding a message so that it can only be read by those with an authorized means of decoding the message

- *Authentication:* a process to verify the identity of a particular party in the message exchange

- *Integrity:* a process to detect whether a message has been interfered with or faked

Using all three services is not mandatory. We could design an application to accept encrypted messages from a sender without authenticating who they are. In practice however, all three services are generally used together to provide the most secure connection possible.