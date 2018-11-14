# xargs
The xargs command in UNIX (construct argument list(s) and execute utility) is a command line utility for building an 
execution pipeline from standard input. Whilst tools like grep can accept standard input as a parameter, many other 
tools cannot. Using xargs allows tools like echo and rm and mkdir to accept standard input as arguments.

By default xargs reads items from standard input as `separated by blanks` and executes a command once for each argument. 
In the following example standard input is piped to xargs and the mkdir command is run for each argument, creating three folders.

## Resources
- [xargs - manual](http://man7.org/linux/man-pages/man1/xargs.1.html)
- [Linux and Unix xargs command tutorial with examples](https://shapeshed.com/unix-xargs/)

