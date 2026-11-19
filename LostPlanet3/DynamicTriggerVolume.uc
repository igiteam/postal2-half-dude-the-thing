class DynamicTriggerVolume extends TriggerVolume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Display);

var(*) /*0x1EB50000-0x00000000*/ private bool bEnabled[65537];

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetCollision(bEnabled, bBlockActors);
    //return;    
}

defaultproperties
{
    bEnabled=true
    BrushColor=(R=100,G=255,B=255,A=255)
    // Reference: BrushComponent'Default__DynamicTriggerVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bStatic=false
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    CollisionComponent=BrushComponent0
}