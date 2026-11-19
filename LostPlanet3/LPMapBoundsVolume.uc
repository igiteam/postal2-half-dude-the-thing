class LPMapBoundsVolume extends Volume
    abstract
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

// Export ULPMapBoundsVolume::execGetCenterAndExtents(FFrame&, void* const)
native final function GetCenterAndExtents()
{
    local /*0x97E50000-0x00000000*/ private @NULL Center[25165825], Extents;


}

simulated function StopsProjectile()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

defaultproperties
{
    BrushColor=(R=100,G=100,B=255,A=255)
    bColored=true
    // Reference: BrushComponent'Default__LPMapBoundsVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bStatic=false
    bCollideActors=false
    CollisionComponent=BrushComponent0
    SupportedEvents=none
}