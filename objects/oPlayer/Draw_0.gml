draw_sprite_ext(anim_sprite, floor(anim_frame), x, y, anim_dir, 1, anim_angle, c_white, 1);

if (visibility)
{
	draw_sprite_ext(sMaskMain, 0, x, y, 1, 1, round(ang), c_white, 1);
	
	draw_sprite(sMaskLarge, 0,
				x + round((dcos(ang) * 9) + (dsin(ang) * -2)),
			    y + round((dcos(ang) * -2) - (dsin(ang) * 9)));
	draw_sprite(sMaskMedium, 0,
				x + round((dcos(ang) * 9) + (dsin(ang) * -2)),
			    y + round((dcos(ang) * -2) - (dsin(ang) * 9)));
	
	draw_sprite(sMaskLarge, 0,
				x + round((dcos(ang) * -9) + (dsin(ang) * -2)),
			    y + round((dcos(ang) * -2) - (dsin(ang) * -9)));
	draw_sprite(sMaskMedium, 0,
				x + round((dcos(ang) * -9) + (dsin(ang) * -2)),
			    y + round((dcos(ang) * -2) - (dsin(ang) * -9)));
	
	draw_sprite(sMaskLarge, 0,
				x + round(dsin(ang) * 13),
			    y + round(dcos(ang) * 13));
	draw_sprite(sMaskMedium, 0,
				x + round(dsin(ang) * 12),
			    y + round(dcos(ang) * 12));
	
	draw_sprite(sMaskLarge, 0,
				x + round(dsin(ang) * -13),
			    y + round(dcos(ang) * -13));
	draw_sprite(sMaskMedium, 0,
				x + round(dsin(ang) * -12),
			    y + round(dcos(ang) * -12));
	
	draw_sprite_ext(sMaskLine, 0,
				x + round((dcos(ang) * -8) + (dsin(ang) * 12)),
				y + round((dcos(ang) * 12) - (dsin(ang) * -8)),
				1, 1, round(ang / 45) * 45, c_white, 1);
	
	draw_sprite_ext(sMaskLine, 0,
				x + round((dcos(ang) * 8) + (dsin(ang) * 12)),
				y + round((dcos(ang) * 12) - (dsin(ang) * 8)),
				1, 1, round(ang / 45) * 45, c_white, 1);
}
