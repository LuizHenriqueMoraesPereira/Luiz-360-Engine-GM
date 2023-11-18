function PlayerAction_Skidding()
{
	anim = "skid";
	
	var inputHorizontal = keyboard_check(vk_right) - keyboard_check(vk_left);
	
	if (grd && abs(gsp) > 0 && inputHorizontal != 0)
	{
		if (sign(gsp) == -inputHorizontal)
		{
			gsp = max(abs(gsp) - 0.5, 0) * sign(gsp);
		}
	}
	else
	{
		action = 0;
		allowInput = true;
	}
	
	if (grd && keyboard_check_pressed(ord("Z")))
	{
		anim = "jump";
		xsp -= jmp * dsin(ang);
		ysp -= jmp * dcos(ang);
		ang = 0;
		grd = false;
		allowInput = true;
		action = 1;
	}
}
