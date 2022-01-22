set pennkey=zhiyaot

if not exist %USERPROFILE%\.ssh\cis571 (
    ssh-keygen -t rsa -q -f %USERPROFILE%\.ssh\cis571 -N ""
    type %USERPROFILE%\.ssh\cis571.pub | ssh %pennkey%@eniac.seas.upenn.edu "cat >> ~/.ssh/authorized_keys"
) else (
    echo you already got setup, dont run this again
)

