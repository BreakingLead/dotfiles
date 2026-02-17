$env.config.show_banner = false


$env.PROMPT_COMMAND = {||
    let username = $"(ansi yellow)(whoami)(ansi reset)"


    let dir = match (do -i { $env.PWD | path relative-to $nu.home-dir }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })

    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })

    let path_segment = $"($username) ($path_color)($dir)(ansi reset)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
}

$env.EDITOR = "nvim"
$env.config.buffer_editor = "nvim"

alias q = exit
alias zed = zeditor
alias sps = sudo pacman -S
alias spss = sudo pacman -Ss
alias spsyu = sudo pacman -Syu
alias spsy = sudo pacman -Sy
alias spr = sudo pacman -R
alias sprsc = sudo pacman -Rsc
alias zl = zellij 
alias hx = helix

alias dots = /usr/bin/git --git-dir=$"($env.HOME)/.dotfiles/" --work-tree=$"($env.HOME)"




# PATH variable

use std/util "path add"

path add "~/.opam/default/bin/"
path add "~/.ghcup/bin/"
path add "~/.elan/bin/"



# About yazi
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	^yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}




# Source - https://stackoverflow.com/a
# Posted by Tyarel, modified by community. See post 'Timeline' for change history
# Retrieved 2026-01-05, License - CC BY-SA 4.0
opam env --shell=powershell | parse "$env:{key} = '{val}'" | transpose -rd | load-env


# fix ssh git@github.com ??? why that works
# whatever anyway it works
$env.__NV_DISABLE_EXPLICIT_SYNC = 1



# zoxide
source ~/.zoxide.nu
# source $"($nu.cache-dir)/carapace.nu"


def cs [x: string] {
  curl $"cheat.sh/($x)"
}

mkdir ($nu.data-dir | path join "vendor/autoload")
tv init nu | save -f ($nu.data-dir | path join "vendor/autoload/tv.nu")


