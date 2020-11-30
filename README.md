# tf-aws-infra

### Prerequisites 

* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.x
* [AWS cli](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-welcome.html) 

## Initialization
## Using Terraform
#### Init the module
```
cd terraform/[module_name]
terraform init -backend-config=../../../inventories/dev/tf_backend_config -reconfigure
terraform workspace new [module_name]
terraform init -backend-config=../../../inventories/dev/tf_backend_config -reconfigure
```
#### Plan the resources creation
```
terraform plan -var-file=../../../inventories/dev/[module_name].tfvars
```
#### Start the creation and confirm 
```
terraform apply -var-file=../../../inventories/dev/[module_name].tfvars
```
### Configure project to use the s3 bucket and the dynamoDB table

#### Use this block on the project main.tf
```
terraform {
  backend "s3" {
    # The key values from this block are defined on ../inventories/{env}/s3backend
    acl            = "private"
    dynamodb_table = "tf-state-lock-dynamo"
  }
}
```
#### Create a file to configure the backend properties on your project
**e.g.:** s3_backend file
```
bucket = "bucket-name-example"
region = "us-east-1"
key = "foo/env/env.tfstate"
profile = "exmple-profile"
dynamodb_table = "terraform-state-lock"
```

**bucket:** The name of the bucket created earlier with this module

**region:** The region where the bucket was created

**key:** The path and the terraform.tfstate name

**profile:** The local profile from ~/.aws/credentials which terraform will use 

**dynamodb_table:** The name of the table created earlier with this module

### Destroying the resources
#### Run the command to destroy and confirm destruction
```
terraform destroy -var-file=../../../inventories/dev/[module_name].tfvars
```

### Modules that use values from tfstate from other modules
```
data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = var.aws_s3_tfstate_storage_bucket_name
    key    = "${var.env}/network/${var.env}.tfstate"
    region = var.aws_region
  }
}
```

## Using Ansible
## Installation
```python
aws configure --profile profile_name
python -m virtualenv -p python3 venv
source venv/bin/activate
pip install -r requirements.txt
```

## Ansible
There are some roles to automate the steps to run terraform(Init, create workspace, apply/destroy)
The available tags can be consulted in the **deploy.yml** file
```
ansible-playbook -vvv deploy.yml -e env=demo -t config
```

**Destroy**
```
ansible-playbook -vvv deploy.yml -e env=demo -e tf_state=absent -t config
```