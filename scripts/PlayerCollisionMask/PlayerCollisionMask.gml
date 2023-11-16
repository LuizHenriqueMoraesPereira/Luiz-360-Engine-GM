/// @description PlayerCollisionMask(mask, x, y, [angle])
/// @param mask
/// @param x
/// @param y
/// @param [angle]
function PlayerCollisionMask()
{
	var _sprite, _angle, _mask, _col;

	_sprite = sprite_index;
	_angle = image_angle;
	_mask = mask_index;

	sprite_index = argument0;
	if (argument_count == 4)
	    image_angle = round(argument[3]);
	mask_index = argument0;

	_col = PlayerCollision(floor(argument1), floor(argument2));

	sprite_index = _sprite;
	image_angle = _angle;
	mask_index = _mask;

	return _col;
}
