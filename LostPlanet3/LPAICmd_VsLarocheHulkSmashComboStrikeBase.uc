class LPAICmd_VsLarocheHulkSmashComboStrikeBase extends LPAICmd_VsLarocheComboStrikeBase within LPAIControllerVsLaroche;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGotBloackedParriedCounterOrSomethingLikeThat[536870913];

function Pushed()
{
    Outer.bDidLastStrikeOfLastComboLand = false;
    bGotBloackedParriedCounterOrSomethingLikeThat = false;
    super.Pushed();
    Outer.PawnZeroVelocity();
    //return;    
}

function Popped()
{
    // End:0x2E
    if(bGotBloackedParriedCounterOrSomethingLikeThat)
    {
        Outer.bDidLastStrikeOfLastComboLand = false;
    }
    super.Popped();
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0xEE
    if((EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0xEE
        if((Info.Impact.HitActor == EnemyForStrike) && Outer.VsLarochePawn != none)
        {
            // End:0xEE
            if(CurrentStrikeIndex == (CombosStrikes.Length - 1))
            {
                Outer.bDidLastStrikeOfLastComboLand = true;
            }
        }
    }
    super(LPAICmd_VsLarocheStrikeBase).MeleeHitSomethingNew(Info);
    //return;    
}

function NotifyPreActiveDefenseSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL CombatWindow[25296897], Activator;

    bGotBloackedParriedCounterOrSomethingLikeThat = true;
    Outer.bDidLastStrikeOfLastComboLand = false;
    //return;    
}
