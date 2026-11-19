class AISwitchablePylon extends Pylon
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Lighting,LightColor,Force);

var(*) /*0x01E30000-0x00000000*/ private bool bOpen[65537];

function PostBeginPlay()
{
    super.PostBeginPlay();
    SetEnabled(bOpen);
    //return;    
}

event SetEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnabled[8388609];

    bOpen = bEnabled;
    bForceObstacleMeshCollision = !bOpen;
    //return;    
}

event IsEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bOpen;
    //return ReturnValue;    
}

defaultproperties
{
    bNeedsCostCheck=true
    // Reference: CylinderComponent'Default__AISwitchablePylon.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=none
    Components[6]=none
    Components[7]=none
    CollisionComponent=CollisionCylinder
}