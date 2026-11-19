class InterpGroupCamera extends InterpGroup
    collapsecategories
    hidecategories(Object,Object);

struct native CameraPreviewInfo
{
    var(*) /*0x10C60000-0x00000000*/ private class PawnClass[65537];
    var(*) /*0x10C60000-0x00000000*/ private editfixedsize array PreviewAnimSets[65537];
    var(*) /*0x10C60000-0x00000000*/ private name AnimSeqName[65537];
    var(*) /*0x35EA0000-0x00000000*/ private const @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private const @NULL Rotation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PawnInst[536870913];

    structdefaultproperties
    {
        PawnClass=none
        PreviewAnimSets=none
        AnimSeqName="None"
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        PawnInst=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL CameraAnimInst[536870913];
var(*) /*0x2BC90000-0x00000000*/ private editfixedsize @NULL Target[65537];
var(*) /*0x2BC90000-0x00000000*/ private float CompressTolerance[65537];

defaultproperties
{
    CompressTolerance=5.0000000
}