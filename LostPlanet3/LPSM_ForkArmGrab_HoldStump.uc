class LPSM_ForkArmGrab_HoldStump extends LPSM_ForkArmGrab_HoldFIXED
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsTorch;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    bIsTorch = ClassIsChildOf(LPVSPlayerPawn(MySPPawn).RightArmPartClass, Class'LPWeaponVSWelder');
    //return;    
}

function StartHoldAnimation()
{
    // End:0x8F
    if(bIsTorch)
    {
        // End:0x5F
        if(bDrillInUse)
        {
            AnimState = 1;
            StartAnimationChoreography(MySPPawn, FollowerPawn, 25, true, DrillInFinished,, false);            
        }
        else
        {
            AnimState = 0;
            StartChoreographedAnimationLooped(MySPPawn, FollowerPawn, 24);
        }        
    }
    else
    {
        super.StartHoldAnimation();
    }
    //return;    
}

function DoTorchKill()
{
    LPAIPawn(FollowerPawn).bAutoExplodeFrozen = true;
    FollowerPawn.TakeDamage(FollowerPawn.Health, MySPPawn.Controller, FollowerPawn.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeForced');
    //return;    
}

function DrillInFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x2B
    if(bDrillInUse && bIsTorch)
    {
        DoTorchKill();
        return;        
    }
    else
    {
        super.DrillInFinished(Node, InUserData, bInterrupted);
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
        // End:0x3F
        case Class'LPSMMTypes'.default.SMM_NewVSRightArmPartSwitchRequest:
            return bIsTorch;
        // End:0x6C
        case Class'LPSMMTypes'.default.SMM_ShockStart:
            DoShockVictim();
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    bShowTaserHelp=true
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldStump.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_ForkArmGrab_HoldStump.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_ForkArmGrab_HoldStump.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
}