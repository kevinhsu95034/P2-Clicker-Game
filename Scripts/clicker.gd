extends Button

var clicker_strength: int = 10

# Custom signal to be sent
signal coin_generated(amount: int)

# Packed coin scene. Make sure you have the correct load path (drag-drop)
@onready var coin_scene: PackedScene = load("res://Scenes/coin.tscn") 

# Export the variable for assigning in the main game scene
@export var game_manager: Node

# When button pressed
func _on_pressed() -> void:
	# Emits signal (we'll connect receiver later)
	coin_generated.emit(clicker_strength)
	
	# Spawn coin
	var c = coin_scene.instantiate()
	add_child(c)
	c.global_position = get_global_mouse_position()


func _on_upgrade_button_pressed() -> void:
	# Check cost
	var cost = clicker_strength*3
	if game_manager.coin >= cost:
		# Double strength
		clicker_strength *= 2
		
		# Reduce coin by cost
		# I'll reuse the coin signal with negative value so it also updates UI
		coin_generated.emit(-cost)
