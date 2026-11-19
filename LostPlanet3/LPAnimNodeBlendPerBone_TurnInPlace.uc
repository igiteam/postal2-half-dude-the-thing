class LPAnimNodeBlendPerBone_TurnInPlace extends LPAnimNodeBlendPerBone
    hidecategories(Object,Object,Object,Object);

struct native TurnInPlaceFullBodyAnimZone
{
    var(0.25_Pct) /*0xCF780000-0x00000000*/ private int MinYaw[65537];
    var(0.25_Pct) /*0xCF780000-0x00000000*/ private int MaxYaw[65537];
    var(0.25_Pct) /*0xCF780000-0x00000000*/ private float BlendTime[65537];
    var(0.25_Pct) /*0xCF780000-0x00000000*/ private bool bUseLocalSpaceBlend[65537];

    structdefaultproperties
    {
        MinYaw=0
        MaxYaw=0
        BlendTime=0.0000000
        bUseLocalSpaceBlend=false
    }
};

var(0.25_Pct) /*0x7BA80000-0x00000000*/ private editfixedsize array FullBodyAnimZones[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TurnInPlaceNode[536870913];
