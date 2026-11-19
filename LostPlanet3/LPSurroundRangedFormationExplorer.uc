class LPSurroundRangedFormationExplorer extends LPSurroundFormationExplorer
    hidecategories(Object);

static function CreateRangedFromPawnClassName()
{
    local /*0x97E50000-0x00000000*/ private name ContentPawnClassName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private bool bSuccess;
    local /*0x97E50000-0x00000000*/ private @NULL newExplorer;

    bSuccess = false;
    newExplorer = CreateNewRangedInstance();
    // End:0x66
    if(newExplorer != none)
    {
        // End:0x66
        if(newExplorer.CreateBotFromPawnClassName(ContentPawnClassName))
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

static function CreateRangedFromPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private bool bSuccess;
    local /*0x97E50000-0x00000000*/ private @NULL newExplorer;

    bSuccess = false;
    newExplorer = CreateNewRangedInstance();
    // End:0x66
    if(newExplorer != none)
    {
        // End:0x66
        if(newExplorer.CreateBotFromPawn(inPawn))
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

protected static function CreateNewRangedInstance()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], newExplorer;

    newExplorer = LPSurroundRangedFormationExplorer(Class'LPSurroundRangedFormationExplorer'.static.Create());
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

protected function AreConnected()
{
    local /*0x97E50000-0x00000000*/ private @NULL Start[25296897], End;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Center;

    // End:0x129
    if(FindPositionBot != none)
    {
        // End:0x129
        if(FindPositionBot.CanGo(Start, End) && FindPositionBot.CanGo(End, Start))
        {
            // End:0x129
            if(Class'SPEngine.SPUtil'.static.DistFromLineSegment(Start, End, CenterActor.Location) > MinDistance)
            {
                Center = FindPositionTraversal.GetStartPoint();
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

protected function CheckLos()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[25296897], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bVis1;

    bVis1 = (TestActor == none) || LosTest(Position, TestActor);
    return bVis1;
    //return ReturnValue;    
}
