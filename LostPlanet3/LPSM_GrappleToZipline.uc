class LPSM_GrappleToZipline extends LPSM_GrapplingFinishBase
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

    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x5F
    if(LPC != none)
    {
        LPC.StartZipline();
    }
    //return;    
}

function SetUpPawnGrappleDest()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], LPP, HandOffset, ReturnValue, Direction, PawnOffsetLoc,
	    ProjectedHandOffset;

    // End:0xEB
    if(LPHookMeshActor(GrappleHookTarget) != none)
    {
        Direction = -Vector(GrappleHookTarget.Rotation);
        // End:0x6F
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
    }
    else
    {
        // End:0x1BC
        if(LPZiplinePoint_Base(GrappleHookTarget) != none)
        {
            Direction = LPZiplinePoint_Base(GrappleHookTarget).GetLineDirection();
            PawnOffsetLoc = vect(0.0000000, 0.0000000, 0.0000000);
            ProjectedHandOffset = Direction * vect(32.8400000, -12.9900000, 0.0000000);
            ProjectedHandOffset.Z += 166.4600000;
            return LPP.GrappleActorLocation - ProjectedHandOffset;
        }
    }
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