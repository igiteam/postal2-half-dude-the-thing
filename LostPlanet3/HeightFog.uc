class HeightFog extends Info
    placeable
    hidecategories(AnimDependency,Navigation,Collision)
    classgroup(Fog);

var(*) /*0x29070000-0x00000400*/ private const export @NULL Component[720897];
var(*) /*0x35EA0000-0x00000000*/ private travel bool bEnabled[2097153];

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    bEnabled = Component.bEnabled;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x43
    if(VarName == 'bEnabled')
    {
        Component.SetEnabled(bEnabled);        
    }
    else
    {
        super(Actor).ReplicatedEvent(VarName);
    }
    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x5A
    if(Action.InputLinks[0].bHasImpulse)
    {
        Component.SetEnabled(true);        
    }
    else
    {
        // End:0xB4
        if(Action.InputLinks[1].bHasImpulse)
        {
            Component.SetEnabled(false);            
        }
        else
        {
            // End:0x12C
            if(Action.InputLinks[2].bHasImpulse)
            {
                Component.SetEnabled(!Component.bEnabled);
            }
        }
    }
    bEnabled = Component.bEnabled;
    ForceNetRelevant();
    SetForcedInitialReplicatedProperty(BoolProperty'HeightFog.bEnabled', bEnabled == default.bEnabled);
    //return;    
}

defaultproperties
{
    // Reference: HeightFogComponent'Default__HeightFog.HeightFogComponent0'
    begin object name=HeightFogComponent0 class=Class'HeightFogComponent'
    end object
    Component=HeightFogComponent0
    Components[0]=none
    Components[1]=HeightFogComponent0
    DrawScale=5.0000000
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bNoDelete=true
}