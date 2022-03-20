# F2C -- A Commandline Temperature Converter

## Overview
f2c converts the temperature from degrees Fahrenheit to Celsius, and from Celsius to Fahrenheit

## Example

```
$> f2c -11
$> -11 faherenheit equals -24 celsius

$> c2f -11
$> -11 celsius equals 12 fahrenheit
```

## To Do
- Install ruby. System ruby works fine - no need for gemsets. You can verify the full path with
```
$> which ruby
/usr/bin/ruby
```

- Download `f2c.rb`

- Create aliases in your bash / zsh dot profile:

```
alias c2f='ruby ~/your/local/path/to/f2c.rb c2f'
alias f2c='ruby ~/your/local/path/to/f2c.rb f2c'
```

## More
The code contains comments regarding set-up (essentially the above), explains more about shell aliases, and provides some talk about the converters.
