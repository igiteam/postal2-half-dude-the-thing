class LPAICmd_CarrierHitReactionToStun extends LPAICmd_HitReactionToStun within LPAIControllerCarrier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnCausingStun;

function Pushed()
{
    super(LPAICommand).Pushed();
    Outer.bIgnoreStunCommands = true;
    Outer.CarrierPawn.SetHiveDeflation(1.0000000);
    //return;    
}

function SetPawnCausingStun()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPawnCausingStun[8388609];

    PawnCausingStun = InPawnCausingStun;
    Outer.StartArbitraryDefenderLaunch(Outer.GetNumOfDefenderToSquirtOutWhenGettingStunByCloseGrenBoom(), InPawnCausingStun, Outer.GetIfShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenGettingStunByCloseGrenBoom(), Outer.GetIfShouldBiasLaunchedDefendersTowardsTopOfHiveWhenGettingStunByCloseGrenBoom(), Outer.GetDelayBeforeLaunchingWhenGettingStunByCloseGrenBoom(), Outer.GetMinDelayBeforeProtectingTheCellsWhenGettingStunByCloseGrenBoom(), Outer.GetMaxDelayBeforeProtectingTheCellsWhenGettingStunByCloseGrenBoom(), Outer.GetMinDelayBeforeUnclaimingCellsWhenGettingStunByCloseGrenBoom(), Outer.GetMaxDelayBeforeUnclaimingCellsWhenGettingStunByCloseGrenBoom());
    //return;    
}

function Popped()
{
    Outer.bIgnoreStunCommands = false;
    super(LPAICommand).Popped();
    //return;    
}

function DoneWithHitReactionPreStun()
{
    Outer.bIgnoreStunCommands = false;
    //return;    
}

function DoneWithStunPreRecovery()
{
    Outer.bIgnoreStunCommands = true;
    //return;    
}

defaultproperties
{
    HitReactionSpecialMove=none
}