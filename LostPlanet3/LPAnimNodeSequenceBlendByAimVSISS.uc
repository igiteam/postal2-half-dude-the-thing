class LPAnimNodeSequenceBlendByAimVSISS extends LPAnimNodeSequenceBlendByAim
    hidecategories(Object,Object,Object,Animations);

var(0.25_Pct) /*0xD45F0000-0x00000000*/ private byte VSWeaponID[65537];

event ScriptGetAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], vsPawn, NewAim;

    vsPawn = LPAIPawnVSISS(SkelComponent.Owner);
    // End:0x187
    if((vsPawn != none) && int(vsPawn.GetActiveWeaponID()) == int(VSWeaponID))
    {
        NewAim = super.ScriptGetAim();
        NewAim.X = LimitAimChange(NewAim.X, PreviousAim.X, TimeToTraverseAimRange.X);
        NewAim.Y = LimitAimChange(NewAim.Y, PreviousAim.Y, TimeToTraverseAimRange.Y);
        return NewAim;
    }
    return PreviousAim;
    //return ReturnValue;    
}

defaultproperties
{
    TimeToTraverseAimRange=(X=0.5000000,Y=0.5000000)
}