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
