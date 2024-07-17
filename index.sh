##To implement the tasks described for the network diagram, you'll need to configure OSPF on the routers (R1 and R2) and set up access control lists (ACLs) to enforce the specified policies. Below is a step-by-step guide, along with the shell script commands (assuming you're using a Cisco-like environment with command-line interface)

##R1 Configuration
enable
configure terminal
hostname R1
router ospf 1
 network 172.16.1.0 0.0.0.255 area 0
 network 172.16.2.0 0.0.0.255 area 0
 network 203.0.113.0 0.0.0.3 area 0

##R2 Configuration
enable
configure terminal
hostname R2
router ospf 1
 network 192.168.1.0 0.0.0.255 area 0
 network 192.168.2.0 0.0.0.255 area 0
 network 203.0.113.0 0.0.0.3 area 0

##Step 2: Implement Access Control Lists(ACLs)
##For R1
access-list 1 permit host 172.16.1.1
access-list 1 permit host 172.16.2.1
access-list 1 deny any
interface GigabitEthernet0/0
 ip access-group 1 out

access-list 2 deny 172.16.2.0 0.0.0.255
access-list 2 permit any
interface GigabitEthernet0/1
 ip access-group 2 out

access-list 3 deny 172.16.1.0 0.0.0.255
access-list 3 permit any
interface GigabitEthernet0/1
 ip access-group 3 in

##For R2 (Using standard named ACLs)
ip access-list standard ALLOW_PC1_PC3
 permit host 172.16.1.1
 permit host 172.16.2.1
 deny any
interface GigabitEthernet0/0
 ip access-group ALLOW_PC1_PC3 in

ip access-list standard BLOCK_172_16_2_0
 deny 172.16.2.0 0.0.0.255
 permit any
interface GigabitEthernet0/1
 ip access-group BLOCK_172_16_2_0 in
