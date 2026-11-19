class LPKyTraversalCoverStalker_MP extends LPKyTraversalCoverStalker within LPAIControllerStalker;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int FoundCoverIndex;

protected event TraversalStrated()
{
    FoundCoverIndex = -1;
    super.TraversalStrated();
    //return;    
}

protected event TraversalFinished()
{
    super.TraversalFinished();
    //return;    
}

protected event TraversalAborted()
{
    super.TraversalAborted();
    //return;    
}

protected event ProcessCoverSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cover[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(FoundCoverIndex >= 0)
    {
        return bLookingForOpenPosition;
    }
    return super.ProcessCoverSlot(Cover);
    //return ReturnValue;    
}

function OnFoundValidCover()
{
    local /*0x97E50000-0x00000000*/ private int CoverIdx[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    FoundCoverIndex = CoverIdx;
    // End:0x24
    if(!bLookingForOpenPosition)
    {
        return false;
    }
    bLookingForCover = false;
    return true;
    //return ReturnValue;    
}

protected event ProcessOpenPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPKyTraversalCover).ProcessOpenPosition(FromLocation);
    //return ReturnValue;    
}

function CheckLineOfSightForOpenPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], DirectionFromEnemy;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DirectionEnemyToLocation;
    local /*0x97E50000-0x00000000*/ private float dotprod;

    DirectionEnemyToLocation = FromLocation - Outer.MainEnemy.Location;
    dotprod = DirectionEnemyToLocation Dot DirectionFromEnemy;
    // End:0x79
    if(dotprod < float(0))
    {
        return false;
    }
    return super(LPKyTraversalCover).CheckLineOfSightForOpenPosition(FromLocation, DirectionFromEnemy);
    //return ReturnValue;    
}

defaultproperties
{
    FoundCoverIndex=-1
}