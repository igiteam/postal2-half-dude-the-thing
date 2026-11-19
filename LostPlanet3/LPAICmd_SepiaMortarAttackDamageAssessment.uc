class LPAICmd_SepiaMortarAttackDamageAssessment extends LPAICmd_MortarAttackDamageAssessment within LPAIControllerSepia
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

function On_LPSM_DamageAssessment_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;
    local /*0x97E50000-0x00000000*/ private float durationOfAction;

    // End:0xCC
    if(bAssessingDamage)
    {
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeStartedAssessingDamage;
        // End:0x7B
        if(durationOfAction > TotalTimeThisDamageAssessmentIsAllowed)
        {
            bAssessingDamage = false;            
        }
        else
        {
            Outer.myAIPawn.DoSpecialMove(AssessmentSpecialMove, true, true, On_LPSM_DamageAssessment_Finished);
        }
    }
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
    stop;    
}
