class SoundNodeEnveloper extends SoundNode
    editinlinenew
    hidecategories(Object,Object);

var(*) /*0x2FFA0000-0x00000000*/ private float LoopStart[65537];
var(*) /*0x2FFA0000-0x00000000*/ private float LoopEnd[65537];
var(*) /*0x2FFA0000-0x00000000*/ private float DurationAfterLoop[65537];
var(*) /*0x2FFA0000-0x00000000*/ private int LoopCount[65537];
var(*) /*0x2FFA0000-0x00000000*/ private bool bLoopIndefinitely[65537];
var(*) /*0x2FFA0000-0x00000000*/ private bool bLoop[65537];
var(*) /*0x204D0000-0x00000400*/ private export @NULL VolumeInterpCurve[589825];
var(*) /*0x204D0000-0x00000400*/ private export @NULL PitchInterpCurve[589825];

defaultproperties
{
    // Reference: DistributionFloatConstantCurve'Default__SoundNodeEnveloper.VolumeInterpCurve'
    begin object name=VolumeInterpCurve class=Class'DistributionFloatConstantCurve'
    end object
    VolumeInterpCurve=VolumeInterpCurve
    // Reference: DistributionFloatConstantCurve'Default__SoundNodeEnveloper.PitchInterpCurve'
    begin object name=PitchInterpCurve class=Class'DistributionFloatConstantCurve'
    end object
    PitchInterpCurve=PitchInterpCurve
}