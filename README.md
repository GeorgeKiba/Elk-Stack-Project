
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

<img width="901" alt="ELK_Diagram" src="https://user-images.githubusercontent.com/76065405/119424720-976fc680-bccb-11eb-9d83-e5830d35c9fc.png">


These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the elkplaybook.yml file may be used to install only certain pieces of it, such as Filebeat.


This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly redundant, in addition to restricting Denial of service to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system metrics.

The configuration details of each machine may be found below.

| Name              | Function | IP Address | Operating System |
|-------------------|----------|------------|------------------|
| KibaSuperJump Box | Gateway  | 10.0.0.4   | Linux            |
| KibaSuperWeb-1    | Gateway  | 10.0.0.5   | Linux            |
| KibaSuperWeb-2    | Gateway  | 10.0.0.6   | Linux            |
| ElkServer         | Gateway  | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the KibaSuperJumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:


Machines within the network can only be accessed by KibaSuperWeb-1 and KibaSuperWeb-2

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box |    Yes              | 127.0.0.1            |
|  Web-1   |     No              | 10.0.0.4             |
|  Web-2   |     No              | 10.0.0.4             |
|  Elk2    |     No              | 10.0.0.4.            |
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because automates away the drugery from daily tasks.

The playbook implements the following tasks:
- Install docker.io
- Install Python3
- Install Docker python module
- Increase more memory for modules to run
- Download and launch a docker elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/GeorgeKiba/Elk-Stack-Project/blob/adb3edc4cd7c7cd8cb60e6dfc84524d370411cfb/Docker_PS.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5 (Web-1)
- 10.0.0.6 (Web-2)

We have installed the following Beats on these machines:
- filebeats and metricbeats

These Beats allow us to collect the following information from each machine:
-Filebeat collects system log files, which we can use to see all events that have happened and are currently happening on a specified server or servers.

Metricbeat collects host metrics used for monitoring performance, which we can use to track things such as memory usage and CPU.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
-Copy the playbook files to the Jump-Box-Provisioner VM.
-Update the hosts file to include the private IP addresses of the DVWA servers as well as the private IP of the elkserver
a sample of the hosts file:

# A collection of hosts belonging to the 'webservers' group
[webservers]
10.0.0.5 ansible_python_interpreter=/usr/bin/python3
10.0.0.6 ansible_python_interpreter=/usr/bin/python3
# A collection of hosts belonging to the 'elkservers' group
[elkservers]
10.2.0.4 ansible_python_interpreter=/usr/bin/python3


Run the playbook, and navigate to Web-1 to check that the installation worked as expected. After that navigate to Web-2 followed by the ELK server to check that all installations worked as expected.


You update the Ansible hosts file to run the playbook on specified machines. Within the Ansible hosts file you create two separate groups. One is called [webservers] and the other is called [elkservers]. You then place the private IP addresses of the corresponding servers underneath each group header. Then within the playbook files you specify whether the playbook should be applied to the webservers or elkservers group.

Navigate to http://(ELK-Server public IP):5601/app/kibana in order to check that the ELK server is running

Once connected to your jumpbox, make sure the ansible hosts file is up to date

The specific commands the user will need to run to download the playbook:

$ sudo su

$ cd/etc/ansible

$ ansible-playbook pentest.yml

$ ansible-playbook install-elk.yml

$ ansible-playbook filebeat-playbook.yml

$ ansible-playbook metricbeat-playbook.yml

