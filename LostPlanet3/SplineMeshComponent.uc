class SplineMeshComponent extends StaticMeshComponent
    editinlinenew
    hidecategories(Object);

struct native SplineMeshParams
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL StartPos;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL StartTangent;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL StartScale;
    var(*) /*0x35EA0000-0x00000000*/ private float StartRoll;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL StartOffset;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL EndPos;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL EndTangent;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL EndScale;
    var(*) /*0x35EA0000-0x00000000*/ private float EndRoll;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL EndOffset;

    structdefaultproperties
    {
        StartPos=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        StartTangent=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        StartScale=(X=0.0000000,Y=0.0000000)
        StartRoll=0.0000000
        StartOffset=(X=0.0000000,Y=0.0000000)
        EndPos=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        EndTangent=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        EndScale=(X=0.0000000,Y=0.0000000)
        EndRoll=0.0000000
        EndOffset=(X=0.0000000,Y=0.0000000)
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL SplineParams;
var(*) /*0x35EA0000-0x00000000*/ private @NULL SplineXDir;
var(*) /*0x35EA0000-0x00000000*/ private bool bSmoothInterpRollScale;
