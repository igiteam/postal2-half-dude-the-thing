class LPAIObjectiveKismetFollowPath extends LPAIObjective within LPAIController
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FollowPathData;

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!super(SPAIObjective).IsValid())
    {
        return false;
    }
    // End:0x69
    if(Outer.WorldInfo.TimeSeconds < Outer.DelayFollowPathTime)
    {
        return false;
    }
    return FollowPathData != none;
    //return ReturnValue;    
}

event Abort()
{
    super(SPAIObjective).Abort();
    FollowPathData = none;
    //return;    
}

function InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609];

    FollowPathData = LPAIOD_FollowPath(InKismetObjectiveData);
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, Obj;

    // End:0x83
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetFollowPath', InAttributes, CurObjective)
    {
        // End:0x82
        if(CurObjective != none)
        {
            Obj = LPAIObjectiveKismetFollowPath(CurObjective);
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

protected function PerformObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = Outer.CmdFollowPath(FollowPathData, Outer.CmdStatus_MoveToPosition, 0);
    // End:0x81
    if(myCommand != none)
    {
        myCommand.SetSPAIObjective(self);
    }
    //return;    
}

function UpdateRating()
{
    //return;    
}

static function @NULL CreateNewObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, Obj;

    Obj = LPAIObjectiveKismetFollowPath(default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes));
    // End:0x72
    if(Obj != none)
    {
        Obj.UpdateRating();
    }
    //return;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes, Obj;

    Obj = FindExistingObjective(InObjectiveManager, InAttributes);
    // End:0x57
    if(Obj != none)
    {
        Obj.UpdateRating();        
    }
    else
    {
        CreateNewObjective(InObjectiveManager, InAttributes);
    }
    //return;    
}

defaultproperties
{
    Attribute=(bRemoveWhenFinished=true)
}