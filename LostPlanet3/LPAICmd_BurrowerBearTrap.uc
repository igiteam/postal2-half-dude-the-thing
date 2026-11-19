class LPAICmd_BurrowerBearTrap extends LPAICmd_Objective within LPAIControllerBurrower;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DamageReceived;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStartSM;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageStopBearTrapMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BearTrappedPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorToTauntAt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeTaunt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForSMToEnd;

function Pushed()
{
    super.Pushed();
    ResetDamageStopBearTrapMode();
    //return;    
}

function Popped()
{
    GotoState('None');
    Outer.PawnBearTrap(false);
    super.Popped();
    //return;    
}

function ResetDamageStopBearTrapMode()
{
    DamageReceived = 0;
    DamageStopBearTrapMode = RandRange(Outer.BurrowerPawn.TuneDataBurrower.MinDamageStopBearTrapMode, Outer.BurrowerPawn.TuneDataBurrower.MaxDamageStopBearTrapMode);
    //return;    
}

function OnSpecialMoveFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bWaitingForSMToEnd = false;
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.PawnBearTrap(true);
        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(ChildCommand);
        Outer.ClearTimer('TimerTransitionToAttack', self);
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function NotifyBearTrapped()
    {
        Outer.PopCommand(self);
        //return;        
    }

    function TimerTransitionToAttack()
    {
        local /*0x97E50000-0x00000000*/ private int I;
        local /*0x97E50000-0x00000000*/ private @NULL PotentialTarget;

        I = 0;
        J0x0B:

        // End:0x1B1 [Loop If]
        if(I < Outer.TargetList.Length)
        {
            // End:0x1A3
            if(VSize2D(Outer.TargetList[I].Location - Outer.BurrowerPawn.Location) < Outer.BurrowerPawn.TuneDataBurrower.DistanceActivateBearTrap)
            {
                PotentialTarget = LPPawn(Outer.TargetList[I].Actor);
                // End:0x1A3
                if((PotentialTarget != none) && PotentialTarget.Health > 0)
                {
                    BearTrappedPawn = PotentialTarget;
                    GotoState('BearTrap');
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x0B;
        }
        //return;        
    }

    event NotifyReceivedDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

        super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
        DamageReceived += Damage;
        // End:0xBC
        if(float(DamageReceived) > DamageStopBearTrapMode)
        {
            ActorToTauntAt = DamageInstigator;
            TimeTaunt = Outer.BurrowerPawn.TuneDataBurrower.TimeSurfaceAfterDamaged;
            GotoState('Taunt');
        }
        //return;        
    }
Begin:

    Outer.SetTimer(0.4000000, true, 'TimerTransitionToAttack', self);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerBearTrapOpenLoop', true, 0.0000000, -1.0000000);
    stop;        
}

state BearTrap
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(ChildCommand);
        Outer.ClearTimer('TimerBearTrapLoop', self);
        LPPlayerController(LPPlayerPawn(BearTrappedPawn).Controller).ReleaseBearTrap();
        bWaitingForSMToEnd = false;
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function WakeUpBurrowers()
    {
        local /*0x97E50000-0x00000000*/ private @NULL OtherBurrower, ClosestBurrower;
        local /*0x97E50000-0x00000000*/ private float MaxDistanceBurrowerAttack, MinDistance, DistanceToBurrower;
        local /*0x97E50000-0x00000000*/ private @NULL DirToBurrower;

        MaxDistanceBurrowerAttack = 3500.0000000;
        MinDistance = MaxDistanceBurrowerAttack;
        ClosestBurrower = none;
        // End:0x14D
        foreach Outer.WorldInfo.AllControllers(Class'LPAIControllerBurrower', OtherBurrower)
        {
            DirToBurrower = OtherBurrower.Location - Outer.BurrowerPawn.Location;
            DistanceToBurrower = VSize(DirToBurrower);
            // End:0x103
            if(DistanceToBurrower > MaxDistanceBurrowerAttack)
            {
                continue;                
            }
            // End:0x12D
            if(DistanceToBurrower < MinDistance)
            {
                ClosestBurrower = OtherBurrower;
            }
            OtherBurrower.NotifyBearTrapped();            
        }        
        // End:0x15F
        if(ClosestBurrower == none)
        {
            return;
        }
        //return;        
    }

    function TimerBearTrapLoop()
    {
        local /*0x97E50000-0x00000000*/ private @NULL OtherBurrower, ObjectiveOtherBurrower;
        local /*0x97E50000-0x00000000*/ private bool bStillAttacking;

        // End:0x4D
        if(BearTrappedPawn.Health <= 0)
        {
            Outer.AbortCommand(ChildCommand);
        }
        bStillAttacking = false;
        // End:0x1EC
        foreach Outer.WorldInfo.AllControllers(Class'LPAIControllerBurrower', OtherBurrower)
        {
            // End:0x148
            if(((Outer.BurrowerPawn == OtherBurrower.Pawn) || OtherBurrower.Pawn == none) || OtherBurrower.Pawn.Health <= 0)
            {
                continue;                
            }
            ObjectiveOtherBurrower = LPAIObjectiveAttackActor(OtherBurrower.CurrentObjective);
            // End:0x1EB
            if((ObjectiveOtherBurrower != none) && ObjectiveOtherBurrower.EnemyInfo.Info.Actor == BearTrappedPawn)
            {
                bStillAttacking = true;
                // End:0x1EC
                break;
            }            
        }        
        // End:0x28A
        if(!bStillAttacking)
        {
            ActorToTauntAt = BearTrappedPawn;
            TimeTaunt = Outer.BurrowerPawn.TuneDataBurrower.TimeTauntAfterBearTrap;
            Outer.AbortCommand(ChildCommand);
        }
        // End:0x362
        if(!BearTrappedPawn.bBearTrapped && !BearTrappedPawn.InStruggleMode)
        {
            ActorToTauntAt = BearTrappedPawn;
            TimeTaunt = Outer.BurrowerPawn.TuneDataBurrower.TimeTauntAfterBearTrap;
            Outer.AbortCommand(ChildCommand);
        }
        //return;        
    }
Begin:

    WakeUpBurrowers();
    Outer.CmdSpecialMove(Class'LPSM_BurrowerBearTrapDisappear', true, 0.0000000, 4.0000000);
    bWaitingForSMToEnd = true;
    BearTrappedPawn.ServerDoSpecialMove(Class'LPSM_PlayerBurrowerBearTrap', true, false, self.OnSpecialMoveFinished, Outer.myAIPawn);
    J0xB2:

    // End:0xDF [Loop If]
    if(bWaitingForSMToEnd)
    {
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0xB2;
    }
    Outer.SetTimer(0.1000000, true, 'TimerBearTrapLoop', self);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerBearTrapLoop', true, 0.0000000, -1.0000000,, BearTrappedPawn);
    // End:0x21E
    if(ActorToTauntAt != none)
    {
        BearTrappedPawn.ServerDoSpecialMove(Class'LPSM_PlayerBearTrapRelease', true, false, self.OnSpecialMoveFinished, Outer.myAIPawn);
        Outer.Sleep(0.1000000);
        Outer.CmdSpecialMove(Class'LPSM_BurrowerBearTrapRelease', true, 0.0000000, 4.0000000);
        GotoState('Taunt');        
    }
    else
    {
        Outer.CmdSpecialMove(Class'LPSM_BurrowerBearTrapRelease', true, 0.0000000, 4.0000000);
        GotoState('StateCmdActive');
    }
    stop;        
}

state Taunt
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.PawnBearTrap(false);
        Outer.PawnUnderground(false);
        ResetDamageStopBearTrapMode();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(ChildCommand);
        Outer.PawnUnderground(true);
        //return;        
    }
Begin:

    Outer.PawnLookAtActor(ActorToTauntAt);
    Outer.PawnZeroVelocity();
    Outer.CmdSpecialMove(Class'LPSM_BurrowerWalkOut', true, 0.0000000, 4.0000000);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerTauntIn', true, 0.0000000, 4.0000000);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerTauntLoop', true, 0.0000000, TimeTaunt);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerTauntOut', true, 0.0000000, 4.0000000);
    Outer.CmdSpecialMove(Class'LPSM_BurrowerWalkIn', true, 0.0000000, 4.0000000);
    Outer.PopCommand(self);
    stop;            
}
