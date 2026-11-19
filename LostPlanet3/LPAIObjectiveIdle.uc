class LPAIObjectiveIdle extends LPAIObjective within LPAIController
    hidecategories(Object,Object);

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x30
    if(LPAICmd_MoveToActorKismet(Outer.GetActiveCommand()) != none)
    {
        return false;
    }
    return super(SPAIObjective).CanBeActivated();
    //return ReturnValue;    
}

protected function PerformObjective()
{
    Outer.CmdWander(,,,,, self);
    Status = 1;
    //return;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes, CurObjective;

    // End:0x50
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveIdle', InAttributes, CurObjective)
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

event Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPAIObjective).Update(DeltaTime);
    // End:0x3F
    if(IsActive())
    {
        MyObjectiveManager.ImportantObjectiveAdded();
    }
    //return;    
}
