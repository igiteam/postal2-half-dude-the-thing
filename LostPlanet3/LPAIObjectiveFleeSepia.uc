class LPAIObjectiveFleeSepia extends LPAIObjectiveFlee within LPAIControllerSepia
    hidecategories(Object,Object);

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x26
    if(Outer.ActorToldToFleeFrom != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnCommandFinished()
{
    FleeBeginTime = 0.0000000;
    //return;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes, Obj;

    Obj = FindFleeObjective(InObjectiveManager, InAttributes);
    // End:0x51
    if(Obj == none)
    {
        CreateNewFleeObjective(InObjectiveManager, InAttributes);
    }
    //return;    
}

static function @NULL FindFleeObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective;

    // End:0x61
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveFlee', InAttributes, CurObjective)
    {
        // End:0x60
        if(CurObjective != none)
        {            
            return LPAIObjectiveFlee(CurObjective);
        }        
    }    
    return none;
    //return ReturnValue;    
}

static function @NULL CreateNewFleeObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes;

    default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes);
    //return;    
}

defaultproperties
{
    FleeDuration=60.0000000
    FleeDistances=/* Array type was not detected. */
    Attribute=(PriorityCategory=SPAIObjectiveCategory.SPAI_OBJCAT_SquadOrder)
}