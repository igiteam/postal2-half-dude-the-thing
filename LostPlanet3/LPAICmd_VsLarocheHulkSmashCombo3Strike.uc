class LPAICmd_VsLarocheHulkSmashCombo3Strike extends LPAICmd_VsLarocheHulkSmashComboStrikeBase within LPAIControllerVsLaroche;

function Pushed()
{
    WhichComboTypeIsThis = 22;
    super.Pushed();
    CombosStrikes = Outer.VsLarochePawn.TuneDataVsLaroche.HulkSmashCombo3StrikeInfo.Strikes;
    StrikeKnocksOutOfBlock = Outer.VsLarochePawn.TuneDataVsLaroche.HulkSmashCombo3StrikeInfo.ShouldStrikeKnockVSPlayerOutOfBlock;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}
