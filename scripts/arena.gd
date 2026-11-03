extends Area2D

# todo unused player_score
var player_score: int = 0 # todo refactor variable name to match everywhere else
@onready var score_label: Label = $"../Scoreboard/Label"

func _on_off_screen_body_entered(body: Node2D) -> void:
	if body.name == "Ball" and body.has_method("reset"):
		if not body.is_moving:
			return # Ignore extra triggers if already resetting

		# todo lives_label is not defined anywhere in the script
		lives_label.text = str(lives_remaining) # todo lives_remaining variable needs to be declared

		# note on deferred - postpone this until a safer moment.
		body.call_deferred("reset") # note: before running the func reset, call_deferred allows waiting until current physics calculations are finished, and then executes the "reset" function on the very next physics frame safely
