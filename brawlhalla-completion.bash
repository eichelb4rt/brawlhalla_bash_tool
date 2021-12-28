#/usr/bin/env bash

_brawlhalla_completions()
{
    CURRENT_WORD="${COMP_WORDS[COMP_CWORD]}"
    PREV_WORD="${COMP_WORDS[COMP_CWORD - 1]}"
    WORD_COUNT="${#COMP_WORDS[@]}"

    complete_options=""
    if [ "$WORD_COUNT" == "2" ]; then
        complete_options="profiles"
    elif [ "$WORD_COUNT" == "3" ]; then
        if [ "$PREV_WORD" == "profiles" ]; then
            complete_options="list save load delete"
        fi
    elif [ "$WORD_COUNT" == "4" ]; then
        if [ "$PREV_WORD" == "load" ]; then
            complete_options=$(brawlhalla profiles list)
        elif [ "$PREV_WORD" == "save" ]; then
            complete_options=$(brawlhalla profiles list)
        elif [ "$PREV_WORD" == "delete" ]; then
            complete_options=$(brawlhalla profiles list)
        fi
    fi

    COMPREPLY=($(compgen -W "$complete_options" "$CURRENT_WORD"))
}

complete -F _brawlhalla_completions brawlhalla