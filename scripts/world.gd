extends TileMapLayer
var terrains = {
	0: "ground",
	1: "continue",
	2: "stop"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	all_cells_valid()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func is_tile_valid(tilemap,cell)-> bool:
	var tile_data = tilemap.get_cell_title_data(0,cell)
	if tile_data == null:
		return true
	var terrain = tile_data.get_terrain()
	if terrain in randi_range(1,2):
		return false
	for bit in range(8):
		var neighbor = tile_data.get_terrain_peering_bit(bit)
		if neighbor in randi_range(1,2):
			return false
	return true
func all_cells_valid() -> bool: 
	for cell in get_used_cells():
		if not is_tile_valid(self,cell):
			return false
	return true
