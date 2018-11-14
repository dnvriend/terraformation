# jq
[Jq](https://stedolan.github.io/jq/) is a lightweight and flexible command-line JSON processor.

## Introduction
jq is like sed for JSON data - you can use it to slice and filter and map and transform structured data with the same 
ease that sed, awk, grep and friends let you play with text.

Data in jq is represented as streams of JSON values - every jq expression runs for each value in its input stream, 
and can produce any number of values to its output stream.

## Installation
Type:

```bash
$ pip install jq
$ jq -V
jq-1.5
```

Note:
- Flag `-c` is for compact output

## Examples
**Simple identity:**

```bash
echo '{"name": "dennis", "age": 42 }' | jq -c '.'
{"name", "dennis", "age":42} 
```

**Select a field:**

```bash
echo '{"name": "dennis", "age": 42 }' | jq -c '.name'
"dennis"
echo '{"name": "dennis", "age": 42 }' | jq -c '.age'
42
echo '{"name": "dennis", "age": 42 }' | jq -c '.foo'
null
echo '' | jq -c '.foo' 

```

**Select an optional field:**

```bash
echo '{"name": "dennis", "age": 42 }' | jq -c '.name?'
"dennis"
echo '{"name": "dennis", "age": 42 }' | jq -c '.age?'
42
echo '{"name": "dennis", "age": 42 }' | jq -c '.foo?'
null
```

**Note:**
All the syntax above is a shorthand notation for `.["name"]`, `.["age"]` and `.["foo"]`.
 
Indexing arrays:

```bash
echo '[{"name": "dennis", "age": 42 }, {"name": "elsa", "age": 16 }]' | jq -c '.[0]'
{"name":"dennis","age":42}
echo '[{"name": "dennis", "age": 42 }, {"name": "elsa", "age": 16 }]' | jq -c '.[1]'
{"name":"elsa","age":16}
```

Slice an array:

```bash
echo '["a", "b", "c"]' | jq -c '.[1:3]'
["b","c"]
```

Array iterator:
The following returns all elements of the array on a separate line, as it is an iterator:

```bash
echo '["a", "b", "c"]' | jq -c '.[]'
"a"
"b"
"c"
```

## cfn-flip based examples

### A simple identity function
```bash
cfn-flip --json examples/person.yaml  | jq '.' | cfn-flip --yaml
```

Output:

```yaml
name: dennis
age: 42 
```

### Change fields
```bash
cfn-flip --json examples/person.yaml  | jq '{ "name": .age, "age": .name}' | cfn-flip --yaml
```

Output:

```yaml
name: 42
age: dennis
```

## Arguments
When jq is invoked with `--arg`:

```text
jq --arg help
jq: --arg takes two parameters (e.g. --arg varname value)
Use jq --help for help with command-line options,
or see the jq manpage, or online docs  at https://stedolan.github.io/jq
```

This option passes a value to the jq program as a predefined variable. If you run jq with `--arg foo bar`, 
then `$foo` is available in the program and has the value "bar". Note that value will be treated as a string, 
so `--arg foo 123` will bind $foo to "123".

Named arguments are also available to the jq program as $ARGS.named.

Example:
```bash
cfn-flip --json examples/bucket.yaml | jq --arg campaign b --arg bucket bucket-a '.sceptre_user_data.origins[$campaign].bucket = $bucket' | cfn-flip --yaml
```

## Resources
- [jq](https://stedolan.github.io/jq/)
- [jq tutorial](https://stedolan.github.io/jq/tutorial/)
- [jq filters](https://stedolan.github.io/jq/manual/#Basicfilters)
- [jq playground](https://jqplay.org/)