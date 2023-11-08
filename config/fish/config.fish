if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim

abbr --add tm 'tmux'
abbr --add tml 'tmux ls'
abbr --add tma 'tmux attach-session -t'
abbr --add tmk 'tmux kill-session -t'

abbr --add g 'git'
abbr --add gs 'git status'
abbr --add gb 'git branch'
abbr --add gd 'git diff'
abbr --add gdc 'git diff --cached'
abbr --add gc 'git commit'
abbr --add gca 'git commit --amend --no-edit'
abbr --add ga 'git add --patch'

abbr --add bb 'brazil-build'
abbr --add bt 'brazil-build test'
abbr --add br 'brazil-build release'

abbr --add L --position anywhere --set-cursor "% | less"
abbr --add J --position anywhere --set-cursor "% | jq '.'"

function fish_right_prompt
  set -g __fish_git_prompt_showcolorhints true
  set -g __fish_git_prompt_showstashstate true
  set -g __fish_git_prompt_use_informative_chars true

  set -g __fish_git_prompt_char_dirtystate '  '
  set -g __fish_git_prompt_char_stagedstate '  '
  set -g __fish_git_prompt_char_untrackedfiles '  '

  fish_git_prompt
end

function YYYY-MM-DD
  date -u +"%Y-%m-%d"
end

function YYYY-MM-DD-HH
  date -u +"%Y-%m-%d-%H"
end

direnv hook fish | source
