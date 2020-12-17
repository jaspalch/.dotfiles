local awful = require("awful")

awful.util.spawn_with_shell("./scripts/synaptics.sh ; touch blah")
awful.util.spawn("nitrogen --restore")
awful.util.spawn_with_shell("xss-lock -- i3lock -n -c 000011 &")
