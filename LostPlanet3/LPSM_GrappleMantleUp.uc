class LPSM_GrappleMantleUp extends LPSM_GrapplingFinishBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistanceToPlane;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GrappleOffsetDueToCollision[536870913];

// Export ULPSM_GrappleMantleUp::execIsValidHookForPawn(FFrame&, void* const)
native function IsValidHookForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609], HookLocation, HookDir;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPSM_GrappleMantleUp::execCanGrappleDownFrom(FFrame&, void* const)
native function CanGrappleDownFrom()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609], HookLocation, HookDir;
    local /*0x97E50000-0x00000000*/ private int bIsCloseEnough[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPSM_GrappleMantleUp::execCanGrappleDown(FFrame&, void* const)
native function CanGrappleDown()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function SetUpPawnGrappleDest()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], LPP, HandOffset, ReturnValue, Direction, PawnOffsetLoc,
	    ProjectedHandOffset, CollisionAdjustedLocation, BaseGrappleLocation, Hook;

    GrappleOffsetDueToCollision = 0.0000000;
    Hook = LPP.GetGrapplingHook();
    Direction = -Vector(GrappleHookTarget.Rotation);
    // End:0x8F
    if(default.GrapplePointOffset == float(0))
    {
        PawnOffsetLoc = vect(0.0000000, 0.0000000, 0.0000000);        
    }
    else
    {
        PawnOffsetLoc = Direction * default.GrapplePointOffset;
    }
    ProjectedHandOffset = ProjectHandOffset(Direction, HandOffset);
    // End:0x1B3
    if(GrappleHookTarget != none)
    {
        CollisionAdjustedLocation = Hook.GrapplePoint;
        BaseGrappleLocation = LPP.GrappleActorLocation;
        CollisionAdjustedLocation.Z = BaseGrappleLocation.Z;
        GrappleOffsetDueToCollision = VSize2D(BaseGrappleLocation - CollisionAdjustedLocation);
        return (CollisionAdjustedLocation + PawnOffsetLoc) - ProjectedHandOffset;
    }
    return LPP.Location;
    //return ReturnValue;    
}

function AdjustRootMotionToReachDestination()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ExtractedTrans, ExtractedRot;
    local /*0x97E50000-0x00000000*/ private float Scale, ExtractedDist2D;

    // End:0x15
    if(GrappleOffsetDueToCollision < 1.0000000)
    {
        return;
    }
    Class'SPEngine.SPUtil'.static.GetAnimationExtractionDeltas(SeqNode.AnimSeq, MySPPawn.Mesh, 0.0000000, SeqNode.AnimSeq.SequenceLength, ExtractedTrans, ExtractedRot);
    ExtractedDist2D = VSize2D(ExtractedTrans);
    // End:0x134
    if(ExtractedDist2D > 0.1000000)
    {
        Scale = (ExtractedDist2D + GrappleOffsetDueToCollision) / ExtractedDist2D;
        SetRootMotionScale(Scale, Scale, 1.0000000);
    }
    //return;    
}

function GetAdvancedGrappleType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 0;
    //return ReturnValue;    
}

simulated function HasAdvancedGrapple()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function GetNumAnimations()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x18
    if(HasAdvancedGrapple())
    {
        return super(LPSM_GrapplingBase).GetNumAnimations();
    }
    return AnimationTemplates.Length - 2;
    //return ReturnValue;    
}

function PlaySequence()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private byte AGT;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnSequence;

    AGT = GetAdvancedGrappleType();
    switch(AGT)
    {
        // End:0x3B
        case 1:
            SequenceID = 4;
            // End:0x97
            break;
        // End:0x4F
        case 2:
            SequenceID = 5;
            // End:0x97
            break;
        // End:0xFFFF
        default:
            // End:0x94
            if(SequenceID == 0)
            {
                SequenceID = int(LPPlayerPawn(MySPPawn).GrappleMovementType);
            }
            // End:0x97
            break;
            break;
    }
    ReturnSequence = super(LPSM_GrapplingBase).PlaySequence();
    // End:0xDC
    if(SequenceID == ((GetNumAnimations()) - 1))
    {
        AdjustRootMotionToReachDestination(ReturnSequence);        
    }
    else
    {
        SetRootMotionScale(1.0000000, 1.0000000, 1.0000000);
    }
    return ReturnSequence;
    //return ReturnValue;    
}

simulated function PlayNextSequence()
{
    // End:0x19
    if(HasAdvancedGrapple())
    {
        OnLastAnimDone();
        return;
    }
    // End:0x35
    if(SequenceID <= 2)
    {
        SequenceID = 2;
    }
    super(LPSM_GrapplingBase).PlayNextSequence();
    //return;    
}

defaultproperties
{
    MinDistanceToPlane=45.0000000
    bShouldFaceGrappleRotation=true
    GrapplePointOffset=75.0000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowFloorConforming=false
    bAllowFootPlacementControllers=false
}