class LPSM_ForkArmGrab_GrabObjectFlameOn extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ObjectToGrab;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool AttachmentFinished;

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x83
    if(super(GameSpecialMove).InternalCanDoSpecialMove())
    {
        // End:0x40
        if(MySPPawn.IsLocallyControlled())
        {
            return (FindGrabbableObject()) != none;            
        }
        else
        {
            // End:0x81
            if(int(MySPPawn.WorldInfo.NetMode) != int(NM_Client))
            {                
            }
            else
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function GetForkArmGrabRange()
{
    local /*0x97E50000-0x00000000*/ private float OutRadius[25165825], OutHeight;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPBaseVSPlayerPawn(PawnOwner);
    // End:0xA8
    if(vsPawn != none)
    {
        OutRadius = vsPawn.TuneDataVSPlayerPawn.ForkArmGrabRange2D;
        OutHeight = vsPawn.TuneDataVSPlayerPawn.ForkArmGrabRangeZ;        
    }
    else
    {
        OutRadius = 0.0000000;
        OutHeight = 0.0000000;
    }
    //return;    
}

function FindGrabbableObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float GrabRadius, GrabHeight, bestDist, Dist;
    local /*0x97E50000-0x00000000*/ private @NULL GrabObject, BestGrabObject;

    GetForkArmGrabRange(GrabRadius, GrabHeight);
    bestDist = 2147484000.0000000;
    // End:0xFA
    foreach MySPPawn.DynamicActors(Class'LPDStaticMesh_VSGrabbable', GrabObject)
    {
        Dist = VSize(MySPPawn.Location - GrabObject.Location);
        // End:0xF9
        if((GrabRadius > Dist) && Dist < bestDist)
        {
            bestDist = Dist;
            BestGrabObject = GrabObject;
        }        
    }    
    return BestGrabObject;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    ObjectToGrab = FindGrabbableObject();
    LPVSPlayerPawn(MySPPawn).CCDControl_LeftArm.SetSkelControlActive(true);
    LPVSPlayerPawn(MySPPawn).CCDControl_LeftArm.EffectorLocation = ObjectToGrab.Location;
    AttachmentFinished = false;
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    LPVSPlayerPawn(MySPPawn).CCDControl_LeftArm.SetSkelControlActive(false);
    AttachmentFinished = false;
    ObjectToGrab = none;
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL WristLocation;

    super.Tick(DeltaTime);
    // End:0x1C7
    if(!AttachmentFinished)
    {
        WristLocation = MySPPawn.Mesh.GetBoneLocation(LPVSPlayerPawn(MySPPawn).WinchBoneName);
        // End:0x1C7
        if(VSize(WristLocation - ObjectToGrab.Location) < float(100))
        {
            ObjectToGrab.SetBase(MySPPawn,, MySPPawn.Mesh, LPVSPlayerPawn(MySPPawn).WinchBoneName);
            LPWeaponVSWinch(LPVSPlayerPawn(MySPPawn).FindInventoryType(Class'LPWeaponVSWinch', true)).GrabbedObject = ObjectToGrab;
            LPVSPlayerPawn(MySPPawn).CCDControl_LeftArm.SetSkelControlActive(false);
            AttachmentFinished = true;
        }
    }
    //return;    
}

function CanOverrideSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ClassIsChildOf(InMove, Class'LPSM_ForkArmGrab_Base');
    //return ReturnValue;    
}

function CanOverrideMoveWith()
{
    local /*0x97E50000-0x00000000*/ private class NewMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ClassIsChildOf(NewMove, Class'LPSM_PlayerVSHitReaction');
    //return ReturnValue;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x80
    if(((MySPPawn != none) && LPVSPlayerPawn(MySPPawn) != none) && LPVSPlayerPawn(MySPPawn).ForkArmGrabAnimTree != none)
    {
        return LPVSPlayerPawn(MySPPawn).ForkArmGrabAnimTree;
    }
    return super.GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

defaultproperties
{
    PlaybackType=SPSM_PlayAnimType.SPSM_PlayAnimUpperBody
    AnimationTemplateNodeNames=/* Array type was not detected. */
}