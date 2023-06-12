extends Control

@onready var table_sprite = $tableTexture
@onready var table_txture = load(IndexMap.table_index_map[randi_range(0, IndexMap.table_index_map.size()-1)])

func _ready():
	table_sprite.texture = table_txture
