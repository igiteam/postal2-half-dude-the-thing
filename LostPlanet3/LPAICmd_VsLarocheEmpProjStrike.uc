class LPAICmd_VsLarocheEmpProjStrike extends LPAICmd_VsLarocheStrikeBase within LPAIControllerVsLaroche;

function Pushed()
{
    super.Pushed();
    Outer.VsLarochePawn.EnableWinchPoints(true);
    //return;    
}

function Popped()
{
    Outer.VsLarochePawn.EnableWinchPoints(false);
    super.Popped();
    //return;    
}
