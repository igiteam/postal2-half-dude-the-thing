class LPTuneDataAmmoGrenade extends LPTuneDataAmmoDefault
    hidecategories(Object,Object);

var(0.25_Pct) /*0x89940000-0x00000000*/ private @NULL WeaponToGive[65537];

function CanPurchase()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 0;
    //return ReturnValue;    
}

function PurchasedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609];

    // End:0x7C
    if(WeaponToGive != none)
    {
        WeaponToGive.PurchasedBy(InController, Quantity);
        LPPlayerController(InController).GiveAmmoType(string(self), 0, Quantity, 2);        
    }
    //return;    
}

defaultproperties
{
    LocationalDamageParts=/* Array type was not detected. */
}