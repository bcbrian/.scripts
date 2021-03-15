# .scripts
AKA potential-journey AKA Xander

### helpful links
ubuntu images
https://cloud-images.ubuntu.com/releases/groovy/release/

### should we create a user? / currently we are opporating as root
https://linuxhint.com/create_user_ubuntu/
https://unix.stackexchange.com/questions/3568/how-to-switch-between-users-on-one-terminal

### WSL Issues
#### no internet
https://github.com/microsoft/WSL/issues/4285#issuecomment-647185072
> I got a clue in the following: [Issue 4844](https://github.com/microsoft/WSL/issues/4844)
> (I also removed docker WSL but I don't think that that made any diff)
> 
> 1. Created a /etc/wsl.conf containing
> 
> ```
> 
>     [network]
>     generateResolvConf = false
> ```
> 
> 1. I exited wsl and then issued a `wsl --shutdown`
> 2. entered wsl force deleted the /etc/resov.conf to stop it being a symbolic  link
> 
> ` sudo rm -fd /etc/resov.conf`
> 
> 1. I exited wsl and then issued a `wsl --shutdown`
> 2. entered wsl  and recreated a resolv.conf
> 
> ```
>     sudo  touch /etc/resov.conf
>     sudo  nano /etc/resov.conf
> ```
> 
> 1. Added the following line to the /etc/resolv.conf
> 
> ` nameserver 8.8.8.8`
> 
> 1. I exited wsl and then issued a `wsl --shutdown`
> 2. Entered wsl and everything was now working

