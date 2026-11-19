class LPAICmd_VsLarocheStruggleVsStrikeBase extends LPAICmd_StruggleVsPlayerInitStrike within LPAIControllerVsLaroche;

function Pushed()
{
    super.Pushed();
    Outer.NumOfMeleeHitsLandedOnEnemySinceLastStruggleMode = 0;
    Outer.bDidLastStrikeOfLastComboLand = false;
    // End:0x96
    if(int(Outer.GetCurrentLarocheMacroCombatState()) == int(0))
    {
        Outer.ChangeCurrentLarocheMacroCombatState(1);
    }
    //return;    
}

function Popped()
{
    Outer.VsLarochePawn.LastTimeAttemptedToGrabOtherPawn = Outer.WorldInfo.TimeSeconds;
    super.Popped();
    //return;    
}

function NotifyCurrentTakeDamageWillShutdownVsOpponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL VsGoingToShutdown[8388609];
    local /*0x97E50000-0x00000000*/ private float NewDamage[8388609];

    EnemyForStrike.ServerEndSpecialMove(GetStruggleSpecialMoveClass());
    //return;    
}
