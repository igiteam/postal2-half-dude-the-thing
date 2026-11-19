class LPAIObjectiveIdleTurret extends LPAIObjectiveIdle within LPAIController
    hidecategories(Object,Object);

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(SPAIObjective).CanBeActivated();
    //return ReturnValue;    
}

protected function PerformObjective()
{
    CmdTurretIdle();
    Status = 1;
    //return;    
}

function CmdTurretIdle()
{
    Outer.AbortCommand(Outer.CommandList);
    Class'LPAICmd_TurretIdle'.static.InitObjectiveCommand(Outer, self);
    //return;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes, CurObjective;

    // End:0x50
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveIdleTurret', InAttributes, CurObjective)
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
