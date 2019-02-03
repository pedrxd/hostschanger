# Hostschanger
This script allows you to change a hostname depending if you are on your lan or not. For instance, if you are on your own lan, you can set a hostname to a private IP and when you are out it loads the correct ip from DNS.

It works changing the /etc/hosts file, if you are on your own lan, a new entry is added with the 'iponlocal' and 'domain' argument. When you are not on lan, it just removes the entry so the correct ip would load from DNS server.

## Usage
> hostschanger.sh [routerip] [routermac] [iponlocal] [domain]

An example:

> hostschanger.sh 192.168.1.1 12:34:56:78:91 192.168.1.130 example.org

You can add this to cron and execute it every 10 minutes or the time you considere correct.

## Is this the correct procedure?
I am not sure, but probably not. I write this for private usage and I think that it will be useful for someone as it is for me. 

Any suggestion is welcome.
