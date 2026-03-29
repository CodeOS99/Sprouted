extends StaticBody3D

@onready var mesh = $"mesh"
var popout_log = preload("res://scenes/popout_log.tscn")
var skeleton_minion = preload("res://scenes/skeleton_minion.tscn")
const MAX_HEALTH: float = 20.0
var health: int = MAX_HEALTH

func spawn_log():
	var log := popout_log.instantiate()
	get_tree().root.add_child(log)
	log.global_position = $LogPoint.global_position

func spawn_skeleton():
	var skeleton := skeleton_minion.instantiate()
	get_tree().root.add_child(skeleton)
	skeleton.global_position = $LogPoint.global_position

func chopped(damage: float) -> bool:
	for i in range(health-damage, health):
		if i % 4 == 0:
			$Pop.play()
			self.spawn_log()
			if randi() % 2 == 0: # 50% chance per log
				spawn_skeleton()
	health -= damage
	self.mesh.scale.x -= (damage / MAX_HEALTH * 4.0)
	self.mesh.scale.y -= (damage / MAX_HEALTH * 4.0)
	self.mesh.scale.z -= (damage / MAX_HEALTH * 4.0)
	Globals.player.shake_camera()
	return self.mesh.scale.x <= 0
