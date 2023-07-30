extends CanvasLayer

# Notifies `Main` node that the button has been pressed
signal start_game
func show_message(text):
	$Msg.text=text
	$Msg.show()
	$MsgTimer.start()

func showgameover():
	show_message("Game Over")
	await $MsgTimer.timeout
	$Msg.text="Dodge the\nCreeps!"
	$Msg.show()
	await get_tree().create_timer(1.0).timeout
	$Start.show()
func update_score(score):
	$Score.text=str(score)
	

func _on_msg_timer_timeout() -> void:
	$Msg.hide()# Replace with function body.


func _on_start_pressed() -> void:
	$Start.hide()
	start_game.emit()
	# Replace with function body.
