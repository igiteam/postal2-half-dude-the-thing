class LPSM_WeaponOverheatBase extends SPSpecialMove
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendOutTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyWeapon;

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldReplicate()
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
    PlayOverheatStartAnim();
    MyWeapon = LPWeapon(MySPPawn.Weapon);
    MyWeapon.ClearPendingFire(int(MyWeapon.CurrentFireMode));
    MySPPawn.StopFiring();
    //return;    
}

function PlayOverheatStartAnim()
{
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), OverheatStartAnimFinished,, 1.0000000, 0.1000000, 0.2500000, false, true);
    //return;    
}

function OverheatStartAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    PlayOverheatIdleAnim();
    //return;    
}

function PlayOverheatIdleAnim()
{
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(1),,, 1.0000000, 0.2500000, 0.2500000, true, true);
    //return;    
}

function PlayOverheatEndAnim()
{
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(2), OverheatEndAnimFinished,, 1.0000000, 0.1000000, 0.2500000, false, true);
    //return;    
}

function OverheatEndAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove();
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
        // End:0x41
        case Class'LPSMMTypes'.default.SMM_WeaponOverheatIdle:
            PlayOverheatIdleAnim();
            // End:0x75
            break;
        // End:0x6F
        case Class'LPSMMTypes'.default.SMM_WeaponStopOverheating:
            PlayOverheatEndAnim();
            // End:0x75
            break;
        // End:0xFFFF
        default:
            // End:0x75
            break;
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.StopUpperBodyAnim(BlendOutTime);
    MyWeapon.ClearPendingFire(int(MyWeapon.CurrentFireMode));
    // End:0xCE
    if(MySPPawn.Weapon == MyWeapon)
    {
        MySPPawn.StopFiring();
    }
    //return;    
}

function CanOverrideMoveWith()
{
    local /*0x97E50000-0x00000000*/ private class InMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    BlendOutTime=0.1500000
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowSwitchWeapon=true
}