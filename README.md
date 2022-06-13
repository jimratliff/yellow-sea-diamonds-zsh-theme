# Yellow Sea Diamonds 🔶🔶🔶 theme for Zsh/Oh My Zsh
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
  - (Although I use VS Code, too, I almost always use iTerm2 as the terminal app
    rather than VS Code’s integrated terminal)
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
     
Packing most of the content into the first line, leaves plenty of room on 
Line 2 for comments with long arguments, particularly long file paths.

## Examples of output
### Current working directory only, no git, no venv, no error return code
<img width="876" alt="Current_working_directory_only" src="https://user-images.githubusercontent.com/8410716/173452015-7bb02eaf-0eab-4dae-b601-b4324882f62d.png">

### CWD plus activated virtual environment
<img width="876" alt="Name_of_activated_virtual_environment" src="https://user-images.githubusercontent.com/8410716/173451313-efd99a0f-88ff-4891-b478-f4825d604ef1.png">

### CWD plus git (with no uncommitted changes, i.e., “clean”)
<img width="875" alt="Git_example_clean" src="https://user-images.githubusercontent.com/8410716/173451576-273553c7-9b31-4288-ac1b-248f25097c73.png">

### CWD plus git (with uncommitted changes, i.e., “dirty”)
<img width="875" alt="Git_example_dirty" src="https://user-images.githubusercontent.com/8410716/173451603-b88bb508-3c79-4523-806b-c3c43e4ca922.png">

### CWD plus nonzero return code
<img width="879" alt="Nonzero_return_code_example" src="https://user-images.githubusercontent.com/8410716/173451675-5686422f-ca17-47ce-b9ce-464e5f4b39fd.png">

## Usage notes
### Prevent duplication of the “(venv)” virtual-environment prompt
When you activate a venv virtual environment, your shell will typically supply its own “(venv)” line of output. If you
don’t prevent that, this will be annoyingly duplicative of Yellow Sea Diamond’s own “(venv)” prompt component. See
the screenshot immediately below.

The key to preventing this duplication is issuing the following command *before* you activate your virtual environment:
```
export VIRTUAL_ENV_DISABLE_PROMPT=1

```
Of course, you won’t want to have to remember to type this command every time you activate a virtual environment. You’ll
probably find it worthwhile to make an alias like the following:
```
alias activate_venv='export VIRTUAL_ENV_DISABLE_PROMPT=1;source venv/bin/activate'
```
Then, after `cd`-ing into the directory in which your `venv` directory resides, just type `activate_venv` to 
simultaneously activate your virtual environment while also suppressing Zsh’s otherwise duplicative “(venv)” output.
