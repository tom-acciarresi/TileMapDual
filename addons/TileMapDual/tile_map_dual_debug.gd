class_name TileMapDualDebug
## Debug functions.


## Returns a pretty-printable neighborhood.
static func neighborhood_str(neighborhood: Array) -> String:
	var neighbors: Array[int] = []
	neighbors.resize(16)
	neighbors.fill(-1)

	for i in neighborhood.size():
		neighbors[neighborhood[i]] = i

	var get := func(neighbor: TileSet.CellNeighbor) -> String:
		var terrain = neighbors[neighbor]
		return '-' if terrain == -1 else str(terrain)

	var nw = get.call(TileSet.CELL_NEIGHBOR_TOP_LEFT_CORNER)
	var n = get.call(TileSet.CELL_NEIGHBOR_TOP_CORNER)
	var ne = get.call(TileSet.CELL_NEIGHBOR_TOP_RIGHT_CORNER)
	var w = get.call(TileSet.CELL_NEIGHBOR_LEFT_CORNER)
	var e = get.call(TileSet.CELL_NEIGHBOR_RIGHT_CORNER)
	var sw = get.call(TileSet.CELL_NEIGHBOR_BOTTOM_LEFT_CORNER)
	var s = get.call(TileSet.CELL_NEIGHBOR_BOTTOM_CORNER)
	var se = get.call(TileSet.CELL_NEIGHBOR_BOTTOM_RIGHT_CORNER)

	return (
		"%2s %2s %2s\n" % [nw, n, ne] +
		"%2s  C %2s\n" % [w, e] +
		"%2s %2s %2s\n" % [sw, s, se]
	)
