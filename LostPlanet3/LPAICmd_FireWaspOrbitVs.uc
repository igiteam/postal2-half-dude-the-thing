class LPAICmd_FireWaspOrbitVs extends LPAICmd_FireWaspOrbit within LPAIControllerFireWasp;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function CanStillAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(super(LPAICmd_Orbit).CanStillAttack())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasAccessToStartAttackFromOrbitSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetStrikeAccessIfRequiredBeforeAttack()
{
    GetStrikeAccess(EnemyForAttack);
    //return;    
}

function PerformReactionToVsBump()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheVs[8388609];

    Outer.CmdReactiveAttackVs(TheVs);
    //return;    
}

function AttackEnemyFromOrbitSlot()
{
    super(LPAICmd_Orbit).AttackEnemyFromOrbitSlot();
    // End:0x267
    if(Outer.FireWaspPawn != none)
    {
        Outer.bMeleeFinished = false;
        // End:0x267
        if(int(TypeOfAttackToldToPerform) == int(2))
        {
            CurrentAttackCmd = Outer.CmdBasicRangedAttackVs(EnemyForAttack, int(Outer.FireWaspPawn.TuneDataFireWasp.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.FireWaspPawn.TuneDataFireWasp.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.FireWaspPawn.TuneDataFireWasp.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.FireWaspPawn.TuneDataFireWasp.MaxAmountOfDamageRequiredToStopAttack.GetValue(), ProcessLookForAnotherRangeLobAttackOpportunityFromCurrentLocation, ProcessLookForFullPhysicalAttackOpportunityFromCurrentLocation, IsThereClearLobAttackLaneFromGivenLoc, Outer.CmdStatus_Strike, 1);            
        }
    }
    //return;    
}

function AltMortarAttackEnemyFromOrbitSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    super(LPAICmd_Orbit).AltMortarAttackEnemyFromOrbitSlot();
    // End:0x121
    if(Outer.FireWaspPawn != none)
    {
        myCommand = Outer.CmdMortarAttackPof(EnemyForAttack, none, Outer.FireWaspPawn.TuneDataAIPawn.AltToFormationLocMortarAttackSetupInfo, None, None, None, none, 1);
        // End:0x10E
        if(myCommand != none)
        {
            myCommand.SetBeSuperAggressive(true);
        }
        CurrentAttackCmd = myCommand;
    }
    //return;    
}

function FlyAttackEnemyFromHere()
{
    super(LPAICmd_Orbit).FlyAttackEnemyFromHere();
    // End:0x267
    if(Outer.FireWaspPawn != none)
    {
        Outer.bMeleeFinished = false;
        // End:0x267
        if(int(TypeOfAttackToldToPerform) == int(2))
        {
            CurrentAttackCmd = Outer.CmdBasicRangedAttackPof(EnemyForAttack, int(Outer.FireWaspPawn.TuneDataFireWasp.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.FireWaspPawn.TuneDataFireWasp.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.FireWaspPawn.TuneDataFireWasp.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.FireWaspPawn.TuneDataFireWasp.MaxAmountOfDamageRequiredToStopAttack.GetValue(), ProcessLookForAnotherRangeLobAttackOpportunityFromCurrentLocation, ProcessLookForFullPhysicalAttackOpportunityFromCurrentLocation, IsThereClearLobAttackLaneFromGivenLoc, Outer.CmdStatus_Strike, 1);            
        }
    }
    //return;    
}

function PerformFlyerReactionPhysicalAttackCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToPerformRactiveAttackOn[8388609];

    CurrentAttackCmd = Outer.CmdReactiveAttackVs(PawnToPerformRactiveAttackOn,, 1);
    //return;    
}
