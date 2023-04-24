# **Terraform-AWS-3-Tier-Application**

![](https://miro.medium.com/v2/resize%3Afit%3A828/format%3Awebp/1%2A9YQ9JIRKpsKj02PQA02ubw.png)


This repository contains code for deploying a three-tier application on AWS using Terraform. The application consists of a web server, application server, and database server, and is deployed across multiple Availability Zones (AZs) for high availability and fault tolerance.

## **Prerequisites**

Before you can deploy this application with Terraform, you will need to have the following tools and resources:

- Basic knowledge of AWS & Terraform

- An AWS account with appropriate permissions to create  resources required by the application.

- Terraform installed on your local machine.

- AWS CLI installed and configured with the access key and secret key of the AWS account that you will be using for this deployment.

## **Deployment Steps**

1. Clone this repository to your local machine.

2. Navigate to the terraform directory in your terminal.

3. Update the variables.tf file with your own values.

4. Initialize the Terraform working directory by running the following command:

> terraform init

5. Run the following command to validate the Terraform configuration:

> terraform plan

6. If the validation is successful, you can now create the infrastructure by running the following command:

> terraform apply

7. The command will show you a summary of the changes that Terraform will make. If you agree with the changes, type "yes" to confirm and deploy the application.

Once the deployment is complete, you should see the URLs for the frontend and backend in the output. You can use these URLs to test the application.

## **Terraform Resources**

The following resources are created by this Terraform code:

- VPC, subnets, and security groups
- EC2 instances for the web server and application server
- RDS instance for the database server
- Elastic Load Balancer (ELB)
- Auto Scaling Group for the web servers
- internet gateway and NAT gateway
- Route tabkes

## **Cleanup**

When you are done testing the application, you can remove the infrastructure by running the following command:terraform destroy

## **Conclusion**

This is a basic example of deploying a 3-tier application with Terraform. You can use this as a starting point for your own projects, adding more tiers or customizing the configuration to suit your needs.
