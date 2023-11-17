visibility = !visibility;
visible = visibility;

for (var i = 0; i < 2; i++)
{
	layer_set_visible("Collision_" + string(i), visibility);
}
