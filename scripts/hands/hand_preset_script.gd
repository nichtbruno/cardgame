extends Control

@onready var chip_board = $"../chip_board"

@onready var hand_sprite = $handSprite
@onready var card_manager = $handSprite/card_manager
@onready var thumb_sprite = $handSprite/thumbSprite
@onready var number_display = $number
@onready var hand_texture = load(IndexMap.hand_index_map[0])
@onready var thumb_texture = load(IndexMap.thumb_index_map[0])

@onready var original_pos = hand_sprite.position.y
var is_hidden = false

func _ready():
	hand_sprite.texture = hand_texture
	thumb_sprite.texture = thumb_texture

func hide_hand():
	var tween = create_tween()
	tween.tween_property(hand_sprite, "position", Vector2(0, original_pos-30), 0.2).set_ease(Tween.EASE_OUT)
	tween.tween_property(hand_sprite, "position", Vector2(0, original_pos+384), 0.2).set_ease(Tween.EASE_OUT_IN)

func show_hand():
	var tween = create_tween()
	tween.tween_property(hand_sprite, "position", Vector2(0, original_pos-30), 0.2).set_ease(Tween.EASE_IN)
	tween.tween_property(hand_sprite, "position", Vector2(0, original_pos), 0.2).set_ease(Tween.EASE_OUT)


func _on_hand_button_button_up():
	if PlayerData.currentPlayerState == PlayerData.PlayerState.PLAYING:
		PlayerData.currentPlayerState = PlayerData.PlayerState.PAUSED
		number_display.visible = false
		card_manager.visible = false
		chip_board.player_state_change(true)
	else:
		PlayerData.currentPlayerState = PlayerData.PlayerState.PLAYING
		number_display.visible = true
		card_manager.visible = true
		chip_board.player_state_change(false)
