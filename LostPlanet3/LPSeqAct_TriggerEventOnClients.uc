class LPSeqAct_TriggerEventOnClients extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83730000-0x00000000*/ private name EventName[65537];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL WI, LPPC;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0xAA
    if((((WI == none) || int(WI.NetMode) == int(NM_Standalone)) || int(WI.Role) < int(ROLE_Authority)) || EventName == 'None')
    {
        return;
    }
    // End:0x107
    foreach WI.AllControllers(Class'LPPlayerController', LPPC)
    {
        LPPC.ClientTriggerKismetEvent(EventName);        
    }    
    OutputLinks[0].bHasImpulse = true;
    super(SequenceOp).Activated();
    //return;    
}

defaultproperties
{
    ObjName="Trigger Event on Remote Network Clients (LP)"
}