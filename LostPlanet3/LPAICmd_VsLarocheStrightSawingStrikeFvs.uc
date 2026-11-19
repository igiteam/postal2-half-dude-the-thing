class LPAICmd_VsLarocheStrightSawingStrikeFvs extends LPAICmd_VsLarocheStrightSawingStrike within LPAIControllerVsLaroche;

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
    //return;    
}

function StopMeleeStrikeSM()
{
    //return;    
}

function GetMaxSawTimeAginstThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfSawing[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.VsLarochePawn.TuneDataVsLaroche.MaxStrightSawingTimePerStrikeFvs.GetValue();
    //return ReturnValue;    
}

defaultproperties
{
    bInterruptible=false
}