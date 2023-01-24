# cis571-ssh-setup

One liner for windows users to set up `ssh` key on `biglab` or `eniac` or any other server that you have access to.

## Why this is useful

VSCode is quite "dirty" in terms of 2-step verification during an SSH session.
Setting up an SSH key pair and signing in through ssh keys, allows you to connect to `eniac` or `biglab` without entering the password and do 2-step verification every time (terminal or VSCode).
That's just a huge plus!

Fun fact, your home directory of `eniac` is mounted on `biglab` as well, as a network drive.
So you can access your files on `eniac` from `biglab` and vice versa.
This also means that you only need to ___do it once___ for `biglab` and `eniac`!

## How to do it

- Clone this repo to your computer.

- Then __Right Click__ on the `.cmd` file:

  - for windows 10, click on `Open with`, and then choose any text editor (e.g. Notepad)
  - for windows 11, click `Show more options` and then choose `Edit`, this should open up a Notepad for you
- Change the first line to your `pennkey`. (Please don't use the default `zhiyaot`, Thanks! I don't want random keys in my authorized_keys file.)
- Save, and click on this file from File Explorer.
- This will open a terminal, prompting for Password: (Enter your pennkey password here)
- Then you do 2-step verification (similar to what you do when ssh into the server)
- You are all set for ssh

```cmd
set pennkey=zhiyaot <<<<<------ change this to your pennkey

if not exist %USERPROFILE%\.ssh\id_rsa (
    ssh-keygen -t rsa -q -f %USERPROFILE%\.ssh\id_rsa -N ""
) else (
    type %USERPROFILE%\.ssh\id_rsa.pub | ssh %pennkey%@eniac.seas.upenn.edu "cat >> ~/.ssh/authorized_keys"
    echo you already got setup, DONT run this again
)
```
