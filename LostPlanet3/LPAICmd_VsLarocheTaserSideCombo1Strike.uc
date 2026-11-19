class LPAICmd_VsLarocheTaserSideCombo1Strike extends LPAICmd_VsLarocheTaserSideComboStrikeBase within LPAIControllerVsLaroche;

function Pushed()
{
    WhichComboTypeIsThis = 15;
    super.Pushed();
    CombosStrikes = Outer.VsLarochePawn.TuneDataVsLaroche.TaserSideCombo1StrikeInfo.Strikes;
    StrikeKnocksOutOfBlock = Outer.VsLarochePawn.TuneDataVsLaroche.TaserSideCombo1StrikeInfo.ShouldStrikeKnockVSPlayerOutOfBlock;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}
