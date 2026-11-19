class LPSM_ForkArmGrab_HoldSpitterTailBase extends LPSM_ForkArmGrab_HoldStateBased
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIgnoreSpitDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanDamageFollower;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitterPawn[536870913];

function ShouldShowReticleHelp()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    SpitterPawn = LPAIPawnSpitter(MySPPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x4A
    if((NextMove == none) || !ClassIsChildOf(NextMove.Class, Class'LPSM_ForkArmGrab_HoldSpitterTailBase'))
    {
        StopSpitting();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function VictimDamaged()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x85
    if(!bCanDamageFollower && FollowerPawn.TakeDamageParams.DamageCauser == MySPPawn)
    {
        FollowerPawn.TakeDamageParams.Damage = 0;
        return true;
    }
    return super(LPSM_ForkArmGrab_Base).VictimDamaged();
    //return ReturnValue;    
}

function NotifyFollowerDamagedByLeader()
{
    local /*0x97E50000-0x00000000*/ private @NULL InDamageParams[25296897], Mat, CoreTag;

    Mat = LPPhysicalMaterial(InDamageParams.HitInfo.PhysMaterial);
    // End:0xE7
    if(Mat != none)
    {
        CoreTag = LPPhysMatPropTag_SpitterCoreId(Mat.GetTag(Class'LPPhysMatPropTag_SpitterCoreId'));
        // End:0xE7
        if((CoreTag != none) && CoreTag.GetCoreId() == (GetVictimVulnerableCoreID()))
        {
            HitVulnerableCore(LPAIPawn(FollowerPawn));
        }
    }
    //return;    
}

function DoShockVictim()
{
    MySPPawn.DoSpecialMove(Class'LPSM_ForkArmGrab_Shock', true,,, FollowerPawn);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0xBB
        case Class'LPSMMTypes'.default.SMM_TakeDamageSetParams:
            // End:0xB8
            if(bIgnoreSpitDamage && ClassIsChildOf(MySPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeSpitterAcid'))
            {
                MySPPawn.TakeDamageParams.Damage = 0;
                return true;
            }
            // End:0xEB
            break;
        // End:0xE8
        case Class'LPSMMTypes'.default.SMM_ShockStart:
            DoShockVictim();
            return true;
        // End:0xFFFF
        default:
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function GetEscapeMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x3F
    if(LPAIPawnSpitter(FollowerPawn).GetCoreHealth(3) > float(0))
    {
        return Class'LPSM_ForkArmGrab_SpittingEscape';        
    }
    else
    {
        return super(LPSM_ForkArmGrab_Hold).GetEscapeMove();
    }
    //return ReturnValue;    
}

function StartTargetedSpit()
{
    // End:0xB5
    if(SpitterPawn.MySpitterController.IsSpitPossible())
    {
        StopSpitting();
        SpitterPawn.SetSpitTarget(MySPPawn);
        SpitterPawn.TargetedSocket = 'FrontGlass';
        SpitterPawn.StartSpitting(10000.0000000);
    }
    //return;    
}

function StartTargetlessSpit()
{
    // End:0x61
    if(SpitterPawn.MySpitterController.IsSpitPossible())
    {
        StopSpitting();
        SpitterPawn.StartReactiveSpit();
    }
    //return;    
}

function StopSpitting()
{
    SpitterPawn.DisableReactiveSpit();
    //return;    
}

defaultproperties
{
    bIgnoreSpitDamage=true
    bShowTaserHelp=true
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailBase.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldSpitterTailBase.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldSpitterTailBase.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}