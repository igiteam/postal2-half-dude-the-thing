class LPSeqEvent_TakeDamage extends SPSeqEvent_TakeDamage
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x84090000-0x00000000*/ private bool OnlyWhenAttackingPlayer[65537];

function HandleDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL InOriginator[8388609], InInstigator;
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private int inAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatorAICtrl;

    // End:0x67
    if(OnlyWhenAttackingPlayer)
    {
        InstigatorAICtrl = SPGFCoverAIController(InInstigator);
        // End:0x67
        if(InstigatorAICtrl != none)
        {
            // End:0x67
            if(LPPlayerPawn(InstigatorAICtrl.MainEnemy) == none)
            {
                return;
            }
        }
    }
    super(SeqEvent_TakeDamage).HandleDamage(InOriginator, InInstigator, inDamageType, inAmount);
    //return;    
}

defaultproperties
{
    ObjName="Take Damage (LP)"
}