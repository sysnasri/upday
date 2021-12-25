
# Application Deployment on EKS
A complete workflow from scrach that uses Terraform to bootstartp a highly
avaialbe Kuberentes cluster on AWS to deploy applications via Helm charts/provider. 

## Important attention

```
This scenario is not using Route53 instead using OVH dns, because my apex domain "nasri.it" is hosted on OVH.
In this scenior a CNAME "upday" is going to be created and pointed to aws application load balancer.  

```

## Description

A java application which is built by a Dockerfile in gitlab-ci, is going to be packed with helm chart! the chart is linted during the deployment and if it finds an error it wont deploy it. nginx-ingress controller, metricserver, application chart are implemented in this scenario, finally the application is exposed via upday.nasri.it with a valid tls certificate on top of AWS/ACM and then http is redirected to https. 

## Dependencies 
You need to install these tools ***git, terraform, helm, aws-iam-authenticator*** before starting to use this repository. 

```
git clone https://git.nasri.it/nasri/upday

```

## Before Starting 

Before start working with CLI or gitlab-ci the following variables must be set. you can put them in a tfvar file outside of repository folder and then refer to it later.
```
#########  AWS athentication #########

AWS_ACCESS_KEY 
AWS_SECRET_KEY
AWS_DEFAULT_REGION



#########  OVH athentication #########

application_key  
application_secret
consumer_key

```
OVH variables are exported into gitlab with TF_VAR format, please refer to .gitlab-ci.yml
Set these variables if your DNS Server is hosted on OVH, otherwise you need to use [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) and adjust ./deployment/terraform/records.tf


## Getting Started
For terraform state it is recommended to use a remote state either on s3 bucket or hashicorp counsol. It's pretty common to use s3 bucket and dynomodb.

First we can create an s3 bucket and dynamodb to put terraform state on a remote location which can be used in CI/CD later on in gitlab. 

Change neccessary values in ./infrastructure/tfbackend/backend.tf and then run the following commands. 

```
terraform -chdir=./infrastructure/tfbackend init 
terraform -chdir=./infrastructure/tfbackend apply -var-file=/home/secrets/terraform.tfvars

```
Remember that you need the bucket name and dynamodb name later when you want to connect to remote state to build EKS and deploy appliactions. 



### Infrastructure Setup  

* First point bucketName and key for terraform backend in bakcend.tf

To initialize EKS cluster you must set some values in ./infrastrucutre/k8s/variables.tf 

```
* region
* cluster_name
* kubernetes_version
* vpc_cidr
...

```
For compelte variables refer to the file :) 
You can use plan/apply approach to deploy the infrastructure

```
cd ./infrastructure/k8s 

 terraform init
 terraform plan -input=false -out "infraPlanFile" -var-file=/home/secrets/terraform.tfvars
 terraform apply -input=false "infraPlanFile" -var-file=/home/secrets/terraform.tfvars

```


### Helm Charts And Deployments 
Helm is used to pack the k8s manifest/yaml files and uses a templating strucutre,  helm values.yaml file is located in ./deployment/charts/upday/values.yaml. you can adjust values base on your needs. 


* Deployment,Ingress,service,PodDisruptionBudget,HorizentalAutoscaling template files are located in template directory. 

* With terraform helm provider metricserver,ingress-enginx,application chart is going to be installed.

* First point bucketName and key for terraform backend in bakcend.tf

```
cd ./deployment/terraform

    terraform init
    terraform -input=false -out "AppPlanFile" -var-file=/home/secrets/terraform.tfvars
    terraform apply -input=false "AppPlanFile" -var-file=/home/secrets/terraform.tfvars

```

### Termination Phase 
You can destroy two phases but remember you have to destroy Deployment phase at first and then destroy EKS later. 

```
cd ./deployment/terraform
    terraform destory -var-file=/home/secrets/terraform.tfvars

cd ./infrastructure/k8s 
    terraform destory -var-file=/home/secrets/terraform.tfvars

```

## Want to collaborate? 

Try to fork the project and request a merge! 


## Authors

Contributors :)

Alireza Nasri
[@sysnasri](https://linkedin.com/in/sysnasri)


## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
