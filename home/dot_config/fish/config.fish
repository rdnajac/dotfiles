# only run the shell init scripts if the commands are available
function __source_if_command
  command -q $argv[1]; and $argv | source
end

# needs the absolute path since it's not on $PATH yet
__source_if_command /opt/homebrew/bin/brew shellenv

# commands to run in interactive sessions go here
if status is-interactive
  __source_if_command atuin init fish
  __source_if_command chezmoi completion fish
  __source_if_command fzf --fish
  __source_if_command starship init fish
  __source_if_command thefuck --alias
  __source_if_command zoxide init fish

  # fish handles `alias` and `export` natively
  if test -f ~/.bash_aliases
    source ~/.bash_aliases
  end

  if test -n "$NVIM"
    echo "Setting up OSC 7 for Neovim terminal"
    function __print_osc7 --on-variable PWD
      printf '\033]7;file://%s\033\\' "$PWD"
    end
  end

  fish_config theme choose tokyonight
end

# clean up
functions -e __source_if_command

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
set -gx MAMBA_EXE "/Users/rdn/.local/bin/micromamba"
set -gx MAMBA_ROOT_PREFIX "/Users/rdn/.cache/micromamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
