class LPAnimNodeAimOffset extends SPAnimNodeAimOffset
    hidecategories(Object,Object,Object,Object);

var(0.25_Pct) /*0x7B8A0000-0x00000000*/ private byte AimZoneType[65537];

event OnInit()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPawnOwner;

    LPPawnOwner = LPPawn(SkelComponent.Owner);
    // End:0x74
    if(LPPawnOwner != none)
    {
        LPPawnOwner.AimNodeInfo.bUsesAimNode = true;
    }
    //return;    
}

event ScriptGetAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPPawnOwner;

    LPPawnOwner = LPPawn(SkelComponent.Owner);
    // End:0x6A
    if(LPPawnOwner != none)
    {
        return LPPawnOwner.GetAimForAimZone(AimZoneType);
    }
    //return ReturnValue;    
}

defaultproperties
{
    bCallScriptEventOnInit=true
}