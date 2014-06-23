# Vim Dot Files

## Instructions

```
git clone http://github.com/dbolson/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
cd ~/.vim
git submodule update --init
```

### Installing Additional Plugins

For installing e.g., fugitive.vim:

* `git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive`
* `git submodule update --init`

### Installing JSHint

```
brew install node
curl https://npmjs.org/install.sh | sh
npm install -g jshint
```

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
