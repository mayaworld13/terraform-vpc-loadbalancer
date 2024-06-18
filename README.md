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

# Getting Started
To use this Terraform configuration:

1. Clone the repository.
2. Ensure you have Terraform installed.
3. Configure your AWS credentials.
4. Create the key pair or use that already created.
5. Initialize the Terraform configuration:

### creating key pair in case you are not using the used one

```sh
ssh-keygen -t rsa -b 4096 -f ./id_rsa
```

### Initialize the Terraform resources
```sh
terraform init
```

### To structure the look and feel of terraform files
```sh
terraform fmt
```

### To validate the syntax
```sh
terraform validate
```

### To plan what will be created after running this configeration
```sh
terrform plan
```

### Apply the configuration to create the infrastructure
```sh
terraform apply
```

## Contributing
Contributions are welcome! If you find any issues or improvements, please open an issue or a pull request on GitHub.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.
