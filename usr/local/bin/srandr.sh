#!/usr/bin/env sh

## Example ~/.display.sh Configuration
#
# #!/usr/bin/env sh
#
# DisplayConfigs="LVDS1 VGA1"
#
# LVDS1() {
#     xrandr --output LVDS1 --auto
# }
#
# VGA1() {
#     xrandr --output VGA1 --auto --above LVDS1
# }


Displays=""

while :; do
    if [ -n "$DISPLAY" ]; then
        Connected="$(xrandr | grep ' connected'   | awk '{print $1}')"
        Disconnected="$(xrandr | grep 'disconnected' | awk '{print $1}')"

        if [ "$Displays" != "$Connected" ]; then
            for display in $Connected; do
                if [ -e "$HOME/.display.sh" ]; then
                    . "$HOME/.display.sh"

                    for config in $DisplayConfigs; do
                        if [ "$display" == "$config" ]; then
                            $config
                        fi
                    done
                else
                    xrandr --output "$display" --auto
                fi
            done

            for display in $Disconnected; do
                xrandr --output "$display" --off
            done

            Displays="$Connected"
        fi
    fi

    sleep 5
done
