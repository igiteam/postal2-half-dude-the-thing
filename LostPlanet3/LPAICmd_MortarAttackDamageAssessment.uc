class LPAICmd_MortarAttackDamageAssessment extends LPAICmd_BasicDamageAssessment within LPAIController
    config(AI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinRangeSqFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxRangeSqFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue[536870913];

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

function SetMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue()
{
    local /*0x97E50000-0x00000000*/ private float InMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue[8388609];

    MinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue = InMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue;
    MinRangeSqFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue = MinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue * MinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue;
    //return;    
}

function SetMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue()
{
    local /*0x97E50000-0x00000000*/ private float InMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue[8388609];

    MaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue = InMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue;
    MaxRangeSqFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue = MaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue * MaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue;
    //return;    
}

function ShouldJumpBackBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldDoFastSprintToDamageAssessmentPosition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HasEnemyGottenToCloseDurringAssessmentOrAnnounce()
{
    local /*0x97E50000-0x00000000*/ private float outSepeartionToEnemySq[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5A
    if(ActorToCareAboutWhileAssessing != none)
    {
        outSepeartionToEnemySq = Outer.SeperationToActorSq(ActorToCareAboutWhileAssessing);
        // End:0x5A
        if(outSepeartionToEnemySq < MinRangeSqFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function HasEnemyGottenToFarAwayDurringAssessment()
{
    local /*0x97E50000-0x00000000*/ private float outSepeartionToEnemySq[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1.0000000
    // End:0x74
    if(ActorToCareAboutWhileAssessing != none)
    {
        // End:0x5B
        if(outSepeartionToEnemySq < float(0))
        {
            outSepeartionToEnemySq = Outer.SeperationToActorSq(ActorToCareAboutWhileAssessing);
        }
        // End:0x74
        if(outSepeartionToEnemySq > MaxRangeSqFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}
