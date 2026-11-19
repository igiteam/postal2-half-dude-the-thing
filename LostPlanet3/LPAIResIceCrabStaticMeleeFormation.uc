class LPAIResIceCrabStaticMeleeFormation extends SPAIResGroupLocation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const IceCrabRadius = 490;
const MaxLocations = 8;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Radius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PawnRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxAttackers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOptimize[131073];

// Export ULPAIResIceCrabStaticMeleeFormation::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export ULPAIResIceCrabStaticMeleeFormation::execAssignSortKeys(FFrame&, void* const)
protected native function AssignSortKeys()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];


}

function Init()
{
    local /*0x97E50000-0x00000000*/ private float MyActorRadius, MyActorHeight;

    PawnRadius = 490.0000000;
    Attributes.Radius = PawnRadius;
    Attributes.Height = PawnRadius;
    Attributes.LineOfSightRadius = PawnRadius * 0.5000000;
    Outer.GetUserRadiusAndHeight(Outer.ResourceManagerOuter, MyActorRadius, MyActorHeight);
    Attributes.MoveThreshold = MyActorRadius;
    // End:0x144
    if(Attributes.MoveThreshold < float(200))
    {
        Attributes.MoveThreshold = 200.0000000;
    }
    Radius += MyActorRadius;
    // End:0x171
    if(!bOptimize)
    {
        AddLocations();
    }
    super.Init();
    //return;    
}

function GetResourceExtents()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutLocation[25165825];
    local /*0x97E50000-0x00000000*/ private float OutRadius[25165825];

    // End:0x7C
    if(bOptimize && Resource.Length == 0)
    {
        OutLocation = Outer.GetOuterLocation();
        OutRadius = Radius + Attributes.Radius;        
    }
    else
    {
        super(SPAIResourceGroup).GetResourceExtents(OutLocation, OutRadius);
    }
    //return;    
}

event Update()
{
    super.Update();
    // End:0x5A
    if(((bOptimize && Resource.Length > 0) && NumUsers() == 0) && (GetLastHadUserTime()) > float(30))
    {
        RemoveAllResources();
    }
    //return;    
}

function ShutDown()
{
    super.ShutDown();
    RemoveAllResources();
    //return;    
}

event AddLocations()
{
    local /*0x97E50000-0x00000000*/ private float Angle, AngleStep;
    local /*0x97E50000-0x00000000*/ private @NULL RelativeLocation;

    RemoveAllResources();
    AngleStep = (2.0000000 * 3.1415930) / float(8);
    Angle = 0.0000000;
    J0x35:

    // End:0x108 [Loop If]
    if(Angle < (float(2) * 3.1415930))
    {
        RelativeLocation.X = Cos(Angle);
        RelativeLocation.Y = Sin(Angle);
        RelativeLocation.Z = 0.0000000;
        RelativeLocation = RelativeLocation * Radius;
        CreateResource(RelativeLocation);
        Angle += AngleStep;
        // [Loop Continue]
        goto J0x35;
    }
    //return;    
}

defaultproperties
{
    bOptimize=true
    Attributes=(bRevokeAccessOnLocationChange=true,TestForLineOfSight=true,LineOfSightFrequency=1.0000000)
    GeneratedClass=Class'LPAIResLocation'
    UniqueName="IceCrabMelee"
}