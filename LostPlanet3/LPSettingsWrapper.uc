class LPSettingsWrapper extends Subsystem
    transient;

struct native Resolution
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Width;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Height;

    structdefaultproperties
    {
        Width=0
        Height=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Resolutions[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentResolution[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFullScreen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVsync[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMotionBlur[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDepthOfField[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAmbientOcclusion[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBloom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLightShafts[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDynamicShadows[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MultiSamples[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TextureLevel[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WorldLevel[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ShadowLevel[536870913];

// Export ULPSettingsWrapper::execGetSupportedResoultions(FFrame&, void* const)
native function GetSupportedResoultions()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array OutResolutions[25165825];


}

// Export ULPSettingsWrapper::execApplySettings(FFrame&, void* const)
native function ApplySettings();

// Export ULPSettingsWrapper::execInitFromGlobalSettings(FFrame&, void* const)
native function InitFromGlobalSettings();

// Export ULPSettingsWrapper::execPushSettings(FFrame&, void* const)
native function PushSettings();

// Export ULPSettingsWrapper::execRestoreSettings(FFrame&, void* const)
native function RestoreSettings();

// Export ULPSettingsWrapper::execSetToDefaults(FFrame&, void* const)
native function SetToDefaults();
