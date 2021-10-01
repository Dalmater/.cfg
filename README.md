
# Termux dotfiles

## ***Just my personal dotfiles***
![picture](storage/Screenshot_Termux.jpg)

This is my setup for **Termux** on **Android**.<br>
With **zsh, fzf, nvim, vim/lightline, starship, Tmux,
git, vifm**, micro and more. <br>
A lot of **aliases, fzf functions** and a couple scripts.

I'm using too many plugins but only 2 or 3 are essential(fast syntax highlighting, zsh-autosuggestions, fzf-tab).<br>
[oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)(configured) manages about 10 - 15 plugins.<br>
***Zsh startup time on Android 9(Sm-j7) is about 0.5 - 0.75 sec***<br>
(zsh -i -c exit  0.39s user 0.12s system 85% cpu 0.625 total)

#### **Essential plugins**
[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)<br>
[fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)<br>
[fzf-tab](https://github.com/Aloxaf/fzf-tab)

#### **Prompt**<br>
[starship](https://github.com/starship/starship) ***timings***<br>
- In my home directory
  - directory   -   2ms  -  ~
  - line_break  -  <1ms  -  \n
  - character   -  <1ms  -  ❯

- In a git repo (oh-my-zsh)
  - git_status   -  43ms  -   »×8 !×7
  - git_metrics  -  38ms  -   +68|-115
  - directory    -  13ms  -   ~/.zsh
  - git_commit   -   5ms  -   (93ad3a8)
  - git_branch   -   5ms  -    master:origin/master
  - line_break   -  <1ms  -   \n
  - character    -  <1ms  -   ❯<br>
![Termux-pic](storage/Termux_Prompt-time.jpg)

### **TODO**<br>
Migrate to [Zinit](https://github.com/zdharma/zinit)
or do it without any plugin manager by myself.
