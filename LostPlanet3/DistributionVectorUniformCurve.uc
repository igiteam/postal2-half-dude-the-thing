class DistributionVectorUniformCurve extends DistributionVector
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

var(*) /*0x1D8A0000-0x00000000*/ private editfixedsize @NULL ConstantCurve[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bLockAxes1;
var(*) /*0x35EA0000-0x00000000*/ private bool bLockAxes2;
var(*) /*0x1D8A0000-0x00000000*/ private bool bUseExtremes[65537];
var(*) /*0x1D8A0000-0x00000000*/ private byte LockedAxes[65538];
var(*) /*0x1D8A0000-0x00000000*/ private byte MirrorFlags[65539];
var(*) /*0x1D8A0000-0x00000000*/ private byte InterpChannel[65537];

defaultproperties
{
    MirrorFlags[0]=EDistributionVectorMirrorFlags.EDVMF_Different
    MirrorFlags[1]=EDistributionVectorMirrorFlags.EDVMF_Different
    MirrorFlags[2]=EDistributionVectorMirrorFlags.EDVMF_Different
}