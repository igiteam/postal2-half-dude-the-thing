class LPAICmd_LeechDamageAssessment extends LPAICmd_BasicDamageAssessment within LPAIControllerLeech
    config(AI);

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

function GetDamageAssessmentTurnToFaceEnemySpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x41
    if(Outer.LeechPawn.IsInverted())
    {
        return Class'LPSM_LeechTurnLeft180Inverted';
    }
    return Class'LPSM_LeechTurnLeft180';
    //return ReturnValue;    
}

function GetJumpBackSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x41
    if(Outer.LeechPawn.IsInverted())
    {
        return Class'LPSM_LeechInvertedJumpBack';
    }
    return Class'LPSM_LeechJumpBackBeforeDamageAssessment';
    //return ReturnValue;    
}

function ShouldFocusOnEnemyWhileJumpingBackBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldDoSpeiclMoveTurnToFaceEnemyAfterJumpBackButBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4B
    if(Class'SPEngine.SPUtil'.static.IsInFront(Outer.LeechPawn, ActorToCareAboutWhileAssessing))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function ShouldJumpBackBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4B
    if(Class'SPEngine.SPUtil'.static.IsInFront(Outer.LeechPawn, ActorToCareAboutWhileAssessing))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldDoFastSprintToDamageAssessmentPosition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4B
    if(Class'SPEngine.SPUtil'.static.IsInFront(Outer.LeechPawn, ActorToCareAboutWhileAssessing))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function FakeJumpBackByMovingAccelerationRateToUse()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.myAIPawn.TuneDataAIPawn.AccelRateWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss;
    //return ReturnValue;    
}

function FakeJumpBackByMovingSpeedScaleToUse()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    MaxSpeedScaleBeforeJumpBack = Outer.myAIPawn.ReplicatedMaxSpeedScale;
    // End:0xC0
    if(Outer.LeechPawn.IsInverted())
    {
        return Outer.LeechPawn.TuneDataLeech.MaxSpeedScaleWhenInvertedWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss;        
    }
    else
    {
        return Outer.myAIPawn.TuneDataAIPawn.MaxSpeedScaleWhileSeparatingFromEnemyAfterStrikeAndBeforeDamAss;
    }
    //return ReturnValue;    
}

function MaxDelayBeforeStartAssessmentSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.LeechPawn.TuneDataLeech.JumpBackMaxRandomLagBeforeStartSM;
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

    function IsDamagedAssessmentFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float durationOfAction, totalDurationOfDamAss;

        // End:0x11
        if(!bAssessingDamage)
        {
            return true;
        }
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeStartedAssessingDamage;
        totalDurationOfDamAss = Outer.LeechPawn.TuneDataLeech.MaxDurationOfDamageAssessmentWhenDirectAttack.GetValue();
        // End:0xDA
        if(durationOfAction > totalDurationOfDamAss)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
    stop;    
}

defaultproperties
{
    bRandDelayBeforeStartAssessmentSpecialMove=true
}