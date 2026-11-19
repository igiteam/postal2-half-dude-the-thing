class LPSurroundCoverExplorerHumanSoldier extends LPSurroundCoverExplorer within LPAIControllerHumanSoldier
    hidecategories(Object);

protected function StartExploration()
{
    local /*0x97E50000-0x00000000*/ private @NULL InStartPos[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x34
    if(Outer.bFlankingGuy)
    {
        MaxDistanceLookCover = 1750.0000000;        
    }
    else
    {
        MaxDistanceLookCover = 2000.0000000;
    }
    return super.StartExploration(InStartPos);
    //return ReturnValue;    
}

function GetTraversalClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPKyTraversalCoverHumanSoldier';
    //return ReturnValue;    
}
