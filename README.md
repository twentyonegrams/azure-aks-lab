# azure-aks-lab
A lab to learn how to debug an AKS cluster in Azure

---

### Phase 1 address plan


| Component | Range | Hold |
|---|---|---|
| VNet | 10.1.0.0/16 | 65,536 addresses |
| Node subnet |	10.1.0.0/24 | 251 usable in Azure |
| Pod CIDR | 172.16.0.0/20 | 16 /24 node blocks |
| Service CIDR | 192.168.0.0/26	| 64 ClusterIPs |
| DNS service IP | 192.168.0.10	| inside the service CIDR |