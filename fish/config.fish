if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f /opt/miniconda3/etc/fish/conf.d/conda.fish
        . /opt/miniconda3/etc/fish/conf.d/conda.fish
    else
        set -x PATH /opt/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

export TESSDATA_PREFIX="$HOME/tessdata/"
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
export QT_QPA_PLATFORMTHEME=qt6ct
export PATH=/home/blake/.local/bin:/home/blake/Scripts/:/opt/miniconda3/condabin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/cuda/bin:/opt/cuda/nsight_compute:/opt/cuda/nsight_systems/bin:/var/lib/flatpak/exports/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/opt/cuda/lib:/usr/lib:/opt/TensorRT-10.7.0.23/bin/:/home/blake/.modular/bin/:/home/blake/.local/lib/:/opt/TensorRT-10.7.0.23/include/:/home/blake/.local/share/syncovery/
export LD_LIBRARY_PATH=/opt/cuda/lib:/usr/lib:/opt/TensorRT-10.7.0.23/lib/
export LIBRARY_PATH=/opt/cuda/lib:/usr/lib:/opt/TensorRT-10.7.0.23/lib/
export EDITOR="nvim"

alias ls "lsd --hyperlink auto -a"
alias ll "lsd --hyperlink auto -ahl"
alias mkdir "mkdir -p"
alias cp "cp -r"
alias .. "cd .."
alias cr "cargo run"
alias cb "cargo build"

export SUPERPOWERSAVE=1

set -x PATH /home/blake/.cargo/bin/ $PATH

starship init fish | source
set -gx PATH $HOME/.npm-global/bin $PATH
set -Ux OPENAI_API_KEY sk-958a83e9f9184c86624056e16f37a51e
set -Ux AVANTE_OPENAI_API_KEY sk-958a83e9f9184c86624056e16f37a51e
