class LPGRI_Scenario_MP extends LPGRI_TDM_MP
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

defaultproperties
{
    GameType=EMPGameType.EMPGT_Scenario
    GameEndCondition=(WinCondition=eEndGameWinCondition.eEndGameWinCondition_ObjectivesMet)
}