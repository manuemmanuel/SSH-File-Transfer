# Data Sharing Between Two Ubuntu Computers on the Same Switch

## 1. Using SSH with SCP (Secure Copy)
### Install OpenSSH Server
```bash
sudo apt update
sudo apt install openssh-server
```
### Find IP Address
```bash
ifconfig
```
### Copy Files Using SCP
```bash
scp /path/to/file username@destination_ip:/path/to/destination
```
### Access via SSH
```
ssh username@destination_ip
```
