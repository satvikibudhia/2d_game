extends Node
@export var mob_scene: PackedScene
var score
func _ready():
	pass
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	get_tree().call_group("mobs", "queue_free")
func _on_score_t_imer_timeout() -> void:
	score+=1 
	print("score",score)
	$HUD.update_score(score)
func _on_start_timer_timeout() -> void:
	print("woks")
	$Moby.start()
	$ScoreTImer.start()
	
func _on_moby_timeout() -> void:
	print("woks")
	var mob = mob_scene.instantiate()
	var mob_spawn_location = get_node(^"MobPath/MobFollow")
	mob_spawn_location.progress_ratio = randf()
	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.get_rotation()+ PI / 2
	# Set the mob's position to a random location.
	mob.position = mob_spawn_location.position
	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.set_rotation(direction)
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.set_linear_velocity(velocity.rotated(direction))
	add_child(mob)
func _on_player_hit() -> void:#gameover
	$ScoreTImer.stop()
	$HUD.showgameover()
	$Moby.stop() # Replace with function body.
