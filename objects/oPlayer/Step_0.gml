/*==================
	X/Y Movement
==================*/

// Grounded state
if (grd)
{
	// Limit speed value
    gsp = min(max(gsp, -15), 15);
	
	// Ground movement
    xsp = gsp * dcos(ang);
    ysp = gsp * -dsin(ang);
}

// Limit speed values
xsp = min(max(xsp, -15), 15);
ysp = min(max(ysp, -15), 15);

// Move the player
xps += xsp;
yps += ysp;

/*====================
	Wall Collision
====================*/

// Right side
while (PlayerCollisionMask(sMaskMedium,
    floor(xps) + round((dcos(ang) * 9) + (dsin(ang) * -2)),
    floor(yps) + round((dcos(ang) * -2) - (dsin(ang) * 9))))
{
    xps -= dcos(ang);
    yps += dsin(ang);
}

// Left side
while (PlayerCollisionMask(sMaskMedium,
    floor(xps) + round((dcos(ang) * -9) + (dsin(ang) * -2)),
    floor(yps) + round((dcos(ang) * -2) - (dsin(ang) * -9))))
{
    xps += dcos(ang);
    yps -= dsin(ang);
}

/*===================
	Air Collision
===================*/

// Airborne state
if (!grd)
{
	// Reset angle
    ang = 0;
    anim_angle = ang;
    
    if (ysp >= 0) // If moving down
    {
		// Floor collision
        while (PlayerCollisionMask(sMaskMedium, xps, floor(yps) + 12))
        {
            yps -= 1;
        }
        
		// Landing
        if (PlayerCollisionMask(sMaskLarge, xps, floor(yps) + 13))
        {
			// Calculate angle
            if (PlayerCollisionMask(sMaskLine,
                floor(xps) + 8,
                floor(yps) + 12) &&
                PlayerCollisionMask(sMaskLine,
                floor(xps) - 8,
                floor(yps) + 12))
            {
                ang = PlayerCalculateAngle(xps, yps, 0, 7, 32);
            }
            
			// Change ground speed
            gsp = xsp;
            if (ang > 22 && ang < 338)
            {
                gsp -= (ysp * 0.84) * dsin(ang);
            }
			
			// Land
            grd = true;
        }
    }
    else // If moving up
    {
		// Ceiling collision
        while (PlayerCollisionMask(sMaskMedium, xps, floor(yps) - 12))
        {
            yps += 1;
        }
        
		// Ceiling landing
        if (ysp < -1.75 && PlayerCollisionMask(sMaskLarge, xps, floor(yps) - 13))
        {
			// Calculate angle
            if (PlayerCollisionMask(sMaskLine,
                floor(xps) - 8,
                floor(yps) - 12,
                180) &&
                PlayerCollisionMask(sMaskLine,
                floor(xps) + 8,
                floor(yps) - 12,
                180))
            {
                ang = PlayerCalculateAngle(xps, yps, 180, 7, 32);
            }
            
			// If it's not a flat ceiling
            if (ang < 170 || ang > 190)
            {
				// Change ground speed
                gsp = xsp - ((ysp * 0.84) * (dsin(ang) / 0.35));
                
				// Land
				grd = true;
            }
            else
            {
				// Cancel landing
                ysp = 0;
                ang = 0;
                grd = false;
            }
        }
    }
}

/*======================
	Ground Collision
======================*/

// Grounded state
if (grd)
{
	// Downhill slopes
    if (PlayerCollisionMask(sMaskLarge,
        floor(xps) + round(dsin(ang) * 24),
        floor(yps) + round(dcos(ang) * 24)))
    {
        while (!PlayerCollisionMask(sMaskMain, xps, yps, round(ang / 45) * 45))
        {
            xps += dsin(ang);
            yps += dcos(ang);
        }
    }
	
    // Uphill slopes
    while (PlayerCollisionMask(sMaskMain, xps, yps, round(ang / 45) * 45))
    {
        xps -= dsin(ang);
        yps -= dcos(ang);
    }
    
	// Calculate angle
    if (PlayerCollisionMask(sMaskLine,
        floor(xps) + round((dcos(ang) * 8) + (dsin(ang) * 12)),
        floor(yps) + round((dcos(ang) * 12) - (dsin(ang) * 8)),
        round(ang / 45) * 45) &&
        PlayerCollisionMask(sMaskLine,
        floor(xps) + round((dcos(ang) * -8) + (dsin(ang) * 12)),
        floor(yps) + round((dcos(ang) * 12) - (dsin(ang) * -8)),
        round(ang / 45) * 45))
    {
        ang = PlayerCalculateAngle(xps, yps, ang, 7, 20);
    }
    
    anim_angle = ang;
    
	// Fall when not fast enough or when not on ground anymore
    if (ang >= 75 && ang <= 285 &&
        abs(gsp) < (0.4 + abs(min(dcos(ang), 0))) * 2 ||
        !PlayerCollisionMask(sMaskLarge,
        floor(xps) + round(dsin(ang) * 13),
        floor(yps) + round(dcos(ang) * 13)))
    {
        xsp = gsp * dcos(ang);
        ysp = gsp * -dsin(ang);
        ang = 0;
        grd = false;
    }
}

// Apply positions to object
x = floor(xps);
y = floor(yps);

/*=============
	Control
=============*/

// Detect input
var inputHorizontal = keyboard_check(vk_right) - keyboard_check(vk_left);

// Change direction
if (inputHorizontal != 0)
    anim_dir = inputHorizontal;

if (grd) // Ground control
{
	// Decelerate
    if (abs(gsp) >= 0 && inputHorizontal != sign(gsp))
    {
        gsp = max(abs(gsp) - acc, 0) * sign(gsp);
    }
    
	// Accelerate
    if (abs(gsp) < top)
    {
        gsp += acc * inputHorizontal;
    }
}
else // Air control
{
	// Accelerate (x2)
    if (abs(xsp) < top)
    {
        xsp += (acc * 2) * inputHorizontal;
    }
}

// Right wall collision
if (PlayerCollisionMask(sMaskLarge,
    floor(xps) + round((dcos(ang) * 9) + (dsin(ang) * -2)),
    floor(yps) + round((dcos(ang) * -2) - (dsin(ang) * 9))))
{
    if (grd) gsp = min(0, gsp);
    else xsp = min(0, xsp);
}

// Left wall collision
if (PlayerCollisionMask(sMaskLarge,
    floor(xps) + round((dcos(ang) * -9) + (dsin(ang) * -2)),
    floor(yps) + round((dcos(ang) * -2) - (dsin(ang) * -9))))
{
    if (grd) gsp = max(0, gsp);
    else xsp = max(0, xsp);
}

if (grd)
{
	// Slope factor
    if (ang > 35 && ang < 325)
    {
        if (abs(gsp) < top)
        {
            gsp -= (slp * 0.38) * dsin(ang);
        }
        else
        {
            gsp -= slp * dsin(ang);
        }
    }
}
else
{
	// Gravity
    ysp += grv;
    
    if (ysp < 0)
    {
		// Air drag
        if (ysp > -4)
        {
            if (abs(xsp) >= 0.125) xsp *= 0.96875;
        }
        
		// Ceiling collision
        if (PlayerCollisionMask(sMaskLarge, xps, floor(yps) - 13))
        {
            ysp = 0;
        }
    }
}

// Actions
switch (action)
{
    case 0: PlayerAction_Common(); break;
    case 1: PlayerAction_Jumping(); break;
}
