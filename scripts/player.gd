extends AnimatableBody2D # todo transitioning player from characterbody2d to animatablebody2d, change most code in this script

const SPEED: float = 400.0
var fixed_y: float = 0.0 # Custom variable to remember the paddle's starting y position

# ready runs once, at first game bootup
func _ready() -> void:
	# Automatically save the Y coordinate on startup so the paddle never drifts sideways
	fixed_y = global_position.y

# runs every single frame
func _physics_process(delta: float) -> void:
# Force-lock the Y position every single frame so the ball can never push it left or right!
	global_position.y = fixed_y

	# Check keyboard inputs for moving up and down
	# todo edit controls in godot's ui, and add to this code block to move to the sides
	if Input.is_action_pressed("moveLeft"):
		pass
	elif Input.is_action_pressed("moveRight"):
		pass


