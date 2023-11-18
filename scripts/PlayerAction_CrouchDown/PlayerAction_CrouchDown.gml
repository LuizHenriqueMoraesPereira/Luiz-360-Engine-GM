function PlayerAction_CrouchDown()
{
	anim = "crouch";
	
	if (!grd || gsp != 0 || !keyboard_check(vk_down) || keyboard_check(vk_up))
	{
		action = 0;
	}
}
