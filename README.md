# repo2-aws_instance-sharedState

## Explanation
Simple repo which creates ubuntu AWS EC2 instance and uses for tag **random pet name** which gets which `data "terraform_remote_state"`.

## Prerequisites
* Terraform cloud access
* AWS access

## Usage
Create two workspaces in Terraform cloud:
* **First** VCS driven with this repo: https://github.com/IvanGavrilov777/repo1-randompet-sharedState 
* **Second** VCS driven with this repo: https://github.com/IvanGavrilov777/repo2-aws_instance-sharedState
* Go to Settings of **First workspace** -> General -> Remote state sharing -> Share with specific workspaces -> Choose **Second workspace**

* Execute `Plan and Apply run` in **First workspace** and then in **Second workspace**.
