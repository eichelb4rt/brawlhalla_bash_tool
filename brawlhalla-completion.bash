#!/usr/bin/env bash

ALL_LEGENDS="bodvar cassidy orion lord_vraxx gnash queen_nai hattori sir_roland scarlet thatch ada sentinel lucien teros brynn asuri barraza ember azoth koji ulgrim diana jhala kor wu_shang val ragnir cross mirage nix mordex yumiko artemis caspian sidra xull kaya isaiah jiro lin_fei zariel rayman dusk fait thor petra vector volkov onyx jaeyun mako magyar reno munin arcadia ezio tezca thea red_raptor loki seven vivi imugi king_zuva priya"

_brawlhalla_completions() {
    CURRENT_WORD="${COMP_WORDS[COMP_CWORD]}"
    PREV_WORD="${COMP_WORDS[COMP_CWORD - 1]}"
    WORD_COUNT="${#COMP_WORDS[@]}"
    SUB_COMMAND="${COMP_WORDS[1]}"
    SUB_SUB_COMMAND="${COMP_WORDS[2]}"

    complete_options=""
    if [ "$WORD_COUNT" == "2" ]; then
        # choose sub commands
        # (brawlhalla pr -> brawlhalla profiles)
        complete_options="profiles track"
    elif [ "$WORD_COUNT" == "3" ]; then
        # choose sub sub commands
        # (brawlhalla profiles sa -> brawlhalla profiles save)
        if [ "$SUB_COMMAND" == "profiles" ]; then
            # sub commands in profile
            complete_options="list save load delete"
        elif [ "$SUB_COMMAND" == "track" ]; then
            # sub commands in track
            complete_options="random"
        fi
    elif [ "$WORD_COUNT" == "4" ]; then
        # choose sub sub command arguments
        # (brawlhalla profiles save ma -> brawlhalla profiles save main)
        if [ "$SUB_COMMAND" == "profiles" ]; then
            # sub commands in profile
            if [ "$SUB_SUB_COMMAND" == "load" ]; then
                # autocomplete to all already existing profiles
                complete_options=$(brawlhalla profiles list)
            elif [ "$SUB_SUB_COMMAND" == "save" ]; then
                # autocomplete to all already existing profiles
                complete_options=$(brawlhalla profiles list)
            elif [ "$SUB_SUB_COMMAND" == "delete" ]; then
                # autocomplete to all already existing profiles
                complete_options=$(brawlhalla profiles list)
            fi
        elif [ "$SUB_COMMAND" == "track" ]; then
            if [ "$SUB_SUB_COMMAND" == "random" ]; then
                # autocomplete to all legends
                complete_options=$ALL_LEGENDS
            fi
        fi
    fi

    COMPREPLY=($(compgen -W "$complete_options" "$CURRENT_WORD"))
}

complete -F _brawlhalla_completions brawlhalla
