class LPAnimMetaDataWeapon extends SPAnimMetaDataWeapon
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

event TriggerWeaponAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyWeapon[8388609], P;

    P = LPPlayerPawn(MyWeapon.Instigator);
    // End:0x91
    if((P != none) && P.bIsMirrored)
    {
        // End:0x91
        if(P.IsDoingSpecialMove_OF_Class(Class'LPSM_ReloadWeaponBase'))
        {
            return;
        }
    }
    super.TriggerWeaponAnim(MyWeapon);
    //return;    
}
