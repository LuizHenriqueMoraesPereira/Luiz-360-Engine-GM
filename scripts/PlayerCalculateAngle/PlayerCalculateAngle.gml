/// @description PlayerCalculateAngle(x, y, angle, width, loops)
/// @param x
/// @param y
/// @param angle
/// @param width
/// @param loops
function PlayerCalculateAngle(argument0, argument1, argument2, argument3, argument4) {
	var x1, y1, z1;
	var x2, y2, z2;
	var _sprite, _mask;

	_sprite = sprite_index;
	_mask = mask_index;

	z1 = 0;
	z2 = 0;

	sprite_index = sMaskSmall;
	mask_index = sMaskSmall;

	repeat (argument4)
	{
	    if (!PlayerCollision(
	        floor(argument0) - round((dcos(argument2) * argument3) - (dsin(argument2) * z1)),
	        floor(argument1) + round((dcos(argument2) * z1) + (dsin(argument2) * argument3))))
	    {
	        if (PlayerCollision(
	            floor(argument0) - round((dcos(argument2) * argument3) - (dsin(argument2) * z1)),
	            floor(argument1) + round((dcos(argument2) * z1) + (dsin(argument2) * argument3))))
	        {
	            z1 -= 1;
	        }
	        z1 += 1;
	    }
    
	    if (!PlayerCollision(
	        floor(argument0) + round((dcos(argument2) * argument3) + (dsin(argument2) * z2)),
	        floor(argument1) + round((dcos(argument2) * z2) - (dsin(argument2) * argument3))))
	    {
	        if (PlayerCollision(
	            floor(argument0) + round((dcos(argument2) * argument3) + (dsin(argument2) * z2)),
	            floor(argument1) + round((dcos(argument2) * z2) - (dsin(argument2) * argument3))))
	        {
	            z2 -= 1;
	        }
	        z2 += 1;
	    }
	}

	sprite_index = _sprite;
	mask_index = _mask;

	x1 = floor(argument0) - round((dcos(argument2) * argument3) - (dsin(argument2) * z1));
	y1 = floor(argument1) + round((dcos(argument2) * z1) + (dsin(argument2) * argument3));

	x2 = floor(argument0) + round((dcos(argument2) * argument3) + (dsin(argument2) * z2));
	y2 = floor(argument1) + round((dcos(argument2) * z2) - (dsin(argument2) * argument3));

	return round(point_direction(x1, y1, x2, y2));



}
