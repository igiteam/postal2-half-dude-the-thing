class TerrainLayerSetup extends Object
    collapsecategories
    hidecategories(Object);

struct FilterLimit
{
    var(*) /*0x22CC0000-0x00000000*/ private bool Enabled[65537];
    var(*) /*0x22CC0000-0x00000000*/ private float Base[65537];
    var(*) /*0x22CC0000-0x00000000*/ private float NoiseScale[65537];
    var(*) /*0x22CC0000-0x00000000*/ private float NoiseAmount[65537];

    structdefaultproperties
    {
        Enabled=false
        Base=0.0000000
        NoiseScale=0.0000000
        NoiseAmount=0.0000000
    }
};

struct TerrainFilteredMaterial
{
    var(*) /*0x4BD90000-0x00000000*/ private bool UseNoise[65537];
    var(*) /*0x4BD90000-0x00000000*/ private float NoiseScale[65537];
    var(*) /*0x4BD90000-0x00000000*/ private float NoisePercent[65537];
    var(*) /*0x4BD90000-0x00000000*/ private @NULL MinHeight[65537];
    var(*) /*0x4BD90000-0x00000000*/ private @NULL MaxHeight[65537];
    var(*) /*0x4BD90000-0x00000000*/ private @NULL MinSlope[65537];
    var(*) /*0x4BD90000-0x00000000*/ private @NULL MaxSlope[65537];
    var(*) /*0x4BD90000-0x00000000*/ private float Alpha[65537];
    var(*) /*0x4BD90000-0x00000000*/ private @NULL Material[65537];

    structdefaultproperties
    {
        UseNoise=false
        NoiseScale=0.0000000
        NoisePercent=0.0000000
        MinHeight=(Enabled=false,Base=0.0000000,NoiseScale=0.0000000,NoiseAmount=0.0000000)
        MaxHeight=(Enabled=false,Base=0.0000000,NoiseScale=0.0000000,NoiseAmount=0.0000000)
        MinSlope=(Enabled=false,Base=0.0000000,NoiseScale=0.0000000,NoiseAmount=0.0000000)
        MaxSlope=(Enabled=false,Base=0.0000000,NoiseScale=0.0000000,NoiseAmount=0.0000000)
        Alpha=1.0000000
        Material=none
    }
};

var(*) /*0x4BDD0000-0x00000000*/ private editfixedsize array Materials[196609];

simulated function PostBeginPlay()
{
    //return;    
}
