class ImageReflection extends Actor
    placeable
    hidecategories(AnimDependency,Navigation)
    autoexpandcategories(ImageReflection,ImageBasedReflectionComponent);

var(*) /*0x35EA0000-0x00000000*/ private travel bool bEnabled[2097153];
var(*) /*0x35EA0000-0x00000400*/ private export transient @NULL ReflectionComponent[524289];
var(*) /*0x29B20000-0x00000400*/ private export @NULL ImageReflectionComponent[589825];

event PostBeginPlay()
{
    super.PostBeginPlay();
    bEnabled = ImageReflectionComponent.bEnabled;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x43
    if(VarName == 'bEnabled')
    {
        ImageReflectionComponent.SetEnabled(bEnabled);        
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
        ImageReflectionComponent.SetEnabled(true);        
    }
    else
    {
        // End:0xB4
        if(Action.InputLinks[1].bHasImpulse)
        {
            ImageReflectionComponent.SetEnabled(false);            
        }
        else
        {
            // End:0x12C
            if(Action.InputLinks[2].bHasImpulse)
            {
                ImageReflectionComponent.SetEnabled(!ImageReflectionComponent.bEnabled);
            }
        }
    }
    bEnabled = ImageReflectionComponent.bEnabled;
    ForceNetRelevant();
    SetForcedInitialReplicatedProperty(BoolProperty'ImageReflection.bEnabled', bEnabled == default.bEnabled);
    //return;    
}

defaultproperties
{
    bEnabled=true
    // Reference: ImageBasedReflectionComponent'Default__ImageReflection.ReflectionComponent0'
    begin object name=ReflectionComponent0 class=Class'ImageBasedReflectionComponent'
    end object
    ImageReflectionComponent=ReflectionComponent0
    Components[0]=ReflectionComponent0
    bNoDelete=true
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=10.0000000
}