class LPTVCameraVolume extends LPTriggerVolume
    abstract
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(0.25_Pct) /*0x9DFC0000-0x00000000*/ private bool bInitiallyEnabled[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Cameras;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InterestingIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MostInterestingActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NextBestCamera;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __CompareCameraCandidates__Delegate;

delegate CompareCameraCandidates()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x4A
    if(A.DistanceFromTargetSquared > B.DistanceFromTargetSquared)
    {
        return -1;        
    }
    else
    {
        return 0;
    }
    //return ReturnValue;    
}

simulated function PostBeginPlay()
{
    bEnabled = bInitiallyEnabled;
    Cameras.Length = 0;
    LocateCameras();
    //return;    
}

simulated function LocateCameras()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cam;

    // End:0x90
    foreach WorldInfo.AllActors(Class'LPTVCamera', Cam)
    {
        // End:0x8F
        if(EncompassesPoint(Cam.Location))
        {
            Cameras.AddItem(Cam);            
            Cam.AddParentVolume(self);
        }        
    }    
    //return;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    super(Volume).OnToggle(Action);
    //return;    
}

simulated function EvaluateMyInterestIndex()
{
    local /*0x97E50000-0x00000000*/ private @NULL LP, LPP, PlayerReplicationInfo;
    local /*0x97E50000-0x00000000*/ private int iPawnCount, iPlayerPawnCount, iTeamCount, iActionOriented;
    local /*0x97E50000-0x00000000*/ private bool bCourierAction;
    local /*0x97E50000-0x00000000*/ private float CurrentTime;
    local /*0x97E50000-0x00000000*/ private @NULL FirstActor, Interesting;
    local /*0x97E50000-0x00000000*/ private float InterestingValue, val;

    NextBestCamera = -1;
    // End:0x2F
    if(!bEnabled)
    {
        InterestingIndex = -1.0000000;
        return;
    }
    CurrentTime = Class'Engine.WorldInfo'.static.GetWorldInfo().TimeSeconds;
    Interesting = none;
    InterestingValue = -1.0000000;
    // End:0x2FC
    foreach TouchingActors(Class'LPPawn', LP)
    {
        val = 0.0000000;
        // End:0xD1
        if(FirstActor == none)
        {
            FirstActor = LP;
        }
        LPP = LPPlayerPawn(LP);
        // End:0x272
        if(LPP != none)
        {
            ++iPlayerPawnCount;
            val += 1.0000000;
            // End:0x178
            if(int(LPP.GetTeamNum()) == int(MyManager.MyTeamNumber))
            {
                ++iTeamCount;
                val += 1.0000000;
            }
            PlayerReplicationInfo = LPPRI(LPP.PlayerReplicationInfo);
            // End:0x23D
            if((PlayerReplicationInfo != none) && (PlayerReplicationInfo.TimeOfLastWeaponDischarge >= (CurrentTime - 2.0000000)) || PlayerReplicationInfo.TimeOfLastInflictedDamage >= (CurrentTime - 2.0000000))
            {
                ++iActionOriented;
                val += 1.0000000;
            }
            // End:0x26F
            if(LPP.IsAliveAndWell())
            {
                val += 1.0000000;
            }            
        }
        else
        {
            ++iPawnCount;
        }
        // End:0x2BE
        if(LP.CourierItems.Length > 0)
        {
            bCourierAction = true;
            val += 10.0000000;
        }
        // End:0x2FB
        if(val > InterestingValue)
        {
            InterestingValue = val;
            Interesting = LP;
        }        
    }    
    InterestingIndex = ((float(iPawnCount) + (float(iPlayerPawnCount - iTeamCount) * 1.5000000)) + (float(iTeamCount) * 2.0000000)) + (float(iActionOriented) * 3.0000000);
    // End:0x376
    if(bCourierAction)
    {
        InterestingIndex += 10.0000000;
    }
    // End:0x39D
    if(InterestingValue <= float(0))
    {
        MostInterestingActor = FirstActor;        
    }
    else
    {
        MostInterestingActor = Interesting;
    }
    //return;    
}

simulated function FindBestCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[9437185], ReturnValue, Cam;
    local /*0x97E50000-0x00000000*/ private int Candidates;

    none
    // End:0x27
    if(A == none)
    {
        A = MostInterestingActor;
    }
    // End:0x54
    if((A == none) || Cameras.Length == 1)
    {
        return Cameras[0];
    }
    Candidates = 0;
    // End:0x133
    foreach Cameras(Cam)
    {
        // End:0x10E
        if(Cam.IsActorVisible(A))
        {
            Cam.DistanceFromTargetSquared = VSizeSq(Cam.Location - A.Location);
            ++Candidates;            
        }
        else
        {
            Cam.DistanceFromTargetSquared = 100000000.0000000;
        }        
    }    
    // End:0x154
    if(Candidates == 0)
    {
        NextBestCamera = -1;
        return none;
    }
    Cameras.Sort(CompareCameraCandidates);    
    NextBestCamera = 1;
    return Cameras[0];
    //return ReturnValue;    
}

simulated function FindNextBestCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x11
    if(NextBestCamera <= 0)
    {
        return none;
    }
    // End:0x5D
    if((NextBestCamera >= Cameras.Length) || Cameras[NextBestCamera].DistanceFromTargetSquared < float(0))
    {
        return none;
    }
    ++NextBestCamera;
    return Cameras[NextBestCamera - 1];
    //return ReturnValue;    
}

simulated function PickRandomCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iCamera;

    iCamera = int(FRand() * float(Cameras.Length));
    return Cameras[iCamera];
    //return ReturnValue;    
}

simulated function FindMostInterestingActorInVolume()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MostInterestingActor;
    //return ReturnValue;    
}

simulated function IsActorInside()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LP;

    // End:0x33
    foreach TouchingActors(Class'LPPawn', LP)
    {
        // End:0x32
        if(A == LP)
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    // End:0x66
    if(MyManager != none)
    {
        MyManager.EnteredVolume(self, Other);
    }
    //return;    
}

event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    super(Actor).UnTouch(Other);
    // End:0x4B
    if(MyManager != none)
    {
        MyManager.LeftVolume(self, Other);
    }
    //return;    
}

simulated function SleepCollision()
{
    local /*0x97E50000-0x00000000*/ private bool bDisableCollision[8388609];

    // End:0x1F
    if(bDisableCollision)
    {
        SetCollision(false, bBlockActors);        
    }
    else
    {
        SetCollision(bEnabled, bBlockActors);
    }
    //return;    
}

defaultproperties
{
    bInitiallyEnabled=true
    bEnabled=true
    InterestingIndex=-1.0000000
    NextBestCamera=-1
    // Reference: BrushComponent'Default__LPTVCameraVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}