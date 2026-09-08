extends Control

var coin: int
@onready var coin_label: Label = $CoinLabel
	
# When clicker is clicked
func _on_clicker_button_coin_generated(amount: int) -> void:
	# Add coins
	coin += amount
	
	# Update UI
	coin_label.text = "Coin: " + str(coin)
