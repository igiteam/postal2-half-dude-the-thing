class LPSM_AkridSmallRecoverFromRagdoll extends SPSM_RecoverFromRagdoll
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, AkridController;

    super.SpecialMoveEnded(PrevMove, NextMove);
    AkridController = LPAIController(MySPPawn.Controller);
    // End:0x7B
    if(AkridController != none)
    {
        AkridController.ForceEnableAI();
    }
    //return;    
}

function CheckCollision()
{
    local /*0x97E50000-0x00000000*/ private @NULL AdjustedLocation, Extent, TraceStart, TraceEnd, HeightVec, HitLocation,
	    HitNormal, HitActor, lookVector;

    // End:0xB3
    if(SPKynapseBotHandle(MySPPawn.myKynapseHandle).PathFinder_CheckInsideNavMeshAndAdjustToFloor(MySPPawn.Location, AdjustedLocation))
    {
        // End:0xB0
        if(!MySPPawn.SetLocation(AdjustedLocation))
        {
            MySPPawn.Suicide();
            return;
        }        
    }
    else
    {
        HeightVec = vect(0.0000000, 0.0000000, 1.0000000) * PawnOwner.CylinderComponent.CollisionHeight;
        TraceStart = MySPPawn.Location + (HeightVec * 1.1000000);
        TraceEnd = MySPPawn.Location - (HeightVec * 3.0000000);
        Extent = vect(0.0000000, 0.0000000, 0.0000000);
        HitActor = MySPPawn.Trace(HitLocation, HitNormal, TraceEnd, TraceStart, true, Extent,, PawnOwner.8);
        // End:0x31B
        if(HitActor != none)
        {
            HitLocation += HeightVec;
            Extent = (vect(1.0000000, 1.0000000, 0.0000000) * MySPPawn.CylinderComponent.CollisionRadius) + (HeightVec * 0.1000000);
            // End:0x2F7
            if(MySPPawn.FindSpot(Extent, HitLocation))
            {
                // End:0x2F4
                if(MySPPawn.Location != HitLocation)
                {
                    MySPPawn.SetLocation(HitLocation);
                }                
            }
            else
            {
                MySPPawn.SetLocation(HitLocation);
            }            
        }
    }
    lookVector = MySPPawn.TakeDamageParams.DamageCauser.Location - MySPPawn.Location;
    lookVector.Z = 0.0000000;
    MySPPawn.SetRotation(Rotator(lookVector));
    //return;    
}

defaultproperties
{
    bDoOnlyHold=true
}