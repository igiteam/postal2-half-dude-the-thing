class LPAICmd_VsLarocheCombo2Strike extends LPAICmd_VsLarocheComboStrikeBase within LPAIControllerVsLaroche;

function Pushed()
{
    WhichComboTypeIsThis = 8;
    super.Pushed();
    CombosStrikes = Outer.VsLarochePawn.TuneDataVsLaroche.Combo2StrikeInfo.Strikes;
    StrikeKnocksOutOfBlock = Outer.VsLarochePawn.TuneDataVsLaroche.Combo2StrikeInfo.ShouldStrikeKnockVSPlayerOutOfBlock;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}
