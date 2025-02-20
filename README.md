# Shell Configuration
This is a repository for managing common shell configuration across different machines and OSs

* *`init.sh`* - Does the initial alias setups
* *`pull.sh`*: By default also runnable with 'pull-aliases', will delete the local alias configurations and replaces them with the remote ones. Device aliases are excluded by this.
* *`push.sh`*: By default also runnable with 'push-aliases', will delete the remote alias configurations and replaces them with the local ones. Device aliases are excluded by this.

## Requirements
You need some kind of bash based shell. Powershell does not work.