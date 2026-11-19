class ImageReflectionShadowPlane extends Actor
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000000*/ private travel bool bEnabled[2097153];
var(*) /*0x29B90000-0x00000400*/ private export @NULL ReflectionShadowComponent[589825];

event PostBeginPlay()
{
    super.PostBeginPlay();
    bEnabled = ReflectionShadowComponent.bEnabled;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x43
    if(VarName == 'bEnabled')
    {
        ReflectionShadowComponent.SetEnabled(bEnabled);        
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

    // End:0x5A
    if(Action.InputLinks[0].bHasImpulse)
    {
        ReflectionShadowComponent.SetEnabled(true);        
    }
    else
    {
        // End:0xB4
        if(Action.InputLinks[1].bHasImpulse)
        {
            ReflectionShadowComponent.SetEnabled(false);            
        }
        else
        {
            // End:0x12C
            if(Action.InputLinks[2].bHasImpulse)
            {
                ReflectionShadowComponent.SetEnabled(!ReflectionShadowComponent.bEnabled);
            }
        }
    }
    bEnabled = ReflectionShadowComponent.bEnabled;
    ForceNetRelevant();
    SetForcedInitialReplicatedProperty(BoolProperty'ImageReflectionShadowPlane.bEnabled', bEnabled == default.bEnabled);
    //return;    
}

defaultproperties
{
    bEnabled=true
    // Reference: ImageReflectionShadowPlaneComponent'Default__ImageReflectionShadowPlane.ReflectionComponent0'
    begin object name=ReflectionComponent0 class=Class'ImageReflectionShadowPlaneComponent'
    end object
    ReflectionShadowComponent=ReflectionComponent0
    Components[0]=ReflectionComponent0
    Components[1]=none
    Physics=EPhysics.PHYS_Interpolating
    bNoDelete=true
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=10.0000000
}