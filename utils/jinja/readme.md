# jinja2
Jinja2 is a modern and designer-friendly templating language for Python. It is fast, widely used and secure with the 
optional sandboxed template execution environment. It is supported by [sceptre](https://sceptre.cloudreach.com/latest/)

## Basics
```jinja2
{% ... %} for Statements
{{ ... }} for Expressions to print to the template output
{# ... #} for Comments not included in the template output
#  ... ## for Line Statements
```

## Remove unnecessary whitespace from Jinja rendered template
Jinja has multiple ways to [control whitespace](http://jinja.pocoo.org/docs/dev/templates/#whitespace-control). It does 
not have a way to prettify output, you have to manually make sure everything looks "nice".

The broadest solution is to set trim_blocks and lstrip_blocks on the env.

```python
app.jinja_env.trim_blocks = True
app.jinja_env.lstrip_blocks = True
```

If you want to keep a newline at the end of the file, set `strip_trailing_newlines = False`.

You can use control characters to modify how the whitespace around a block works.  
`-` always removes whitespace before and after a tag, 
`+` always preserves it before, overriding the env settings for that block. 

The character can go at the beginning or end (or both) of a block to control the whitespace in that direction.

```jinja2
{%- if ... %} strips before
{%+ if ... %} preserves before
{%+ if ... -%} preserves before and strips after
```

Remember that `{% endif %}` is treated separately.

Note that the control characters only apply to templates you write. If you include a template or use a macro from a 3rd party, 
however they wrote the template will apply to that part.

## Resources
- [Primer on Jinja Templating](https://realpython.com/primer-on-jinja-templating/)
- [Remove unnecessary whitespace from Jinja rendered template](https://stackoverflow.com/questions/35775207/remove-unnecessary-whitespace-from-jinja-rendered-template)