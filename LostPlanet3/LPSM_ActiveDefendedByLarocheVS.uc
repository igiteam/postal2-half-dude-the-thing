class LPSM_ActiveDefendedByLarocheVS extends LPSM_ActiveDefenseLeaderVS
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatWindow;

function StartInteraction()
{
    CombatWindowInfo.CombatWindow = CombatWindow;
    super.StartInteraction();
    //return;    
}

defaultproperties
{
    // Reference: LPCombatWindow_ActiveDefense'Default__LPSM_ActiveDefendedByLarocheVS.CombatWindowObj'
    begin object name=CombatWindowObj class=Class'LPCombatWindow_ActiveDefense'
        WindowName="LarocheDefended"
    end object
    CombatWindow=CombatWindowObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
}