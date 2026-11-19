class LPAIObjectiveIdleVSISS extends LPAIObjectiveIdle within LPAIController
    hidecategories(Object,Object);

protected function PerformObjective()
{
    Outer.CmdWander(-1.0000000, false, 0.1000000, 0.1000000, self);
    Status = 1;
    //return;    
}
