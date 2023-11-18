if (instance_exists(player))
{
    with (player)
    {
        other.flag = (!grd && ysp >= 0 || grd) && y + 8 <= other.y;
    }
}

