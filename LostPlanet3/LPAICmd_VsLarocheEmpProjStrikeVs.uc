class LPAICmd_VsLarocheEmpProjStrikeVs extends LPAICmd_VsLarocheEmpProjStrike within LPAIControllerVsLaroche;

function Pushed()
{
    Outer.HandleBossFightPhaseEventMessage(Outer.MyLPEnemy, 19);
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function GetSmForStrike()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    Outer.VsLarochePawn.SetAimInfoForDirectFireStrike(EnemyForStrike.Location, EnemyForStrike, Outer.VsLarochePawn.GetDirectFireStrikeTierForCurrentAttack(), Outer.VsLarochePawn.GetDirectFireStrikeZoneForCurrentAttack(), Outer.VsLarochePawn.TuneDataVsLaroche.HieghtOffTargetPointForEmpPulseFire);
    return Class'LPSM_VsLarocheLaunchEmpPulse';
    //return ReturnValue;    
}

defaultproperties
{
    bInterruptible=false
}