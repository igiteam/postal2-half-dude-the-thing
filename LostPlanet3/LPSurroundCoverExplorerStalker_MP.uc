class LPSurroundCoverExplorerStalker_MP extends LPSurroundCoverExplorerStalker within LPAIControllerStalker
    hidecategories(Object);

function GetTraversalClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPKyTraversalCoverStalker_MP';
    //return ReturnValue;    
}

defaultproperties
{
    MaxDistanceLookCover=1500.0000000
}