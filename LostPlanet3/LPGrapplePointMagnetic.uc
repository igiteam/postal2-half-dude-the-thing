class LPGrapplePointMagnetic extends LPHookMeshActor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation,HookConnectionInfo);

var(0.25_Pct) /*0x8B4F0000-0x00000400*/ private export @NULL GrappleMesh[589825];
var(0.25_Pct) /*0x8B4F0000-0x00000000*/ private @NULL GrappleOffset[65537];

// Export ULPGrapplePointMagnetic::execGetGrapplePoint(FFrame&, void* const)
native simulated function GetGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAdjustForCollision[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPGrapplePointMagnetic::execGetGrappleDownPoint(FFrame&, void* const)
native simulated function GetGrappleDownPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bRestrict[9437185];
    local /*0x97E50000-0x00000000*/ private int bIsValid[26214401];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

defaultproperties
{
    bMagnetic=true
    // Reference: CylinderComponent'Default__LPGrapplePointMagnetic.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[0]=CollisionCylinder
    Components[1]=none
    Components[2]=none
}