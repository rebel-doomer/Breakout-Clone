extends Node2D
"""
todo
The Floor is a Penalty (Lose a Life), Not a Score
todo Clean Up Empty Functions
"""
var player_score: int = 0 # todo refactor variable name to match everywhere else
@onready var score_label: Label = $"../Scoreboard/Label"

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_off_screen_body_entered(body: Node2D) -> void:
	if body.name == "Ball" and body.has_method("reset"):
		if not body.is_moving:
			return # Ignore extra triggers if already resetting

		score_label.text = str(player_score)

		# note on deferred - postpone this until a safer moment.
		body.call_deferred("reset") # note: before running the func reset, call_deferred allows waiting until current physics calculations are finished, and then executes the "reset" function on the very next physics frame safely
