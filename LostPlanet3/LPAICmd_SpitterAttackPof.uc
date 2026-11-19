class LPAICmd_SpitterAttackPof extends LPAICmd_SpitterAttack within LPAIControllerSpitter;

function Pushed()
{
    super.Pushed();
    AttackSeperation_SpitAttack = Outer.SpitterPawn.AttackSeperation_SpitAttackPof;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetTunables()
{
    super.SetTunables();
    AttackSeperation_SpitAttack = Outer.SpitterPawn.AttackSeperation_SpitAttackPof;
    AttackSeperation_TailSting = Outer.SpitterPawn.AttackSeperation_TailStingPof;
    TailStingForwardArcDot = Outer.SpitterPawn.TailStingForwardArcDot;
    AttackSeperation_TalonAttackNormal = Outer.SpitterPawn.AttackSeperation_TalonAttackPof;
    AttackSeperation_TalonAttackReactive = Outer.SpitterPawn.AttackSeperation_TalonAttackReactivePof;
    AttackSeperation_ChargeAttack = Outer.SpitterPawn.AttackSeperation_TalonAttackReactivePof;
    AttackSelectionNotResined = Outer.SpitterPawn.AttackSelectionPofNotResined;
    AttackSelectionNotResinedSpitDisabled = Outer.SpitterPawn.AttackSelectionPofNotResinedSpitDisabled;
    AttackSelectionNotResinedTailDisabled = Outer.SpitterPawn.AttackSelectionPofNotResinedTailDisabled;
    AttackSelectionResined = Outer.SpitterPawn.AttackSelectionPofResined;
    AttackSelectionTailBurning = Outer.SpitterPawn.AttackSelectionPofTailBurning;
    AttackSeperation_ReactiveTailSting.Min = AttackSeperation_TalonAttackReactive.Max;
    AttackSeperation_ReactiveTailSting.Max = AttackSeperation_TailSting.Min;
    StalkSpeedScale = Outer.SpitterPawn.StalkSpeedScalePof;
    AttackSpeedScale = Outer.SpitterPawn.AttackSpeedScalePof;
    //return;    
}

function StartCommandForChargeAttack()
{
    Outer.CmdPerformChargeAttackPof(EnemyForAttack, -1.0000000, Outer.CmdStatus_ChargeAttack, 1);
    //return;    
}
