
{
  # Compile zcompdump, if modified, to increase startup speed.
  zcompdump="${ZSH_COMPDUMP}"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!
