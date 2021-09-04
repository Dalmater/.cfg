
# Termux dotfiles

## ***Just my personal dotfiles***
![picture](storage/Screenshot_Termux.jpg)

This is my setup for **Termux** on **Android**.<br>
With **zsh, fzf, nvim, vim/lightline, starship, Tmux,
git, vifm**, micro and some more. <br>
Oh, and a lot of **aliases and fzf functions**.

I'm using too many plugins but only 2-3 are essential
to me(fast syntax highlighting, zsh-autosuggestions, fzf-tab).<br>
I'm using [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) as a plugin manager with about 10-15 plugins.<br>
#### ***Zsh startup time on Android 9(Sm-j7) is about 0.8 - 1.2 sec***<br>(0.53s user 0.20s system 80% cpu 0.912 total)

#### ***Starship timings***
- In my home directory<br>
  - directory   -   2ms  -  ~ <br>
  - line_break  -  <1ms  -  \n <br>
  - character   -  <1ms  -  ❯ <br>

- In a git repo (oh-my-zsh)<br>
  - git_status   -  44ms  -   $×1 ✘×3 !×10<br>
  - git_metrics  -  41ms  -   +181|-242<br>
  - directory    -  13ms  -   ~/.zsh<br>
  - git_commit   -   5ms  -   (6d5b8484)<br>
  - git_branch   -   5ms  -    master:origin/master<br>
  - line_break   -  <1ms  -   \n <br>
  - character    -  <1ms  -   ❯

#### **Essential plugins**<br>
[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)<br>
[fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)<br>
[fzf-tab](https://github.com/Aloxaf/fzf-tab)

#### **Prompt**
[starship](https://github.com/starship/starship)

### **TODO**
Migrate to [Zinit](https://github.com/zdharma/zinit)
<br>
Clean up .zshrc with a zshenv and .zprofile file.
