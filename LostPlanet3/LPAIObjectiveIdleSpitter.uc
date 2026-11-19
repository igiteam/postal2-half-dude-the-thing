class LPAIObjectiveIdleSpitter extends LPAIObjectiveIdle within LPAIController
    hidecategories(Object,Object);

protected function PerformObjective()
{
    super.PerformObjective();
    LPAIPawnSpitter(Outer.Pawn).SetAiming(false);
    //return;    
}
