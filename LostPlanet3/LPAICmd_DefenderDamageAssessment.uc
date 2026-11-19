class LPAICmd_DefenderDamageAssessment extends LPAICmd_BasicDamageAssessment within LPAIControllerDefender
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
        totalDurationOfDamAss = Outer.DefenderPawn.TuneDataDefender.MaxDurationOfDamageAssessmentWhenDirectAttack.GetValue();
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
