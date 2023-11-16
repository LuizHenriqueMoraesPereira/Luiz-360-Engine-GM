PlayerAnimations_Sonic();

anim_changed = false;

if (anim_old != anim)
{
    anim_old = anim;
    anim_frame = anim_start;
    anim_changed = true;
    anim_finished = false;
}

if (!anim_finished)
{
    anim_frame += anim_speed;
    if (floor(anim_frame) > anim_end)
    {
        if (anim_repeat)
        {
            anim_frame = anim_loop;
        }
        else
        {
            if (anim_times > 0)
            {
                anim_frame = anim_loop;
                anim_times -= 1;
            }
            else
            {
                anim_frame = anim_end;
                if (anim_linked != "none") anim = anim_linked;
                else anim_finished = true;
            }
        }
    }
}
