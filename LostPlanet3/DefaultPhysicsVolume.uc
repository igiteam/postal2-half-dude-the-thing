class DefaultPhysicsVolume extends PhysicsVolume
    transient
    notplaceable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

event Destroyed()
{
    // DebugMode: 0
    assert(false);
    //return;    
}

defaultproperties
{
    // Reference: BrushComponent'Default__DefaultPhysicsVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bStatic=false
    bNoDelete=false
    CollisionComponent=BrushComponent0
}