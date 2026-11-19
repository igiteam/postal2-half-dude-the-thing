class SplineAudioComponent extends AudioComponent
    editinlinenew
    collapsecategories
    hidecategories(Object,ActorComponent,Object,ActorComponent,Object,ActorComponent);

struct InterpPointOnSpline
{
    var(*) /*0x2BE20000-0x00000000*/ private @NULL Position[65537];
    var(*) /*0x2BE20000-0x00000000*/ private float InVal[65537];
    var(*) /*0x2BE20000-0x00000000*/ private float Length[65537];

    structdefaultproperties
    {
        Position=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        InVal=0.0000000
        Length=0.0000000
    }
};

var(*) /*0x492A0000-0x00000000*/ private float ListenerScopeRadius[65537];
var(*) /*0x35EA0000-0x00000000*/ private int ClosestPointOnSplineIndex;
var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array Points;
