class LPAIObjectiveSearchSentinel extends LPAIObjectiveIdle within LPAIControllerSentinel
    hidecategories(Object,Object);

protected function PerformObjective()
{
    Status = 1;
    // End:0x88
    if(Outer.DesignerInStealthMode)
    {
        Outer.CmdSearchTurtle(Outer.MyLPEnemy).SetSPAIObjective(self);        
    }
    else
    {
        Outer.CmdSearch(Outer.MyLPEnemy).SetSPAIObjective(self);
    }
    //return;    
}

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x6E
    if((Outer.DesignerInStealthMode && Outer.Enemy != none) && Outer.bFinishedSearch)
    {
        return false;
    }
    // End:0x92
    if(Outer.DesignerForceBlockSearch)
    {
        return false;
    }
    return super(SPAIObjective).IsValid();
    //return ReturnValue;    
}

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.CanBeActivated();
    //return ReturnValue;    
}

event IsBetterThan()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x70
    if((Outer.Enemy == none) && !Outer.DesignerForceBlockTurtle || Outer.DesignerInStealthMode)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes, CurObjective;

    // End:0x50
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveSearchSentinel', InAttributes, CurObjective)
    {
        // End:0x4F
        if(CurObjective != none)
        {            
            return;
        }        
    }    
    default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes);
    //return;    
}
