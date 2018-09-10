# dpghs (diceware password generator)

dpghs is simple utility that aims at generating secure, easy to remember passwords using diceware method.

## What is diceware?

Common problem with strong, secure passwords is that these are hard to remember. Diceware method () aims to solve the problem. This method is based on generating password containing couple of words (4 or more). It is easier to remember couple of words, especially those that could be somehow visualized, than do the same with random string of letters, special characters, digits etc. Good explanation of diceware has been depicted in one of the xkcd comic strips: 

![alt text](https://imgs.xkcd.com/comics/password_strength.png "xkcd on Diceware")

Diceware method is described in details by its author - Arnold G. Reinhold: http://world.std.com/~reinhold/diceware.html

## Usage

This project has been created using `stack` tool for Haskell (https://docs.haskellstack.org/en/stable/README/).

`stack repl` launches ghci with all code from the sources loaded

`stack build` builds executable (it will be placed under `.stack-work/install` directory)

### Options

`Dpghs` supports following options:
- `-l language` - specifies which language list to use to generate password. Please note that language file has to exist, and should be named in a following manner: "diceware-xy.txt" where xy is two letter code of the language (de for German, en for English, pl for Polish etc.)
- `w words` (password length) - how long (in words) generated password should be
- `p password count` - how many passwords to generate

Example of Usage:
`dpghs -l pl -w 6 -p 3` - generate 3 passwords, each consisting of 6 words. Words will be taken from diceware list for Polish language.

## Diceware lists

`Dpghs` requires list of words to be used (diceware word list). At the moment the application has two lists built in: one containg words in English (default) and other list containing words in Polish (it has to be explicity specified). 

List of english words has been taken from FFI website: https://www.eff.org/deeplinks/2016/07/new-wordlists-random-passphrases
List of Polish words has been created by me (https://github.com/MaciekTalaska/diceware-pl) - this work is based on the list created originally by Piotr (DrFugazi) Tarnowski.


[Mathias Gumz's repository](https://github.com/mgumz/diceware/tree/master/lists) contains diceware lists for different languages.

## Licenses 

Diceware is trademark (™) by Arnold G. Reinhold (http://world.std.com/~reinhold/diceware.html)

The English word list used is created and copyrighted by Electronic Frontier Foundation (https://www.eff.org/about).

Polish word list has been created by myself, but is based on the work of Dr Piotr 'Fugazi' Tarnowski.
