class LPSM_PlayerVSWinchFireBase extends SPSM_PlayAnimBase
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CustomAnimSlot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;

function CanOverrideMoveWith()
{
    local /*0x97E50000-0x00000000*/ private class NewMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function PlayCustomAnimation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PlayParams[25296897], ReturnValue, at;

    at = AnimTree(MySPPawn.Mesh.Animations);
    vsPawn = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x16A
    if((at != none) && vsPawn != none)
    {
        vsPawn.UpperBodyBlendPerBone.SetBlendTarget(vsPawn.TuneDataVSPlayerPawn.WinchBlendAmount, 0.2500000);
        CustomAnimSlot = SPAnimNodeSlot(at.FindAnimNode('UpperBodySlotNode'));
        // End:0x16A
        if(CustomAnimSlot != none)
        {
            return MySPPawn.PlayAnimationFromParams(CustomAnimSlot, PlayParams);
        }
    }
    //return ReturnValue;    
}

function StopCustomAnimation()
{
    // End:0x3E
    if(CustomAnimSlot != none)
    {
        CustomAnimSlot.StopCustomAnim(0.2500000);
        CustomAnimSlot = none;
    }
    // End:0x8B
    if(vsPawn != none)
    {
        vsPawn.UpperBodyBlendPerBone.SetBlendTarget(1.0000000, 0.2500000);
    }
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    LPVSPlayerPawn(MySPPawn).EnableUpperBodyCameraBypass(true);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, VS;

    super.SpecialMoveEnded(PrevMove, NextMove);
    VS = LPVSPlayerPawn(MySPPawn);
    // End:0xA6
    if(VS != none)
    {
        VS.UpperBodyBlendPerBone.SetBlendTarget(1.0000000, 0.2500000);
        VS.EnableUpperBodyCameraBypass(false);
    }
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPVSPlayerPawn(MySPPawn).VSWinchAnimTree;
    //return ReturnValue;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_AllowMunitionsLockerAccess:
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    PlaybackType=SPSM_PlayAnimType.SPSM_PlayAnimCustom
}