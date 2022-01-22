# cis571-ssh-shetup
One liner for windows user to setup ssh key on biglab

## How to do it

Clone this repo to your computer. 

Then __Right Click__ on the `.cmd` file open with any editor, VSCode would work. 

Change first line to your pennkey. 

Save, and click on this file from File Explorer.

This will open a terminal, prompting for Password: (Enter your pennkey password here)

Then you do 2-step verification (similar to what you do when ssh into the server)

You are all set for ssh

```cmd
set pennkey=zhiyaot <<<<<------ change this to your pennkey

if not exist %USERPROFILE%\.ssh\id_rsa (
    ssh-keygen -t rsa -q -f %USERPROFILE%\.ssh\id_rsa -N ""
) else (
    type %USERPROFILE%\.ssh\id_rsa.pub | ssh %pennkey%@eniac.seas.upenn.edu "cat >> ~/.ssh/authorized_keys"
    echo you already got setup, dont run this again
)
```
