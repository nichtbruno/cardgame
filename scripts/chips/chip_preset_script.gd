extends Control

@onready var chip_label = $Label
@onready var chip_sprite = $Sprite2D
@onready var chip_shadow = $shadow
@onready var chip_texture = load(IndexMap.chip_index_map[0])

@export var is_all_in: bool = false
@export var empty_label_color: Color

func _ready():
	chip_sprite.texture = chip_texture
	chip_shadow.texture = chip_texture
	chip_sprite.frame = 0
	if is_all_in:
		chip_label.text = "ALL IN"
		chip_sprite.frame = 0
	else: create_chip()

func create_chip():
	if randi_range(0, 10) == 5:
		chip_label.text = "EMPTY"
		chip_label.add_theme_color_override("font_color", empty_label_color)
		chip_label.add_theme_constant_override("outline_size", 0)
		chip_sprite.frame = 18
		chip_shadow.visible = false
	else:
		chip_label.add_theme_color_override("font_color", Color(1,1,1,1))
		chip_label.add_theme_color_override("font_outline_color", Color(0,0,0,1))
		chip_label.add_theme_constant_override("outline_size", 5)
		var x = randi_range(1, 17)
		chip_label.text = IndexMap.chip_val[x-1]
		chip_sprite.frame = x
		chip_shadow.visible = true