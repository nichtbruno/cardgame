extends Control

@onready var allInChip = $used_chips/AllInChip
@onready var chip0 = $used_chips/Chip0
@onready var chip1 = $used_chips/Chip1
@onready var chip2 = $used_chips/Chip2
@onready var pencil = $pencil
var hand_paused = false
var can_edit = false

enum BoardState {
	USING,
	EDITING
}

func _on_button_all_in_button_up():
	if can_edit:
		print("all in chip")
	else:
		print("use all in chip")

func _on_button_0_button_up():
	if can_edit:
		chip0.create_chip()
		print("button 0")
	else:
		print("use button 0")

func _on_button_1_button_up():
	if can_edit:
		chip1.create_chip()
		print("button 1")
	else:
		print("use button 1")

func _on_button_2_button_up():
	if can_edit:
		chip2.create_chip()
		print("button 2")
	else:
		print("use button 2")

func _on_edit_button_button_up():
	if hand_paused:
		print("edit button")
		can_edit = !can_edit

func player_state_change(is_paused:bool):
	if is_paused:
		pencil.frame = 1
		hand_paused = true
	else:
		pencil.frame = 0
		hand_paused = false
		can_edit = false