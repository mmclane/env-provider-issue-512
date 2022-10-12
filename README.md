# env-provider-issue-512

minimal repo of issue: https://github.com/env0/terraform-provider-env0/issues/512

To reproduce the issue do the following:

## Setup
1. In all three providers.tf files, start with **version = "1.1.1"**
2. Update m3test/main.tf and otherstuff/main.tf to point to a valid project and template.  I have a template called nothing for testing that doesn't actually build any cloud resources and just returns a null resource.  
3. Run **terraform init && terraform apply** to build the two env0 environments
4. Run **terraform plan** and verify that your plan says **No changes**
5. Run **terraform plan --target module.m3test.env0_environment.nothing** and verify that your plan says **No changes**

## Create Error
1. Update all three providers.tf files so that **version = ">= 1.1.1"**
2. Run **terraform init --upgrade** and verify that it installs env0/env0 v1.2.7
3. Change m3test/nothing.tf to set **run_plan_on_pull_requests  = false**
3. Run **terraform plan** and verify it shows your change
4. Run **terraform plan --target module.m3test.env0_environment.nothing** and observe error.
5. Run **terraform plan --target module.other.env0_environment.nothing** and observe error.

## Error
```
> tfp --target module.other.env0_environment.nothing

module.other.env0_environment.nothing: Refreshing state... [id=213e1cea-d5af-456a-b259-5019b196c0b2]
╷
│ Warning: Resource targeting is in effect
│ 
│ You are creating a plan with the -target option, which means that the result of this plan may not represent all of the changes requested by the current configuration.
│ 
│ The -target option is not for routine use, and is provided only for exceptional situations such as recovering from errors or mistakes, or when Terraform specifically suggests to use it as part of an error
│ message.
╵
╷
│ Error: Failed to decode resource from state
│ 
│ Error decoding "module.m3test.env0_environment.nothing" from previous state: unsupported attribute "template"

```

## Recover from error
1. In all three providers.tf files, reset to **version = "1.1.1"**
2. Run **terraform init --upgrade** and verify that it installs env0/env0 v1.1.1
3. Run **terraform plan --target module.m3test.env0_environment.nothing** and verify it shows your change.

## Additional Notes

- I get this error with both terraform version 1.1.8 and 1.3.2.
- Sometimes I need to make a change before the error happens (step 3 above) and other times I do not need to make a change.

