# sed
sed is a stream editor, i.e a non-interactive text editor that process a stream of text. 90% of the time, sed is used 
as a very powerful search and replace tool.

**Note**:
sed works different on a mac than on Linux, better to try it out in a linux container like [amazonlinux](https://hub.docker.com/_/amazonlinux/) eg:

```bash
docker run -it amazonlinux /bin/bash
```

## Replacing text
The 's' is the 'Search and Replace' command. The following command will match on the 'apples' text and replace it 
with 'oranges'. The 'g' replaces all occurrences on the same line.

```bash
echo 'I love apples, I love pears, but not all pears' | sed 's/apples/oranges/g'
I love oranges, I love pears, but not all pears
```

We can use a different delimiter. Above we use '/', but we can also use ',':

```bash
echo 'I love apples, I also love pears, but not all pears' | sed 's,apples,oranges,g'
I love oranges, I also love pears, but not all pears
```

We can also match case-insensitive:

```bash
echo 'I love apples, I also love pears, but not all pears' | sed 's/apples/APPLES/g' | sed 's/pears/PEARS/g' | sed 's/apples/oranges/gI'
I love oranges, I also love PEARS, but not all PEARS
```

Matching regular expressions:

```bash
echo 'I love apples, I also love pears, but not all pears' | sed "s/[oe]/XXX/g"
I lXXXvXXX applXXXs, I alsXXX lXXXvXXX pXXXars, but nXXXt all pXXXars
```

Strip leading white space:

```bash
echo '     I love apples' | sed 's/^\s*//'
I love apples
```



## Resources
- [sed tutorial](https://wiki.debian.org/Tutorials/Sed)

