class SPCameraModeAnimated extends SPCameraMode
    abstract;

const HeadRadius = 24.0;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL AnimatedParams;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CameraCollisionAnim;

// Export USPCameraModeAnimated::execGetCameraAttributes(FFrame&, void* const)
native function GetCameraAttributes()
{
    local /*0x043A0000-0x00000000*/ private @NULL CamLocation[25165825], CamRotation;
    local /*0x043A0000-0x00000000*/ private float CamFOV[25165825];


}

function InitPendingMode()
{
    local /*0x043A0000-0x00000000*/ private @NULL PendingModeParam[8388609];

    super.InitPendingMode(PendingModeParam);
    AnimatedParams = SPCameraModeAnimatedParam(PendingModeParam.ModeParam);
    // End:0xA5
    if(AnimatedParams != none)
    {
        // End:0xA5
        if(AnimatedParams.CameraSocketName == 'None')
        {
            AnimatedParams.CameraSocketName = 'PlayerCamera';
        }
    }
    //return;    
}

simulated function UpdateViewTarget()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];

    GetCameraAttributes(Rig.Location, Rig.Rotation, Rig.FOV);
    Rig.Orbit = RotatorToSpherical(Rig.Rotation);
    //return;    
}

simulated function AllowLookAround()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetHeadLoc()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CameraMgr.Targeting.Current.eyeLoc + vect(0.0000000, 0.0000000, 8.0000000);
    //return ReturnValue;    
}

simulated function CollideViewTargets()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function FinalConstraints()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool collided[9437185];

    false
    //return;    
}

simulated function ShouldOrbitOverrideRotation()
{
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function CheckForTeleport()
{
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x043A0000-0x00000000*/ private float out_YL[25165825], out_YPos;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    out_YPos = HUD.Canvas.CurY;
    //return;    
}
