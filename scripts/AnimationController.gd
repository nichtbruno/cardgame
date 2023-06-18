extends Node2D

@export var hand = Node
@export var dealer_hand = Node
@export var wallet = Node
@export var chip_storage = Node

var is_chip_board_hidden:bool = true

# func _process(_delta):
# 	if Input.is_action_just_pressed("Space"):
# 		if is_chip_board_hidden:
# 			hand.hide_hand()
# 			dealer_hand.hide_hand()
# 			wallet.hide_wallet()
# 			# chip_storage.show_storage()
# 			is_chip_board_hidden = false
# 		else:
# 			# chip_storage.hide_storage()
# 			hand.show_hand()
# 			dealer_hand.show_hand()
# 			wallet.show_wallet()
# 			is_chip_board_hidden = true
