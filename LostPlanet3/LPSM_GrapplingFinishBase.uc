class LPSM_GrapplingFinishBase extends LPSM_GrapplingBase
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldFaceGrappleRotation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GrapplePointOffset;

// Export ULPSM_GrapplingFinishBase::execIsValidHookForPawn(FFrame&, void* const)
native function IsValidHookForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609], HookLocation, HookDir;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPSM_GrapplingFinishBase::execCanGrappleDownFrom(FFrame&, void* const)
native function CanGrappleDownFrom()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609], HookLocation, HookDir;
    local /*0x97E50000-0x00000000*/ private int bIsCloseEnough[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPSM_GrapplingFinishBase::execCanGrappleDown(FFrame&, void* const)
native function CanGrappleDown()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    // End:0x40
    if(LPPlayerPawn(MySPPawn) != none)
    {
        LPPlayerPawn(MySPPawn).OnGrapplingFinishedAnimBegin();
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    LPPlayerPawn(MySPPawn).StopGrappling();
    //return;    
}

static function ProjectHandOffset()
{
    local /*0x97E50000-0x00000000*/ private @NULL vForward[8388609], HandOffset, ReturnValue, vRight, vUp, vNewOffset;

    vForward.Z = 0.0000000;
    vForward = Normal(vForward);
    vUp = vect(0.0000000, 0.0000000, 1.0000000);
    vRight = vForward Cross vUp;
    vNewOffset = vForward * HandOffset.Y;
    vNewOffset += (vRight * HandOffset.X);
    vNewOffset += (vUp * HandOffset.Z);
    return vNewOffset;
    //return ReturnValue;    
}

function SetUpPawnGrappleDest()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], LPP, HandOffset, ReturnValue, Direction, PawnOffsetLoc,
	    ProjectedHandOffset;

    Direction = -Normal(LPP.GrappleActorLocation - LPP.Location);
    // End:0x77
    if(default.GrapplePointOffset == float(0))
    {
        PawnOffsetLoc = vect(0.0000000, 0.0000000, 0.0000000);        
    }
    else
    {
        PawnOffsetLoc = Direction * default.GrapplePointOffset;
    }
    ProjectedHandOffset = ProjectHandOffset(Direction, HandOffset);
    return (LPP.GrappleActorLocation + PawnOffsetLoc) - ProjectedHandOffset;
    //return ReturnValue;    
}

defaultproperties
{
    bDisableCollision=true
}