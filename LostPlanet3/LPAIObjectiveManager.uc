class LPAIObjectiveManager extends SPAIObjectiveManager
    editinlinenew
    hidecategories(Object,ActorComponent);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FrameForLastAttackObjective;

function ActivateBestObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentObjective[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private float MinTimeToKeepCurrentObjective[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    false
    3.0000000
    return super.ActivateBestObjective(CurrentObjective, bForced, MinTimeToKeepCurrentObjective);
    //return ReturnValue;    
}
