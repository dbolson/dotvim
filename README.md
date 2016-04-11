# Vim Dot Files

## Instructions

* `git clone http://github.com/dbolson/dotvim.git ~/.vim`
* `cd ~/.vim`
* `./bin/setup`

## Troubleshooting

### Installing CTags

` brew install ctags`

[More](http://www.scholarslab.org/research-and-development/code-spelunking-with-ctags-and-vim/):

Now you have to make sure that your shell finds the right version

```
> which ctags
/usr/bin/
```

Well, that’s not right. Let’s rearrange our $PATH.

```
> PATH=/usr/local/bin:$PATH
> which ctags
/usr/local/bin
```

That’s better. You probably want to put that into your ~/.bash_profile file to make sure you find
the right ctags in the future also.
