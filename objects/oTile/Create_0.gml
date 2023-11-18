switch (room)
{
	case rTest: sprite_index = sTestFrames; break;
}

mask_index = sprite_index;

for (var i = 0; i < 2; i++)
{
	layer_set_visible("Collision_" + string(i), false);
}
