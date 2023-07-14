extends Control

func _process(delta):
	$cidade.rotation_degrees += 1


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
