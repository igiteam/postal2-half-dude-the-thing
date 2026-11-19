class LPAICmd_RangedLobAttack extends LPAICmd_RangedBaseAttack within LPAIController;

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

function SetMinNumberOfStrikesToAttemptPerAttack()
{
    local /*0x97E50000-0x00000000*/ private int NumOfAttempts[8388609];

    MinNumberOfStrikesToAttemptPerAttack = NumOfAttempts;
    //return;    
}

function SetMaxNumberOfStrikesToAttemptPerAttack()
{
    local /*0x97E50000-0x00000000*/ private int NumOfAttempts[8388609];

    MaxNumberOfStrikesToAttemptPerAttack = NumOfAttempts;
    //return;    
}

function SetMinAmountOfDamageRequiredToStopAttack()
{
    local /*0x97E50000-0x00000000*/ private int NumOfHits[8388609];

    MinAmountOfDamageRequiredToStopAttack = float(NumOfHits);
    //return;    
}

function SetMaxAmountOfDamageRequiredToStopAttack()
{
    local /*0x97E50000-0x00000000*/ private int NumOfHits[8388609];

    MaxAmountOfDamageRequiredToStopAttack = float(NumOfHits);
    //return;    
}

function SetProcessLookForAnotherAttackOpportunityDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[8388609];

    ProcessLookForAnotherAttackOpportunityDelegate = InProcessLookForAnotherAttackOpportunityDel;
    //return;    
}

function SetProcessLookForAlternateAttackOpportunityDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAlternateAttackOpportunityDel[8388609];

    ProcessLookForAlternateAttackOpportunityDelegate = InProcessLookForAlternateAttackOpportunityDel;
    //return;    
}

function GetAmountOfDamageToCausePlowInThisAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x2D
    if(Outer.bBeSuperAggressive)
    {
        return float(2147483647);        
    }
    else
    {
        return RandRange(Outer.myAIPawn.TuneDataAIPawn.MinAmountOfDamageForTripAndPlowIn.GetValue(), Outer.myAIPawn.TuneDataAIPawn.MaxAmountOfDamageForTripAndPlowIn.GetValue());
    }
    //return ReturnValue;    
}

private final function AbortAnyRunningChildCommand()
{
    // End:0x38
    if(CurSpecialMoveCmd != none)
    {
        Outer.AbortCommand(CurSpecialMoveCmd);
    }
    // End:0x7B
    if(CurWaitCmd != none)
    {
        Outer.AbortCommand(CurWaitCmd);
        CurWaitCmd = none;
    }
    // End:0xBE
    if(CurStrikeCmd != none)
    {
        Outer.AbortCommand(CurStrikeCmd);
        CurStrikeCmd = none;
    }
    // End:0xF6
    if(CurDamageAssessmentCmd != none)
    {
        Outer.AbortCommand(CurDamageAssessmentCmd);
    }
    // End:0x12E
    if(CurTurnToFaceCmd != none)
    {
        Outer.AbortCommand(CurTurnToFaceCmd);
    }
    //return;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ConvertRangeToSeperation(Outer.myAIPawn.TuneDataAIPawn.MaxSeperationForDirectPhysicalStrike);
    //return ReturnValue;    
}

function MoveToEnemyForRangedStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function RangedStikeLaneStillValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IsAttackOpertunityStillValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x71
    if(((Outer.myAIPawn != none) && Outer.myAIPawn.GetRangedLobStrikeZoneForCurrentAttack() >= 0) || RangedStikeLaneStillValid())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}
