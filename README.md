# Homerecipe
Recipe to cook my `$HOME` :yum:

#### My \$HOME isn't your \$HOME :house:
The core of this repository is a set of scripts to manage your `$HOME`.  
-   `cook`
-   `core/scripts/*`

They allow me to sync my `$HOME` settings across multiple devices.

Please note thta `dotfiles` and `recipes` are  my personal `$HOME` setup.  
They are not intended to be useful for all.


## Examples

#### Use it as is
(NOT recommended, they are my own setup)
```bash
git clone http://github.com/rytswd/homerecipe
./homerecipe/cook restore # Set up with all the defaults
```

#### Manage your existing $HOME setup

(*Recommended*) The below commands with Forked repository helps you manage your own `$HOME`.
```bash
# Fork this repository
git clone YOUR_FORKED_REPOSITORY
cd homerecipe
./cook remove
./cook backup
git commit -a -m "Restore backup"
git push
```


## Homerecipe Scripts
`cook` command provides access to Homerecipe toolset.  
They are the core of this repository (`core/scripts`), and `dotfiles` and `recipes` are consumed / generated by those.  
Find more with:
```bash
./cook help
```

#### Keep all devices up-to-date
`.homerecipe` is provided to set up alias for `cook` command.  
You may want to include the following line in your startup source (e.g. `.bash_profile`, `.profile`, `.zshrc`, etc.), which just sets up an alias to `cook` command.

```bash
source ~/.homerecipe
```

Then, you can simply use `cook` alias.
```bash
cook check
```

## Homerecipe Data
Homerecipe is just a directory structure with data in it. What kind of data? It is aimed for `dotfiles`, and some installed libraries, such as [Homebrew](http://brew.sh), [NPM](http://npmjs.org).

`dotfiles` directory contains many dotfiles I rely on.  
`recipes` directory contains a few items, such as list of installed `brew` and `npm` packages.

Syncing those `recipes` and `cook`-ing them allow me to apply the same setup to multiple devices.


## Environment
The following condition is assumed (and tested)

-   macOS
-   [Homebrew](http://brew.sh) is installed
-   `git` client is installed - e.g. `brew install git`


---

#### How I Use Homerecipe
I consistently work between different machines - with my laptop outside, and desktop machine at home.  
Until I created this repository, I often ended up running the same installation, dotfile updates, etc. on both machines.

I run the following commands to backup / restore / sync my `dotfiles` and `recipes`.

```bash
cook check # tells you the current status
# If up-to-date :       Homerecipe up-to-date! :)
# If you are ahead :    Some updates found - do you want to save, and push back to the server? [y/N]
#    and with commit :  Some updates found, which need to be pushed - do you want to go ahead and push? [y/N]
# If you are behind :   Recipes/dotfiles out of date - do you want to get the latest? [y/N]
# If other cases... :   Homerecipe found to be diverged... Please resolve manually using git commands
```

---

#### Environment Tested
This repository only focuses on my own usage, which means this was only tested with the following environment:  
-   macOS Sierra ver. 10.12.3


#### macos-recipe
There is currently no way to create this file programmatically.  
Please manually update the file (make sure that the file is executable).

---

#### Special Thanks
Thanks to the below list for setting up my own dotfiles

<https://github.com/kevinSuttle/macOS-Defaults> - great set of mac OS default setup  
<https://github.com/mathiasbynens/dotfiles> - many boilerplate dotfiles

#### More on dotfiles
GitHub has a nice list of many other alternatives  
<http://dotfiles.github.io/>

---

#### License
MIT
