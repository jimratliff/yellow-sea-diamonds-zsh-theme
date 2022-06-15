# Yellow Sea Diamonds 🔶🔶🔶 theme for Zsh/Oh My Zsh
<img width="660" alt="Omnibus_demo_YSD_theme_annotated" src="https://user-images.githubusercontent.com/8410716/173704660-d06e09da-69e7-4a57-a1d2-e979124c39be.png">


See this README [on GitHub](https://github.com/jimratliff/yellow-sea-diamonds-zsh-theme/blob/main/README.md).

## Description of output and selective discussion of rationales
Here’s my theme for Zsh and [Oh My Zsh](https://ohmyz.sh/) that I developed for
my personal workflow that is characterized by:
- git
- Python 3 development
  - Consistent use of [venv virtual environments](https://docs.python.org/3/library/venv.html)
- I am the only person working on my machine
  - Therefore I don’t need to be told who the “user” is
- I’m not working with multiple machines/hosts
  - Therefore I don’t need to be told the name of the machine
- I know what time it is and can’t think of any reason to have a date or time
   stamp on the prompt line (though apparently other people do have such needs)
- I work on macOS 12.4 (Monterey) using iTerm and Oh My Zsh
  - (Although I use [VS Code](https://code.visualstudio.com/), too, I almost always use
   [iTerm2](https://iterm2.com/) as the terminal app rather than VS Code’s integrated terminal)
  - This is the only environment on which Yellow Sea Diamonds has been tested
  - Will [my diamond emoji](https://unicode-table.com/en/1F536/) with color
    [“Yellow Sea](https://www.htmlcsscolor.com/hex/EB9E2B)” (“🔶”) render
    correctly and with the the same color on other people’s systems?
      - I don’t know!

This theme creates a two-line prompt structure (not including the leading blank
line to create some whitespace after the just-previous output):
- Line 1:
   - “(venv)” (or whatever the name of your virtual environment directory)
     - The presence of this descriptor is conditional on your having an 
       activated virtual environment
     - See [§ Usage note: Prevent duplication of the ‘(venv)’ virtual-environment prompt](#usage-note-prevent-duplication-of-the-venv-virtual-environment-prompt) 
     below to stop virtualenv’s own “(venv)” 
     output from being duplicative
   - Current working directory, with “~” replacing $HOME when possible
   - Git information (conditional on there being git information to display)
     - “ | git: ”
     - Branch name
     - Clean (✅) or Dirty (❌), depending on whether there are uncommitted
       changes on your branch.
     - The SHA-1 hash of the current commit
- Line 2 (the actual prompt line):
   - Report of return code, ONLY if the return code was nonzero
     - Red box with white letters: “ERROR #64”, where here the 64 is an example
       of a return code I encountered.
     - An easy way to test this is just to enter at the prompt:
          `sh -c 'exit 1'`
     - I rejected including a ✅ or similar for a zero return code, because
       in my experience that’s not an exceptional event and so adding such 
       would create visual noise not offset by the minimal informativeness
       of the extra symbol.
   - The [Yellow Sea Diamond](https://unicode-table.com/en/1F536/) prompt,
     (“🔶”), after which this theme is named
     
Packing most of the content into the first line leaves plenty of room on 
Line 2 for comments with long arguments, particularly long file paths.

## Examples of output
### Current working directory (CWD) only—no git, no venv, no error return code
<img width="876" alt="Current_working_directory_only" src="https://user-images.githubusercontent.com/8410716/173452015-7bb02eaf-0eab-4dae-b601-b4324882f62d.png">

### CWD plus activated virtual environment
<img width="876" alt="Name_of_activated_virtual_environment" src="https://user-images.githubusercontent.com/8410716/173451313-efd99a0f-88ff-4891-b478-f4825d604ef1.png">

### CWD plus git (with no uncommitted changes, i.e., “clean”)
<img width="875" alt="Git_example_clean" src="https://user-images.githubusercontent.com/8410716/173451576-273553c7-9b31-4288-ac1b-248f25097c73.png">

### CWD plus git (with uncommitted changes, i.e., “dirty”)
<img width="875" alt="Git_example_dirty" src="https://user-images.githubusercontent.com/8410716/173451603-b88bb508-3c79-4523-806b-c3c43e4ca922.png">

### CWD plus nonzero return code
<img width="879" alt="Nonzero_return_code_example" src="https://user-images.githubusercontent.com/8410716/173451675-5686422f-ca17-47ce-b9ce-464e5f4b39fd.png">

## Install Yellow Sea Diamonds
You can download this theme from its GitHub repository at:
```
https://github.com/jimratliff/yellow-sea-diamonds-zsh-theme/archive/refs/heads/main.zip
```
and unzip the archive to find the Oh My Zsh theme file `yellow-sea-diamonds.zsh-theme`.

Although that is the *file* name, the theme name is simply `yellow-sea-diamonds`.

You can install Yellow Sea Diamonds in either of the following locations

```
~/.oh-my-zsh/themes
```
or
```
~/.oh-my-zsh/custom/themes
```
Then edit your `~/.zshrc` file and change its `ZSH_THEME` line to be:
```
ZSH_THEME="yellow-sea-diamonds"
```
Follow this up with:
```
source ~/.zshrc 
```



## Usage note: Prevent duplication of the “(venv)” virtual-environment prompt
When you activate a venv virtual environment, virtualenv will supply its own “(venv)” line of output. If you
don’t prevent that, this will be annoyingly duplicative of Yellow Sea Diamond’s own “(venv)” prompt component. See
the screenshot immediately below.

<img width="879" alt="(venv)_with_duplication" src="https://user-images.githubusercontent.com/8410716/173463867-255cd7fc-3a0d-44d8-b842-0e4d8855f6d9.png">


The key to preventing this duplication is issuing the following command *before* you activate your virtual environment:
```
export VIRTUAL_ENV_DISABLE_PROMPT=1
```
(Hat tip to [icktoofay’s answer](https://stackoverflow.com/a/16257963/8401379) and [Marlon Richert’s answer](https://stackoverflow.com/a/69314224/8401379) on Stack Overflow. Also, see the [documentation for `VIRTUAL_ENV_DISABLE_PROMPT`](https://virtualenv.pypa.io/en/legacy/reference.html#envvar-VIRTUAL_ENV_DISABLE_PROMPT): “Any virtualenv *activated* when this is set to a non-empty value will leave the shell prompt unchanged during processing of the activate script, rather than modifying it to indicate the newly activated environment.” (Emphasis in original.))

See the next screenshot for this method in action:
<img width="879" alt="(venv)_without_duplication" src="https://user-images.githubusercontent.com/8410716/173463935-af8b2c22-151a-4ce7-a2a8-8430b40d7d0d.png">

Of course, you won’t want to have to remember to type this command every time you activate a virtual environment. You’ll
probably find it worthwhile to [make an alias](https://linuxhint.com/configure-use-aliases-zsh/) like the following:
```
alias activate_venv='export VIRTUAL_ENV_DISABLE_PROMPT=1;source venv/bin/activate'
```
Then, after `cd`-ing into the directory in which your `venv` directory resides, just type `activate_venv` to 
simultaneously activate your virtual environment while also suppressing Zsh’s otherwise duplicative “(venv)” output. See the next screenshot:
<img width="879" alt="(venv)_without_duplication_using_alias" src="https://user-images.githubusercontent.com/8410716/173464465-18b83048-397e-4863-8531-5a742149f0bf.png">

## Some tips for customizing Yellow Sea Diamonds, or any theme, to your liking
### Good resources to learn about customizing themes
An outstanding source to learn about customizing themes is Sarah Port, “[Writing ZSH Themes: A Quickref](https://blog.carbonfive.com/writing-zsh-themes-a-quickref/),” CarbonFive, March 3, 2020. In particular the [Quick Reference](https://jsfiddle.net/seport/shrovLgf/embedded/result/) is amazing.

Also see:
- Armin Briegel, “[Moving to zsh, part 6 — Customizing the zsh Prompt](https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/),” Scripting OS X.
- § “[Prompt Expansion](https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion)” in
[The Z Shell Manual](https://zsh.sourceforge.io/Doc/Release/index.html). 

### Changing colors
It’s very easy to change the color scheme of Yellow Sea Diamonds.

Yellow Sea Diamonds specifies a color by using an integer 0–255 in, for example, an `%{$FG[226]%}` command, where `FG` 
stands for “foreground,” as opposed to `%{$BG[226]%}`, which sets the background color.

[To be honest, I have no idea what all the characters in, for example, `%{$FG[226]%}`, are doing. If they’re really necessary, somehow I’ve gotten away with simple use of `$FG[226]`, as you’ll see in the code for Yellow Sea Diamonds. (I’d love to be enlightened! 🧐]

If you want to conveniently access the mapping between integers and colors, just use the `spectrum_ls` command, e.g.,
see the next screenshot:

<img width="474" alt="spectrum_ls_output" src="https://user-images.githubusercontent.com/8410716/173466889-6551450e-6629-4068-9f6f-60e7de5897b7.png">

After you turn on a new color with `$FG`, you’ll at some point later want to reset it (so that color doesn’t take over the world) with
`%f`. To reset the background color, use `%k`. To reset both foreground and background simultaneously, you’ll often
see `%{$reset_color%}`.

You can also access a handfull of colors by name, rather than number: Black, Red, Green, Yellow, Blue, Magenta, Cyan,
White. If you specify a color by name, you’ll need to use the lowercase version of $FG and $BG, e.g., `$fg[red]`.
  
### Deleting a component or rearranging components
The ultimate output of Yellow Sea Diamonds, or any such theme, is the prompt structure itself.

In YSD, this is defined at the very end of the theme:
```
PROMPT="
╭─$VIRTUALENV_REPORT $CWD $GIT_REPORT $COMMIT_HASH %{$reset_color%}
╰─$REPORT_RETURN_CODE\$(prompt_char) "
```
I hope that the components are named so transparently that it’ll be fairly obvious how to delete something you don’t
want or rearrange the components that are already there.

Each of the components is defined above the prompt structure, and they are defined in the same order that they appear
in the prompt structure (L to R, then up to down).

Of course, you can add components, too. But you’re on your own there. 😉

### Look out for: does the commit hash continue to update automatically?
As you modify and refactor, I’d suggest that you continuously test your code.

One thing in particular to watch out for: Does the commit hash continue to update automatically? I’ve had the problem
arise where a commit hash would be displayed, but then—after I made a subsequent commit—that hash wouldn’t change. It’s
an easy failure to miss, so I suggest—as part of your testing during development—to continuously make a new commit to
check whether its hash updates.

## Version History
* 1.0.0 6/13/2022
<!--
* 0.2
    * Various bug fixes and optimizations
    * See [commit change]() or See [release history]()
* 0.1
    * Initial Release
-->
## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/jimratliff/yellow-sea-diamonds-zsh-theme/blob/main/LICENSE) file for details.
