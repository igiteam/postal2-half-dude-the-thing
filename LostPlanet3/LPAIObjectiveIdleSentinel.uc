class LPAIObjectiveIdleSentinel extends LPAIObjectiveIdle within LPAIControllerSentinel
    hidecategories(Object,Object);

protected function PerformObjective()
{
    Status = 1;
    Outer.CmdTurtle(none,,, true).SetSPAIObjective(self);
    //return;    
}

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(Outer.DesignerInStealthMode)
    {
        return false;
    }
    // End:0x48
    if(Outer.DesignerForceBlockTurtle)
    {
        return false;
    }
    return super(SPAIObjective).IsValid();
    //return ReturnValue;    
}

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(Outer.CheckValidRangeToEnemy())
    {
        return false;
    }
    // End:0x48
    if(Outer.DesignerForceBlockTurtle)
    {
        return false;
    }
    return super.CanBeActivated();
    //return ReturnValue;    
}
