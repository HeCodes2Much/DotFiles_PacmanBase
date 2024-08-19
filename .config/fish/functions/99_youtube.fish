#youtube-dl commands
function yta-aac
    youtube-dl --extract-audio --audio-format aac $argv
end

function yta-best
    youtube-dl --extract-audio --audio-format best $argv
end

function yta-m4a
    youtube-dl --extract-audio --audio-format m4a $argv
end

function yta-mp3
    youtube-dl --extract-audio --audio-format mp3 $argv
end

function yta-wav
    youtube-dl --extract-audio --audio-format wav $argv
end
