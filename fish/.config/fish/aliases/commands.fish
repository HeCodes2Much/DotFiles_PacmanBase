# Unlock user from passwords
function ulock
    command faillock --reset
end

# Check ports for current user
function ports
    command sudo netstat -tulanp
end

# Set permissions for user
function setperm
    command sudo chown repo:repo $argv
end

# Stow commands
function stowadd
    command stow -St ~ $argv
end

function stowremove
    command stow -Dt ~ $argv
end

# Clear command
function clear
    command reset && shellfetch
end

# free
function free
    command free -mt
end

# continue download
function wget
    command wget -c $argv
end

# grub update
function update-grub
    command sudo grub-mkconfig -o /boot/grub/grub.cfg
end

# add new fonts
function update-fc
    command fc-cache -fv
end

function reload
    source ~/.config/fish/config.fish
end
