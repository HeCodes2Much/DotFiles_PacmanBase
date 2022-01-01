# Unlock user from passwords
function ulock
    faillock --reset
end

# Check ports for current user
function ports
    sudo netstat -tulanp
end

# Set permissions for user
function setperm
    sudo chown dt:dt $argv
end

# Stow commands
function stowadd
    stow -St ~ $argv
end

function stowremove
    stow -Dt ~ $argv
end

# Clear command
function clear
    command reset && fish
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
    sudo grub-mkconfig -o /boot/grub/grub.cfg
end
