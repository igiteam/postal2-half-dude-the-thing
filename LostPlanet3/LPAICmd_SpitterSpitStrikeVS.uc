class LPAICmd_SpitterSpitStrikeVS extends LPAICmd_SpitterSpitStrike within LPAIControllerSpitter;

function Pushed()
{
    super.Pushed();
    ErrorInAiming_Min = Outer.SpitterPawn.ErrorInAimingVS_Min;
    ErrorInAiming_Max = Outer.SpitterPawn.ErrorInAimingVS_Max;
    AimingErrorCorrectionSpeed = Outer.SpitterPawn.AimingErrorCorrectionSpeedVS;
    Outer.SpitterPawn.SetWinchPointEnabledByIndex(0, true);
    //return;    
}

function Popped()
{
    Outer.SpitterPawn.SetWinchPointEnabledByIndex(0, false);
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function GetTargetPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], pos;

    // End:0x75
    if(!EnemyForStrike.Mesh.GetSocketWorldLocationAndRotation('CenterGlass', pos))
    {
        pos = EnemyForStrike.Location;
    }
    return pos;
    //return ReturnValue;    
}

function TargetSpit()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    CurSpitTarget = GetTargetPosition();
    Outer.SpitterPawn.SetSpitTargetPosition(CurSpitTarget);
    //return;    
}

function AdjustmentToAimError()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

function MoveClose()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ManeuverForAttack(Outer.SpitterPawn.AttackSeperation_SpitAttackVs.Min, Outer.SpitterPawn.AttackSeperation_SpitAttackVs.Max, EnemyForStrike);
    //return ReturnValue;    
}

state SpitStart
{
    function MoveInRange()
    {
        //return;        
    }
    stop;    
}

state SpitHold
{
    function SetFinishTime()
    {
        local /*0x97E50000-0x00000000*/ private float TimeToHold;

        TimeToHold = RandRange(Outer.SpitterPawn.Duration_SpitAttackVs_Min, Outer.SpitterPawn.Duration_SpitAttackVs_Max);
        Outer.SetTimer(TimeToHold, false, 'FinishHold', self);
        //return;        
    }
    stop;    
}

defaultproperties
{
    LPSMClassSpitStart=Class'LPSM_SpitterSpitAttackVS'
    LPSMClassSpitHold=Class'LPSM_SpitterSpitAttackVSHold'
    LPSMClassSpitFinish=Class'LPSM_SpitterSpitAttackVSFinish'
    bDoTransitionInToAttack=false
    bCanDoReactiveAttacksDuringTransition=false
    AttackCSA=eSpitterCSA.eSpitterCSA_AttackVs
}