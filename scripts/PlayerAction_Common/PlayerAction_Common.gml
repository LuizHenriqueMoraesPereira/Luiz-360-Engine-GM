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

	if (grd && keyboard_check_pressed(ord("Z")))
	{
	    anim = "jump";
	    xsp -= jmp * dsin(ang);
	    ysp -= jmp * dcos(ang);
	    ang = 0;
	    grd = false;
	    action = 1;
	}
}
