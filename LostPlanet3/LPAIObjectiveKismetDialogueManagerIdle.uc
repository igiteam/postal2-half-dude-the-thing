class LPAIObjectiveKismetDialogueManagerIdle extends LPAIObjective within LPAIController
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHaveValidData[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Action[536870913];

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Controller;

    Controller = Outer;
    // End:0x5A
    if(Controller != none)
    {
        // End:0x34
        if(IsActive())
        {
            return true;            
        }
        else
        {
            // End:0x5A
            if(Controller.CommandList != none)
            {
                return false;
            }
        }
    }
    return super(SPAIObjective).CanBeActivated();
    //return ReturnValue;    
}

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bHaveValidData && super(SPAIObjective).IsValid();
    //return ReturnValue;    
}

event OnCommandAborted()
{
    // End:0x37
    if(Action != none)
    {
        Action.DialogueManagerObjectiveTerminated(Outer);
    }
    super(SPAIObjective).OnCommandAborted();
    //return;    
}

event OnCommandFinished()
{
    // End:0x37
    if(Action != none)
    {
        Action.DialogueManagerObjectiveTerminated(Outer);
    }
    super(SPAIObjective).OnCommandFinished();
    //return;    
}

event InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData;

    KismetData = LPAIOD_DialogueManagerIdle(InKismetObjectiveData);
    bHaveValidData = KismetData != none;
    // End:0x68
    if(bHaveValidData)
    {
        Action = KismetData.Action;
    }
    //return;    
}

protected function PerformObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = Outer.CmdDialogueManager();
    // End:0x59
    if(myCommand != none)
    {
        myCommand.SetSPAIObjective(self);
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, Obj;

    // End:0x83
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetDialogueManagerIdle', InAttributes, CurObjective)
    {
        // End:0x82
        if(CurObjective != none)
        {
            Obj = LPAIObjectiveKismetDialogueManagerIdle(CurObjective);
            // End:0x82
            if(Obj != none)
            {                
                return Obj;
            }
        }        
    }    
    return none;
    //return ReturnValue;    
}

static function @NULL AllocateAndAddObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, Obj;

    Obj = FindExistingObjective(InObjectiveManager, InAttributes);
    // End:0x54
    if(Obj != none)
    {
        Obj.Abort();
    }
    return super(SPAIObjective).AllocateAndAddObjective(InObjectiveManager, InAttributes);
    //return ReturnValue;    
}

defaultproperties
{
    Attribute=(bRemoveWhenFinished=true)
}