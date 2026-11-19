class DynamicPhysicsVolume extends PhysicsVolume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Display);

var(*) /*0x1EAD0000-0x00000000*/ private bool bEnabled[65537];

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
    bColored=true
    // Reference: BrushComponent'Default__DynamicPhysicsVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    Physics=EPhysics.PHYS_Interpolating
    bStatic=false
    CollisionComponent=BrushComponent0
}