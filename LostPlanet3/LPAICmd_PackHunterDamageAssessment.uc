class LPAICmd_PackHunterDamageAssessment extends LPAICmd_BasicDamageAssessment within LPAIControllerPackHunter
    config(AI);

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.EnableAnnounceHeadGlow(false);
    Outer.EnableAnnounceTailGlow(false);
    super.Popped();
    //return;    
}

function ShouldJumpBackBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsThereSpaceToJumpBack();
    //return ReturnValue;    
}

function GetJumpBackSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterJumpBackBeforeDamageAssessment';
    //return ReturnValue;    
}

function GetAssessmentSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterDirectAttackDamageAssessment';
    //return ReturnValue;    
}

function HandlePostJumpBackGoingIntoDamAssSpecialMoveEffects()
{
    Outer.EnableAnnounceHeadGlow(true);
    Outer.EnableAnnounceTailGlow(true);
    //return;    
}

function HandleEndOfDamAssSpecialMoveEffects()
{
    Outer.EnableAnnounceHeadGlow(false);
    Outer.EnableAnnounceTailGlow(false);
    //return;    
}

function GetMaxTimeForJumpBackBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.PHPawn.TuneDataPackHunter.MaxTimeForJumpBackBeforeDamageAssessment;
    //return ReturnValue;    
}

function GetTotalTimeThisDamageAssessmentIsAllowed()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.PHPawn.TuneDataPackHunter.MaxDurationOfDamageAssessmentWhenDirectAttackFromStaticFormation.GetValue();
    //return ReturnValue;    
}
