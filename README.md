
# Termux dotfiles

## ***Just my personal dotfiles***

This is my setup for **Termux** on **Android**.<br>
With **zsh, fzf, nvim, vim/lightline, starship, Tmux,
git, vifm**, micro and some more. <br>
Oh, and a lot of **aliases and fzf functions**.

I'm using a dozen plugins but only 3 are essential
for me(fast syntax highlighting, zsh-autosuggestions, fzf-tab).<br>
### ***Zsh startup time on Android 9(Sm j7) is about 0.8 - 1.2 sec***<br>
#### ***Starship timings***<br>
- In my home directory<br>
  - git_status  -  22ms <br>
  - directory   -   2ms <br>
  - line_break  -   1ms <br>
  - character   -   1ms <br>

- In a git repo (oh-my-zsh)<br>
  - git_status   -  44ms  -   $×1 ✘×3 !×10<br>
  - git_metrics  -  42ms  -   +181|-242<br>
  - directory    -  13ms  -   ~/.zsh<br>
  - git_commit   -   5ms  -   (6d5b8484)<br>
  - git_branch   -   5ms  -    master:origin/master<br>
  - line_break   -   1ms  -   \n<br>
  - character    -   1ms  -   ❯

### **Essential plugins
[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions.git)
[fast-syntax-highlighting](p)
[fzf-tab](https://github.com/Aloxaf/fzf-tab.git)
