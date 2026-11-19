class LPCameraModeAimControlFirstPerson extends SPCameraModeAimControlFirstPerson;

function InitPendingMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    //return;    
}

defaultproperties
{
    // Reference: SPCameraBlendSpeedFilter'Default__LPCameraModeAimControlFirstPerson.OffsetFilterObj'
    begin object name=OffsetFilterObj
    end object
    StaticOffsetFilter=OffsetFilterObj
    // Reference: SPCameraCollision'Default__LPCameraModeAimControlFirstPerson.MainCameraCollisionObj'
    begin object name=MainCameraCollisionObj
    end object
    CameraCollisionMain=MainCameraCollisionObj
}