class LPAIObjectiveKismetDefend extends LPAIObjective within LPAIController
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private @NULL DefendVolume[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private bool bIgnoreEnemiesUnlessInDefendVolume[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private bool bIgnoreEnemiesNotOnNAVMesh[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private bool bUseAggressiveIndicator[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private bool bHaveValidData[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private @NULL ThingToFocusOnWhenNoEnemy[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private float HowCloseToLocationToTryAndStay[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private float HowCloseToLetEnemiesGetBeforeAttacking[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private float DamageThresholdBeforeEndingCommand[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private editfixedsize array MovesToPlay[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private float HowCloseToLetGrenadesGetBeforeAttacking[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private float MinTimeToWaitAtNode[65537];
var(0.25_Pct) /*0x7A2E0000-0x00000000*/ private float MaxTimeToWaitAtNode[65537];

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xE0
    if((((int(Attribute.PriorityCategory) < int(7)) && Outer.DelayDefendActor != none) && Outer.DelayDefendActor.IsAliveAndWell()) && Outer.WorldInfo.TimeSeconds < Outer.DelayDefendTime)
    {
        return false;
    }
    return bHaveValidData && super(SPAIObjective).IsValid();
    //return ReturnValue;    
}

function OnWantsToAttackEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyToAttack[8388609];

    Outer.DelayDefendTime = Outer.WorldInfo.TimeSeconds + float(3);
    Outer.DelayDefendActor = EnemyToAttack;
    //return;    
}

event IsBetterThan()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x8B
    if(((int(Attribute.PriorityCategory) < int(7)) && Other.IsActive()) && int(Other.Attribute.PriorityCategory) >= int(5))
    {
        return false;
    }
    // End:0xA3
    if(super(SPAIObjective).IsBetterThan(Other))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData, AIPawn;

    KismetData = LPAIOD_Defend(InKismetObjectiveData);
    bHaveValidData = KismetData != none;
    // End:0x2DA
    if(bHaveValidData)
    {
        DefendVolume = KismetData.DefendVolume;
        bIgnoreEnemiesUnlessInDefendVolume = KismetData.bIgnoreEnemiesUnlessInDefendVolume;
        bIgnoreEnemiesNotOnNAVMesh = KismetData.bIgnoreEnemiesNotOnNAVMesh;
        // End:0x20D
        if(DefendVolume != none)
        {
            ThingToFocusOnWhenNoEnemy = DefendVolume.ThingToFocusOnWhenNoEnemy;
            HowCloseToLocationToTryAndStay = DefendVolume.HowCloseToLocationToTryAndStay;
            HowCloseToLetEnemiesGetBeforeAttacking = DefendVolume.HowCloseToLetEnemiesGetBeforeAttacking;
            DamageThresholdBeforeEndingCommand = DefendVolume.DamageThresholdBeforeEndingCommand;
            HowCloseToLetGrenadesGetBeforeAttacking = DefendVolume.HowCloseToLetGrenadesGetBeforeAttacking;
            bUseAggressiveIndicator = DefendVolume.bUseAggressiveIndicator;
            MinTimeToWaitAtNode = DefendVolume.MinTimeToWaitAtNode;
            MaxTimeToWaitAtNode = DefendVolume.MaxTimeToWaitAtNode;
        }
        AIPawn = LPAIPawn(Outer.Pawn);
        // End:0x28A
        if(AIPawn != none)
        {
            MovesToPlay = AIPawn.TuneDataAIPawn.DefendVolumeMovesToPlay;
        }
        bHaveValidData = (((DefendVolume != none) && HowCloseToLocationToTryAndStay > float(0)) && HowCloseToLetEnemiesGetBeforeAttacking > float(0)) && DamageThresholdBeforeEndingCommand > float(0);
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, ReturnValue, CurObjective, Obj;

    // End:0x83
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetDefend', InAttributes, CurObjective)
    {
        // End:0x82
        if(CurObjective != none)
        {
            Obj = LPAIObjectiveKismetDefend(CurObjective);
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
    local /*0x97E50000-0x00000000*/ private @NULL myCommand, LocationToWaitAt, DefendNode;
    local /*0x97E50000-0x00000000*/ private bool bRandomizeMovesToPlay;

    // End:0x1B
    if(DefendVolume == none)
    {
        Abort();
        return;
    }
    LocationToWaitAt = DefendVolume.GetBestDefendPositionActor(LPAIPawn(Outer.Pawn));
    // End:0x87
    if(LocationToWaitAt == none)
    {
        Abort();
        return;
    }
    DefendNode = LPAIDefendNode(LocationToWaitAt);
    // End:0x28D
    if(DefendNode != none)
    {
        // End:0xFE
        if(DefendNode.ThingToFocusOnWhenNoEnemy != none)
        {
            ThingToFocusOnWhenNoEnemy = DefendNode.ThingToFocusOnWhenNoEnemy;
        }
        // End:0x14C
        if(DefendNode.HowCloseToLetEnemiesGetBeforeAttacking != float(0))
        {
            HowCloseToLetEnemiesGetBeforeAttacking = DefendNode.HowCloseToLetEnemiesGetBeforeAttacking;
        }
        // End:0x19A
        if(DefendNode.HowCloseToLetGrenadesGetBeforeAttacking != float(0))
        {
            HowCloseToLetGrenadesGetBeforeAttacking = DefendNode.HowCloseToLetGrenadesGetBeforeAttacking;
        }
        // End:0x1E8
        if(DefendNode.MinTimeToWaitAtNode >= float(0))
        {
            MinTimeToWaitAtNode = DefendNode.MinTimeToWaitAtNode;
        }
        // End:0x236
        if(DefendNode.MaxTimeToWaitAtNode >= float(0))
        {
            MaxTimeToWaitAtNode = DefendNode.MaxTimeToWaitAtNode;
        }
        // End:0x263
        if(DefendNode.bUseNodeRotation)
        {
            ThingToFocusOnWhenNoEnemy = none;
        }
        bRandomizeMovesToPlay = DefendNode.bRandomizeMovesToPlay;
    }
    myCommand = Outer.CmdDefend(DefendVolume, LocationToWaitAt, ThingToFocusOnWhenNoEnemy, HowCloseToLetEnemiesGetBeforeAttacking, HowCloseToLetGrenadesGetBeforeAttacking, HowCloseToLocationToTryAndStay, DamageThresholdBeforeEndingCommand, bRandomizeMovesToPlay, MovesToPlay, MinTimeToWaitAtNode, MaxTimeToWaitAtNode, bIgnoreEnemiesUnlessInDefendVolume, bIgnoreEnemiesNotOnNAVMesh,, 0);
    // End:0x360
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

    Obj = LPAIObjectiveKismetDefend(default.Class.static.AllocateAndAddObjective(InObjectiveManager, InAttributes));
    // End:0x72
    if(Obj != none)
    {
        Obj.UpdateRating();
    }
    //return;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes, Obj, MySquad;

    // End:0x4A
    if((int(InAttributes.PriorityCategory) <= int(6)) && IsAttackingEnemy(OuterController, InObjectiveManager))
    {
        return;
    }
    MySquad = LPSquad(OuterController.Squad);
    // End:0x8A
    if(MySquad != none)
    {
    }
    Obj = FindExistingObjective(InObjectiveManager, InAttributes);
    // End:0xE1
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
    HowCloseToLocationToTryAndStay=200.0000000
    HowCloseToLetEnemiesGetBeforeAttacking=1000.0000000
    DamageThresholdBeforeEndingCommand=50.0000000
    Attribute=(bRemoveWhenFinished=true)
}