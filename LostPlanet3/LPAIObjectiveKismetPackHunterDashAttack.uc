class LPAIObjectiveKismetPackHunterDashAttack extends LPAIObjective within LPAIController
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TheEnemy;

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((LPAIControllerPackHunter(Outer) != none) && TheEnemy != none) && super(SPAIObjective).IsValid();
    //return ReturnValue;    
}

function InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData, InEnemy;

    TheEnemy = none;
    KismetData = LPAIOD_PackHunterDashAttack(InKismetObjectiveData);
    // End:0xCF
    if(KismetData != none)
    {
        InEnemy = KismetData.TheEnemy;
        // End:0xB3
        if(Controller(InEnemy) != none)
        {
            TheEnemy = LPPlayerPawn(Controller(InEnemy).Pawn);            
        }
        else
        {
            TheEnemy = LPPlayerPawn(InEnemy);
        }
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, AttackObjective;

    // End:0x83
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetPackHunterDashAttack', InAttributes, CurObjective)
    {
        // End:0x82
        if(CurObjective != none)
        {
            AttackObjective = LPAIObjectiveKismetPackHunterDashAttack(CurObjective);
            // End:0x82
            if(AttackObjective != none)
            {                
                return AttackObjective;
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
    local /*0x97E50000-0x00000000*/ private @NULL ResSurroundLocation, PackHunterController;
    local /*0x97E50000-0x00000000*/ private float minDmg, maxDmg;
    local /*0x97E50000-0x00000000*/ private @NULL myCommand;

    PackHunterController = LPAIControllerPackHunter(Outer);
    Status = 4;
    // End:0x23B
    if((PackHunterController != none) && TheEnemy != none)
    {
        minDmg = PackHunterController.PHPawn.TuneDataPackHunter.MinAmountOfDamageRequiredToStopAttack.GetValue();
        maxDmg = PackHunterController.PHPawn.TuneDataPackHunter.MaxAmountOfDamageRequiredToStopAttack.GetValue();
        ResSurroundLocation = none;
        // End:0x18C
        if(PackHunterController.HaveMeleeAccess())
        {
            ResSurroundLocation = LPAIResMultiLocation(Outer.MeleeAccess.GetResource());
        }
        myCommand = PackHunterController.CmdPerformDashAttackPof(TheEnemy, 1, 1, minDmg, maxDmg, ResSurroundLocation, none, vect(0.0000000, 0.0000000, 0.0000000), false, 1);
        // End:0x207
        if(myCommand == none)
        {
            Status = 4;
        }
        // End:0x23B
        if(int(Status) != int(4))
        {
            myCommand.SetSPAIObjective(self);
        }
    }
    //return;    
}

defaultproperties
{
    Attribute=(bRemoveWhenFinished=true)
}