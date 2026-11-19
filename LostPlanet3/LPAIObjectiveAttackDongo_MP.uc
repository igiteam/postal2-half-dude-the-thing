class LPAIObjectiveAttackDongo_MP extends LPAIObjectiveAttackDongoBase within LPAIController
    config(AI)
    hidecategories(Object,Object);

function CmdAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand, DongoMelee;

    Outer.CmdStatus_Attack
    0
    myCommand = super.CmdAttack(EnemyPawn, CmdStatus, CmdOption);
    DongoMelee = LPAICmd_CrabMelee(myCommand);
    // End:0xE2
    if(DongoMelee != none)
    {
        DongoMelee.SetCanStrikeBeforeReachingMeleeSlot(true);
        DongoMelee.SetForcedDirectAttack(true);
        DongoMelee.DisableMeleeAccess(true);
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    AttackCmdTable=/* Array type was not detected. */
    Attribute=(GameType=SPAIObjectiveGameType.SPAI_OBJ_GAMETYPE_MULTI_PLAYER)
}