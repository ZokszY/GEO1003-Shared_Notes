# Some checks to perform to ensure that the markdown files are well formatted

## Images

Not missing the width property:

```regex
!\[.+?\]\([^)]+\)(?!\s*\{)
```

## *Headers*

No bold or italic headers:

```regex
#+ .*\*.*\*
```
