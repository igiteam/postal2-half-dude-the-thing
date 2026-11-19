class SoundClass extends Object
    dontsortcategories(SoundClass)
    hidecategories(Object);

enum ESoundClassProfileSetting
{
    ESCPS_None,                     // 0
    ESCPS_Fx,                       // 1
    ESCPS_Dialog,                   // 2
    ESCPS_Music,                    // 3
    ESCPS_Movie,                    // 4
    ESCPS_MAX                       // 5
};

struct native export SoundClassEditorData
{
    var(*) /*0x35EA0000-0x00000000*/ private int NodePosX[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private int NodePosY[268566529];
};

struct native SoundClassProperties
{
    var(*) /*0x483F0000-0x00000000*/ private float Volume[65537];
    var(*) /*0x483F0000-0x00000000*/ private float Pitch[65537];
    var(*) /*0x483F0000-0x00000000*/ private float StereoBleed[65537];
    var(*) /*0x483F0000-0x00000000*/ private float LFEBleed[65537];
    var(*) /*0x483F0000-0x00000000*/ private float VoiceCenterChannelVolume[65537];
    var(*) /*0x483F0000-0x00000000*/ private float RadioFilterVolume[65537];
    var(*) /*0x483F0000-0x00000000*/ private float RadioFilterVolumeThreshold[65537];
    var(*) /*0x483F0000-0x00000000*/ private bool bApplyEffects[65537];
    var(*) /*0x483F0000-0x00000000*/ private bool bAlwaysPlay[65537];
    var(*) /*0x483F0000-0x00000000*/ private bool bIsUISound[65537];
    var(*) /*0x483F0000-0x00000000*/ private bool bIsMusic[65537];
    var(*) /*0x483F0000-0x00000000*/ private bool bReverb[65537];
    var(*) /*0x483F0000-0x00000000*/ private bool bCenterChannelOnly[65537];
    var(*) /*0x483F0000-0x00000000*/ private bool bApplyAmbientVolumes[65537];
    var(*) /*0x483F0000-0x00000000*/ private byte ProfileSettingCategory[65537];

    structdefaultproperties
    {
        Volume=1.0000000
        Pitch=1.0000000
        StereoBleed=0.2500000
        LFEBleed=0.5000000
        VoiceCenterChannelVolume=0.0000000
        RadioFilterVolume=0.0000000
        RadioFilterVolumeThreshold=0.0000000
        bApplyEffects=false
        bAlwaysPlay=false
        bIsUISound=false
        bIsMusic=false
        bReverb=true
        bCenterChannelOnly=false
        bApplyAmbientVolumes=false
        ProfileSettingCategory=ESoundClassProfileSetting.ESCPS_Fx
    }
};

var(*) /*0x48380000-0x00000000*/ private @NULL Properties[65537];
var(*) /*0x48380000-0x00000000*/ private editfixedsize array ChildClassNames[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsChild;
var(*) /*0x35EA0000-0x00000000*/ private int MenuID;
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} EditorData[268566529];

defaultproperties
{
    Properties=(Volume=1.0000000,Pitch=1.0000000,StereoBleed=0.2500000,LFEBleed=0.5000000,VoiceCenterChannelVolume=0.0000000,RadioFilterVolume=0.0000000,RadioFilterVolumeThreshold=0.0000000,bApplyEffects=false,bAlwaysPlay=false,bIsUISound=false,bIsMusic=false,bReverb=true,bCenterChannelOnly=false,bApplyAmbientVolumes=false,ProfileSettingCategory=ESoundClassProfileSetting.ESCPS_Fx)
}