function fish_user_key_bindings
    ### emoji-cli-fish ###
    bind \cs "__emoji-cli_name"
    bind \cx "__emoji-cli_emoji"
    if bind -M insert >/dev/null ^/dev/null
        bind -M insert \cs "__emoji-cli_name"
        bind -M insert \cx "__emoji-cli_emoji"
    end
    ### emoji-cli-fish ###
end

fzf_key_bindings
