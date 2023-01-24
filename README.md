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

## Cautions

- This script will wipe out your existing `authorized_keys` file on the server, so if you have other keys in there, you might want to do it manually. (yea I know, I'm lazy)
- Go install WSL2 and use `ssh-keygen` and `ssh-copy-id` instead. (That is the right way to do it)

```cmd
@REM *************** CIS 571 SSH Setup ****************
@REM This script will setup your ssh keys so you can
@REM ssh to eniac.seas.upenn.edu without a password
@REM 
@REM Please file all bugs by submitting a issue on
@REM the github page.
@REM 
@REM Zhiyao Tang 
@REM **************************************************

set pennkey=zhiyaot
@REM        ^^^^^^^ change your pennkey here

if not exist %USERPROFILE%\.ssh\id_rsa (
    ssh-keygen -t rsa -q -f %USERPROFILE%\.ssh\id_rsa -N ""
    echo enter your pennkey password here
    type %USERPROFILE%\.ssh\id_rsa.pub | ssh %pennkey%@eniac.seas.upenn.edu "cat >> ~/.ssh/authorized_keys"
    echo we have generated a key for you in %USERPROFILE%\.ssh\id_rsa
    echo you can now ssh to eniac.seas.upenn.edu without a password
    echo you do not need to run this again
    pause
) else (
    echo you already have a key in %USERPROFILE%\.ssh\id_rsa
    echo enter your pennkey password here
    type %USERPROFILE%\.ssh\id_rsa.pub | ssh %pennkey%@eniac.seas.upenn.edu "cat >> ~/.ssh/authorized_keys"
    echo you already got setup, dont run this again
    pause
)
```
