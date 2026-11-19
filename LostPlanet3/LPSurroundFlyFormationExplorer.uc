class LPSurroundFlyFormationExplorer extends LPSurroundFormationExplorer
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FindFlyPositionTraversal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FindFlyPositionBot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FlyLocationExploreData;

function SetFlySearchDistances()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttributeToBuildFlyDataFrom[8388609];

    Class'SPAI.SPAIResFlyLocation'.static.BuildExploreDataFromAttribite(AttributeToBuildFlyDataFrom, FlyLocationExploreData);
    // End:0xCF
    if(FindFlyPositionTraversal != none)
    {
        FindFlyPositionTraversal.SetFlySearchParams(FlyLocationExploreData, Sectors);
        SetSearchDistances(FlyLocationExploreData.MinFormationRadius, FlyLocationExploreData.MaxFormationRadius, FlyLocationExploreData.IdealRadius);
    }
    //return;    
}

static function CreateFlyFromPawnClassName()
{
    local /*0x97E50000-0x00000000*/ private name ContentPawnClassName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private bool bSuccess;
    local /*0x97E50000-0x00000000*/ private @NULL newExplorer;

    bSuccess = false;
    newExplorer = CreateNewFlyInstance();
    // End:0x66
    if(newExplorer != none)
    {
        // End:0x66
        if(newExplorer.CreateFlyBotFromPawnClassName(ContentPawnClassName))
        {
            bSuccess = true;
        }
    }
    // End:0xCF
    if((newExplorer != none) && !bSuccess)
    {
        newExplorer.Cleanup();
        newExplorer.Destroy();
        newExplorer = none;
    }
    return newExplorer;
    //return ReturnValue;    
}

static function CreateFlyFromPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private bool bSuccess;
    local /*0x97E50000-0x00000000*/ private @NULL newExplorer;

    bSuccess = false;
    newExplorer = CreateNewFlyInstance();
    // End:0x66
    if(newExplorer != none)
    {
        // End:0x66
        if(newExplorer.CreateFlyBotFromPawn(inPawn))
        {
            bSuccess = true;
        }
    }
    // End:0xCF
    if((newExplorer != none) && !bSuccess)
    {
        newExplorer.Cleanup();
        newExplorer.Destroy();
        newExplorer = none;
    }
    return newExplorer;
    //return ReturnValue;    
}

protected static function CreateNewFlyInstance()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], newExplorer;

    newExplorer = LPSurroundFlyFormationExplorer(Class'LPSurroundFlyFormationExplorer'.static.Create());
    // End:0x90
    if(newExplorer != none)
    {
        // End:0x90
        if(!newExplorer.CreateTraversal())
        {
            newExplorer.Destroy();
            newExplorer = none;
        }
    }
    return newExplorer;
    //return ReturnValue;    
}

function CreateTraversal()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    FindFlyPositionTraversal = LPKyTraversalAttackFlyFormationSurround(Class'LPKyTraversalAttackFlyFormationSurround'.static.Create());
    FindPositionTraversal = FindFlyPositionTraversal;
    // End:0xEA
    if(FindFlyPositionTraversal != none)
    {
        FindFlyPositionTraversal.SetLosFunction(CheckLos);
        FindFlyPositionTraversal.SetFinishCallBack(FindPositionTraversalFinished);
        FindFlyPositionTraversal.SetAbortCallBack(FindPositionTraversalAborted);
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function CreateFlyBotFromPawnClassName()
{
    local /*0x97E50000-0x00000000*/ private name ContentPawnClassName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    FindFlyPositionBot = Class'SPAIKynapse.SPKyFlyDummyBot'.static.CreateFlyFromContentPawnClassName(ContentPawnClassName);
    // End:0x59
    if(FindFlyPositionBot != none)
    {
        FindPositionBot = FindFlyPositionBot;
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function CreateFlyBotFromPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    FindFlyPositionBot = Class'SPAIKynapse.SPKyFlyDummyBot'.static.CreateFlyFromPawn(inPawn);
    // End:0x59
    if(FindFlyPositionBot != none)
    {
        FindPositionBot = FindFlyPositionBot;
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function Cleanup()
{
    super.Cleanup();
    FindFlyPositionTraversal = none;
    //return;    
}

function StartExploration()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCenterActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL StartPos;
    local /*0x97E50000-0x00000000*/ private float Radius, Height;

    // End:0x15F
    if(((InCenterActor != none) && FindFlyPositionTraversal != none) && FindFlyPositionBot != none)
    {
        // End:0x15D
        if(!FindFlyPositionTraversal.IsRunning())
        {
            CenterActor = InCenterActor;
            StartPos = CenterActor.Location;
            CenterActor.GetBoundingCylinder(Radius, Height);
            StartPos.Z -= (Height * 0.5000000);
            FindFlyPositionTraversal.SetCenterActor(CenterActor);
            FindFlyPositionTraversal.StartAndBindToDummyBot(FindFlyPositionBot, StartPos, MaxDistance);
            ExpState = 1;
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected function AreConnected()
{
    local /*0x97E50000-0x00000000*/ private @NULL Start[25296897], End;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Center;

    // End:0x129
    if(FindFlyPositionBot != none)
    {
        // End:0x129
        if(FindFlyPositionBot.CanGo(Start, End) && FindFlyPositionBot.CanGo(End, Start))
        {
            // End:0x129
            if(Class'SPEngine.SPUtil'.static.DistFromLineSegment(Start, End, CenterActor.Location) > MinDistance)
            {
                Center = FindFlyPositionTraversal.GetStartPoint();
                // End:0x129
                if(IsEdgeAngleGood(Start, End, Center))
                {
                    return true;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function NumPositions()
{
    local /*0x97E50000-0x00000000*/ private int InIndex[8388609], ReturnValue;

    return Positions.Length;
    //return ReturnValue;    
}

function GetPosition()
{
    local /*0x97E50000-0x00000000*/ private int InIndex[8388609], PosIndex;
    local /*0x97E50000-0x00000000*/ private @NULL OutPosition[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x37
    if(InIndex < Positions.Length)
    {
        OutPosition = Positions[InIndex];
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected function CheckLos()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bVis1;

    bVis1 = (TestActor == none) || LosTest(Position, TestActor);
    return bVis1;
    //return ReturnValue;    
}

defaultproperties
{
    FlyLocationExploreData=(IdealRadius=1000.0000000,MinFormationRadius=500.0000000,MaxFormationRadius=2000.0000000,DistanceErrorBuffer=50.0000000,CostOfDistanceDeltaInsideIdealPerMeter=100.0000000,CostOfDistanceDeltaOutsideIdealPerMeter=50.0000000,MinFormationHeightDelta=1.0000000,FormationIdealHeightDelta=10.0000000,MaxFormationHeightDelta=20.0000000,HeightErrorBuffer=50.0000000,CostOfHeightDeltaBelowIdealPerMeter=100.0000000,CostOfHeightDeltaAboveIdealPerMeter=50.0000000,bUseHeightInsteadOfPitchForEvaluations=true,MaxPitchAllowedInUU=10,IdealPitchInUU=10,MinPitchAllowedInUU=0,PitchErrorBufferInUU=5,CostOfPitchDeltaBelowIdealPerUU=1.0000000,CostOfPitchDeltaAboveIdealPerUU=1.0000000,MinRangeFromVsForFlyLocToBeValid=800.0000000)
}