class LPAIObjectiveIdleWhiteLeech extends LPAIObjectiveIdleLeech within LPAIControllerWhiteLeech
    hidecategories(Object,Object);

protected function PerformObjective()
{
    Outer.CmdWhiteLeechIdle(self);
    Status = 1;
    //return;    
}
