# Advent of Code, Day 1 Shakespeare Programming Language solution
===

# Instruction

Just getting it to work is a non-trivial task, because the original SPL source
contains a bug that makes it impossible to write SPL interpreters with modern
versions of bison or flex. I'm not sure which.

## Get SPL
[Here](https://bitbucket.org/kcartmell/marlowe/downloads/marlowe-1.0.tar.gz) is
a fixed version. Download, untar, `make`. You'll probably need build-essential
and some other packages, but it should be easy to determine what's missing from
the error messages.

## Provide environment variables
`SPL` -- should point to `spl2c`

`SPL_INCLUDE` -- should point to the directory containing `spl.h`

`SPL_LIB` -- should point to the directory containing `libspl.a`

## make
That's it.

## Result
![Image of result][result]

[result]: http://i.imgur.com/6MrM8qQ.png
