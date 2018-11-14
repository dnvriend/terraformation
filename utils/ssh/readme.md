# SSH
SSH, or secure shell, is a secure protocol and the most common way of safely administering remote servers. Using a 
number of encryption technologies, SSH provides a mechanism for establishing a cryptographically secured connection 
between two parties, authenticating each side to the other, and passing commands and output back and forth.

## Resources
- [Understanding the SSH Encryption and Connection Process](https://www.digitalocean.com/community/tutorials/understanding-the-ssh-encryption-and-connection-process)


## Stuff

### Host key verification failed
"Host key verification failed" means that the host key of the remote host was changed.
SSH stores the host keys of the remote hosts in ~/.ssh/known_hosts. You can either edit that text file manually and remove the old key (you can see the line number in the error message), or use
ssh-keygen -R hostname

### Existing Key Pair
Before generating a new SSH key pair check if your system already has one at the default location by opening a shell, 
and running the following command:

```text
cat ~/.ssh/id_rsa.pub
```

If you see a string starting with ssh-rsa you already have an SSH key pair.

### Generating a new SSH key pair
To generate a new SSH key pair, use the following command:

```text
ssh-keygen -o -t rsa -C "your.email@example.com" -b 4096
```

If you already have a SSH key pair with the suggested file path, you will need to input a new file path and declare 
what host this SSH key pair will be used for in your `.ssh/config`

