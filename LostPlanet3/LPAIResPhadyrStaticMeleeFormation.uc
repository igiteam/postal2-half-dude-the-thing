class LPAIResPhadyrStaticMeleeFormation extends SPAIResGroupLocation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const PhadyrRadius = 45;
const MaxLocations = 32;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Radius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PawnRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxAttackers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOptimize[131073];

function Init()
{
    local /*0x97E50000-0x00000000*/ private float MyActorRadius, MyActorHeight;

    PawnRadius = 45.0000000;
    Attributes.Radius = PawnRadius;
    Attributes.Height = PawnRadius;
    Outer.GetUserRadiusAndHeight(Outer.ResourceManagerOuter, MyActorRadius, MyActorHeight);
    Attributes.MoveThreshold = MyActorRadius;
    // End:0x117
    if(Attributes.MoveThreshold < float(200))
    {
        Attributes.MoveThreshold = 200.0000000;
    }
    Radius += MyActorRadius;
    // End:0x144
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

function AddLocations()
{
    local /*0x97E50000-0x00000000*/ private float Angle, AngleStep;
    local /*0x97E50000-0x00000000*/ private @NULL RelativeLocation;

    RemoveAllResources();
    AngleStep = (2.0000000 * 3.1415930) / float(32);
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
    Attributes=(bRevokeAccessOnLocationChange=true)
    GeneratedClass=Class'LPAIResLocation'
    UniqueName="PhadyrMelee"
}