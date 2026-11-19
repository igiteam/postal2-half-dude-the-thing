class LPSM_PlayerShackBridgeStruggle extends LPSM_LeadStruggleMode
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateTree;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPPlayerPawn(inPawn).TuneDataStruggleShackBridge;
    super.InitSpecialMove(inPawn, InHandle);
    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.bCollideWorld = false;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.SetPhysics(1);
    MySPPawn.bCollideWorld = true;
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x19
    if(AnimTemplateTree != none)
    {
        return AnimTemplateTree;
    }
    return super.GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    // End:0x41
    if(MySPPawn != none)
    {
        MySPPawn.ZeroMovementVariables();
    }
    //return;    
}

defaultproperties
{
    PlayerCtrlStateName="SoloStruggle"
    TuneDataClass=Class'LPTuneDataStruggleShackBridge'
    ApplyDamageClass=Class'LPDamageTypeForced'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerShackBridgeStruggle.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerShackBridgeStruggle.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    bAllowNullFollower=true
}