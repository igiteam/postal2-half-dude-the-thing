class LPPlayerCamera extends SPPlayerCameraManager
    transient
    hidecategories(AnimDependency,Navigation);

function InitializeFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC[8388609], LPPC;

    super(Camera).InitializeFor(PC);
    LPPC = LPPlayerController(PC);
    // End:0x69
    if(LPPC != none)
    {
        DefaultCameraParam = LPPC.ThirdPersonAimCamParams;        
    }
    else
    {
        DefaultCameraParam = new (self) Class'LPCameraModeAimControlThirdPersonParam';
    }
    //return;    
}

function AddExistingCameraLensEffect()
{
    local /*0x97E50000-0x00000000*/ private @NULL LensEffectEmitter[8388609], CamLoc, CamRot;

    // End:0x9C
    if(LensEffectEmitter != none)
    {
        GetCameraViewPoint(CamLoc, CamRot);
        LensEffectEmitter.UpdateLocation(CamLoc, CamRot, GetFOVAngle());
        LensEffectEmitter.RegisterCamera(self);
        CameraLensEffects.AddItem(LensEffectEmitter);        
    }
    //return;    
}

defaultproperties
{
    CameraTypes=/* Array type was not detected. */
}