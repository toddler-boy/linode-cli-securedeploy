##  Simple Terminal prompts for folks using the Linode CLI!

This is a really lightweight prompt-based script that leverages the Linode- CLI to deploy a Linode using their *Secure Your Server* Marketplace Application. 

It will let you do the following via some fairly user-friendly text prompts:

- Pick deployment specs:
    - Linode Plan Size
    - Deployment Region
    - Distribution (**The Marketplace App currently only supports 3 distros**)
    - Label
    - Tags
- Harden SSH access by:
    - Set a Limited User
    - Disable root access via SSH
    - Automatically add an SSH key (*if it lives in the expected spot on your machine)


## Requirements ##
Using this script obviously has a few requisites to make this work. You are going to need:

- [A Linode account](https://login.linode.com)
Create your account - Linode Loginhttps://login.linode.com › signup)
- [The Linode-CLI](https://www.linode.com/docs/products/tools/cli/guides/install/)  installed on your local machine (*or VM*).
- Money to pay for any stuff you create.  ***This is going to create live services so make sure you [delete them](https://www.linode.com/docs/products/platform/billing/guides/stop-billing/) if you don't want them.***


