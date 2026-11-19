class LPAIObjectiveKismetCircleActor extends LPAIObjective within LPAIController
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x7A2D0000-0x00000000*/ private @NULL ActorToCircle[65537];
var(0.25_Pct) /*0x7A2D0000-0x00000000*/ private float DistanceToCircle[65537];
var(0.25_Pct) /*0x7A2D0000-0x00000000*/ private float CirclingTime[65537];
var(0.25_Pct) /*0x7A2D0000-0x00000000*/ private bool bHaveValidData[65537];
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
    KismetData = LPAIOD_CircleActor(InKismetObjectiveData);
    bHaveValidData = KismetData != none;
    // End:0x101
    if(bHaveValidData)
    {
        ActorToCircle = KismetData.ActorToCircle;
        DistanceToCircle = KismetData.DistanceToCircle;
        CirclingTime = KismetData.CirclingTime;
        bHaveValidData = (ActorToCircle != none) && DistanceToCircle > float(0);
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, Obj;

    // End:0x83
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetCircleActor', InAttributes, CurObjective)
    {
        // End:0x82
        if(CurObjective != none)
        {
            Obj = LPAIObjectiveKismetCircleActor(CurObjective);
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

    CmdStatus_Move.SetDefaults();
    myCommand = Outer.CmdCircleActor(ActorToCircle, DistanceToCircle, DistanceToCircle * 1.1000000, CmdStatus_Move, 0);
    // End:0xCC
    if(myCommand != none)
    {
        myCommand.SetSPAIObjective(self);
        myCommand.CirclingTime = CirclingTime;
    }
    //return;    
}

defaultproperties
{
    DistanceToCircle=1000.0000000
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIObjectiveKismetCircleActor.LPAICmdStatus_MoveToPosition_LPAIObjectiveKismetCircleActor0'
    begin object name=LPAICmdStatus_MoveToPosition_LPAIObjectiveKismetCircleActor0 class=Class'LPAICmdStatus_MoveToPosition'
    end object
    CmdStatus_Move=LPAICmdStatus_MoveToPosition_LPAIObjectiveKismetCircleActor0
    Attribute=(bRemoveWhenFinished=true)
}