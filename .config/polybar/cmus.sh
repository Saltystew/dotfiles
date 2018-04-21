#!/usr/bin/env bash


# If you want to display a message when music is not
# playing place it between double quotes below.
# Leave space between double quotes otherwise.


message=" "


cmusstatus=$(cmus-remote -C status)
egrep 'stopped | paused' <<< "$cmusstatus" 1>/dev/null 2>&1
if [ ! $? -eq 1 ];
then echo -n "$message"; else
    grep playing <<< "$cmusstatus" 1>/dev/null 2>&1
    if [ ! $? -eq 0 ]; then exit; else

        strindex() { 
            x="${1%%$2*}"
            [[ "$x" = "$1" ]] && echo -1 || echo "${#x}"
        }

        get_all_but_first() {
            shift
            echo "$@"
        }

        get_stat() {
            line=$(grep "$1" -m 1 <<< "$cmusstatus")
            a=$(strindex "$line" "$1")
            sub="${line:a}"
            echo "$(get_all_but_first $sub)"
        }

        artist=$(echo -n $(get_stat artist))
        song=$(echo -n $(get_stat title))

        echo -n "$song - $artist"

    fi
fi
