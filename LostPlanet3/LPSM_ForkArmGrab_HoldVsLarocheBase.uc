class LPSM_ForkArmGrab_HoldVsLarocheBase extends LPSM_ForkArmGrab_HoldStateBased
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VsLarochePawn;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    vsPawn = LPVSPlayerPawn(MySPPawn);
    ForkArmGrabInfo.GrabPoint.bFirmGrab = vsPawn.ReplicatedForkArmGrabInfo.GrabPointInfo.bFirmGrab;
    ForkArmGrabInfo.GrabPoint.GrabPointIndex = vsPawn.ReplicatedForkArmGrabInfo.GrabPointInfo.GrabPointIndex;
    ForkArmGrabInfo.GrabPoint.HitPawn = vsPawn.ReplicatedForkArmGrabInfo.GrabPointInfo.HitPawn;
    super.SpecialMoveStarted(bForced, PrevMove);
    VsLarochePawn = LPAIPawnVsLaroche(FollowerPawn);
    // End:0x1E3
    if(VsLarochePawn != none)
    {
        VsLarochePawn.InStruggleMode = true;
    }
    //return;    
}

function StartInteraction()
{
    super.StartInteraction();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x30
    if(VsLarochePawn != none)
    {
        VsLarochePawn.InStruggleMode = false;
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function GetCoreDestroyedSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_ForkArmGrab_CoreDestroyedVs';
    //return ReturnValue;    
}

function NotifyFollowerDamagedByLeader()
{
    local /*0x97E50000-0x00000000*/ private @NULL InDamageParams[25296897];

    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldVsLarocheBase.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldVsLarocheBase.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldVsLarocheBase.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}