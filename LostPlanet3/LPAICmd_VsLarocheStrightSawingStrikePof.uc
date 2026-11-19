class LPAICmd_VsLarocheStrightSawingStrikePof extends LPAICmd_VsLarocheStrightSawingStrike within LPAIControllerVsLaroche;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function StartMeleeStrikeSM()
{
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheSawArmSawing', true, false, None);
    //return;    
}

function StopMeleeStrikeSM()
{
    Outer.VsLarochePawn.EndSpecialMove(Class'LPSM_VsLarocheSawArmSawing');
    //return;    
}

function GetMaxSawTimeAginstThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfSawing[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.VsLarochePawn.TuneDataVsLaroche.MaxStrightSawingTimePerStrikePof.GetValue();
    //return ReturnValue;    
}

defaultproperties
{
    bInterruptible=false
}