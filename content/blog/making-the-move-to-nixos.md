+++
title = "Making the move to NixOS"
date = "1970-01-02"
draft = true
taxonomies.tags = ["nixos"]
+++

So a few month ago (november 2023), I pushed my first `nixos` branch commit of my `dotfiles` repository. But what lead me here, digging my own hole, wasting time on creating wanky derivations and non-working NixOS configuration modules?

<!-- more -->

I've always been attracted by clean things, especially in programmation, things that feel right. I'd touched to things like Terraform before, but 

# Before

I've spent my entire childhood on macOS systems, Mac Book Pros owned by my parents, then an IMac that we acquired in 2016 when entering [6eme] grade. When entering in [3eme] grade, right after the global shutdown, my school made the "technology transition", I had to acquire a cheap computer through school partners to access online books and class ressources directly in class. It came with their custom Windows 10 image with preinstalled software.

// Fact check
>> Bonus story : Day 1 of finally receiving my laptop, I fucked around with partitions to reinstall Windows and corrupted my hard drive
Downloading unknown partition management software from the internet to delete randon bit without even think of the consequences (though it's not the first time, i've already dropped the partition table of a work — think work as important stuff that could be sensitive to lost — hard drive of my father)

Due to delays when fixing my hard drive (or them being unable to trouleshoot?) they sent me back a better computer (wider screen, better cpu, etc.) though it had the same three inches thicc screen borders. Despite hating Windows at the time {.fold}(guess I won't get a job offer from Microsoft from now on), I must have considered I wasn't ready to switch to a linux-based distro. {.delete}(Also Windows has good proprietary software support overall :smile:.) I had to suffer WSL2, which is actually pretty good to get started at CLI while still having a friendly environnement (e.g installing games). It definitly helped to transition later.
While traveling in 2021, Windows really pissed me off in the plane, I don't remember why exactly, but WSL was laggy and just I really didn't like the overall Windows experience. The night I arrived at our stay, I completly reinstalled my computer to fresh version of `PopOS!` (Ubuntu/GNOME shell with great defaults btw). When experimenting the next few days, it felt like I had gained x5 performance. That's also when I discovered tiling managers (god, what would I do today? use a mouse? lmao). No, seriously, if you haven't used them, thy rn. (Looking at my history, might have done a bual boot) (Regolith)

> Wait, I started to write Rust programs on WSL, wtf.

When looking at my dotfiles repository, I created minor commits in 2020, but really spent some time to backup properly my config in february 2021 using `DotBot` that would automatically create symlinks and for that matter keep my config synced with upstream.

(date acquisition asus) I bought my own laptop with correct RAM size 16GB and a better cpu, I could finally install a real distro on it: Ubuntu :smile:. I tried to install Arch but I stuggled so much to get it working, I figured out it would be hard to work everyday on it, also i've been several time about arch updates being real destructive when not being careful. Also I went for a dual boot at first cause I did played a little with friends

>> Bonus story 2 : once deleted my network manager by removing the python3 package and doing `apt autoremove` (yep, that's destuctive). the first you would do in that case is to search online, but I hope you already figured out there an issue blocking. (precision: this happened during classes to searching on an other computer was not possible either). Lucky I still had my dual boot, I could transfer downloded pkgs from the internet on windows via my friends usb key to my ubuntu session. Also, that auto remove did a lot of damage cause I know I missed things that were perfectly working before this event.

I'd been intrested in making a new wayland setup with sway cause it seems it would work better when dealing with scaling differences between displays and cause wayland is supposed to be a fresher still perfectly working protocol.

In december, my computer's keyboard suddently broke and forced me to hand my laptop to repair. I was left with my older computer and it's half installed NixOS. I took the time to backup my PGP key and push git changes (forgot that I had a bunch of classes notes in LaTeX, these were lost forever). I recieved my ASUS laptop only 3 weeks later during which I had perfected my NixOS and fallen into the config trap, my NixOS and home manager game had leveled up hard.

Well thats what I thought before learning that I wasn't even close to mastering NixOS. Indeed, mastering NixOS is actually grasping every Linux concepts, how components of your system communicate (dbus, systemd, etc.), how to write bash shells, with a shiny abtraction on top of it that lets you nicely interface with it.

> Insert xkcd learning curve where you think you genius

I also engaged in making a quick script that could flash installer ISO that could setup a computer without an internet connection, it took me 3 more weeks to make this installer only to find out this wasn't practical at all and I made it more lightweight.

Still, I could now reinstall NixOS on my main laptop. I am very happy with my current setup with is btrfs on luks without running a single command thanks to Disko

# Start

Using my older laptop I could easily flash a NixOS installer and make many unsucessful attempts to installing it. I finally took some time to understand how it worked and create a basic config. Then a Nixos god broke my main laptop keyboard and so my only option was to use my newly installed nixos computer and live with it. Getting into it the hard way (I prepared myself, save my config, etc.) actually worked perfectly for me.

tl;dr : learing nixos is hard

nix3 / flakes / "experimental" / nix / modules / HM / overlays / registries / channels / a fk dumb interpreter (no offense) / quite opaque

Talking about the NixOS process
- How I split my config


nixos is just a bash abstraction :smile: over normal linux config

insert nixos meme "files were not meant to have sha 256 filenames

# Current 

still having toubles with packaging and creating nixos modules

Few months in, what's up!

So far, I really like the declarative way approach as I thought I would. However, that isn't without some quirks.
- I cannot wrap my head around problems like derivations.
- Takes much time and energy, I often lost time trying to makes modules or custom derivations.
- Must ditch old doc and make your own mental model of nix3/flakes
- I really like the fact that I can keep my env kind of clean, but still don't know exactly how to deal with libraries pathes, etc.

# Future

- what i wan't to do in the future

> Grades US/UK, France, Years
10   9    8    7    6    5    4    3 
T    1    2    3    4    5    6    7
23   22   21   20   19   18   17   16
