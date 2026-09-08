extends Control

var coin: int
@export var clicker_strength: int
@onready var coin_label: Label = $CoinLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Setting initial coin to 0
	coin = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# Reciever funciton for clicker button
func _on_button_down() -> void:
	# print("Hi")
	# Whenever clicker is clicked, add 10 coins
	coin += clicker_strength
	
	coin_label.text = "Coin: " + str(coin)
	print(coin)


func _on_upgrade_button_pressed() -> void:
	print("Upgrade pressed")
	
	clicker_strength = clicker_strength * 2
	pass # Replace with function body.
