class LPSM_LedgeJump extends SPGFSM_LedgeJump
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LongJumpDist[1073741825];

function GetTravelAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CurLedgeLink, NewLedgeLink;
    local /*0x97E50000-0x00000000*/ private float JumpDist;
    local /*0x97E50000-0x00000000*/ private @NULL DestPos;

    CurLedgeLink = LPLedgeWalkLink(SPGFCoverPawn(MySPPawn).CurrentLink);
    NewLedgeLink = LPLedgeWalkLink(SWATTurnTargetCovInfo.Link);
    DestPos = SWATTurnTargetCovInfo.Location;
    // End:0xB1
    if((CurLedgeLink == none) || NewLedgeLink == none)
    {
        return 0;
    }
    // End:0xF8
    if(int(CurLedgeLink.LedgeWalkType) == int(NewLedgeLink.LedgeWalkType))
    {
        return 0;
    }
    JumpDist = VSize(DestPos - MySPPawn.Location);
    // End:0x172
    if(int(CurLedgeLink.LedgeWalkType) == int(0))
    {
        // End:0x170
        if(JumpDist > LongJumpDist)
        {
            return 3;
        }
        return 1;
    }
    // End:0x18C
    if(JumpDist > LongJumpDist)
    {
        return 4;
    }
    return 2;
    //return ReturnValue;    
}

function CanOverrideSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if((InMove == Class'LPSM_LedgeWalkReach') || InMove == Class'LPSM_LedgeWalkNearFall')
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    LongJumpDist=300.0000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowFloorConforming=false
    bAllowFootPlacementControllers=false
}