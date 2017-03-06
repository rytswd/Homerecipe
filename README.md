# Homerecipe
Recipe to cook my `$HOME`


## My `$HOME` isn't probably your `$HOME`...
This is rather my own recipe, which may not work for you.  
<http://dotfiles.github.io/> provides all the alternative ways to handle dotfiles.

I created this repo because I wanted to wrap up dotfiles I already had into one bundle.  
This repository contains all of my personal setup in `dotfiles` and `recipes` directories.  
By removing all the contents there, you can use the wrapper part of this repository to personalize for your use case.  

## Requirements
Because this repository is designed for macOS users, it assumes the following:
-   [Homebrew](http://brew.sh) is installed
-   `git` client is installed - `brew install git`

Also, it is recommended to have a basic understanding of shell scripting.


## Usage
If you wish to use `Homerecipe` logic for maintaining your own `$HOME`, I would strongly suggest to fork this repository.  
Because all the `dotfiles` and `recipes` are only meant to be used by myself, downloading / cloning this repository directly means that you may have difficult time syncing to the latest.

*NOTE: Although I'm not intending to update this repo so frequently.*

### Save Your Own $HOME
The core of this repository is just the `scripts` directory.  
You can override other files with your own files to manage your `$HOME`.

-   Fork this repo (recommended)
-   Remove all contents inside `dotfiles` and `recipes`
-   Copy all of your dotfiles under `dotfiles` directory
-   CD into homerecipe's root directory
-   Run `./cook prep`
-   Commit the change

---

#### Environment Tested
This repository only focuses on my own usage, which means this was only tested with the following environment:  
-   macOS Sierra ver. 10.12.3

#### My Own Note
For any weirdo who wants to copy my $HOME... (myself, obviously)  
```bash
git clone http://github.com/rytswd/homerecipe
./homerecipe/cook all
```

#### macos-recipe
There is currently no way to create this file programmatically.  
Please manually update the file (make sure that the file is executable).

---

#### Special Thanks
Thanks to the below list for setting up my own dotfiles

<https://github.com/kevinSuttle/macOS-Defaults> - great set of mac OS default setup  
<https://github.com/mathiasbynens/dotfiles> - many boilerplate dotfiles
