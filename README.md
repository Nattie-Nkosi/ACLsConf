# Enterprise Network Configuration

## Network Overview

This enterprise network consists of multiple segments interconnected by two routers (R1 and R2) and four switches (SW1, SW2, SW3, and SW4). The network includes:

- 4 PCs (PC1, PC2, PC3, PC4)
- 2 Servers (SRV1, SRV2)
- 2 Routers (R1, R2)
- 4 Switches (SW1, SW2, SW3, SW4)

## Network Segments

| Subnet         | Connected Devices | Switch |
| -------------- | ----------------- | ------ |
| 172.16.1.0/24  | PC1, PC2          | SW1    |
| 172.16.2.0/24  | PC3, PC4          | SW2    |
| 192.168.1.0/24 | SRV1              | SW3    |
| 192.168.2.0/24 | SRV2              | SW4    |

The routers R1 and R2 are connected via a WAN link (203.0.113.0/30).

## Configuration Tasks

### 1. OSPF Configuration

OSPF is configured on R1 and R2 to enable full connectivity between all PCs and servers.

### 2. Access Control Lists (ACLs)

ACLs are implemented to enforce the following network policies:

- Only PC1 and PC3 can access 192.168.1.0/24
- Hosts in 172.16.2.0/24 cannot access 192.168.2.0/24
- 172.16.1.0/24 cannot access 172.16.2.0/24
- 172.16.2.0/24 cannot access 172.16.1.0/24

#### ACL Types:

- R1: Standard numbered ACLs
- R2: Standard named ACLs

## Implementation Details

The configuration includes:

1. OSPF setup on both routers
2. ACL creation and application on router interfaces

This setup ensures proper routing and enforces security policies across the network segments.
