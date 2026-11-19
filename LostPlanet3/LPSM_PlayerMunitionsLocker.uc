class LPSM_PlayerMunitionsLocker extends LPSM_PlayerArmUI
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOpenLockerOnStart;

function GetControllerState()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'MunitionsLocker';
    //return ReturnValue;    
}

function HideUI()
{
    // End:0x43
    if(MyPlayerController != none)
    {
        MyPlayerController.myLPHUD.CancelMunitionsLocker();
    }
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x92
    if(MySPPawn.IsLocallyControlled() && MyPlayerController != none)
    {
        MyPlayerController.bMunitionsLockerEnabled = false;
        MyPlayerController.bMunitionsLockerReloadEnabled = false;
    }
    // End:0xD6
    if(bOpenLockerOnStart)
    {
        MyPlayerController.myLPHUD.ShowMunitionsLocker(true);
    }
    //return;    
}

defaultproperties
{
    bOpenLockerOnStart=true
    bAllowSwitchWeapon=true
}