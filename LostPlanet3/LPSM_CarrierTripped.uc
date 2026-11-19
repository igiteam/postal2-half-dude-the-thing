class LPSM_CarrierTripped extends LPSM_CarrierDefaultStandingStun
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsLeft;
    local /*0x97E50000-0x00000000*/ private int StartCell, LastCell, PreferredCell;
    local /*0x97E50000-0x00000000*/ private @NULL CarrierPawn, LCC;
    local /*0x97E50000-0x00000000*/ private int Count;

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.ZeroMovementVariables();
    CarrierPawn = LPAIPawnCarrier(MySPPawn);
    LCC = LPAIControllerCarrier(MySPPawn.Controller);
    switch(CarrierPawn.TemplateLogicData.GrabPointIndex)
    {
        // End:0xE2
        case 0:
            bIsLeft = true;
            StartCell = 0;
            // End:0x122
            break;
        // End:0x11D
        case 1:
            bIsLeft = false;
            StartCell = CarrierPawn.NumOfCellsPerSideOfHive;
            // End:0x122
            break;
        // End:0xFFFF
        default:
            return;
            break;
    }
    LastCell = StartCell + CarrierPawn.NumOfCellsPerSideOfHive;
    PreferredCell = Rand(CarrierPawn.NumOfCellsPerSideOfHive) + StartCell;
    PreferredCell = CarrierPawn.FindNextValidForSpawnAndLaunchCellOnSideFromThisIndex(bIsLeft, PreferredCell, true);
    Count = LCC.GetNumOfDefenderToSquirtOutWhenTripping();
    J0x1F0:

    // End:0x36F [Loop If]
    if((PreferredCell >= 0) && Count >= 0)
    {
        LCC.StartArbitraryDefenderLaunch(1, CarrierPawn.TemplateLogicData.TargetPawn, false, false, 0.0000000, LCC.GetMinDelayBeforeProtectingTheCellsWhenTripping(), LCC.GetMaxDelayBeforeProtectingTheCellsWhenTripping(), LCC.GetMinDelayBeforeUnclaimingCellsWhenTripping(), LCC.GetMaxDelayBeforeUnclaimingCellsWhenTripping(), PreferredCell, false, false);
        ++PreferredCell;
        // End:0x324
        if(PreferredCell >= LastCell)
        {
            PreferredCell = StartCell;
        }
        PreferredCell = CarrierPawn.FindNextValidForSpawnAndLaunchCellOnSideFromThisIndex(bIsLeft, PreferredCell, true);
        --Count;
        // [Loop Continue]
        goto J0x1F0;
    }
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MySPPawn.HitReactLogicAnimTree;
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySPPawn.ZeroMovementVariables();
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}