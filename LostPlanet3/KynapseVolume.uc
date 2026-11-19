class KynapseVolume extends Volume
    abstract
    hidecategories(AnimDependency,Navigation,Object,Movement,Display,Actor,Advanced,Attachment,Brush,Collision,Volume);

simulated function StopsProjectile()
{
    local /*0x02000000-0x00000000*/ private @NULL P[8388609];
    local /*0x02000000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: BrushComponent'Default__KynapseVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bCollideActors=false
    CollisionComponent=BrushComponent0
    SupportedEvents=none
}