# Sceptre Jinja Templating


## Sceptre User Data
Python or Jinja templates can contain data which should be parameterised, but can’t be parameterised using CloudFormation 
parameters. An example of this is if a Python template which creates an IAM Role reads in the policy from a JSON file. 
The file path must be hardcoded in the Python template.

Sceptre user data allows users to store arbitrary key-value pairs in their `<stack-name>.yaml` file. This data is then 
passed as a Python dict to the sceptre_handler(sceptre_user_data) function in Python templates.

Syntax:

```yaml
sceptre_user_data:
    iam_policy_file_path: /path/to/policy.json
```

or

```yaml
sceptre_user_data:
    iam_policy: !file_contents /path/to/policy.json
```

When compiled, `sceptre_user_data` would be the dictionary:
 
 ```json
 {"iam_policy_file": "/path/to/policy.json"}
 ```

## Sceptre Jinja Templating
Templates with `.j2` extensions are treated as Jinja2 templates. These are rendered and should create a raw JSON or YAML 
CloudFormation template. Sceptre User Data is accessible within templates as `sceptre_user_data`. For example:
 
```jinja2
{{ sceptre_user_data.some_variable }}
``` 

## Resources
- [Jinja Documentation](http://jinja.pocoo.org/)
- [Jinja Templating Documentation](http://jinja.pocoo.org/docs/2.10/templates/)
- [Jinja in 5 minutes](https://codeburst.io/jinja-2-explained-in-5-minutes-88548486834e) 
- [Sceptre Documentation](https://sceptre.cloudreach.com/latest/)
- aws login binx 