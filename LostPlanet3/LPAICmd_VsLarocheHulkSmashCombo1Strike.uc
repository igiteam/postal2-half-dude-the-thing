class LPAICmd_VsLarocheHulkSmashCombo1Strike extends LPAICmd_VsLarocheHulkSmashComboStrikeBase within LPAIControllerVsLaroche;

function Pushed()
{
    WhichComboTypeIsThis = 20;
    super.Pushed();
    CombosStrikes = Outer.VsLarochePawn.TuneDataVsLaroche.HulkSmashCombo1StrikeInfo.Strikes;
    StrikeKnocksOutOfBlock = Outer.VsLarochePawn.TuneDataVsLaroche.HulkSmashCombo1StrikeInfo.ShouldStrikeKnockVSPlayerOutOfBlock;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}
