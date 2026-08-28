# execute the last command with sudo if it was not
function please
  set last_command (history --max=1)
  echo (set_color yellow)$last_command(set_color normal)
  if test (string match -r '^sudo' $last_command)
    eval $last_command
  else
    eval "sudo $last_command"
  end
end
