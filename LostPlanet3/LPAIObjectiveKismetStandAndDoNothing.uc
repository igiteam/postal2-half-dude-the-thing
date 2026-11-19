class LPAIObjectiveKismetStandAndDoNothing extends LPAIObjective within LPAIController
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Time[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHaveValidData[536870913];

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bHaveValidData && super(SPAIObjective).IsValid();
    //return ReturnValue;    
}

event InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData;

    KismetData = LPAIOD_StandAndDoNothing(InKismetObjectiveData);
    bHaveValidData = KismetData != none;
    // End:0x68
    if(bHaveValidData)
    {
        Time = KismetData.Time;
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, Obj;

    // End:0x83
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetStandAndDoNothing', InAttributes, CurObjective)
    {
        // End:0x82
        if(CurObjective != none)
        {
            Obj = LPAIObjectiveKismetStandAndDoNothing(CurObjective);
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

    // End:0x20
    if(Time < float(0))
    {
        Time = 1.0000000;
    }
    myCommand = Outer.CmdPause(Time);
    // End:0x82
    if(myCommand != none)
    {
        myCommand.SetSPAIObjective(self);
    }
    //return;    
}

defaultproperties
{
    Time=120.0000000
    Attribute=(bRemoveWhenFinished=true)
}