class AnimNotify_Trails extends AnimNotify
    editinlinenew
    collapsecategories
    hidecategories(Object);

struct native TrailSocketSamplePoint
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Position;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Velocity;

    structdefaultproperties
    {
        Position=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Velocity=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native TrailSamplePoint
{
    var(*) /*0x35EA0000-0x00000000*/ private float RelativeTime;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL FirstEdgeSample;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ControlPointSample;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SecondEdgeSample;

    structdefaultproperties
    {
        RelativeTime=0.0000000
        FirstEdgeSample=(Position=(X=0.0000000,Y=0.0000000,Z=0.0000000),Velocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
        ControlPointSample=(Position=(X=0.0000000,Y=0.0000000,Z=0.0000000),Velocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
        SecondEdgeSample=(Position=(X=0.0000000,Y=0.0000000,Z=0.0000000),Velocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
    }
};

struct native TrailSample
{
    var(*) /*0x35EA0000-0x00000000*/ private float RelativeTime;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL FirstEdgeSample;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ControlPointSample;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SecondEdgeSample;

    structdefaultproperties
    {
        RelativeTime=0.0000000
        FirstEdgeSample=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ControlPointSample=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        SecondEdgeSample=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(*) /*0x4D6F0000-0x00000000*/ private @NULL PSTemplate[65537];
var(*) /*0x4D6F0000-0x00000000*/ private const @NULL SampledSkeletalMesh[65537];
var(*) /*0x4D6F0000-0x00000000*/ private bool bIsExtremeContent[65537];
var(*) /*0x02F50000-0x00000000*/ private bool bPreview[65537];
var(*) /*0x02F50000-0x00000000*/ private bool bPreviewForceExplicit[65537];
var(*) /*0x02F50000-0x00000000*/ private bool bSkipIfOwnerIsHidden[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bResampleRequired;
var(*) /*0x4D6F0000-0x00000000*/ private name FirstEdgeSocketName[65537];
var(*) /*0x4D6F0000-0x00000000*/ private name ControlPointSocketName[65537];
var(*) /*0x4D6F0000-0x00000000*/ private name SecondEdgeSocketName[65537];
var(*) /*0x35EA0000-0x00000000*/ private float LastStartTime;
var(*) /*0x35EA0000-0x00000000*/ private float EndTime;
var(*) /*0x35EA0000-0x00000000*/ private transient float SampleTimeStep;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array TrailSampleData;
var(*) /*0x4D6F0000-0x00000000*/ private float SamplesPerSecond[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TrailSampledData;
var(*) /*0x35EA0000-0x00000000*/ private float CurrentTime[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float TimeStep[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AnimNodeSeq[536870913];

// Export UAnimNotify_Trails::execGetNumSteps(FFrame&, void* const)
native function GetNumSteps()
{
    local /*0x35EA0000-0x00000000*/ private int InLastTrailIndex[8388609], ReturnValue;


}

defaultproperties
{
    bSkipIfOwnerIsHidden=true
    FirstEdgeSocketName="EndControl"
    ControlPointSocketName="MidControl"
    SecondEdgeSocketName="StartControl"
    SamplesPerSecond=60.0000000
}