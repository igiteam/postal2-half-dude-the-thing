class LPSM_GrappleToVSZipline extends LPSM_GrapplingFinishBase
    config(Game);

// Export ULPSM_GrappleToVSZipline::execCanGrappleDownFrom(FFrame&, void* const)
native function CanGrappleDownFrom()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609], HookLocation, HookDir;
    local /*0x97E50000-0x00000000*/ private int bCloseEnough[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPSM_GrappleToVSZipline::execCanGrappleDown(FFrame&, void* const)
native function CanGrappleDown()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super(LPSM_GrapplingBase).SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

simulated function OnAnimDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPPlayerPawn(MySPPawn).bUseZiplineVSTransition = true;
    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x89
    if(LPC != none)
    {
        LPC.StartZiplineReturn();
    }
    //return;    
}

function SetUpPawnGrappleDest()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], LPP, HandOffset, ReturnValue, Direction, PawnOffsetLoc,
	    ProjectedHandOffset;

    Direction = -Vector(GrappleHookTarget.Rotation);
    // End:0x57
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

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x80
    if(((MySPPawn != none) && LPPlayerPawn(MySPPawn) != none) && LPPlayerPawn(MySPPawn).ZiplineLogicAnimTree != none)
    {
        return LPPlayerPawn(MySPPawn).ZiplineLogicAnimTree;
    }
    return super(SPSpecialMove).GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

defaultproperties
{
    bShouldFaceGrappleRotation=true
    GrapplePointOffset=75.0000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
}