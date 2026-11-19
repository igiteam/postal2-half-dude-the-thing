class Light extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation)
    classgroup(Lights);

var(*) /*0x2E9D0000-0x00000400*/ private const export @NULL LightComponent[720897];
var(*) /*0x35EA0000-0x00000000*/ private travel bool bEnabled[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bPreserveOldDynamicStatus;

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x43
    if(VarName == 'bEnabled')
    {
        LightComponent.SetEnabled(bEnabled);        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x198
    if(!bStatic)
    {
        // End:0x69
        if(Action.InputLinks[0].bHasImpulse)
        {
            LightComponent.SetEnabled(true);            
        }
        else
        {
            // End:0xC3
            if(Action.InputLinks[1].bHasImpulse)
            {
                LightComponent.SetEnabled(false);                
            }
            else
            {
                // End:0x13B
                if(Action.InputLinks[2].bHasImpulse)
                {
                    LightComponent.SetEnabled(!LightComponent.bEnabled);
                }
            }
        }
        bEnabled = LightComponent.bEnabled;
        ForceNetRelevant();
        SetForcedInitialReplicatedProperty(BoolProperty'Light.bEnabled', bEnabled == default.bEnabled);
    }
    //return;    
}

defaultproperties
{
    Components[0]=none
    bStatic=true
    bHidden=true
    bNoDelete=true
    bRouteBeginPlayEvenIfStatic=false
    bMovable=false
}