class LPAICmd_SentinelTactical extends LPAICmd_StationaryEngagement within LPAIControllerSentinel;

function Pushed()
{
    Outer.myAIPawn.HeadTrackComponent.LookInfo.Mode = 1;
    Outer.myAIPawn.HeadTrackComponent.LookAtActor = Outer.Enemy;
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.myAIPawn.HeadTrackComponent.LookInfo.Mode = 0;
    Outer.myAIPawn.HeadTrackComponent.LookAtActor = none;
    Outer.bFinishedSearch = false;
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetDefaultAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.SentinelPawn.TuneDataSentinel.DefaultStrikeRange;
    //return ReturnValue;    
}

function GetStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    -1.0000000
    false
    // End:0x5B
    if(Outer.DesignerInStealthMode)
    {
        Outer.StrikeResourceName = 'SentinelStealthStrike';        
    }
    else
    {
        Outer.StrikeResourceName = 'strike';
    }
    super(LPAICommand).GetStrikeAccess(TheEnemy, RevokeTolerance, bForced);
    Outer.LockStrikeAccess(false);
    //return;    
}

function ShouldAbortFlee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    GetStrikeAccess(EnemyForAttack);
    return Outer.HaveStrikeAccess() && HasAttackWaitTimerExpired();
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Outer.HandlePossiblityOfNeedingToTurtle(EnemyForAttack, HitCoreIndex, AmountOfDamage, TypeOfDamage);
    return false;
    //return ReturnValue;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Outer.HandlePossiblityOfNeedingToTurtle(EnemyForAttack, -1, AmountOfDamage, TypeOfDamage);
    return false;
    //return ReturnValue;    
}

function HasEnoughTimePassedBetweenMedRangeSlowPreyDownAttacks()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x58
    if(Outer.WorldInfo.TimeSeconds > Outer.TimeAllowedNextMedRangeStrike)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL tInfo;
    local /*0x97E50000-0x00000000*/ private int TargetIndex;
    local /*0x97E50000-0x00000000*/ private @NULL NewDesiredRotation;

    super(LPAICommand).LPCommandTick(DeltaTime);
    TargetIndex = MyController.GetTargetIndex(EnemyForAttack);
    // End:0x77
    if(TargetIndex < 0)
    {
        MyController.AbortCommand(self);
        return;
    }
    tInfo = MyController.TargetList[TargetIndex];
    // End:0x1C9
    if((Outer.WorldInfo.TimeSeconds - tInfo.LastSeenTime) > Outer.SentinelPawn.TuneDataSentinel.MaxTimeToKeepUnseenEnemy.GetValue())
    {
        MyController.RemoveEnemy(EnemyForAttack);
        MyController.AbortCommand(self);
        Outer.bFinishedSearch = false;
        return;
    }
    Outer.SentinelPawn.StemSkelControl.ControlStrength = 1.0000000;
    NewDesiredRotation = Outer.SentinelPawn.StemSkelControl.BoneRotation;
    NewDesiredRotation.Yaw = Rotator(MyController.Enemy.Location - Outer.MySPPawn.Location) - Outer.MySPPawn.Rotation.Yaw;
    Outer.SentinelPawn.StemSkelControl.BoneRotation = RInterpTo(Outer.SentinelPawn.StemSkelControl.BoneRotation, NewDesiredRotation, DeltaTime, 2.5000000);
    //return;    
}

defaultproperties
{
    MinAttackRange=100.0000000
    MaxAttackRange=150.0000000
}