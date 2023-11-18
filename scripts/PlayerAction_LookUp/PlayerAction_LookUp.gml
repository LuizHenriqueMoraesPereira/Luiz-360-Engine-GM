function PlayerAction_LookUp()
{
	anim = "stand";
	
	if (!grd || gsp != 0 || !keyboard_check(vk_up) || keyboard_check(vk_down))
	{
		action = 0;
	}
}
