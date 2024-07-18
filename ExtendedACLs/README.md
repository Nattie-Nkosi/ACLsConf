## Network Topology Diagram

This image shows a network topology diagram with multiple devices connected through switches and routers. Here's a breakdown of the key elements:

### 1. Network Segments:

- **172.16.1.0/24** (connected to SW1)
- **172.16.2.0/24** (connected to SW2)
- **192.168.1.0/24** (connected to SW3)
- **192.168.2.0/24** (connected to SW4)
- **203.0.113.0/30** (connecting R1 and R2)

### 2. Devices:

- **PCs**: PC1, PC2, PC3, PC4
- **Switches**: SW1, SW2, SW3, SW4
- **Routers**: R1, R2
- **Servers**: SRV1, SRV2

### 3. Connections:

- The network is divided into two main sections connected by routers R1 and R2.
- SW1 and SW2 are connected to R1, while SW3 and SW4 are connected to R2.
- R1 and R2 are connected via a WAN link (203.0.113.0/30).

### 4. Task:

The image includes a task description for configuring extended Access Control Lists (ACLs) to implement the following network policies:

- Hosts in **172.16.2.0/24** can't communicate with **PC1**.
- Hosts in **172.16.1.0/24** can't access the DNS service on **SRV1**.
- Hosts in **172.16.2.0/24** can't access the HTTP or HTTPS services on **SRV2**.

This task requires implementing traffic filtering rules to restrict specific types of communication between different network segments, likely to be configured on router **R1**.
