class LPGRI_Survival_MP extends LPGRI_TDM_MP
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

defaultproperties
{
    GameType=EMPGameType.EMPGT_Survival
    GameEndCondition=(WinCondition=eEndGameWinCondition.eEndGameWinCondition_TeamCredits)
}