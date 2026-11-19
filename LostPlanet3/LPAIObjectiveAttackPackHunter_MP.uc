class LPAIObjectiveAttackPackHunter_MP extends LPAIObjectiveAttackPackHunterBase within LPAIController
    config(AI)
    hidecategories(Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxStepHeight[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OffNavMeshPenalty[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CloserPackHunterPenality[131073];

function CmdAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand, PHMelee;

    Outer.CmdStatus_Attack
    0
    myCommand = super.CmdAttack(EnemyPawn, CmdStatus, CmdOption);
    PHMelee = LPAICmd_PackHunterMelee(myCommand);
    // End:0xA2
    if(PHMelee != none)
    {
        PHMelee.SetCanStrikeBeforeReachingMeleeSlot(true);
    }
    return myCommand;
    //return ReturnValue;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;

    // End:0x68
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) == int(NM_Standalone))
    {
        super(LPAIObjectiveAttackActor).GenerateObjectives(OuterController, InObjectiveManager, InAttributes);        
    }
    else
    {
        GenerateSingleObjective(OuterController, InObjectiveManager, InAttributes);
    }
    //return;    
}

function UpdateRating()
{
    // End:0x4D
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) == int(NM_Standalone))
    {
        super(LPAIObjectiveAttack).UpdateRating();        
    }
    else
    {
        Rating = 1.0000000;
    }
    //return;    
}

defaultproperties
{
    MaxStepHeight=100.0000000
    OffNavMeshPenalty=100.0000000
    CloserPackHunterPenality=50.0000000
    MinimumAttackTimeBeforeSwitchingEnemies=2.0000000
    AttackCmdTable=/* Array type was not detected. */
    Attribute=(GameType=SPAIObjectiveGameType.SPAI_OBJ_GAMETYPE_MULTI_PLAYER)
}