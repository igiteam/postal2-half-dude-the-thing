class LPGRI_TDM_MP extends LPGRI_Base_MP
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

// Export ULPGRI_TDM_MP::execIsPlayerEnemy(FFrame&, void* const)
native simulated function IsPlayerEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Player[8388609], TargetPawn;
    local /*0x97E50000-0x00000000*/ private bool bIgnoreHealth[9437185], ReturnValue;


}

defaultproperties
{
    GameType=EMPGameType.EMPGT_TeamDeathmatch
    GameEndCondition=(WinCondition=eEndGameWinCondition.eEndGameWinCondition_TeamScore)
}