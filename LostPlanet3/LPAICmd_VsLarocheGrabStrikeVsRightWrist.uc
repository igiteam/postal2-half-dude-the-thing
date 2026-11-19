class LPAICmd_VsLarocheGrabStrikeVsRightWrist extends LPAICmd_VsLarocheGrabStrikeBase within LPAIControllerVsLaroche;

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

function OnGrabStrikeEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    super.OnGrabStrikeEnd(FinishedSM, NextSM);
    //return;    
}

function GetMaxGrabTimeAginstThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfSawing[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.VsLarochePawn.TuneDataVsLaroche.MaxGrabingUrRightArmTime.GetValue();
    //return ReturnValue;    
}

function StartPostGrabStruggleMode()
{
    super.StartPostGrabStruggleMode();
    Outer.CmdStruggleVsShutDownVsWithTaserStrike(EnemyForStrike,, 1);
    //return;    
}

defaultproperties
{
    bInterruptible=false
}