# **The Physical Network**


## **Characteristics of a Physical Network**
The two main characteristics in terms of the performance of a physical network are Latency and Bandwidth. In simple terms, latency is a measure of the time it takes for some data to get from one point in a network to another point in a network. Bandwidth is the amount of data that can be sent in a particular unit of time (typically, a second).


### **The Elements of Latency**

- *Propagation delay:* this is the amount of time it takes for a message to travel from the sender to the receiver, and can be calculated as the ratio between distance and speed.

- *Transmission delay:* the journey of data from point A to point B on a network typically won't be made over one single cable. Instead, the data will travel across many different wires and cables that are all inter-connected by switches, routers, and other network devices. Each of these elements within the network can be thought of as an individual 'link' within the overall system. Transmission delay is the amount of time it takes to push the data onto the link.

- *Processing delay:* Data travelling across the physical network doesn't directly cross from one link to another, but is processed in various ways .

- *Queuing delay:* Network devices such as routers can only process a certain amount of data at one time. If there is more data than the device can handle, then it queues, or buffers, the data. The amount of time the data is waiting in the queue to be processed is the queuing delay.

*The total latency between two points, such as a client and a server, is the sum of all the delays above. This value is usually given in milliseconds (ms).*

Other latency related terms:

- *Last-mile latency:* A lot of the delays described above can take place within the parts of the network which are closest to the end points. This is often referred to as 'last-mile latency' and relates to the delays involved in getting the network signal from your ISP's network to your home or office network. The 'hops' within the core part of the network are longer with less interruptions for transmission, processing, and queuing. At the network edge, there are more frequent and shorter hops as the data is directed down the network hierarchy to the appropriate sub-network. You can think of the network edge as the 'entry point' into a network like a home or corporate LAN.

- *Round-trip Time (RTT):* A latency calculation often used in networking is Round-trip Time (RTT). This is the length of time for a signal to be sent, added to the length of time for an acknowledgement or response to be received.

*Network Hops*

The journey of a piece of data on the network isn't direct from the start point to the end point but will consist of several 'hops', or journeys, between nodes on the network. You can think of the nodes as routers that process the data and forward it to the next node on the path.

To see this process in action, open up your console and run the following command:
```
traceroute google.com
```
`traceroute`is a utility for displaying the route and latency of a path across a network. Running the command should return a list of hops taken for the test data to get from your PC or laptop to the Google server. The values indicated here are the Round-Trip Time (RTT) for each hop.


### **Bandwidth**

Bandwidth varies across the network, and isn't going to be at a constant level between the start point and the end point of our data's journey. For example, the capacity of the core network is going to be much higher than the part of the network infrastructure that ultimately connects to your home or office building.

The bandwidth that a connection receives is the lowest amount at a particular point in the overall connection. A point at which bandwidth changes from relatively high to relatively low is generally referred to as a bandwidth bottleneck.

Low bandwidth can be an issue when dealing with large amounts of data, however, in many situations latency can be a much more serious limitation on the performance of a networked application.

### **Limitations of the Physical Network**
As developers and software engineers, there's really not a lot we can do about the limitations of the physical network itself. If we want to improve the performance of the applications we build, then our influence is limited to the implementation of the application in terms of how we use the higher-level protocols.