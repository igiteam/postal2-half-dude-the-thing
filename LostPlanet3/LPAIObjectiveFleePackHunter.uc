class LPAIObjectiveFleePackHunter extends LPAIObjectiveFlee within LPAIController
    hidecategories(Object,Object);

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(int(Outer.WorldInfo.NetMode) == int(NM_Standalone))
    {
        return false;
    }
    // End:0x70
    if(LPAICmd_MoveToActorKismet(Outer.GetActiveCommand()) != none)
    {
        return false;
    }
    // End:0xAD
    if(Outer.Pawn.LastPainTime == float(0))
    {
        return false;
    }
    // End:0x139
    if(FleeBeginTime == float(0))
    {
        // End:0x136
        if((Outer.WorldInfo.TimeSeconds - Outer.Pawn.LastPainTime) > FleeDuration)
        {
            return false;
        }        
    }
    else
    {
        // End:0x187
        if((Outer.WorldInfo.TimeSeconds - FleeBeginTime) > FleeDuration)
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

protected function PerformObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cmd;

    FleeBeginTime = Outer.WorldInfo.TimeSeconds;
    Cmd = Outer.CmdFlee(FleeDuration);
    Cmd.SetSPAIObjective(self);
    //return;    
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
    FleeDuration=6.0000000
    Attribute=(GameType=SPAIObjectiveGameType.SPAI_OBJ_GAMETYPE_MULTI_PLAYER)
}