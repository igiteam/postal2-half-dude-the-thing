class LPHookMeshActor extends LPGrapplePointActorBase
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

enum EAdvanceGrappleType
{
    AGT_None,                       // 0
    AGT_VaultOver,                  // 1
    AGT_RollOver,                   // 2
    AGT_MAX                         // 3
};

var(0.25_Pct) /*0x677D0000-0x00000400*/ private native @NULL HookConnection1[65537];
var(0.25_Pct) /*0x677D0000-0x00000400*/ private native @NULL HookConnection2[65537];
var(0.25_Pct) /*0x67840000-0x00000000*/ private bool bAutoWallAlign[65537];
var(0.25_Pct) /*0x67840000-0x00000000*/ private bool bAutoFallRecovery[65537];
var(0.25_Pct) /*0x67840000-0x00000000*/ private bool bCanOnlyBeUsedByCourier[65537];
var(0.25_Pct) /*0x8B8D0000-0x00000000*/ private bool bForceMantleCollisionChecksOff[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private native @NULL ParentHookConnection;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WallAutoDetectDist[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WallAutoDetectStepDist[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TopOfWallOffset[131073];
var(0.25_Pct) /*0x035C0000-0x00000000*/ private byte AdvancedGrappleType[65537];
var(0.25_Pct) /*0x8B8D0000-0x00000000*/ private float PercentageOfPawnsCollisionHeightToCheck[65537];
var(0.25_Pct) /*0x8B8D0000-0x00000000*/ private float PercentageOfPawnsCollisionRadiusToCheck[65537];

// Export ULPHookMeshActor::execUpdate(FFrame&, void* const)
native simulated function Update()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnLocation[8388609], CameraPos, CameraDir;


}

// Export ULPHookMeshActor::execIsValidForPlayerGrapple(FFrame&, void* const)
native simulated function IsValidForPlayerGrapple()
{
    local /*0x97E50000-0x00000000*/ private float CurrentDot[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyBasePlayerPawn[8388609], LPPC;
    local /*0x97E50000-0x00000000*/ private float MaxPlayerAngleToHookDot[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPHookMeshActor::execCheckGrappleEarlyOuts(FFrame&, void* const)
native simulated function CheckGrappleEarlyOuts()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPHookMeshActor::execHasHookConnections(FFrame&, void* const)
native simulated function HasHookConnections()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPHookMeshActor::execGetGrapplePoint(FFrame&, void* const)
native simulated function GetGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAdjustForCollision[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPHookMeshActor::execGetCollisionAdjustedGrapplePoint(FFrame&, void* const)
native final simulated function GetCollisionAdjustedGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609], ReturnValue;


}

// Export ULPHookMeshActor::execGetGrappleDownPoint(FFrame&, void* const)
native simulated function GetGrappleDownPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bRestrict[9437185];
    local /*0x97E50000-0x00000000*/ private int bIsValid[26214401];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPHookMeshActor::execIsInViewableRange(FFrame&, void* const)
native simulated function IsInViewableRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL CameraLocation[8388609], CameraDir;
    local /*0x97E50000-0x00000000*/ private float RequiredDot[8388609], MaxDist, ReturnValue;


}

// Export ULPHookMeshActor::execCanGrappleDownFrom(FFrame&, void* const)
native final simulated function CanGrappleDownFrom()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609];
    local /*0x97E50000-0x00000000*/ private int bIsCloseEnough[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPHookMeshActor::execCanGrappleDown(FFrame&, void* const)
native final simulated function CanGrappleDown()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function UpdateForFallRecovery()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnLocation[8388609], CameraDir, CameraPos, PlanePoint, PlaneDir, CameraIntersection,
	    ConnectionDir, Temp, HookConnectionEnd;

    // End:0x11
    if(!HasHookConnections())
    {
        return;
    }
    HookConnection1.bEnabled = false;
    HookConnection1.SetCollision(false, false);
    // End:0xAE
    if(HookConnection2 != none)
    {
        HookConnection2.bEnabled = false;
        HookConnection2.SetCollision(false, false);
        HookConnectionEnd = HookConnection2;        
    }
    else
    {
        HookConnectionEnd = self;
    }
    PlanePoint = HookConnection1.Location;
    PlaneDir = -Vector(Rotation);
    CameraPos = PawnLocation;
    CameraDir = -PlaneDir;
    // End:0x19C
    if(Class'SPEngine.SPUtil'.static.IntersectRayWithPlane(PlanePoint, PlaneDir, CameraPos, CameraDir, CameraIntersection) == false)
    {
        GrappleLocation = HookConnection1.Location;
        return;
    }
    CameraIntersection.Z = PlanePoint.Z;
    ConnectionDir = Normal(HookConnection1.Location - HookConnectionEnd.Location);
    Temp = Normal(CameraIntersection - HookConnection1.Location);
    // End:0x29B
    if((ConnectionDir Dot Temp) > float(0))
    {
        CameraIntersection = HookConnection1.Location;        
    }
    else
    {
        Temp = Normal(CameraIntersection - HookConnectionEnd.Location);
        ConnectionDir *= float(-1);
        // End:0x326
        if((ConnectionDir Dot Temp) > float(0))
        {
            CameraIntersection = HookConnectionEnd.Location;
        }
    }
    GrappleLocation = CameraIntersection;
    //return;    
}

defaultproperties
{
    bAutoWallAlign=true
    WallAutoDetectDist=20.0000000
    WallAutoDetectStepDist=50.0000000
    TopOfWallOffset=4.0000000
    PercentageOfPawnsCollisionHeightToCheck=0.5000000
    PercentageOfPawnsCollisionRadiusToCheck=3.0000000
    GrappleType=Class'LPSM_GrappleFall'
    bEnabled=true
    // Reference: CylinderComponent'Default__LPHookMeshActor.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[0]=CollisionCylinder
    Components[1]=none
    Components[2]=none
    RemoteRole=ENetRole.ROLE_None
    bStatic=true
    bHidden=true
    bMovable=false
    SupportedEvents=/* Array type was not detected. */
}