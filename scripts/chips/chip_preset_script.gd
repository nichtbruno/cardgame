extends Control

@onready var chip_label = $Label
@onready var chip_sprite = $Sprite2D
@onready var chip_shadow = $shadow

@export var is_all_in: bool = false
var is_empty: bool = true if randi_range(0, 10) == 5 else false
@export var empty_label_color: Color

func _ready():
	chip_sprite.frame = 0
	if is_all_in:
		chip_label.text = "ALL IN"
		chip_sprite.frame = 0
	elif is_empty:
		chip_label.text = "EMPTY"
		chip_label.add_theme_color_override("font_color", empty_label_color)
		chip_sprite.frame = 18
		chip_shadow.visible = false
	else:
		var x = randi_range(1, 17)
		chip_label.text = IndexMap.chip_val[x]
		chip_sprite.frame = x
