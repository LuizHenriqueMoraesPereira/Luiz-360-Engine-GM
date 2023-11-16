function PlayerAction_Jumping()
{
	anim = "jump";

	if (ysp < -3.78125 && !keyboard_check(ord("Z")))
	{
	    ysp = -3.78125;
	}

	if (grd) action = 0;
}
