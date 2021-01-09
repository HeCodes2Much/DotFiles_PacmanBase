local b_blk = "\27[90m"
local b_red = "\27[91m"
local b_grn = "\27[92m"
local b_yel = "\27[93m"
local b_blu = "\27[94m"
local b_mag = "\27[95m"
local b_cyn = "\27[96m"
local b_wht = "\27[97m"
local blk = "\27[30m"
local red = "\27[31m"
local grn = "\27[32m"
local yel = "\27[33m"
local blu = "\27[34m"
local mag = "\27[35m"
local cyn = "\27[36m"
local wht = "\27[37m"
local bld = "\27[1m"
local res = "\27[0m"

yafetch.sep = " » "
yafetch.sep_color = bld

-- if set to false, yafetch.shell() will return
-- the full path of the current shell
yafetch.shell_base = false
local shell = yafetch.shell()
local shell_icon = " "

local username = yafetch.user()
local hostname = yafetch.hostname()

local kernel = yafetch.kernel()
local kernel_icon = " "

local pkgs = yafetch.pkgs()
local pkgs_icon = " "

local distro = yafetch.distro()
local distro_icon

if distro == "Arch Linux" then
    distro_icon = " "
elseif distro == "EndeavourOS" then
    distro_icon = " "
elseif distro == "NixOS" then
    distro_icon = " "
elseif distro == "Ubuntu" then
    distro_icon = " "
elseif distro == "Alpine Linux" then
    distro_icon = " "
else
    distro_icon = " "
end

local color_icon = blk .. " ⬤ " .. red .. " ⬤ " .. grn .. " ⬤ " .. yel .. " ⬤ " .. blu .. " ⬤ " .. mag .. " ⬤ " .. cyn .. " ⬤ " .. wht .. " ⬤ ".. res
local bcolor_icon = b_blk .. " ⬤ " .. b_red .. " ⬤ " .. b_grn .. " ⬤ " .. b_yel .. " ⬤ " .. b_blu .. " ⬤ " .. b_mag .. " ⬤ " .. b_cyn .. " ⬤ " .. b_wht .. " ⬤ ".. res

ascii1 = b_wht .. bld .. "╔══════════════════════╦══════════╗     "     .. res
ascii2 = b_wht .. bld .. "║                      ║ ".. b_grn .." "     .. b_yel    .. "  "         .. b_mag    .. "  "    .. wht .." ║     "         .. res
ascii3 = b_wht .. bld .. "╠══════════════════════╝          ║     "     .. res
ascii4 = b_wht .. bld .. "║                                 ║     "     .. res
ascii5 = b_wht .. bld .. "║                                 ║     "     .. res
ascii6 = b_wht .. bld .. "║           ".. b_red .."█▀▀▀▀▀▀▀▀█"          .. wht      .. "            ║     "      .. res
ascii7 = b_wht .. bld .. "║           ".. b_red .."█        █"          .. wht      .. "            ║     "      .. res
ascii8 = b_wht .. bld .. "║           ".. b_blk .."█ ".. b_red          .." █  █ "  .. b_blk        .." █"       .. wht      .. "            ║     "    .. res
ascii9 = b_wht .. bld .. "║           ".. b_blk .."█        █"          .. wht      .. "            ║     "      .. res
ascii10 = b_wht .. bld .. "║           ".. b_blk .."▀█▄▄▄▄▄▄█▀"         .. wht      .. "            ║     "      .. res
ascii11 = b_wht .. bld .. "║                                 ║     "    .. res
ascii12 = b_wht .. bld .. "║                                 ║     "    .. res
ascii13 = b_wht .. bld .. "║    ".. b_red .."sudo rm -rf /* _$     "  .. wht      .. "     ║     "             .. res .. color_icon
ascii14 = b_wht .. bld .. "║                                 ║     "    .. res .. bcolor_icon
ascii15 = b_wht .. bld .. "╚═════════════════════════════════╝     "    .. res

yafetch.header_sep = "@"
yafetch.header_sep_color = bld
yafetch.header_format = ascii1 -- could be ascii1, an icon, etc.

extras1 = {
    [1] = ascii6
}

extras2 = {
    [1] = ascii8,
    [2] = ascii9,
    [3] = ascii10,
    [4] = ascii11,
    [5] = ascii12,
    [6] = ascii13,
    [7] = ascii14,
    [8] = ascii15,
}

function yafetch.init()
    yafetch.header()
    yafetch.format(ascii2 .. res .. red, distro_icon, wht, distro)
    yafetch.format(ascii3 .. res .. grn, shell_icon, wht, shell)
    yafetch.format(ascii4 .. res .. yel, kernel_icon, wht, kernel)
    yafetch.format(ascii5 .. res .. blu, pkgs_icon, wht, pkgs)

    for _, extra_art in ipairs(extras1) do
        print(extra_art)
    end

    local cpuinfo = io.open("/proc/cpuinfo", "r")

    for line in cpuinfo:lines() do
        if line:match "^model name" then
            model=string.match(line, ":(.*)")
        end
    end
    model_icon = " "
    yafetch.format(ascii7 .. res .. blu, model_icon, wht, model)

    for _, extra_art in ipairs(extras2) do
        print(extra_art)
    end
end
