class SkelControlTrail extends SkelControlBase
    hidecategories(Object,Object);

var(*) /*0x4D6C0000-0x00000000*/ private int ChainLength[65537];
var(*) /*0x4D6C0000-0x00000000*/ private byte ChainBoneAxis[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bInvertChainBoneAxis[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bLimitStretch[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool bActorSpaceFakeVel[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bHadValidStrength;
var(*) /*0x4D6C0000-0x00000000*/ private float TrailRelaxation[65537];
var(*) /*0x4D6C0000-0x00000000*/ private float StretchLimit[65537];
var(*) /*0x4D6C0000-0x00000000*/ private @NULL FakeVelocity[65537];
var(*) /*0x35EA0000-0x00000000*/ private float ThisTimstep;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TrailBoneLocations[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL OldLocalToWorld[536870913];

defaultproperties
{
    ChainLength=2
    ChainBoneAxis=EAxis.AXIS_X
    TrailRelaxation=10.0000000
}