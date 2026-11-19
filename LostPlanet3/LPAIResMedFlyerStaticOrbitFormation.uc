class LPAIResMedFlyerStaticOrbitFormation extends SPAIResGroupLocation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const MedFlyerRadius = 45;
const MaxLocations = 8;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Radius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PawnRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxAttackers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HeightOffGround;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RangeOfHeightOffGround;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOptimize[131073];

function Init()
{
    super.Init();
    //return;    
}

function SetFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private float MyActorRadius, MyActorHeight;

    super(SPAIResourceGroup).SetFromTuneData();
    PawnRadius = 45.0000000;
    Attributes.Radius = PawnRadius;
    Attributes.Height = PawnRadius;
    Outer.GetUserRadiusAndHeight(Outer.ResourceManagerOuter, MyActorRadius, MyActorHeight);
    Attributes.MoveThreshold = MyActorRadius;
    // End:0x121
    if(Attributes.MoveThreshold < float(200))
    {
        Attributes.MoveThreshold = 200.0000000;
    }
    // End:0x13A
    if(!bOptimize)
    {
        AddLocations();
    }
    //return;    
}

function GetResourceExtents()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutLocation[25165825];
    local /*0x97E50000-0x00000000*/ private float OutRadius[25165825];

    // End:0x6D
    if(Resource.Length == 0)
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

function ShutDown()
{
    super.ShutDown();
    RemoveAllResources();
    //return;    
}

event IsAccessPossible()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(Resource.Length == 0)
    {
        AddLocations();
    }
    return super(SPAIResourceGroup).IsAccessPossible(Requester);
    //return ReturnValue;    
}

function AddLocations()
{
    local /*0x97E50000-0x00000000*/ private float Angle, AngleStep;
    local /*0x97E50000-0x00000000*/ private @NULL RelativeLocation;

    RemoveAllResources();
    AngleStep = (2.0000000 * 3.1415930) / float(8);
    Angle = 0.0000000;
    J0x35:

    // End:0x12E [Loop If]
    if(Angle < (float(2) * 3.1415930))
    {
        RelativeLocation.X = Cos(Angle);
        RelativeLocation.Y = Sin(Angle);
        RelativeLocation.Z = 0.0000000;
        RelativeLocation = RelativeLocation * Radius;
        RelativeLocation.Z = HeightOffGround;
        CreateResource(RelativeLocation);
        Angle += AngleStep;
        // [Loop Continue]
        goto J0x35;
    }
    //return;    
}

protected event CreateResource()
{
    local /*0x97E50000-0x00000000*/ private @NULL RelativeLocation[8388609], ReturnValue, NewAIResLocation;

    NewAIResLocation = SPAIResLocation(GeneratedClass.static.CreateNew(Outer, UniqueName, MaxUsers));
    // End:0x98
    if(NewAIResLocation != none)
    {
        NewAIResLocation.SetRelativeLocationOnCreate(RelativeLocation);
        AddResource(NewAIResLocation);
    }
    return NewAIResLocation;
    //return ReturnValue;    
}

defaultproperties
{
    HeightOffGround=800.0000000
    RangeOfHeightOffGround=200.0000000
    Attributes=(bRevokeAccessOnLocationChange=true,bTestForGround=false)
    GeneratedClass=Class'LPAIResLocation'
    UniqueName="MedFlyerOrbit"
}