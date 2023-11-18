function PlayerAction_Common()
{
	if (grd)
	{
	    if (abs(gsp) <= 0)
	    {
	        anim = "idle";
	    }
	    else if (abs(gsp) < 5)
	    {
	        anim = "walk";
	    }
	    else
	    {
	        anim = "run";
	    }
	}
	
	if (grd)
	{
		var inputHorizontal = keyboard_check(vk_right) - keyboard_check(vk_left);
		var inputVertical = keyboard_check(vk_down) - keyboard_check(vk_up);
		
		if (gsp == 0 && inputHorizontal == 0)
		{
			if (inputVertical < 0) action = 2;
			if (inputVertical > 0) action = 3;
		}
		
		if (sign(gsp) == -inputHorizontal && abs(gsp) >= 1.4)
		{
			action = 4;
			allowInput = false;
		}
		
		if (keyboard_check_pressed(ord("Z")))
		{
		    anim = "jump";
		    xsp -= jmp * dsin(ang);
		    ysp -= jmp * dcos(ang);
		    ang = 0;
		    grd = false;
		    action = 1;
		}
	}
}
