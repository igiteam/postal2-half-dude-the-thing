class LPSM_PlayerRepairBase extends SPSpecialMove
    abstract
    config(Game);

static function @NULL GetRepairComponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], ReturnValue, RC;

    // End:0x11
    if(A == none)
    {
        return none;
    }
    // End:0x51
    foreach A.ComponentList(Class'LPRepairableBaseComponent', RC)
    {        
        return RC;        
    }    
    return none;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x34
    if(DoesUseInPlaceRepair())
    {
        SetUpInPlaceRepair();
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x33
    if(DoesUseInPlaceRepair())
    {
        CleanUpInPlaceRepair();
    }
    //return;    
}

function DoesUseInPlaceRepair()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(MySPPawn.WorldInfo.NetMode) == int(NM_Standalone);
    //return ReturnValue;    
}

function SetUpInPlaceRepair()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyPlayerController;

    MyPlayerController = LPPlayerController(MySPPawn.Controller);
    // End:0x8D
    if((MyPlayerController != none) && MySPPawn.IsLocallyControlled())
    {
        MyPlayerController.MPStartState('InPlaceRepair');
    }
    //return;    
}

function CleanUpInPlaceRepair()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyPlayerController;

    MyPlayerController = LPPlayerController(MySPPawn.Controller);
    // End:0x84
    if((MyPlayerController != none) && MySPPawn.IsLocallyControlled())
    {
        MyPlayerController.MPEnterWalkState();
    }
    //return;    
}

function GiveReward()
{
    local /*0x97E50000-0x00000000*/ private float Reward[8388609];

    //return;    
}

defaultproperties
{
    bAllowAdditiveHitReaction=true
}