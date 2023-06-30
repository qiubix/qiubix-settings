# Global vi-mode config
# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space


# This is a custom configuration for plugin:
#
# jeffreytse/zsh-vi-mode
#
# It needs to be enabled in .zsh_plugins.txt for this bindings to work

# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

function zvm_after_lazy_keybindings() {

  # Incremental search is elite!
  bindkey -M vicmd "/" history-incremental-search-backward
  bindkey -M vicmd "?" history-incremental-search-forward

  # Search based on what you typed in already
  bindkey -M vicmd "//" history-beginning-search-backward
  bindkey -M vicmd "??" history-beginning-search-forward

  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
}

# This is a custom configuration for plugin:
#
# ohmyzsh/oh-my-zsh path:plugins/vi-mode
#
# It needs to be enabled in .zsh_plugins.txt for this bindings to work

# vi mode binding
# bindkey -M viins 'jk' vi-cmd-mode

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
