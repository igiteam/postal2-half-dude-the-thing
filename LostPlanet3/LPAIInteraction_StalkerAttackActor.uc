class LPAIInteraction_StalkerAttackActor extends LPAIInteraction_BaseAttackActor
    hidecategories(Object,Object,Object,Object);

state StartAttack
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x2E
        if(AIController != none)
        {
            AIController.WeaponStopFiring();
        }
        super.EndState(NextStateName);
        //return;        
    }

    function StartAnimation()
    {
        // End:0x2F
        if(AIController != none)
        {
            AIController.WeaponStartFiring();
        }
        super.StartAnimation();
        //return;        
    }
    stop;    
}
