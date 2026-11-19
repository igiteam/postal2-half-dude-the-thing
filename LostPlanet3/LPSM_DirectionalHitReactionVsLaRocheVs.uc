class LPSM_DirectionalHitReactionVsLaRocheVs extends LPSM_DirectionalHitReactionAI
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], vsPawn, NewRotation, Dir;

    super.SpecialMoveStarted(bForced, PrevMove);
    vsPawn = LPVSPlayerPawn(MySPPawn.TakeDamageParams.InstigatedByPawn);
    // End:0x153
    if(vsPawn != none)
    {
        Dir = vsPawn.Location - MySPPawn.Location;
        Dir.Z = 0.0000000;
        NewRotation = Rotator(Dir);
        NewRotation.Pitch = 0;
        NewRotation.Roll = 0;
        MySPPawn.SetRotation(NewRotation);
    }
    //return;    
}

function GetDesiredAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL VsLarochePawn;
    local /*0x97E50000-0x00000000*/ private bool bcanGoLeft, bcanGoRight, bcanGoBack;

    VsLarochePawn = LPAIPawnVsLaroche(MySPPawn);
    // End:0x331
    if(VsLarochePawn != none)
    {
        bcanGoLeft = false;
        bcanGoRight = false;
        bcanGoBack = false;
        // End:0x7D
        if(VsLarochePawn.IsLeftArmGrabPointAbleToBeGrabed())
        {
            bcanGoLeft = true;
        }
        // End:0xAB
        if(VsLarochePawn.IsLeftShoulderGrabPointAbleToBeGrabed())
        {
            bcanGoLeft = true;
        }
        // End:0xD9
        if(VsLarochePawn.IsRightBicepGrabPointAbleToBeGrabed())
        {
            bcanGoRight = true;
        }
        // End:0x107
        if(VsLarochePawn.IsRightShoulderGrabPointAbleToBeGrabed())
        {
            bcanGoRight = true;
        }
        // End:0x135
        if(VsLarochePawn.IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed())
        {
            bcanGoBack = true;
        }
        // End:0x163
        if(VsLarochePawn.IsCockpitCrossBarGrabPointAbleToBeGrabed())
        {
            bcanGoBack = true;
        }
        // End:0x196
        if((bcanGoLeft && bcanGoRight) && bcanGoBack)
        {
            return Rand(3);            
        }
        else
        {
            // End:0x1EC
            if((bcanGoLeft && bcanGoRight) && !bcanGoBack)
            {
                // End:0x1E6
                if(RandRange(0.0000000, 1.0000000) < 0.5000000)
                {
                    return 0;                    
                }
                else
                {
                    return 2;
                }                
            }
            else
            {
                // End:0x241
                if((bcanGoLeft && !bcanGoRight) && bcanGoBack)
                {
                    // End:0x23C
                    if(RandRange(0.0000000, 1.0000000) < 0.5000000)
                    {
                        return 0;                        
                    }
                    else
                    {
                        return 1;
                    }                    
                }
                else
                {
                    // End:0x297
                    if((!bcanGoLeft && bcanGoRight) && bcanGoBack)
                    {
                        // End:0x292
                        if(RandRange(0.0000000, 1.0000000) < 0.5000000)
                        {
                            return 2;                            
                        }
                        else
                        {
                            return 1;
                        }                        
                    }
                    else
                    {
                        // End:0x2CB
                        if((bcanGoLeft && !bcanGoRight) && !bcanGoBack)
                        {
                            return 0;                            
                        }
                        else
                        {
                            // End:0x300
                            if((!bcanGoLeft && bcanGoRight) && !bcanGoBack)
                            {
                                return 2;                                
                            }
                            else
                            {
                                // End:0x331
                                if((!bcanGoLeft && !bcanGoRight) && bcanGoBack)
                                {
                                    return 1;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return Rand(3);
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}