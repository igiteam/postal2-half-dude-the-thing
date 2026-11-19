class SPCameraModeTest extends SPCameraMode;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL TestParams;

// Export USPCameraModeTest::execHasCameraBasedMovement(FFrame&, void* const)
native function HasCameraBasedMovement()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    TestParams = SPCameraModeTestParam(PendingModeParam.ModeParam);
    //return;    
}

simulated function GetCameraRigBase()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CFD.CurrentVT.Location;
    //return ReturnValue;    
}

simulated function UpdateViewTarget()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    super.UpdateViewTarget(DeltaTime);
    //return;    
}

simulated function ShouldOrbitOverrideRotation()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x043A0000-0x00000000*/ private float out_YL[25165825], out_YPos;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    out_YPos = HUD.Canvas.CurY;
    //return;    
}
