#!/bin/bash

# Function to run commands in vtysh
run_vtysh_commands() {
    echo "$1" | vtysh
}

# Configure ACLs
configure_acls() {
    run_vtysh_commands "
configure terminal

# ACL to prevent 172.16.2.0/24 from communicating with PC1
ip access-list extended BLOCK_172_16_2_TO_PC1
 deny ip 172.16.2.0/24 host 172.16.1.2
 permit ip any any

# ACL to prevent 172.16.1.0/24 from accessing DNS on SRV1
ip access-list extended BLOCK_172_16_1_TO_SRV1_DNS
 deny udp 172.16.1.0/24 host 192.168.1.100 eq 53
 deny tcp 172.16.1.0/24 host 192.168.1.100 eq 53
 permit ip any any

# ACL to prevent 172.16.2.0/24 from accessing HTTP/HTTPS on SRV2
ip access-list extended BLOCK_172_16_2_TO_SRV2_WEB
 deny tcp 172.16.2.0/24 host 192.168.2.100 eq 80
 deny tcp 172.16.2.0/24 host 192.168.2.100 eq 443
 permit ip any any

# Apply ACLs to the appropriate interface
interface GigabitEthernet0/0
 ip access-group BLOCK_172_16_2_TO_PC1 in
 ip access-group BLOCK_172_16_1_TO_SRV1_DNS out
 ip access-group BLOCK_172_16_2_TO_SRV2_WEB out

exit
write memory
"
}

# Main execution
echo "Configuring Extended ACLs..."
configure_acls
echo "Configuration completed. Changes have been saved."