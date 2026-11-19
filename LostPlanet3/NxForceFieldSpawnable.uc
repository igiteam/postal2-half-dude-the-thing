class NxForceFieldSpawnable extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x36D60000-0x00000400*/ private export @NULL ForceFieldComponent[589825];

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x5B
    if(inAction.InputLinks[0].bHasImpulse)
    {
        ForceFieldComponent.bForceActive = true;        
    }
    else
    {
        // End:0xB6
        if(inAction.InputLinks[1].bHasImpulse)
        {
            ForceFieldComponent.bForceActive = false;            
        }
        else
        {
            // End:0x12F
            if(inAction.InputLinks[2].bHasImpulse)
            {
                ForceFieldComponent.bForceActive = !ForceFieldComponent.bForceActive;
            }
        }
    }
    //return;    
}

defaultproperties
{
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=0.1000000
}