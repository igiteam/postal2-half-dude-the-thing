class LPLedgeWalkLink extends LPCoverLink
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(0.25_Pct) /*0x808B0000-0x00000400*/ private native @NULL LedgeWalkCSA[65537];
var(0.25_Pct) /*0x808B0000-0x00000000*/ private byte LedgeWalkType[65537];
var(0.25_Pct) /*0x808B0000-0x00000000*/ private bool bCameraRelativeMovement[65537];
var(0.25_Pct) /*0x808B0000-0x00000000*/ private bool bAutoExitLeft[65537];
var(0.25_Pct) /*0x808B0000-0x00000000*/ private bool bAutoExitRight[65537];

simulated function GetCustomCSA()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LedgeWalkCSA;
    //return ReturnValue;    
}

defaultproperties
{
    LedgeWalkType=ELedgeWalkType.ELWT_Thick
    bAutoExitLeft=true
    bAutoExitRight=true
    // Reference: CylinderComponent'Default__LPLedgeWalkLink.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=CollisionCylinder
    Components[3]=none
    CollisionComponent=CollisionCylinder
}