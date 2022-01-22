set pennkey=zhiyaot <<<<<------ change this to your pennkey

if not exist %USERPROFILE%\.ssh\id_rsa (
    ssh-keygen -t rsa -q -f %USERPROFILE%\.ssh\id_rsa -N ""
) else (
    type %USERPROFILE%\.ssh\id_rsa.pub | ssh %pennkey%@eniac.seas.upenn.edu "cat >> ~/.ssh/authorized_keys"
    echo you already got setup, dont run this again
)
