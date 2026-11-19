class SoundMode extends Object
    dontsortcategories(SoundMode)
    hidecategories(Object);

struct native AudioEQEffect
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL RootTime[805306369];
    var(*) /*0x29360000-0x00000000*/ private float HFFrequency[65537];
    var(*) /*0x29360000-0x00000000*/ private float HFGain[65537];
    var(*) /*0x04CC0000-0x00000000*/ private float MFCutoffFrequency[65537];
    var(*) /*0x04CC0000-0x00000000*/ private float MFBandwidth[65537];
    var(*) /*0x04CC0000-0x00000000*/ private float MFGain[65537];
    var(*) /*0x30080000-0x00000000*/ private float LFFrequency[65537];
    var(*) /*0x30080000-0x00000000*/ private float LFGain[65537];

    structdefaultproperties
    {
        HFFrequency=0.0000000
        HFGain=0.0000000
        MFCutoffFrequency=0.0000000
        MFBandwidth=0.0000000
        MFGain=0.0000000
        LFFrequency=0.0000000
        LFGain=0.0000000
    }
};

struct native SoundClassAdjuster
{
    var(*) /*0x48390000-0x00000000*/ private byte SoundClassName[536936449];
    var(*) /*0x48390000-0x00000000*/ private const name SoundClass[65537];
    var(*) /*0x48390000-0x00000000*/ private float VolumeAdjuster[65537];
    var(*) /*0x48390000-0x00000000*/ private float PitchAdjuster[65537];
    var(*) /*0x48390000-0x00000000*/ private bool bApplyToChildren[65537];
    var(*) /*0x48390000-0x00000000*/ private float VoiceCenterChannelVolumeAdjuster[65537];

    structdefaultproperties
    {
        SoundClassName=ESoundClassName.Master
        SoundClass="Master"
        VolumeAdjuster=1.0000000
        PitchAdjuster=1.0000000
        bApplyToChildren=false
        VoiceCenterChannelVolumeAdjuster=1.0000000
    }
};

var(*) /*0x20FE0000-0x00000000*/ private bool bApplyEQ[65537];
var(*) /*0x20FE0000-0x00000000*/ private @NULL EQSettings[65537];
var(*) /*0x483C0000-0x00000000*/ private editfixedsize array SoundClassEffects[65537];
var(*) /*0x48520000-0x00000000*/ private float InitialDelay[65537];
var(*) /*0x48520000-0x00000000*/ private float FadeInTime[65537];
var(*) /*0x48520000-0x00000000*/ private float Duration[65537];
var(*) /*0x48520000-0x00000000*/ private float FadeOutTime[65537];

defaultproperties
{
    EQSettings=(HFFrequency=2000.0000000,HFGain=1.0000000,MFCutoffFrequency=1000.0000000,MFBandwidth=1.0000000,MFGain=1.0000000,LFFrequency=600.0000000,LFGain=1.0000000)
    FadeInTime=0.2000000
    Duration=-1.0000000
    FadeOutTime=0.2000000
}