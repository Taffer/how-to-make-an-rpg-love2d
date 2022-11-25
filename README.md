# Moved

This repo is has been replaced by: https://codeberg.org/Taffer/how-to-make-an-rpg-love2d

![Logo of the GiveUpGitHub campaign](https://sfconservancy.org/img/GiveUpGitHub.png)

Everything in this repo should be considered out of date.

# Love2D - How To Make An RPG

[Dan Schuller's "How To Make An RPG"](https://howtomakeanrpg.com/) code,
ported to Love2D.

Dan's book is good (I'm still reading though), but it's using a custom game
engine... I'm porting it to [Love2D](https://love2d.org/) so I can get better
at Love2D for my own games.

**Note:** This repo is using `git` submodules for the `3rdparty` code; use
`git clone --recursive` when cloning, or `git submodule update --init
--recursive` if you've already cloned the repo without submodules.

## Organization

The code from "How To Make An RPG" is split up into a lot (a _lot_) of
separate folders, each one demonstrating one step in the development of the
JRPG style game described in the book.

Rather than duplicate this, I'm going to `git tag` the code whenever I
finish a piece. For example, one of the first bits of code in the book is
`tilemap-1`; check out the tag (`git checkout tilemap-1`) to see what the
code for that bit looks like.

With any luck, I'll remember to add all the tags.

## Assets

The assets from Dan's book are copyrighted. If you want them, buy a copy of
the book!

Rather than re-use the copyrighted assets, I'm using free assets from the
amazing [Kenney](https://kenney.nl/).

* [Roguelike/RPG Pack](https://kenney.nl/assets/roguelike-rpg-pack)

## License

All of the _code_ I'm writing here is covered by the MIT license found in the
[`LICENCE`](LICENSE) file.

All of the _code_ found in the `3rdparty` folder is covered by whatever
license the author originally released it under. Check the
[`README.md`](3rdparty/README.md) in the `3rdparty` folder for details.

All of the _assets_ (in the `assets` folder) are from
[Kenney](https://kenney.nl/) and are released under the
[CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/)
license because Kenney wants us to be happy.
