class LPContextSensitiveAnimObject extends SPContextSensitiveAnimObject
    abstract;

var(0.25_Pct) /*0x01AF0000-0x00000000*/ private bool bUsesWeapon[65537];
var(0.25_Pct) /*0x7CCF0000-0x00000000*/ private bool bCanLowHealthCSAOverride[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowSwitchToBestWeaponCheck;

event OnBecomeActive()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.OnBecomeActive(inPawn);
    CheckSwitchToBestWeapon(LPPawn(inPawn));
    //return;    
}

function CheckSwitchToBestWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bHasWeapon, bHasWeaponNone;

    // End:0x16A
    if((inPawn.InvManager != none) && bAllowSwitchToBestWeaponCheck)
    {
        bHasWeapon = (inPawn.Weapon != none) && LPInventoryWeaponNone(inPawn.Weapon) == none;
        bHasWeaponNone = (inPawn.Weapon != none) && LPInventoryWeaponNone(inPawn.Weapon) != none;
        // End:0x12A
        if(!bHasWeapon && bUsesWeapon)
        {
            inPawn.SwitchToLastEquippedWeapon(true);            
        }
        else
        {
            // End:0x16A
            if(!bHasWeaponNone && !bUsesWeapon)
            {
                inPawn.SwitchToWeaponNone(true);
            }
        }
    }
    //return;    
}

function DoesAllowWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bUsesWeapon;
    //return ReturnValue;    
}
