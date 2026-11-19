class LPAICmd_AttackSmartObject extends LPAICmd_InteractWithSmartObject within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackInteractionData[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GoToActor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbortRotation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldFaceTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GetClearenceAttempts[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WaitTimeBetweenClearenceAttempts[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxClearenceAttempts[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL facing;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.AccumulatedRawDamageTakenWhileAttackingSmartActor = 0;
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

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x193
    if(Outer.CurrentObjective.CurrentCommand == self)
    {
        Outer.AccumulatedRawDamageTakenWhileAttackingSmartActor += Outer.myAIPawn.LastRawDamageTakenFromPlayer;
        // End:0x193
        if(Outer.AccumulatedRawDamageTakenWhileAttackingSmartActor >= Outer.myAIPawn.TuneDataAIPawn.AmountOfRawDamageToAbortSmartActorAttack)
        {
            Outer.TimeToDelaySmartActorAttackUntil = Outer.WorldInfo.TimeSeconds + Outer.myAIPawn.TuneDataAIPawn.AmountOfTimeBeforeAllowedToAttackSmartActorOnceDamaged;
        }
    }
    return super(LPAICommand).NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage);
    //return ReturnValue;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x193
    if(Outer.CurrentObjective.CurrentCommand == self)
    {
        Outer.AccumulatedRawDamageTakenWhileAttackingSmartActor += Outer.myAIPawn.LastRawDamageTakenFromPlayer;
        // End:0x193
        if(Outer.AccumulatedRawDamageTakenWhileAttackingSmartActor >= Outer.myAIPawn.TuneDataAIPawn.AmountOfRawDamageToAbortSmartActorAttack)
        {
            Outer.TimeToDelaySmartActorAttackUntil = Outer.WorldInfo.TimeSeconds + Outer.myAIPawn.TuneDataAIPawn.AmountOfTimeBeforeAllowedToAttackSmartActorOnceDamaged;
        }
    }
    return super(LPAICommand).NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
    //return ReturnValue;    
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

    AttackInteractionData = LPAIInteractionData_BaseAttackActor(ObjectInteractionData);
    // End:0x35
    if(AttackInteractionData == none)
    {
        ExitWithFaliure();
    }
    GotoState('GetAttackClearence');
    stop;                    
}

state GetAttackClearence
{Begin:

    GetClearenceAttempts = 0;
    GetAccessToSmartActor();
    J0x16:

    // End:0x97 [Loop If]
    if(!HaveAccessToSmartActor() && GetClearenceAttempts < MaxClearenceAttempts)
    {
        Outer.PawnZeroVelocity();
        GetClearenceAttempts++;
        Outer.Sleep(WaitTimeBetweenClearenceAttempts);
        GetAccessToSmartActor();
        // [Loop Continue]
        goto J0x16;
    }
    GetClearenceAttempts = 0;
    // End:0xBB
    if(!HaveAccessToSmartActor())
    {
        ExitWithFaliure();
    }
    Outer.Sleep(0.0000000);
    GotoStateWithAccessCheck('MoveToInteractPosition');
    stop;                    
}

state MoveToInteractPosition
{
    function HasMoveFailed()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x7E
        if(int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) >= int(3))
        {
            // End:0x7E
            if(int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) != int(6))
            {
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function HasMoveSucceeded()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) == int(2);
        //return ReturnValue;        
    }

    function IsMoveInProgress()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return !HasMoveFailed() && !HasMoveSucceeded();
        //return ReturnValue;        
    }

    function SelectGoToActor()
    {
        local /*0x97E50000-0x00000000*/ private @NULL GotoCandidate[25165825];
        local /*0x97E50000-0x00000000*/ private float DesiredSeperation[25165825];
        local /*0x97E50000-0x00000000*/ private int I, Next;
        local /*0x97E50000-0x00000000*/ private float Height;

        GotoCandidate = none;
        // End:0x171
        if(AttackInteractionData.ActorsToStandOn.Length > 0)
        {
            I = int(RandRange(0.0000000, float(AttackInteractionData.ActorsToStandOn.Length - 1)));
            GotoCandidate = AttackInteractionData.ActorsToStandOn[I];
            Next = I + 1;
            J0xB7:

            // End:0x171 [Loop If]
            if((GotoCandidate == none) && Next != I)
            {
                // End:0x117
                if(Next >= AttackInteractionData.ActorsToStandOn.Length)
                {
                    Next = 0;
                }
                GotoCandidate = AttackInteractionData.ActorsToStandOn[Next];
                // End:0x163
                if(Next == I)
                {
                    // [Explicit Break]
                    goto J0x171;
                }
                ++Next;
                // [Loop Continue]
                goto J0xB7;
            }
        }
        J0x171:

        // End:0x193
        if(GotoCandidate == none)
        {
            GotoCandidate = SmartActor;
        }
        // End:0x1BD
        if(NavigationPoint(GotoCandidate) != none)
        {
            DesiredSeperation = 50.0000000;            
        }
        else
        {
            GotoCandidate.GetBoundingCylinder(DesiredSeperation, Height);
            // End:0x20F
            if(DesiredSeperation < float(50))
            {
                DesiredSeperation = 50.0000000;
            }
        }
        //return;        
    }

    function MoveToSmartActor()
    {
        local /*0x97E50000-0x00000000*/ private float MaxSeperation, Seperation;

        Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
        // End:0x1DF
        if(HaveAccessToSmartActor())
        {
            SelectGoToActor(GoToActor, MaxSeperation);
            Seperation = Seperation2DFromActor(GoToActor);
            // End:0x1A6
            if(Seperation > MaxSeperation)
            {
                Outer.Focus = none;
                MoveToActorCmd = Outer.CmdMoveToActor(GoToActor, GoToActor, MaxSeperation, Outer.CmdStatus_MoveToActor, 1);
                MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
                MoveToActorCmd.bZeroVelocityOnFinish = true;                
            }
            else
            {
                Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 2;
            }            
        }
        else
        {
            Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 3;
            Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
        }
        //return;        
    }

    function AbortRotation()
    {
        bAbortRotation = true;
        //return;        
    }
Begin:

    // End:0x20
    if(!HaveAccessToSmartActor())
    {
        GotoState('GetAttackClearence');        
    }
    else
    {
        MoveToSmartActor();
        J0x2A:

        // End:0x57 [Loop If]
        if(IsMoveInProgress())
        {
            Outer.Sleep(0.1000000);
            // [Loop Continue]
            goto J0x2A;
        }
        // End:0x6E
        if(HasMoveFailed())
        {
            ExitWithFaliure();
        }
        // End:0x157
        if(!bShouldFaceTarget)
        {
            facing = Vector(Outer.myAIPawn.Rotation);
            facing.Z = 0.0000000;
            facing = Normal(facing);
            Outer.SetFocalPoint((facing * float(100)) + Outer.myAIPawn.Location);
        }
        // End:0x391
        if(GoToActor != SmartActor)
        {
            Outer.myAIPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            Outer.myAIPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            Outer.Kynapse_ActivateBot(false);
            Outer.Focus = none;
            Outer.SetFocalPoint((Vector(GoToActor.Rotation) * float(100)) + Outer.myAIPawn.Location);
            bAbortRotation = false;
            Outer.SetTimer(10.0000000, false, 'AbortRotation', self);
            // End:0x38E
            if(Outer.myAIPawn.RotationRate.Yaw > 0)
            {
                J0x32B:

                Outer.Sleep(0.0000000);
                // End:0x32B
                if(!(Outer.myAIPawn.ReachedDesiredRotation() || bAbortRotation))
                    goto J0x32B;
            }            
        }
        else
        {
            Outer.Focus = GoToActor;
        }
        Outer.ClearTimer('AbortRotation');
        GotoStateWithAccessCheck('StartInteracting');
    }
    stop;            
}

state StartInteracting
{
    event HandleAnimNotifyDamageSmartActor()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Momentum;

        AttackInteractionData.ActorToAttack.TakeDamage(int(AttackInteractionData.DamageAmount), Outer, Outer.myAIPawn.Location, Momentum, AttackInteractionData.DamageType);
        //return;        
    }

    event HandleAnimNotifyDamageSmartActorRanged()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Momentum;

        AttackInteractionData.ActorToAttack.TakeDamage(int(AttackInteractionData.DamageAmount), Outer, Outer.myAIPawn.Location, Momentum, AttackInteractionData.DamageType);
        //return;        
    }
Begin:

    // End:0x1D
    if(!LockAccessToSmartActor())
    {
        GotoState('GetAttackClearence');
    }
    ObjectInteraction = ObjectInteractionData.CreateInteractionInstance(Outer.myAIPawn);
    // End:0x80
    if(ObjectInteraction == none)
    {
        ExitWithFaliure();        
    }
    else
    {
        LPAIInteraction_BaseAttackActor(ObjectInteraction).SetAlignActor(GoToActor);
        J0xB1:

        // End:0x1D5 [Loop If]
        if(HaveAccessToSmartActor())
        {
            J0xBE:

            // End:0x17A [Loop If]
            if(!ObjectInteraction.HasFinished() && !ObjectInteraction.HasFailed())
            {
                // End:0x15A
                if(!AttackInteractionData.IsActorToAttackDamagable() || ObjectInteraction.HasFailed())
                {
                    ExitWithFaliure();
                }
                Outer.Sleep(0.1000000);
                // [Loop Continue]
                goto J0xBE;
            }
            Outer.Sleep(RandRange(0.1000000, 0.5000000));
            // End:0x1D2
            if(HaveAccessToSmartActor())
            {
                ObjectInteraction.ReStartInteraction();
            }
            // [Loop Continue]
            goto J0xB1;
        }
    }
    Outer.PopCommand(self);
    stop;            
}

defaultproperties
{
    bShouldFaceTarget=true
    WaitTimeBetweenClearenceAttempts=1.0000000
}