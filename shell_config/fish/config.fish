if status is-interactive
  # startx in tty1,login
  if status --is-login
    if test (tty) = "/dev/tty1"
      if test -z "$DISPLAY"
        exec startx
      end
    end
  end
# Commands to run in interactive sessions can go here
  fish_vi_key_bindings
  fish_add_path $HOME/.cargo/bin
  set -gx EDITOR nvim
  
  # for kitty
  function newterm
    kitty @ launch --type=os-window --cwd current
  end

  # for yazi
  function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
      builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
  end
end
