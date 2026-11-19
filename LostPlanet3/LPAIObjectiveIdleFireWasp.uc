class LPAIObjectiveIdleFireWasp extends LPAIObjectiveIdle within LPAIController
    hidecategories(Object,Object);

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5F
    if((Outer.myAIPawn == none) || Outer.myAIPawn.GetIfGettingBirthed())
    {
        return false;
    }
    // End:0x83
    if(Outer.GetIfPerformingReactiveAttack())
    {
        return false;
    }
    return super.CanBeActivated();
    //return ReturnValue;    
}
