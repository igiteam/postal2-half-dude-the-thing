class LPAICmd_AttackViaAttackVolume extends LPAICmd_Attack within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbortRotation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAnimPlaying[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDelay[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInterpolating[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMoveAborted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableVolumeDraw[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackVolumeAccess[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GetClearenceAttempts[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WaitTimeBetweenClearenceAttempts[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxClearenceAttempts[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayAnimCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentFacing[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DesiredFacing[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PreInterpPos[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PreInterpRot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FinalInterpPos[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FinalInterpRot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FinalPawnPos[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FinalPawnRot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InterpTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InterpStartTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InterpEndTime[536870913];

function Pushed()
{
    super.Pushed();
    bMoveAborted = false;
    //return;    
}

function Popped()
{
    super.Popped();
    OnExit();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    OnExit();
    //return;    
}

function OnExit()
{
    ReleaseAccessToAttackVolume();
    Outer.myAIPawn.EnableLineSweepHitTester(false);
    AttackInfo.AttackVolume.hide();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

event GotoStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x26
    if(IsMyEnemyAlive())
    {
        GotoState(StateName, 'Begin');        
    }
    else
    {
        Outer.PopCommand(self);
    }
    //return;    
}

function ExitWithFaliure()
{
    LPAICmd_Attack_Status(1);
    Outer.PopCommand(self);
    //return;    
}

function GetAccessToAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1.0000000
    ReleaseAccessToAttackVolume();
    // End:0x8F
    if(AttackInfo.AttackVolume != none)
    {
        AttackVolumeAccess = AttackInfo.AttackVolume.GetAttackAccess(Outer.myAIPawn);
    }
    return HaveAccessToAttackVolume();
    //return ReturnValue;    
}

function ReleaseAccessToAttackVolume()
{
    UnLockAccessToAttackVolume();
    // End:0x43
    if(AttackVolumeAccess != none)
    {
        AttackVolumeAccess.Destroy();
        AttackVolumeAccess = none;
    }
    //return;    
}

function LockAccessToAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4F
    if(AttackVolumeAccess != none)
    {
        AttackVolumeAccess.Lock(true);
        return AttackVolumeAccess.IsLocked();
    }
    return false;
    //return ReturnValue;    
}

function UnLockAccessToAttackVolume()
{
    // End:0x2F
    if(AttackVolumeAccess != none)
    {
        AttackVolumeAccess.Lock(false);
    }
    //return;    
}

function HaveAccessToAttackVolume()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHaveAccess;

    bHaveAccess = IsAttackVolumeValid();
    // End:0x5D
    if(bHaveAccess)
    {
        bHaveAccess = (AttackVolumeAccess != none) && AttackVolumeAccess.IsValid();
    }
    return bHaveAccess;
    //return ReturnValue;    
}

function IsAttackVolumeValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xDA
    if(AttackInfo.AttackVolume != none)
    {
        // End:0xD7
        if(EnemyForAttack.HasAttackVolume(AttackInfo.AttackVolume))
        {
            // End:0xD4
            if(AttackInfo.AttackVolume.IsScriptedAttackUsableBy(AttackInfo.ScriptedAttackIndex, Outer.myAIPawn))
            {
                return true;                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function MoveAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(!super.MoveAbortCondition())
    {
        // End:0x23
        if(!IsAttackVolumeValid())
        {
            return true;            
        }
        else
        {
            // End:0x37
            if(!HaveAccessToAttackVolume())
            {
                return true;                
            }
            else
            {
                return false;
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function Seperation2DFromActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Radius, Height;
    local /*0x97E50000-0x00000000*/ private @NULL inPawn;
    local /*0x97E50000-0x00000000*/ private float Seperation, combinedRadius;

    Seperation = 2147484000.0000000;
    // End:0x191
    if(inActor != none)
    {
        inPawn = LPPawn(inActor);
        // End:0xBB
        if(inPawn != none)
        {
            Radius = Class'LPAIUtils'.static.KynapseAdjustedRadius(inPawn);
            Height = inPawn.CylinderComponent.CollisionHeight;            
        }
        else
        {
            inActor.GetBoundingCylinder(Radius, Height);
        }
        combinedRadius = Outer.MyKynapseRadius + Radius;
        Seperation = VSize2D(Outer.myAIPawn.Location - inActor.Location) - combinedRadius;
    }
    return Seperation;
    //return ReturnValue;    
}

event LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x96
    if(AttackInfo.AttackVolume != none)
    {
        // End:0x64
        if(bEnableVolumeDraw)
        {
            AttackInfo.AttackVolume.Draw();            
        }
        else
        {
            AttackInfo.AttackVolume.hide();
        }
    }
    bEnableVolumeDraw = false;
    super(LPAICommand).LPCommandTick(DeltaTime);
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    // End:0x2E
    if(AttackInfo.AttackVolume != none)
    {
        bEnableVolumeDraw = true;
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
Begin:

    GotoStateWithEnemyCheck('SetupAttackVolume');
    stop;                    
}

state SetupAttackVolume
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(SPStateObject).BeginState(PreviousState);
        //return;        
    }
Begin:

    // End:0x54
    if(AttackInfo.AttackVolume != none)
    {
        AttackInfo.AttackVolume.hide();
    }
    ReleaseAccessToAttackVolume();
    // End:0xC9
    if(!EnemyForAttack.GetAttackVolumeInfo(AttackInfo, Outer.myAIPawn))
    {
        Outer.PopCommand(self);
    }
    GotoStateWithEnemyCheck('GetAttackClearence');
    stop;                
}

state GetAttackClearence
{Begin:

    // End:0x1C
    if(!IsMyEnemyAlive())
    {
        ExitWithFaliure();        
    }
    else
    {
        // End:0x3E
        if(!IsAttackVolumeValid())
        {
            GotoStateWithEnemyCheck('SetupAttackVolume');
        }
    }
    GetClearenceAttempts = 0;
    GetAccessToAttackVolume();
    J0x54:

    // End:0xD5 [Loop If]
    if(!HaveAccessToAttackVolume() && GetClearenceAttempts < MaxClearenceAttempts)
    {
        Outer.PawnZeroVelocity();
        GetClearenceAttempts++;
        Outer.Sleep(WaitTimeBetweenClearenceAttempts);
        GetAccessToAttackVolume();
        // [Loop Continue]
        goto J0x54;
    }
    GetClearenceAttempts = 0;
    // End:0xF9
    if(!HaveAccessToAttackVolume())
    {
        ExitWithFaliure();
    }
    Outer.Sleep(0.0000000);
    GotoStateWithEnemyCheck('MoveToAttackPosition');
    stop;            
}

state MoveToAttackPosition
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        Outer.ClearTimer('AbortRotation');
        //return;        
    }

    function HasMoveFailed()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(bMoveAborted)
        {
            return true;
        }
        // End:0x20
        if(MoveToCmd == none)
        {
            return false;
        }
        // End:0xB9
        if(LPAICmd_MoveToActor(MoveToCmd) != none)
        {
            // End:0xB6
            if(int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) >= int(3))
            {
                // End:0xB6
                if(int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) != int(6))
                {
                    return true;
                }
            }            
        }
        else
        {
            // End:0x111
            if(LPAICmd_MoveToPosition(MoveToCmd) != none)
            {
                // End:0x111
                if(int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) >= int(3))
                {
                    return true;
                }
            }
        }
        return false;
        //return ReturnValue;        
    }

    function HasMoveSucceeded()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(bMoveAborted)
        {
            return false;
        }
        // End:0x20
        if(MoveToCmd == none)
        {
            return true;
        }
        // End:0x77
        if(LPAICmd_MoveToActor(MoveToCmd) != none)
        {
            return int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) == int(2);            
        }
        else
        {
            // End:0xCB
            if(LPAICmd_MoveToPosition(MoveToCmd) != none)
            {
                return int(Outer.CmdStatus_MoveToPosition.Cmd_Move_Error) == int(2);
            }
        }
        return false;
        //return ReturnValue;        
    }

    function IsMoveInProgress()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return !HasMoveFailed() && !HasMoveSucceeded();
        //return ReturnValue;        
    }

    function NotifyOfFailedMovement()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x11C
        if(MoveToCmd != none)
        {
            Outer.AbortCommand(MoveToCmd);
            bMoveAborted = true;
            Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 3;
            Outer.CmdStatus_MoveToActor.Cmd_Error = 1;
            Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 3;
            Outer.CmdStatus_MoveToPosition.Cmd_Error = 1;
        }
        return true;
        //return ReturnValue;        
    }

    event DelegateMovingToPointAvoidance()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bAvoid;
        local /*0x97E50000-0x00000000*/ private @NULL PawnToTest, kActorObs;

        PawnToTest = LPPawn(Obstacle);
        // End:0x8E
        if(PawnToTest != none)
        {
            bAvoid = true;
            // End:0x80
            if((PawnToTest == EnemyForAttack) || PawnToTest.Health <= 0)
            {
                bAvoid = false;
            }
            return bAvoid;            
        }
        else
        {
            bAvoid = true;
            kActorObs = LPKActor(Obstacle);
            // End:0x15A
            if(kActorObs != none)
            {
                // End:0x15A
                if(CylinderComponent(kActorObs.CollisionComponent).CollisionHeight < Outer.myAIPawn.CylinderComponent.CollisionHeight)
                {
                    bAvoid = false;
                }
            }
            return bAvoid;
        }
        return false;
        //return ReturnValue;        
    }

    function MoveToAttackVolume()
    {
        local /*0x97E50000-0x00000000*/ private float MaxSeperation, Seperation;
        local /*0x97E50000-0x00000000*/ private bool bUseMoveToActor;
        local /*0x97E50000-0x00000000*/ private @NULL ActorToFace;

        bUseMoveToActor = true;
        ActorToFace = none;
        bMoveAborted = false;
        Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        // End:0x51C
        if(HaveAccessToAttackVolume())
        {
            // End:0x413
            if(bUseMoveToActor)
            {
                MaxSeperation = 50.0000000;
                Seperation = VSize2D(Outer.myAIPawn.Location - AttackInfo.GoToActor.Location);
                // End:0x3A4
                if(Seperation > MaxSeperation)
                {
                    // End:0x1FE
                    if(AttackInfo.bDoNotFaceEnemyWhileMoving)
                    {
                        ActorToFace = AttackInfo.GoToActor;                        
                    }
                    else
                    {
                        ActorToFace = EnemyForAttack;
                    }
                    MoveToCmd = Outer.CmdMoveToActorTight(AttackInfo.GoToActor, ActorToFace, MaxSeperation, Outer.CmdStatus_MoveToActor, 1);
                    LPAICmd_MoveToActorTight(MoveToCmd).OverridePawnRadius(50.0000000);
                    Outer.Focus = ActorToFace;
                    MoveToCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
                    MoveToCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToPointAvoidance;
                    MoveToCmd.bZeroVelocityOnFinish = true;
                    MoveToCmd.SetMovementMonitorParameters(true, 2.0000000, 100.0000000, 2.0000000, NotifyOfFailedMovement);                    
                }
                else
                {
                    Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 2;
                    Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 2;
                }                
            }
            else
            {
                MoveToCmd = Outer.CmdMoveToPosition(AttackInfo.GoToActor.Location, EnemyForAttack, 100.0000000, Outer.CmdStatus_MoveToPosition, 1);
                Outer.Focus = EnemyForAttack;
                MoveToCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
                MoveToCmd.bZeroVelocityOnFinish = true;
            }            
        }
        else
        {
            Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 3;
            Outer.CmdStatus_MoveToActor.Cmd_Error = 1;
            Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 3;
            Outer.CmdStatus_MoveToPosition.Cmd_Error = 1;
        }
        //return;        
    }

    function AbortRotation()
    {
        bAbortRotation = true;
        //return;        
    }

    event LPCommandTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], Alpha;
        local /*0x97E50000-0x00000000*/ private @NULL NewPos, NewRot;

        // End:0x1F1
        if(bInterpolating)
        {
            super(LPAICmd_AttackViaAttackVolume).LPCommandTick(DeltaTime);
            Alpha = Class'SPEngine.SPUtil'.static.MapFromRangeToNewRange(InterpStartTime, InterpEndTime, 0.0000000, 1.0000000, CurTime());
            // End:0x118
            if(Alpha >= float(1))
            {
                Alpha = 1.0000000;
                bInterpolating = false;
                Outer.myAIPawn.SetRotation(FinalInterpRot);
                Outer.myAIPawn.SetLocationNoCheck(FinalInterpPos);                
            }
            else
            {
                NewRot = RLerp(PreInterpRot, FinalInterpRot, Alpha, true);
                Outer.myAIPawn.SetRotation(NewRot);
                NewPos = VLerp(PreInterpPos, FinalInterpPos, Alpha);
                Outer.myAIPawn.SetLocationNoCheck(NewPos);
            }
        }
        //return;        
    }
Begin:

    // End:0x1C
    if(!IsMyEnemyAlive())
    {
        ExitWithFaliure();        
    }
    else
    {
        // End:0x41
        if(!IsAttackVolumeValid())
        {
            GotoStateWithEnemyCheck('SetupAttackVolume');            
        }
        else
        {
            // End:0x66
            if(!HaveAccessToAttackVolume())
            {
                GotoStateWithEnemyCheck('GetAttackClearence');                
            }
            else
            {
                MoveToAttackVolume();
                Outer.Sleep(0.1000000);
                J0x8D:

                // End:0xBA [Loop If]
                if(IsMoveInProgress())
                {
                    Outer.Sleep(0.1000000);
                    // [Loop Continue]
                    goto J0x8D;
                }
                // End:0xD1
                if(HasMoveFailed())
                {
                    ExitWithFaliure();
                }
                CurrentFacing = Vector(Outer.Rotation);
                DesiredFacing = Vector(AttackInfo.GoToActor.Rotation);
                // End:0x35F
                if((CurrentFacing Dot DesiredFacing) < 0.9960000)
                {
                    Outer.myAIPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
                    Outer.myAIPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
                    Outer.Kynapse_ActivateBot(false);
                    Outer.Focus = none;
                    Outer.SetFocalPoint((DesiredFacing * float(100)) + Outer.myAIPawn.Location);
                    bAbortRotation = false;
                    Outer.SetTimer(10.0000000, false, 'AbortRotation', self);
                    // End:0x35F
                    if(Outer.myAIPawn.RotationRate.Yaw > 0)
                    {
                        J0x2FC:

                        Outer.Sleep(0.0000000);
                        // End:0x2FC
                        if(!(Outer.myAIPawn.ReachedDesiredRotation() || bAbortRotation))
                            goto J0x2FC;
                    }
                }
                // End:0x670
                if(!AttackInfo.GoToActor.bBlockActors)
                {
                    Outer.myAIPawn.ZeroMovementVariables();
                    Outer.Focus = none;
                    Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
                    PreInterpPos = Outer.myAIPawn.Location;
                    PreInterpRot = Outer.myAIPawn.Rotation;
                    FinalInterpPos = AttackInfo.GoToActor.Location;
                    FinalInterpPos.Z = Outer.myAIPawn.Location.Z;
                    FinalInterpRot = AttackInfo.GoToActor.Rotation;
                    FinalInterpRot.Roll = 0;
                    InterpStartTime = CurTime();
                    InterpEndTime = InterpStartTime + InterpTime;
                    bInterpolating = true;
                    Outer.EnableRotation(false);
                    J0x5E6:

                    // End:0x613 [Loop If]
                    if(bInterpolating)
                    {
                        Outer.Sleep(0.0000000);
                        // [Loop Continue]
                        goto J0x5E6;
                    }
                    Outer.EnableRotation(true);
                    FinalPawnPos = Outer.myAIPawn.Location;
                }
                Outer.ClearTimer('AbortRotation');
                GotoStateWithEnemyCheck('StartStriking');
            }
        }
    }
    stop;                
}

state StartStriking
{
    function NotifyAnimationDone()
    {
        bAnimPlaying = false;
        Outer.myAIPawn.EnableLineSweepHitTester(false);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        Outer.AbortCommand(PlayAnimCmd);
        PlayAnimCmd = none;
        Outer.myAIPawn.EnableLineSweepHitTester(false);
        Outer.ClearTimer('DelayExpired');
        //return;        
    }

    function StartAnimation()
    {
        Outer.myAIPawn.EnableLineSweepHitTester(true);
        PlayAnimCmd = Outer.CmdPlayAnimForSmartActor(AttackInfo.AnimInfo.TemplateAnimTree, AttackInfo.AnimInfo.TemplateAnimName, none, none, AttackInfo.GoToActor,, 1);
        PlayAnimCmd.__AnimFinished__Delegate = NotifyAnimationDone;
        PlayAnimCmd.User = Outer.myAIPawn;
        bAnimPlaying = true;
        //return;        
    }

    function GetDelayBeforeNextAttack()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], MinDelay, MaxDelay, Delay;

        MinDelay = Outer.myAIPawn.TuneDataAIPawn.MinDelayBetweenAttacks.GetValue();
        MaxDelay = Outer.myAIPawn.TuneDataAIPawn.MaxDelayBetweenAttacks.GetValue();
        // End:0xF0
        if(MinDelay < float(0))
        {
            MinDelay = 0.0000000;
        }
        // End:0x110
        if(MaxDelay < float(0))
        {
            MaxDelay = 0.0000000;
        }
        // End:0x150
        if(MaxDelay < MinDelay)
        {
            Delay = RandRange(MaxDelay, MinDelay);            
        }
        else
        {
            Delay = RandRange(MinDelay, MaxDelay);
        }
        return Delay;
        //return ReturnValue;        
    }

    function DelayExpired()
    {
        bDelay = false;
        //return;        
    }

    function GotoEndOfStrikingState()
    {
        GotoStateWithEnemyCheck('SetupAttackVolume');
        //return;        
    }
Begin:

    bAnimPlaying = false;
    // End:0x28
    if(!IsMyEnemyAlive())
    {
        ExitWithFaliure();        
    }
    else
    {
        // End:0x4D
        if(!IsAttackVolumeValid())
        {
            GotoStateWithEnemyCheck('SetupAttackVolume');            
        }
        else
        {
            // End:0x72
            if(!HaveAccessToAttackVolume())
            {
                GotoStateWithEnemyCheck('GetAttackClearence');                
            }
            else
            {
                // End:0x94
                if(!LockAccessToAttackVolume())
                {
                    GotoStateWithEnemyCheck('GetAttackClearence');
                }
            }
        }
    }
    StartAnimation();
    J0x9E:

    // End:0xCB [Loop If]
    if(bAnimPlaying)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x9E;
    }
    Outer.SetWantsNewEnemy(true);
    DelayTime = GetDelayBeforeNextAttack();
    bDelay = true;
    Outer.SetTimer(DelayTime, false, 'DelayExpired', self);
    J0x137:

    // End:0x1C7 [Loop If]
    if(bDelay)
    {
        // End:0x160
        if(!IsMyEnemyAlive())
        {
            ExitWithFaliure();            
        }
        else
        {
            // End:0x185
            if(!IsAttackVolumeValid())
            {
                GotoStateWithEnemyCheck('SetupAttackVolume');                
            }
            else
            {
                // End:0x1A7
                if(!HaveAccessToAttackVolume())
                {
                    GotoStateWithEnemyCheck('GetAttackClearence');
                }
            }
        }
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x137;
    }
    GotoEndOfStrikingState();
    stop;            
}

defaultproperties
{
    WaitTimeBetweenClearenceAttempts=1.0000000
    InterpTime=0.2000000
}