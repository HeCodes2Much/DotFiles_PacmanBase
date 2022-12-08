# Bookmark Manager

## Usage

```help
Usage: ./bm [modifier(s)] command [option(s)]

    Commands :
    ==========
    -h		Print this help
    -H		Print help for legacy usage
    -v/-V		Print the version
    -a 'URL'	Add the URL to bookmark file
        Options for -a
            -t "TagList"	Tags are sparated by a comma ,
            -T "Title"	Title for this URL (if empty and allowed Title
                    downloaded)
            -A "accel"	Accelerator when search for URLs (start with Accel)
                    Default is FQDN without gTld (and www, and sheme)
            -F		Force the bookmark to be created (even if duplicate
                    or invalid)
            -p		Force the screenshot to be taken

    -l		List all URLs (default action, same thing as calling bm without args)
        Options for -l
            -z		Use the alternate print list
            -n		Sort the results by date
            -N		Sort the results by date  (reverse)


    -s 'object'	Search for bookmarks
        Options for -s
            -i		Incensitive case search
            -z		Use the alternate print list
            -n		Sort the results by date
            -N		Sort the results by date  (reverse)

    -o 'object'	Search for bookmarks and open it (use the same argument as for -s)
        Options for -o
            -i		Incensitive case search
            -O		If more than one answer force the first bookmark to be open
            -Y		If more than one answer force ALL bookmarks to be open

    -x 'object'	Search for bookmarks and copy it to clipboard (use the same argument as for -s)
        Options for -x
            -i		Incensitive case search
            -X		If more than one answer force the first bookmark to be copied
            -Y		If more than one answer force ALL bookmarks to be copied

    -r 'object'	Search for bookmarks and Print the recorded associated picture (use the same argument as for -s)
        Options for -r
            -i		Incensitive case search
            -O		If more than one answer force the first bookmark to have its picture printed
            -Y		If more than one answer force ALL bookmarks to have their picture printed

    -d 'URL' or	Delete the URL from bookmark file md5sum or 'URL part'
       Options for -d
            -D		Delete first occurence only
            -F		Force the bookmark to be deleted (even if duplicate)
            -p		Delete the associated picture (no trash available)

    -g		Generate a HTML page with all bookmarks
            If used more than once, generate a page per tag
        Options for -g
            -G "filename"	If g==1 then generate then use this filename to generate page
            -O		Open the file when generated

    -P 'object'	Generate all Non existant picture (check done for all URL in bm), if none argument.
            If an argument is given (use the same argument as for -s) only the results will have a picture.
        Options for -P
            -F		Force the picture to be taken again (even if already exists).

    -L		List all tags

    -C		Print the color table (usefull for configuration)

    -S		Show statistics about bookmarks/tags (and also configuration)
            Options for -S
            -p		Print the list of orphaned Pictures

    Modifiers :
    ===========
    -c 'file'	Use this configuration file instead of the default one

    -b 'file'	Use this bookmark file instead of the default one

    Old Legacy usage still available :
    Usage: bm [options] [cmd]

    Objects:
    ========
        :string	Search in accelerator list
        +string	Search in tags list
        =string	Search in MD5 list
        /string	Search in URL list
        string	Search in full test

    How to use:
    ===========
    # add a bookmark with the given url, description, and optional tags
    $ bm add <url> [desc] [tag...] [accelerator]

    # open the first bookmark matching <query>
    $ bm open <query>
    $ bm <query>

    # search the bookmarks via full-text <query>
    $ bm search <query>

    # list tags
    $ bm tags

    # list bookmarks available
    $ bm list
    $ bm ls
    $ bm

    # display statistics about the bookmarks
    $ bm statistics
    $ bm stats

    # view bookmark screenshots in your default browser
    $ bm view design
    $ bm view

    # clear all bookmarks
    $ bm clear
```