class LPSM_VsLarocheArmSwingEndBase extends LPSM_VsLarocheArmSwingBase
    abstract
    config(Game);

function IsAnimTimeInRangeForCombo()
{
    local /*0x97E50000-0x00000000*/ private float AnimPercent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MyVsLaPawn.bPerformingMultiMoveMeleeStrike = false;
    super.SpecialMoveEnded(PrevMove, NextMove);
    MyVsLaPawn.NotifyAIOfMeleeSwingEnd();
    //return;    
}

defaultproperties
{
    bStartsComboSpecialMoveInstantly=true
}