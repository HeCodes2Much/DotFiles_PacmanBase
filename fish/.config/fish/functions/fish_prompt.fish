function fish_prompt
    set -g fish_prompt_pwd_dir_length 3
    # Cache exit status
    set -l last_status $status

    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end
    if not set -q __fish_prompt_char
        switch (id -u)
            case 0
                set -g __fish_prompt_char \u276f\u276f
            case '*'
                set -g __fish_prompt_char '$'
        end
    end

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

    # Configure __fish_git_prompt
    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_showcolorhints true

    # Color prompt char red for non-zero exit status
    set -l pcolor $bpurple
    if [ $last_status -ne 0 ]
    set pcolor $bred
    end

    # Top
    echo -n $bred"["$byellow"$USER"$bgreen"@"$bblue"$__fish_prompt_hostname"$bnormal $bred(prompt_pwd)"]"$normal
    __fish_git_prompt

    # Bottom
    echo -n $bmagenta$__fish_prompt_char $normal
end
