current_output_name = i3-msg -t get_workspaces | jq '.[0]["output"]'

output_names = i3-msg -t get_outputs | jq 'to_entries[] | select(.value.current_workspace != null) | .value.name'

wsNext=$(( $( i3-msg -t get_workspaces | jq '.[] | select(.focused).num' ) + $1))
i3-msg move container to workspace $wsNext
i3-msg workspace $wsNext
