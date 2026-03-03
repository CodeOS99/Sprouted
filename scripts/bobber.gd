extends Node

@export var to_bob: Node3D # would by default be set to the parent in the ready function

@export var BOB_FREQ := 2.4
@export var BOB_AMP := 0.08
var t_bob = 0.0

func _ready() -> void:
	if to_bob == null:
		to_bob = get_parent()

func _process(delta: float) -> void:
	t_bob += delta * Globals.player.velocity.length() * float(Globals.player.is_on_floor())
	to_bob.transform.origin = _headbob(t_bob)

func _headbob(time: float) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos
