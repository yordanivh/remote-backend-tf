# remote-backend-tf
This repo is for code that will use a remote backend

# What this repo is for
This repo is intended to show how a remote backend is created when using atlas.

# Why use this repo

Use this repo to create a remote backend on your own.

# How to use this repo
 
* Install Terraform
 ```
 https://www.terraform.io/downloads.html
 ```
 
 * Clone this repository
 
 ```
 git clone https://github.com/yordanivh/remote-backend-tf
 ```
 
 * Change directory
 
 ```
 cd remote-backend-tf
 ```
 * You need to have a TFCloud registration register [here](https://app.terraform.io/)!
 
 * You need to create an organization and a workspace in it.

 * The workspace should not be linked to any VCS.

 * Create a token for your user with which you'll be able to authenticate
 "User Setting">"Tokens"

 * Create a ~/.terraformrc file
 ```
 vim ~/.terraformrc
 ```
 * Add the following information in it
```
credentials "app.terraform.io" {
  token = "Your Token"
}
```
 * Initialize the project ( Terraform will download provider plugins).
 This will initialize the remote backend as well.
 
 ```
 terraform init
 ```
 
 * Plan the operation so that you see what actions will be taken
 
```
terraform plan
```
 * Run Terraform apply to create the resources
 
```
terraform apply
```
* This will create a remote backend which will store the tfstate file.

* To destroy the created resources. Always run this after testing this code to avoid being charged.

```
terraform destroy
```
# Sample output

1.Run init to initialize the remote backend

```
remote-backend-tf (master) $terraform init

Initializing the backend...

Successfully configured the backend "remote"! Terraform will automatically
use this backend unless the backend configuration changes.

Initializing provider plugins...
- Checking for available provider plugins...
- Downloading plugin for provider "null" (hashicorp/null) 2.1.2...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.null: version = "~> 2.1"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```
2. Run Plan to get a plan of action

```
remote-backend-tf (master) $ terraform plan
Running plan in the remote backend. Output will stream here. Pressing Ctrl-C
will stop streaming the logs, but will not stop the plan running remotely.

Preparing the remote plan...

To view this run in a browser, visit:
https://app.terraform.io/app/Yordanh_free/workspace-atlas-remote-backend/runs/run-Wrnb7ddRM84s8CJ4

Waiting for the plan to start...

Terraform v0.12.18
Configuring remote state backend...
Initializing Terraform configuration...
2019/12/18 14:54:33 [DEBUG] Using modified User-Agent: Terraform/0.12.18 TFC/4bc54fd4af
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.helloWorld will be created
  + resource "null_resource" "helloWorld" {
      + id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```
3. Run apply to apply changes
```
remote-backend-tf (master) $ terraform apply
Running apply in the remote backend. Output will stream here. Pressing Ctrl-C
will cancel the remote apply if it's still pending. If the apply started it
will stop streaming the logs, but will not stop the apply running remotely.

Preparing the remote apply...

To view this run in a browser, visit:
https://app.terraform.io/app/Yordanh_free/workspace-atlas-remote-backend/runs/run-fUp6AwVVZYJjykEc

Waiting for the plan to start...

Terraform v0.12.18
Configuring remote state backend...
Initializing Terraform configuration...
2019/12/18 15:07:59 [DEBUG] Using modified User-Agent: Terraform/0.12.18 TFC/4bc54fd4af
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.helloWorld will be created
  + resource "null_resource" "helloWorld" {
      + id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions in workspace "workspace-atlas-remote-backend"?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.helloWorld: Creating...
null_resource.helloWorld: Provisioning with 'local-exec'...
null_resource.helloWorld (local-exec): Executing: ["/bin/sh" "-c" "echo hello world"]
null_resource.helloWorld (local-exec): hello world
null_resource.helloWorld: Creation complete after 0s [id=5745040057179844554]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
4. Run destroy to remove the resources
```
remote-backend-tf (master) $ terraform destroy
Running apply in the remote backend. Output will stream here. Pressing Ctrl-C
will cancel the remote apply if it's still pending. If the apply started it
will stop streaming the logs, but will not stop the apply running remotely.

Preparing the remote apply...

To view this run in a browser, visit:
https://app.terraform.io/app/Yordanh_free/workspace-atlas-remote-backend/runs/run-BkU8evVDemceKght

Waiting for the plan to start...

Terraform v0.12.18
Configuring remote state backend...
Initializing Terraform configuration...
2019/12/18 14:42:32 [DEBUG] Using modified User-Agent: Terraform/0.12.18 TFC/4bc54fd4af
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

null_resource.helloWorld: Refreshing state... [id=6235800376379051793]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # null_resource.helloWorld will be destroyed
  - resource "null_resource" "helloWorld" {
      - id = "6235800376379051793" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources in workspace "workspace-atlas-remote-backend"?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

null_resource.helloWorld: Destroying... [id=6235800376379051793]
null_resource.helloWorld: Destruction complete after 0s

Apply complete! Resources: 0 added, 0 changed, 1 destroyed.
```
