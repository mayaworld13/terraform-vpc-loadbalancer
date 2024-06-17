# Architecture Overview

## Components

   * **`VPC`** : A Virtual Private Cloud to host all the infrastructure components.
   * **`Internet Gateway`** : Allows instances in the public subnet to access the internet.
   * **`NAT Gateway`** : Allows instances in the private subnet to access the internet for updates and other tasks without exposing them directly to the internet.
   * **`Public Subnet`** : Contains public-facing EC2 instances and an Application Load Balancer.
   * **`Private Subnet`** : Contains private EC2 instances, which are accessed through a bastion host.
   * **`Route Tables`** : Configured to manage traffic between subnets, the internet, and the NAT Gateway.

## Provisioners
   * **`File Provisioner`** : Copies necessary PEM files to instances for SSH access.
   * **`Remote-Exec Provisioner`** : Executes commands on private instances to install and configure Nginx and download web content.

## Diagram
![image](https://github.com/mayaworld13/terraform-vpc-loadbalancer/assets/127987256/919d4240-a993-41b6-a482-7deba32a9eba)

## Benefits

* Improved security through isolation and access control
* Scalability and high availability through load balancing and multiple instances
* Efficient traffic management through route tables and NAT Gateway
* Simplified management and maintenance through a bastion host

---
# Demo
https://github.com/mayaworld13/terraform-vpc-loadbalancer/assets/127987256/02b3cccd-2008-4386-88a8-35a7cb296cfa


## Full Demo

https://github.com/mayaworld13/terraform-vpc-loadbalancer/assets/127987256/b9ef4990-75ca-4da9-b0d0-a51898b64031

