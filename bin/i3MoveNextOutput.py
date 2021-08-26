#!/usr/bin/python3
import i3

current_output_name = [ws for ws in i3.get_workspaces() if ws["focused"]][0]["output"]
output_names = [output["name"] for output in i3.get_outputs() if output["current_workspace"] != None]

index = output_names.index(current_output_name)
next_output_index = (index + 1) % len(output_names)
next_output_name = output_names[next_output_index]

i3.move(f"workspace to {next_output_name}")

