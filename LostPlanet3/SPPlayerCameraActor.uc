class SPPlayerCameraActor extends SPCameraActor
    hidecategories(AnimDependency,Navigation);

var(__Filter1__Delegate) /*0x05AD0000-0x00000000*/ private bool bKeepPostProcessOverride[65537];
var(__Filter1__Delegate) /*0x05AD0000-0x00000000*/ private bool bCamOverridePostProcess_Overlay[65537];

// Export USPPlayerCameraActor::execGetInterpAction(FFrame&, void* const)
native simulated function GetInterpAction()
{
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPPlayerCameraActor::execGetValidLocalPlayers(FFrame&, void* const)
native simulated function GetValidLocalPlayers()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize array OutLPs[25165825];


}

// Export USPPlayerCameraActor::execUpdatePlayerControllers(FFrame&, void* const)
native simulated function UpdatePlayerControllers();

// Export USPPlayerCameraActor::execSetPostProcessSettingsOverride(FFrame&, void* const)
native simulated function SetPostProcessSettingsOverride()
{
    local /*0x043A0000-0x00000000*/ private bool bEnable[8388609], bOverlay;


}

// Export USPPlayerCameraActor::execInterpolationStarted(FFrame&, void* const)
native simulated event InterpolationStarted()
{
    local /*0x043A0000-0x00000000*/ private @NULL InterpAction[8388609], GroupInst;


}

// Export USPPlayerCameraActor::execInterpolationFinished(FFrame&, void* const)
native simulated event InterpolationFinished()
{
    local /*0x043A0000-0x00000000*/ private @NULL InterpAction[8388609];


}

// Export USPPlayerCameraActor::execInterpolationChanged(FFrame&, void* const)
native simulated event InterpolationChanged()
{
    local /*0x043A0000-0x00000000*/ private @NULL InterpAction[8388609];


}

// Export USPPlayerCameraActor::execInterpPropertyChanged(FFrame&, void* const)
native simulated event InterpPropertyChanged()
{
    local /*0x043A0000-0x00000000*/ private name TrackPropertyName[25165825];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function OnToggle()
{
    local /*0x043A0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x043A0000-0x00000000*/ private bool bEnableOverride;

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnableOverride = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnableOverride = false;            
        }
        else
        {
            // End:0xF2
            if(Action.InputLinks[2].bHasImpulse)
            {
                // End:0xE6
                if(CamOverridePostProcessAlpha > 0.0000000)
                {
                    bEnableOverride = false;                    
                }
                else
                {
                    bEnableOverride = true;
                }
            }
        }
    }
    SetPostProcessSettingsOverride(bEnableOverride, bCamOverridePostProcess_Overlay);
    //return;    
}

defaultproperties
{
    ParentFOVBoneName="None"
}