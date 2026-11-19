class SpeedTree extends Object;

var(*) /*0x35EA0000-0x00000000*/ private bool bLegacySpeedTree[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SRH[268566529];
var(*) /*0x2EB00000-0x00000000*/ private float LeafStaticShadowOpacity[65537];
var(*) /*0x30850000-0x00000000*/ private @NULL Branch1Material[65537];
var(*) /*0x30850000-0x00000000*/ private @NULL Branch2Material[65537];
var(*) /*0x30850000-0x00000000*/ private @NULL FrondMaterial[65537];
var(*) /*0x30850000-0x00000000*/ private @NULL LeafCardMaterial[65537];
var(*) /*0x30850000-0x00000000*/ private @NULL LeafMeshMaterial[65537];
var(*) /*0x30850000-0x00000000*/ private @NULL BillboardMaterial[65537];
var(*) /*0x50CF0000-0x00000000*/ private float WindStrength[65537];
var(*) /*0x50CF0000-0x00000000*/ private @NULL WindDirection[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightingGuid[131073];

defaultproperties
{
    LeafStaticShadowOpacity=0.5000000
    WindStrength=0.2000000
    WindDirection=(X=1.0000000,Y=0.0000000,Z=0.0000000)
}