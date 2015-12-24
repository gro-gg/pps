# pps - Puzzle project switcher

This tool allows you to easily switch between different projects in your shell.

## Installation

Clone the repository and source the `pps` script:

    cd
    git clone https://github.com/gro-gg/pps
    source pps/pps

Add the following lines to your `.bashrc` or `.zshrc` to use it every time you start a shell:

    source ~/pps/pps


## Configuration
After the first start `pps` will place `template` configuration file in `~/.config/`.
You can now copy this file to create a profile for a project and add your project specific configuration to it.


## Features
Simply switch to a specific profile:

    [user:~] $ pps <profile-name>

Reset your profile specific settings with:

    [user:~] $ pps clean

You can see with profile is laoded by typing:

    [user:~] $ pps status

If you are using [Liquid Prompt](https://github.com/gro-gg/liquidprompt), the current profile will be displayed at the beginning of your prompt:

    {project-name} [user:~] $
