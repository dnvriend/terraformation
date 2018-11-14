# 01_simple_bucket

## using make
Deploy environments typing:

```bash
$ make help
```

## using sceptre
First `brew install sceptre`, then deploy stacks or whole environments:

```bash
# create buckets in the account 'dnvriend', in 'dev' and all 'regions'
$ sceptre launch-env dnvriend/dev 

# describes stack environments state
$ sceptre describe-env dnvriend/dev

# describes all resources
$ sceptre describe-env-resources dnvriend/dev

# the output of a single stack
$ sceptre describe-stack-outputs dnvriend/dev/eu-west-1 bucket

# delete all environments in the account 'dnvriend' and stage 'dev'
$ sceptre delete-env dnvriend/dev
```