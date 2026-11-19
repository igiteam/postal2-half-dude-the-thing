class LPAICmd_Attack extends LPAICmd_Objective within LPAIController
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MyEnemyRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MyEnemyHeight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackStatus[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyForAttackActor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfAttemptsToFindWithDrawPointThisAttack[536870913];

function Pushed()
{
    Outer.StampTimeOfLastAttackStarted();
    super.Pushed();
    //return;    
}

function Popped()
{
    // End:0x78
    if(Outer.FindWithdrawToSpotTraversal != none)
    {
        Outer.FindWithdrawToSpotTraversal.Stop();
        Outer.FindWithdrawToSpotTraversal = none;
    }
    Outer.StampTimeOfLastAttackEnded();
    ForceCloseAllDodgeWindows();
    super.Popped();
    //return;    
}

event SPAborted()
{
    super(LPAICommand).SPAborted();
    ForceCloseAllDodgeWindows();
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    EnemyForAttack = InEnemy;
    EnemyForAttackActor = InEnemy;
    // End:0xB1
    if(EnemyForAttack != none)
    {
        MyEnemyRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(EnemyForAttack);
        MyEnemyHeight = EnemyForAttack.CylinderComponent.CollisionHeight;
        SetEnemyInControllerAndPawn();        
    }
    else
    {
        MyEnemyRadius = -1.0000000;
        MyEnemyHeight = -1.0000000;
    }
    ForceCloseAllDodgeWindows();
    //return;    
}

function SetDesiredEnemyActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609], EnemyPawn;
    local /*0x97E50000-0x00000000*/ private bool bNewEnemy;

    // End:0x23
    if(EnemyForAttackActor != InEnemy)
    {
        bNewEnemy = true;
    }
    EnemyForAttackActor = InEnemy;
    // End:0x8B
    if(EnemyForAttackActor != EnemyForAttack)
    {
        EnemyPawn = LPPawn(InEnemy);
        // End:0x8B
        if(EnemyPawn != none)
        {
            SetDesiredEnemy(EnemyPawn);
        }
    }
    ForceCloseAllDodgeWindows();
    // End:0xAC
    if(bNewEnemy)
    {
        OnNewEnemy();
    }
    //return;    
}

function OnNewEnemy()
{
    //return;    
}

protected function SetEnemyInControllerAndPawn()
{
    Outer.MyLPEnemy = EnemyForAttack;
    Outer.myAIPawn.EnemySelectedByAttackCommand = EnemyForAttack;
    Outer.Enemy = EnemyForAttack;
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    super.SetReturnCmdStatus(ReturnStatus);
    AttackStatus = LPAICmdStatus_Attack(ReturnStatus);
    //return;    
}

event EnemyForAttackLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return EnemyForAttack.Location;
    //return ReturnValue;    
}

function EnemyZDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Abs(Outer.myAIPawn.Location.Z - EnemyForAttackLocation().Z);
    //return ReturnValue;    
}

function EnemyRange2D()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return VSize2D(Outer.myAIPawn.Location - (EnemyForAttackLocation()));
    //return ReturnValue;    
}

function EnemyRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return VSize(Outer.myAIPawn.Location - (EnemyForAttackLocation()));
    //return ReturnValue;    
}

function EnemySeperation2D()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius;

    combinedRadius = Outer.MyKynapseRadius + MyEnemyRadius;
    return (EnemyRange2D()) - combinedRadius;
    //return ReturnValue;    
}

function ActorSeperation2D()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], enemyRadius, combinedRadius;

    // End:0x15
    if(EnemyToCheck == none)
    {
        return 0.0000000;
    }
    enemyRadius = Class'LPAIUtils'.static.KynapseAdjustedRadius(EnemyToCheck);
    combinedRadius = Outer.MyKynapseRadius + enemyRadius;
    return VSize2D(Outer.myAIPawn.Location - EnemyToCheck.Location) - combinedRadius;
    //return ReturnValue;    
}

function PointSeperation2D()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestPoint[8388609];
    local /*0x97E50000-0x00000000*/ private float TestRadius[9437185], ReturnValue, combinedRadius, Range2D;

    0.0000000
    combinedRadius = Outer.MyKynapseRadius + TestRadius;
    Range2D = VSize2D(Outer.myAIPawn.Location - TestPoint);
    return Range2D - combinedRadius;
    //return ReturnValue;    
}

function EnemySeperation()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius;

    combinedRadius = Outer.MyKynapseRadius + MyEnemyRadius;
    return (EnemyRange()) - combinedRadius;
    //return ReturnValue;    
}

function EnemySeperation2DTight()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius;

    combinedRadius = Outer.myAIPawn.CylinderComponent.CollisionRadius + EnemyForAttack.CylinderComponent.CollisionRadius;
    return (EnemyRange2D()) - combinedRadius;
    //return ReturnValue;    
}

function ConvertRangeToSeperation2D()
{
    local /*0x97E50000-0x00000000*/ private float RangeToConvert[8388609], ReturnValue, combinedRadius;

    combinedRadius = Outer.MyKynapseRadius + MyEnemyRadius;
    return RangeToConvert - combinedRadius;
    //return ReturnValue;    
}

function ConvertRangeToSeperation()
{
    local /*0x97E50000-0x00000000*/ private float RangeToConvert[8388609], ReturnValue, combinedRadius;

    combinedRadius = Outer.MyKynapseRadius + MyEnemyRadius;
    return RangeToConvert - combinedRadius;
    //return ReturnValue;    
}

function LPAICmd_Attack_Status()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];

    // End:0x62
    if((AttackStatus != none) && int(AttackStatus.Cmd_Attack_Error) < int(1))
    {
        AttackStatus.Cmd_Attack_Error = NewStatus;
    }
    // End:0x82
    if(int(NewStatus) >= int(1))
    {
        LPAICmd_Status(1);
    }
    //return;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess;

    ResourceAccess = SPAIResourceAccess(ResAccess);
    // End:0x7D
    if((ResourceAccess != none) && ResourceAccess == Outer.MeleeAccess)
    {
        Outer.bMeleePointMoved = true;        
    }
    else
    {
        // End:0xDB
        if((ResourceAccess != none) && ResourceAccess == Outer.RangedAccess)
        {
            Outer.bRangedPointMoved = true;
        }
    }
    return false;
    //return ReturnValue;    
}

function DoesThisAttackCommandCareIfItsFormationAccessHasChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function MoveAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsMyEnemyAlive();
    //return ReturnValue;    
}

function MoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MoveAbortCondition()) || !Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function ForceCloseAllDodgeWindows()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCtrl;

    // End:0xB1
    if(EnemyForAttack != none)
    {
        PlayerCtrl = LPPlayerController(EnemyForAttack.Controller);
        // End:0xB1
        if((PlayerCtrl != none) && PlayerCtrl.SpecialDodgeActor == Outer.myAIPawn)
        {
            PlayerCtrl.NotifyCloseAllDodgeWindows();
        }
    }
    Outer.myAIPawn.NotifyAllPlayerDodgeWindowsClosed();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super(LPAICommand).Resumed(OldCommandName);
    SetEnemyInControllerAndPawn();
    //return;    
}

function IsMyEnemyAlive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(EnemyForAttack != none)
    {
        return Outer.CanBeMyEnemy(EnemyForAttack);
    }
    // End:0x49
    if(EnemyForAttackActor == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function TimeToFaceEnemy()
{
    local /*0x97E50000-0x00000000*/ private float YawRateRadians[8388609], ToleranceAngleRadians, ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL Direction;
    local /*0x97E50000-0x00000000*/ private float SmallestAngle;

    0.0000000
    Class'SPEngine.SPUtil'.static.NormalizeRadian(ToleranceAngleRadians);
    Direction = (EnemyForAttackLocation()) - Outer.myAIPawn.Location;
    Direction.Z = 0.0000000;
    Direction = Normal(Direction);
    SmallestAngle = Vector(Outer.myAIPawn.Rotation) Dot Direction;
    SmallestAngle = Acos(SmallestAngle);
    SmallestAngle -= ToleranceAngleRadians;
    // End:0x14C
    if(SmallestAngle < float(0))
    {
        SmallestAngle = 0.0000000;
    }
    return SmallestAngle / YawRateRadians;
    //return ReturnValue;    
}

final function StartTryingToFindingWithDrawPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL displacementToLocationToStartLookingForWithDrawPoint;
    local /*0x97E50000-0x00000000*/ private float DistanceAwayToStartLookingForWithdrawPoint;
    local /*0x97E50000-0x00000000*/ private @NULL locationToStartLookingForWithDrawPoint;

    displacementToLocationToStartLookingForWithDrawPoint = Outer.myAIPawn.Location - EnemyForAttack.Location;
    displacementToLocationToStartLookingForWithDrawPoint.Z = 0.0000000;
    displacementToLocationToStartLookingForWithDrawPoint = Normal(displacementToLocationToStartLookingForWithDrawPoint);
    DistanceAwayToStartLookingForWithdrawPoint = Outer.myAIPawn.TuneDataAIPawn.DistanceAwayToStartLookingForWithdrawPoint.GetValue();
    displacementToLocationToStartLookingForWithDrawPoint = displacementToLocationToStartLookingForWithDrawPoint * DistanceAwayToStartLookingForWithdrawPoint;
    locationToStartLookingForWithDrawPoint = displacementToLocationToStartLookingForWithDrawPoint + EnemyForAttack.Location;
    Outer.StartFindWithdrawToSpotTraversal(EnemyForAttack, locationToStartLookingForWithDrawPoint, Outer.myAIPawn.TuneDataAIPawn.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPoint.GetValue());
    //return;    
}

final function StartProcessWidthdrawFromFightMonitorTimer()
{
    // End:0x5D
    if(!Outer.bDisableAI && !IsProcessWidthdrawFromFightMonitorTimerActive())
    {
        Outer.SetTimer(0.0100000, true, 'ProcessWidthdrawFromFightMonitorTimer', self);
    }
    //return;    
}

final function StopProcessWidthdrawFromFightMonitorTimer()
{
    Outer.ClearTimer('ProcessWidthdrawFromFightMonitorTimer', self);
    //return;    
}

function PauseProcessWidthdrawFromFightMonitorTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopProcessWidthdrawFromFightMonitorTimer();        
    }
    else
    {
        StartProcessWidthdrawFromFightMonitorTimer();
    }
    //return;    
}

final function IsProcessWidthdrawFromFightMonitorTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('ProcessWidthdrawFromFightMonitorTimer', self);
    //return ReturnValue;    
}

private final function ProcessWidthdrawFromFightMonitorTimer()
{
    ProcessWidthdrawFromFightMonitor();
    //return;    
}

function ProcessWidthdrawFromFightMonitor()
{
    //return;    
}

function @NULL DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];
    local /*0x97E50000-0x00000400*/ private editfixedsize array ComponentArray;
    local /*0x97E50000-0x00000400*/ private @NULL DebugComponent, ToolTip;
    local /*0x97E50000-0x00000000*/ private float ReachTime;

    super(LPAICommand).DrawDebug(InHUD);
    // End:0x6E
    if(!InHUD.GetDebugModeManager().GetDebugMode().IsFlagEnabled('CmdAttack'))
    {
        return;
    }
    // End:0xB6
    if(ChildCommand != none)
    {
        // End:0xB6
        if(Outer.LPFindFirstAICommandOfClassInStack(Class'LPAICmd_Attack', ChildCommand) != none)
        {
            return;
        }
    }
    // End:0x37C
    if(EnemyForAttack != none)
    {
        Outer.myAIPawn.GetComponentsOfClass(Class'SPEngine.SPDebugComponentPawn', ComponentArray);
        // End:0x139
        if(ComponentArray.Length > 0)
        {
            DebugComponent = SPDebugComponentPawn(ComponentArray[0]);
        }
        // End:0x37C
        if(DebugComponent != none)
        {
            ToolTip = DebugComponent.GetTooltip(InHUD);
            ToolTip.Draw2DTextLn("Seperation : " $ string(EnemySeperation2D()),, ToolTip.YellowColor);
            // End:0x274
            if(Outer.GetStrikeResourceReachTime(ReachTime, EnemyForAttack))
            {
                ToolTip.Draw2DTextLn("Strike Reach time : " $ string(ReachTime),, ToolTip.YellowColor);
            }
            // End:0x2F3
            if(Outer.HaveStrikeAccess())
            {
                ToolTip.Draw2DTextLn("Have Strike Access : ",, ToolTip.RedColor);                
            }
            else
            {
                ToolTip.Draw2DTextLn("Strike Access is with : " $ string(Outer.GetStrikeResourceHolder(EnemyForAttack)),, ToolTip.YellowColor);
            }
        }
    }
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        //return;        
    }
    stop;    
}
