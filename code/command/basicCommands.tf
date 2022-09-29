# aws s3 ls => view your aws buckets you have in your account 

/*
    .tf files are terraform files
    .tf.json are terraform jon files

    Step 1 select instance
    AMI = amazon machine image in other words instances and it does come with an id 
    note ami is region specific  my current is us-east-1

    step 2 select instance type (ie size, vcpu, etc)


    For aws 
    the resource instance you create => resource  "aws_instance" 
    the provider tells which cloud we are provisioning to

    provider "google" {
        project = "acme-app"
        region  = "us-central1"
        }


    resource "resource type" "resource name" {
    ami = "ami-ID" #us-west-2
    instance_type = "t2.micro"
}

    big step 1 introduction to terraform workflow - main commands
    Terraform init => initialization working dirrectory

    Terraform  validate => validates configuration files in the respective directory

    Terraform plan => creates executon plan & performs a refresh and determines what actions are necessary to achieve desired state specified in the configuration

    Terraform apply => used to apply the changes required to reach the desired state configuration
                        by default, apply scans the current directory for the configuration and applies the changes appropriately
                        the state file is created when apply ran the first time
    adding the tag -auto-approve to your terraform apply skips the approval stage

    Terraform refresh => used to reconcile the state Terraform knows about (via its state file) with the real-world infrastructure 
                        does not modify infastructure, but does modify state file 
        
        destroy
            destroy the infrastructure and all resources
            modifies both state and infastructure
            terraform destroy -target can be used to destroy  targeted resources
            terraform plan -destroy allows creation of destroy plan

    Terraform import => helps import already-existing external resources, not managed by Terraform, into Terraform state and allow it to manage those resourcees
                        Terraform is not able to auto -generate configuration for those imported modules for now, and requires you ti first write the resource definition in Terraform and then import this resource

    Terraform taint => marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on the next apply.
                        will not modify infrastructure, but does modify the state file in order to mark a resource as tainted. Infrastructure and state are changed in next apply.
                        can be used to tint a resource within a module

    Terraform fmt => format to lint the code into standard format

    Terraform console => command provides an inyeractive console for evaluating expressions               


    Terraform destroy =>   used to destroy terraform managed infrastructure
                            this will ask for confirmation before destroying

    big step 2 review terraform manifest for ec2
    Pre-condition-1=> ensure you have **default-vpc** in that respective region
    Pre-condition-2=> ensure ami you are providing exists in that region if not update ami id
    Pre-condition-3=> Verifiy your aws credentias in **$HOME/.aws/credentials** in other words ~/.aws/credentials





    **Static credentials**  => is done in your .tf file but its not recommended since it displays your credentials in plain text.
    provider "aws" {
        region = "us-east-1"
        access_key = "my-access-key"
        secret_key = "my-secret-key"
    } 

    alt
    **Environment Variables** => method can be recommended since it does not display your credentials in plain text
    $ export AWS_ACCESS_KEY_ID = "access_key"
    $ export AWS_SECRET_ACCESS_KEY = "secret_key"
    $ export AWS_DEFAULT_REGION = "us-east-1"

    **Shared credentials/configuration file**
    provider "aws" {
        region = "us-east-1"
        shared_credentials_file = '/Users/tf_user/.aws/creds'
        profile = "dev"
    }
*/