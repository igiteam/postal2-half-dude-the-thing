class SPVectorFieldSamplerComponent extends ActorComponent
    editinlinenew
    collapsecategories
    dontsortcategories(All)
    hidecategories(Object);

struct native SPVectorFieldSamplerInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private int AttachIndex[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LocalToWorld[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private array Data[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private int DataSizeX[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private int DataSizeY[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private int DataSizeZ[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL NormalizedExtent[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private float NormalizedScale[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private float NormalizedLength[805437441];
    var(*) /*0x498D0000-0x00000000*/ private int NumSamplesX[65537];
    var(*) /*0x498D0000-0x00000000*/ private int NumSamplesY[65537];
    var(*) /*0x498D0000-0x00000000*/ private int NumSamplesZ[65537];
    var(*) /*0x498D0000-0x00000000*/ private float Opacity[65537];
    var(*) /*0x498D0000-0x00000000*/ private float OpacityGrid[65537];
    var(*) /*0x498D0000-0x00000000*/ private int NumSegments[65537];
    var(*) /*0x498D0000-0x00000000*/ private @NULL TempDir[65537];

    structdefaultproperties
    {
        NumSamplesX=0
        NumSamplesY=8
        NumSamplesZ=1
        Opacity=0.5000000
        OpacityGrid=0.2500000
        NumSegments=4
        TempDir=(X=0.0000000,Y=0.0000000,Z=1.0000000)
    }
};

var(*) /*0x498B0000-0x00000000*/ private bool bRealtime[65537];
var(*) /*0x498B0000-0x00000000*/ private @NULL VectorFieldSampler[65537];
