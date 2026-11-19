class SoundNodeOscillator extends SoundNode
    editinlinenew
    hidecategories(Object,Object);

var(*) /*0x38F40000-0x00000000*/ private bool bModulateVolume[65537];
var(*) /*0x38F40000-0x00000000*/ private bool bModulatePitch[65537];
var(*) /*0x38F40000-0x00000000*/ private float AmplitudeMin[65537];
var(*) /*0x38F40000-0x00000000*/ private float AmplitudeMax[65537];
var(*) /*0x38F40000-0x00000000*/ private float FrequencyMin[65537];
var(*) /*0x38F40000-0x00000000*/ private float FrequencyMax[65537];
var(*) /*0x38F40000-0x00000000*/ private float OffsetMin[65537];
var(*) /*0x38F40000-0x00000000*/ private float OffsetMax[65537];
var(*) /*0x38F40000-0x00000000*/ private float CenterMin[65537];
var(*) /*0x38F40000-0x00000000*/ private float CenterMax[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export transient @NULL Amplitude;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export transient @NULL Frequency;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export transient @NULL Offset;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export transient @NULL Center;
