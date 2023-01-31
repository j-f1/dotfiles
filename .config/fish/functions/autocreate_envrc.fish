function autocreate_envrc
    set start (gdate "+%s%3N")
    set tools_path (pwd)
    while test (dirname $tools_path) != /
        if test -f $tools_path/.tool-versions; or test -f $tools_path/.nvmrc; or test -f $tools_path/.node-version; or test -f $tools_path/.ruby-version
            if not test -f $tools_path/.envrc
                echo (set_color grey)"Creating .envrc at $tools_path"(set_color normal)
                echo "use asdf" >$tools_path/.envrc
                echo dotenv >>$tools_path/.envrc
                asdf exec direnv allow "$tools_path/.envrc"
            end
            break
        end
        set tools_path (dirname $tools_path)
    end
    set delta_t (math (gdate "+%s%3N") - $start)
    if [ $delta_t -lt 30 ]
        return
    else if [ $delta_t -lt 50 ]
        set perf_color green
    else if [ $delta_t -lt 100 ]
        set perf_color yellow
    else
        set perf_color red
    end
    set_color grey
    echo direnv update took (set_color --dim $perf_color){$delta_t}ms(set_color normal)
end
