class FluidInfluenceActor extends Actor
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Fluid);

var(*) /*0x35EA0000-0x00000400*/ private export @NULL FlowDirection[524289];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL Sprite[524289];
var(*) /*0x23970000-0x00000400*/ private const export @NULL InfluenceComponent[720897];
var(*) /*0x35EA0000-0x00000000*/ private travel bool bActive[2097153];
var(*) /*0x35EA0000-0x00000000*/ private travel bool bToggled[2097153];

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x5B
    if(inAction.InputLinks[0].bHasImpulse)
    {
        InfluenceComponent.bActive = true;        
    }
    else
    {
        // End:0xB6
        if(inAction.InputLinks[1].bHasImpulse)
        {
            InfluenceComponent.bActive = false;            
        }
        else
        {
            // End:0x150
            if(inAction.InputLinks[2].bHasImpulse)
            {
                InfluenceComponent.bActive = !InfluenceComponent.bActive;
                InfluenceComponent.bIsToggleTriggered = true;
            }
        }
    }
    bActive = InfluenceComponent.bActive;
    bToggled = InfluenceComponent.bIsToggleTriggered;
    bForceNetUpdate = true;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x44
    if(VarName == 'bActive')
    {
        InfluenceComponent.bActive = bActive;        
    }
    else
    {
        // End:0x88
        if(VarName == 'bToggled')
        {
            InfluenceComponent.bIsToggleTriggered = bToggled;            
        }
        else
        {
            super.ReplicatedEvent(VarName);
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: FluidInfluenceComponent'Default__FluidInfluenceActor.NewInfluenceComponent'
    begin object name=NewInfluenceComponent class=Class'FluidInfluenceComponent'
    end object
    InfluenceComponent=NewInfluenceComponent
    Components[0]=none
    Components[1]=none
    Components[2]=NewInfluenceComponent
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=0.1000000
}