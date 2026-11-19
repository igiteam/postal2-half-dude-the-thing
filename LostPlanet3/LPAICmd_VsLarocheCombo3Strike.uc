class LPAICmd_VsLarocheCombo3Strike extends LPAICmd_VsLarocheComboStrikeBase within LPAIControllerVsLaroche;

function Pushed()
{
    WhichComboTypeIsThis = 9;
    super.Pushed();
    CombosStrikes = Outer.VsLarochePawn.TuneDataVsLaroche.Combo3StrikeInfo.Strikes;
    StrikeKnocksOutOfBlock = Outer.VsLarochePawn.TuneDataVsLaroche.Combo3StrikeInfo.ShouldStrikeKnockVSPlayerOutOfBlock;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}
