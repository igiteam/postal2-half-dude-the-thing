class LPAIObjectiveHideFromActor extends LPAIObjective within LPAIController
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToHideFrom[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDistanceToSearchForHidingPlace[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HidingTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHaveValidData[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_Move[524289];

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bHaveValidData && super(SPAIObjective).IsValid();
    //return ReturnValue;    
}

function InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData;

    CmdStatus_Move.SetDefaults();
    KismetData = LPAIOD_HideFromActor(InKismetObjectiveData);
    bHaveValidData = KismetData != none;
    // End:0xD9
    if(bHaveValidData)
    {
        ActorToHideFrom = KismetData.ActorToHideFrom;
        HidingTime = KismetData.HidingTime;
        bHaveValidData = (ActorToHideFrom != none) && HidingTime > float(0);
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, Obj;

    // End:0x83
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveHideFromActor', InAttributes, CurObjective)
    {
        // End:0x82
        if(CurObjective != none)
        {
            Obj = LPAIObjectiveHideFromActor(CurObjective);
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
    local /*0x97E50000-0x00000000*/ private editfixedsize array HideFrom;

    HideFrom.AddItem(ActorToHideFrom);    
    myCommand = Outer.CmdHideFromActor(HideFrom, HidingTime, MaxDistanceToSearchForHidingPlace,, 0);
    // End:0xB4
    if(myCommand != none)
    {
        myCommand.SetSPAIObjective(self);
        myCommand.HidingTime = HidingTime;
    }
    //return;    
}

defaultproperties
{
    MaxDistanceToSearchForHidingPlace=10000.0000000
    HidingTime=120.0000000
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIObjectiveHideFromActor.LPAICmdStatus_MoveToPosition_LPAIObjectiveKismetCircleActor0'
    begin object name=LPAICmdStatus_MoveToPosition_LPAIObjectiveKismetCircleActor0 class=Class'LPAICmdStatus_MoveToPosition'
    end object
    CmdStatus_Move=LPAICmdStatus_MoveToPosition_LPAIObjectiveKismetCircleActor0
    Attribute=(bRemoveWhenFinished=true)
}