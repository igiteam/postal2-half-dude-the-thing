class LPAIObjectiveDongoChargeAttack extends LPAIObjective within LPAIControllerDongo
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHaveValidData;

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bHaveValidData)
    {
        return false;
    }
    // End:0x22
    if(!super(SPAIObjective).IsValid())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function GetActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609], ReturnValue;

    // End:0x40
    if(Controller(inActor) != none)
    {
        return Controller(inActor).Pawn;
    }
    return inActor;
    //return ReturnValue;    
}

function InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData;

    super(SPAIObjective).InitFromKismet(InKismetObjectiveData);
    KismetData = LPAIOD_DongoChargeAttack(InKismetObjectiveData);
    bHaveValidData = KismetData != none;
    // End:0xA5
    if(bHaveValidData)
    {
        ActorToAttack = LPPawn(GetActor(KismetData.ActorToAttack));
        bHaveValidData = ActorToAttack != none;
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, Obj;

    // End:0x83
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveDongoChargeAttack', InAttributes, CurObjective)
    {
        // End:0x82
        if(CurObjective != none)
        {
            Obj = LPAIObjectiveDongoChargeAttack(CurObjective);
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
    InObjectiveManager.ImportantObjectiveAdded();
    return super(SPAIObjective).AllocateAndAddObjective(InObjectiveManager, InAttributes);
    //return ReturnValue;    
}

function StartCommandForChargeAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x69
    if(LPBaseVSPlayerPawn(ActorToAttack) == none)
    {
        return Outer.CmdPerformChargeAttackPof(ActorToAttack, -1.0000000, Outer.CmdStatus_ChargeAttack, 0);        
    }
    else
    {
        return Outer.CmdPerformChargeAttackVS(ActorToAttack, -1.0000000, Outer.CmdStatus_ChargeAttack, 0);
    }
    //return ReturnValue;    
}

protected function PerformObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    myCommand = StartCommandForChargeAttack();
    // End:0x43
    if(myCommand != none)
    {
        myCommand.SetSPAIObjective(self);
    }
    //return;    
}

event Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPAIObjective).Update(DeltaTime);
    MyObjectiveManager.ImportantObjectiveAdded();
    //return;    
}

defaultproperties
{
    Attribute=(bRemoveWhenFinished=true)
}