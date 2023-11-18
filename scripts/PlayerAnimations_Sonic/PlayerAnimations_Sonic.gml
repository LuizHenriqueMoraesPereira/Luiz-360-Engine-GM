function PlayerAnimations_Sonic()
{
	if (anim == "idle")
	{
	    anim_start = 0;
	    anim_end = 0;
	    anim_loop = 0;
	    anim_speed = 0;
	    anim_repeat = false;
	    anim_linked = "none";
	}
	if (anim == "walk")
	{
	    anim_start = 5;
	    anim_end = 10;
	    anim_loop = 5;
	    anim_speed = 0.125 + (abs(gsp) / 25);
	    anim_repeat = true;
	    anim_linked = "none";
	}
	if (anim == "run")
	{
	    anim_start = 11;
	    anim_end = 14;
	    anim_loop = 11;
	    anim_speed = 0.125 + (abs(gsp) / 25);
	    anim_repeat = true;
	    anim_linked = "none";
	}
	if (anim == "jump")
	{
	    anim_angle = 0;
	    anim_start = 15;
	    anim_end = 22;
	    anim_loop = 15;
	    anim_speed = 0.375 + (abs(gsp) / 25);
	    anim_repeat = true;
	    anim_linked = "none";
	}
	if (anim == "stand")
	{
	    anim_start = 23;
	    anim_end = 24;
	    anim_loop = 24;
	    anim_speed = 0.125;
	    anim_repeat = false;
	    anim_linked = "none";
	}
	if (anim == "crouch")
	{
	    anim_start = 25;
	    anim_end = 26;
	    anim_loop = 26;
	    anim_speed = 0.125;
	    anim_repeat = false;
	    anim_linked = "none";
	}
	if (anim == "skid")
	{
	    anim_start = 27;
	    anim_end = 30;
	    anim_loop = 30;
	    anim_speed = 0.25;
	    anim_repeat = false;
	    anim_linked = "none";
	}
}
