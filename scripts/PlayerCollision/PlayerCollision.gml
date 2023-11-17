/// @description PlayerCollision(x, y)
/// @param x
/// @param y
function PlayerCollision(argument0, argument1)
{
	var tilemap = layer_tilemap_get_id("Collision_" + string(lyr));
	var terrain = oTile;
	
	var x1 = tilemap_get_cell_x_at_pixel(tilemap, bbox_left + (argument0 - x), y);
	var y1 = tilemap_get_cell_y_at_pixel(tilemap, x, bbox_top + (argument1 - y));
	var x2 = tilemap_get_cell_x_at_pixel(tilemap, bbox_right + (argument0 - x), y);
	var y2 = tilemap_get_cell_y_at_pixel(tilemap, x, bbox_bottom + (argument1 - y));
	
	for (var i = x1; i <= x2; i++)
	{
		for (var j = y1; j <= y2; j++)
		{
			var tile = tile_get_index(tilemap_get(tilemap, i, j));
			if (tile > 0)
			{
				terrain.x = i * tilemap_get_tile_width(tilemap);
				terrain.y = j * tilemap_get_tile_height(tilemap);
				terrain.image_index = tile;
				
				if (place_meeting(argument0, argument1, terrain))
				{
					return true;
				}
			}
		}
	}
	
	if (place_meeting(argument0, argument1, pTerrain))
	{
	    return true;
	}

	if (instance_place(argument0, argument1, pSolid) != noone)
	{
	    if (instance_place(argument0, argument1, pSolid).flag)
	        return true;
	}

	return false;
}
