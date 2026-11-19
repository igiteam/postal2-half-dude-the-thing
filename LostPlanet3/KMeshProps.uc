class KMeshProps extends Object
    noexport;

struct KSphereElem
{
    var(*) /*0x2D6F0000-0x00000000*/ private const @NULL TM[65537];
    var(*) /*0x2D6F0000-0x00000000*/ private const float Radius[65537];
    var(*) /*0x2D6F0000-0x00000000*/ private bool bNoRBCollision[65537];
    var(*) /*0x2D6F0000-0x00000000*/ private bool bPerPolyShape[65537];

    structdefaultproperties
    {
        TM=(XPlane=(W=0.0000000,X=1.0000000,Y=0.0000000,Z=0.0000000),YPlane=(W=0.0000000,X=0.0000000,Y=1.0000000,Z=0.0000000),ZPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=1.0000000),WPlane=(W=1.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000))
        Radius=1.0000000
        bNoRBCollision=false
        bPerPolyShape=false
    }
};

struct KBoxElem
{
    var(*) /*0x2D230000-0x00000000*/ private const @NULL TM[65537];
    var(*) /*0x2D230000-0x00000000*/ private const float X[65537];
    var(*) /*0x2D230000-0x00000000*/ private const float Y[65537];
    var(*) /*0x2D230000-0x00000000*/ private const float Z[65537];
    var(*) /*0x2D230000-0x00000000*/ private bool bNoRBCollision[65537];
    var(*) /*0x2D230000-0x00000000*/ private bool bPerPolyShape[65537];

    structdefaultproperties
    {
        TM=(XPlane=(W=0.0000000,X=1.0000000,Y=0.0000000,Z=0.0000000),YPlane=(W=0.0000000,X=0.0000000,Y=1.0000000,Z=0.0000000),ZPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=1.0000000),WPlane=(W=1.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000))
        X=1.0000000
        Y=1.0000000
        Z=1.0000000
        bNoRBCollision=false
        bPerPolyShape=false
    }
};

struct KSphylElem
{
    var(*) /*0x2D700000-0x00000000*/ private const @NULL TM[65537];
    var(*) /*0x2D700000-0x00000000*/ private const float Radius[65537];
    var(*) /*0x2D700000-0x00000000*/ private const float Length[65537];
    var(*) /*0x2D700000-0x00000000*/ private bool bNoRBCollision[65537];
    var(*) /*0x2D700000-0x00000000*/ private bool bPerPolyShape[65537];

    structdefaultproperties
    {
        TM=(XPlane=(W=0.0000000,X=1.0000000,Y=0.0000000,Z=0.0000000),YPlane=(W=0.0000000,X=0.0000000,Y=1.0000000,Z=0.0000000),ZPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=1.0000000),WPlane=(W=1.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000))
        Radius=1.0000000
        Length=1.0000000
        bNoRBCollision=false
        bPerPolyShape=false
    }
};

struct KConvexElem
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array VertexData;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PermutedVertexData;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FaceTriData;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array EdgeDirections;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FaceNormalDirections;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FacePlaneData;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ElemBox;

    structdefaultproperties
    {
        VertexData=none
        PermutedVertexData=none
        FaceTriData=none
        EdgeDirections=none
        FaceNormalDirections=none
        FacePlaneData=none
        ElemBox=(Min=(X=0.0000000,Y=0.0000000,Z=0.0000000),Max=(X=0.0000000,Y=0.0000000,Z=0.0000000),IsValid=0)
    }
};

struct KAggregateGeom
{
    var(*) /*0x2D1F0000-0x00000000*/ private editfixedsize array SphereElems[4259841];
    var(*) /*0x2D1F0000-0x00000000*/ private editfixedsize array BoxElems[4259841];
    var(*) /*0x2D1F0000-0x00000000*/ private editfixedsize array SphylElems[4259841];
    var(*) /*0x2D1F0000-0x00000000*/ private editfixedsize array ConvexElems[4259841];
    var(*) /*0x35EA0000-0x00000100*/ private globalconfig @NULL RenderInfo[268435457];
    var(*) /*0x2D1F0000-0x00000000*/ private bool bSkipCloseAndParallelChecks[65537];

    structdefaultproperties
    {
        SphereElems=none
        BoxElems=none
        SphylElems=none
        ConvexElems=none
        bSkipCloseAndParallelChecks=false
    }
};

var(*) /*0x2D6E0000-0x00000000*/ private @NULL COMNudge[65537];
var(*) /*0x2D6E0000-0x00000000*/ private editfixedsize @NULL AggGeom[65537];
