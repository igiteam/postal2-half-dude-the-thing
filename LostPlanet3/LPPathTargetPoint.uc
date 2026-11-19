class LPPathTargetPoint extends SPPathTargetPoint
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisited;

// Export ULPPathTargetPoint::execCacheTargetPoint(FFrame&, void* const)
native function CacheTargetPoint();

// Export ULPPathTargetPoint::execGetClosestLinkedPathTargetPoint(FFrame&, void* const)
native function GetClosestLinkedPathTargetPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL SearchLoc[25296897], ReturnValue;


}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    CacheTargetPoint();
    //return;    
}

defaultproperties
{
    Components[0]=none
    Components[1]=none
    // Reference: CylinderComponent'Default__LPPathTargetPoint.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[2]=CollisionCylinder
    Components[3]=none
    CollisionComponent=CollisionCylinder
}