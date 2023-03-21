# **Internet/Network Layer**

The primary function of protocols at this layer is to facilitate communication between hosts (e.g. computers) on different networks. In the OSI model the Network layer is layer 3 (between the Data Link and Transport layers). In the Internet Protocol Suite, the Internet layer is layer 2 (between the Link layer and the Transport layer).

The Internet Protocol (IP) is the predominant protocol used at this layer for inter-network communication. Currently IPv4 and IPv6 are the two version of IP in use.

The primary features of both IPv4 and IPv6 are:
- Routing capability via IP addressing
- Encapsulation of data into packets

## Data Packets
The Protocol Data Unit (PDU) within the IP Protocol is referred to as a packet. 
A packet is comprised of a Data Payload and a Header. Just as with Ethernet Frames, the Data Payload of an IP Packet is the PDU from the layer above (the Transport layer). It will generally be a TCP segment or a UDP datagram. The Header is split into logical fields which provide metadata used in transporting the packet. Again, as with Ethernet Frames, the data in the IP Packet is in bits. The logical separation of those bits into header fields and payload is determined by the set size of each field in bits and the order within the packet.


### Important fields
- Version: Indicates the version of the Internet Protocol used, e.g. IPv4.

- ID, Flags, Fragment Offset: these fields are related to fragmentation. If the Transport layer PDU is too large to be sent as a single packet, it can be fragmented, sent as multiple packets, and then reassembled by the recipient.

- TTL: every packet has a Time to Live (TTL) value. This is to ensure that any packets which don't reach their destination for some reason aren't left to endlessly bounce around the network. The TTL indicates the maximum number of network 'hops' a packet can take before being dropped. At each hop, the router which processes and forwards the packet will decrement the TTL value by one.

- Protocol: this indicates the protocol used for the Data Payload, e.g. TCP, UDP, etc.

- Checksum: this is an error checking value generated via an algorithm. The destination device generates a value using the same algorithm and if it doesn't match, it drops the packet. IP doesn't manage retransmission of dropped packets. This is left to the layers above to implement.

- Source Address: the 32-bit IP address of the source (sender) of the packet

- Destination Address: the 32-bit IP address of the destination (intended recipient) of the packet

## *IP Addresses*

Unlike MAC Addresses, IP Addresses are logical in nature. This means that they are not tied to a specific device, but can be assigned as required to devices as they join a network. The IP address that the device is assigned must fall within a range of addresses available to the local network that the device is connected to. This range is defined by a network hierarchy, where an overall network is split into logical subnetworks, with each defined by the range of IP addresses available to it.

### *IPv4*
IPv4 addresses are 32 bits in length and are divided into four sections of eight bits each. When converted from binary to decimal, each of those sections provides a range of numbers between 0 and 255 (since 2 to the power of 8 equals 256). For example 109.156.106.57.

Each network defines the address at the start of the range, e.g. 109.156.106.0, as the network address, and the address at the end of the range, e.g. 109.156.106.255, as the broadcast address. Addresses between the network and broadcast address, 109.156.106.1 to 109.156.106.254, can be allocated to individual devices on the network.

This splitting of a network into parts is referred to as sub-netting. By dividing IP address ranges further, subnets can be split into smaller subnets to create even more tiers within the hierarchy.


#### Routing and Routing Tables

All routers on the network store a local routing table. When an IP packet is received by a router, the router examines the destination IP address and matches it against a list of network addresses in its routing table. The matching network address will determine where in the network hierarchy the subnet exists. This will then be used to select the best route for the IP packet to travel.

### *IPv6*
The structure of IPv4 addresses means that there is a logical maximum of around 4.3 billion addresses. Due to the popularity of the internet, it is anticipated that this pool of addresses will eventually be depleted. Since the late 1990s, the Internet Engineering Task Force (IETF) have been working on a new version of the Internet Protocol called IPv6. Since IPv6 uses 128-bit addresses (eight 16-bit blocks), this increases the theoretical number of possible addresses to approximately 340 undecillion (340 billion billion billion billion).

As well as a difference in address structure, IPv6 has some other differences with IPv4 such as a different header structure for the packet and a lack of error checking (it leaves this to the Link Layer checksum).