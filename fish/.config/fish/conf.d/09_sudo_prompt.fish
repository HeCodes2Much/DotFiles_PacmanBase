# ------------------------------------------------------------------------------
# Description
# -----------
#
# sudo prompt in color
#
function sudo

	# ------------------------------------------------------------------------------
	# Setup colors
    #Bold Colors
    set -l bnormal (set_color -o normal)
    set -l bblack (set_color -o brblack)
    set -l bred (set_color -o brred)
    set -l bgreen (set_color -o brgreen)
    set -l byellow (set_color -o bryellow)
    set -l bblue (set_color -o brblue)
    set -l bmagenta (set_color -o brmagenta)
    set -l bcyan (set_color -o brcyan)
    set -l bwhite (set_color -o brwhite)

    #Normal Colors
    set -l normal (set_color normal)
    set -l black (set_color black)
    set -l red (set_color red)
    set -l green (set_color green)
    set -l yellow (set_color yellow)
    set -l blue (set_color blue)
    set -l magenta (set_color magenta)
    set -l cyan (set_color cyan)
    set -l white (set_color white)
    # ------------------------------------------------------------------------------

    command sudo -p "$red$yellow [sudo]$green password for %u: $normal" $argv
end
