class LPAICmd_VSISSStagedAttack extends LPAICmd_Attack within LPAIControllerVSISS;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RangedAttackCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpecialMoveCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAttackingEnemy[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAttackingRig[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DamageAttackingRig[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromOpenCmd[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    StopCmd();
    ClearUtilityRigTimer();
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

function StartCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL Railgun, GrenadeLauncher;

    Railgun = LPWeaponVSISSRailgun(Outer.vsPawn.VSWeapons[1]);
    GrenadeLauncher = LPWeaponVSISSGrenadeLauncher(Outer.vsPawn.VSWeapons[0]);
    // End:0x29F
    if(EnemyForAttack.IsHumanControlled())
    {
        Railgun.FireInterval[0] = Railgun.TuneDataRailgun.FireModes[0].FireInterval;
        Railgun.TimeShoulderHold = Railgun.TuneDataRailgun.TimeShoulderHold;
        GrenadeLauncher.FireInterval[0] = GrenadeLauncher.TuneDataGrenadeLauncher.FireModes[0].FireInterval;
        GrenadeLauncher.TimeShoulderHold = GrenadeLauncher.TuneDataGrenadeLauncher.TimeShoulderHold;
        GrenadeLauncher.TimeShoulderUpAfterFire = GrenadeLauncher.TuneDataGrenadeLauncher.TimeShoulderUpAfterFire;
        GrenadeLauncher.bGrenadesDontJump = false;        
    }
    else
    {
        Railgun.FireInterval[0] = Railgun.TuneDataRailgun.FireIntervalAgainstAkrid;
        Railgun.TimeShoulderHold = Railgun.TuneDataRailgun.TimeShoulderHoldAgainstAkrid;
        GrenadeLauncher.FireInterval[0] = GrenadeLauncher.TuneDataGrenadeLauncher.FireIntervalAgainstAkrid;
        GrenadeLauncher.TimeShoulderHold = GrenadeLauncher.TuneDataGrenadeLauncher.TimeShoulderHoldAgainstAkrid;
        GrenadeLauncher.TimeShoulderUpAfterFire = GrenadeLauncher.TuneDataGrenadeLauncher.TimeShoulderUpAfterFireAgainstAkrid;
        GrenadeLauncher.bGrenadesDontJump = true;
    }
    //return;    
}

function StopCmd()
{
    GotoState('None');
    //return;    
}

event Stunned()
{
    local /*0x97E50000-0x00000000*/ private byte MainCore;

    MainCore = Outer.vsPawn.GetMainCore();
    // End:0x63
    if(int(MainCore) == int(0))
    {
        GotoState('GrenadeLauncherStunned');        
    }
    else
    {
        // End:0x88
        if(int(MainCore) == int(2))
        {
            GotoState('MissileLauncherStunned');            
        }
        else
        {
            // End:0xAA
            if(int(MainCore) == int(1))
            {
                GotoState('RailgunStunned');
            }
        }
    }
    //return;    
}

function ISSCoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];

    // End:0xE2
    if(!Outer.vsPawn.bDamageOnlyWhenStunned)
    {
        // End:0x71
        if(CoreTag.GetCoreId() == 0)
        {
            GotoState('GrenadeLauncherStunned');
            return;            
        }
        else
        {
            // End:0xAA
            if(CoreTag.GetCoreId() == 2)
            {
                GotoState('MissileLauncherStunned');
                return;                
            }
            else
            {
                // End:0xDF
                if(CoreTag.GetCoreId() == 1)
                {
                    GotoState('RailgunStunned');
                    return;
                }
            }
        }        
    }
    else
    {
        RecoverFromStunned();
    }
    // End:0x167
    if(CoreTag.GetCoreId() == 4)
    {
        Outer.SetKismetEvent(3);
        Outer.vsPawn.Suicide();
    }
    //return;    
}

function RecoverFromStunned()
{
    //return;    
}

function TimerTransitions()
{
    //return;    
}

function StartUtilityRigTimer()
{
    TimeStartedAttackingEnemy = Outer.WorldInfo.TimeSeconds;
    // End:0xAE
    if(EnemyForAttack.IsHumanControlled() && Outer.UtilityRig != none)
    {
        Outer.SetTimer(0.1500000, true, 'CheckAttackUtilityRig', self);
    }
    //return;    
}

function ClearUtilityRigTimer()
{
    Outer.ClearTimer('CheckAttackUtilityRig', self);
    //return;    
}

function StageSelection()
{
    // End:0x50
    if(Outer.vsPawn.GetCoreHealth(0) > 0.0000000)
    {
        GotoState('Stage1GrenadeLauncher');        
    }
    else
    {
        // End:0xA1
        if(Outer.vsPawn.GetCoreHealth(2) > 0.0000000)
        {
            GotoState('Stage2SalvoLauncher');            
        }
        else
        {
            // End:0xF1
            if(Outer.vsPawn.GetCoreHealth(1) > 0.0000000)
            {
                GotoState('Stage3Railgun');                
            }
            else
            {
                // End:0x117
                if(LPPlayerPawn(EnemyForAttack) != none)
                {
                    GotoState('StageKamikaze');
                }
            }
        }
    }
    //return;    
}

function CheckAttackUtilityRig()
{
    // End:0x1B
    if(WantsToAttackUtilityRig())
    {
        GotoState('AttackUtilityRig');
    }
    //return;    
}

function WantsToAttackUtilityRig()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float DistancePlayer, TimeAttackingPlayer, TimeNotShooting;

    // End:0x1A
    if(LPAIPawn(EnemyForAttack) != none)
    {
        return false;
    }
    DistancePlayer = EnemySeperation2D();
    // End:0x86
    if(DistancePlayer < Outer.vsPawn.TuneDataVsISS.MinDistanceDontAttackRig)
    {
        return false;
    }
    TimeAttackingPlayer = Outer.WorldInfo.TimeSeconds - TimeStartedAttackingEnemy;
    // End:0x126
    if(TimeAttackingPlayer < Outer.vsPawn.TuneDataVsISS.MinTimeDontAttackRig)
    {
        return false;
    }
    // End:0x19D
    if(Outer.TimeSinceLastSeenEnemy(EnemyForAttack) > Outer.vsPawn.TuneDataVsISS.TimePlayerLostAttackRig)
    {
        return true;
    }
    // End:0x1F5
    if(DistancePlayer > Outer.vsPawn.TuneDataVsISS.DistancePlayerAttackRig)
    {
        return true;
    }
    // End:0x24D
    if(TimeAttackingPlayer > Outer.vsPawn.TuneDataVsISS.TimeAttackingPlayerToChangeToAttackRig)
    {
        return true;
    }
    TimeNotShooting = Outer.WorldInfo.TimeSeconds - Outer.TimeStampFireFromOpen;
    // End:0x302
    if(TimeNotShooting > Outer.vsPawn.TuneDataVsISS.TimeRunningAfterPlayerAttackRig)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

state StateCmdActive
{Begin:

    StartCmd();
    StartUtilityRigTimer();
    StageSelection();
    stop;        
}

state Stage1GrenadeLauncher
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.SetKismetEvent(0);
        SelectWeapon();
        Outer.vsPawn.SetActiveVSWeapon(0);
        SelectWeapon();
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(RangedAttackCmd);
        RangedAttackCmd = none;
        Outer.ClearTimer('TimerTransitions', self);
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function SelectWeapon()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FireWasp, Sepia;

        // End:0x11
        if(EnemyForAttack == none)
        {
            return;
        }
        // End:0x236
        if(EnemyForAttack.IsHumanControlled())
        {
            // End:0x135
            if(int(Outer.vsPawn.GetActiveWeaponID()) == int(0))
            {
                // End:0x132
                if(!Outer.vsPawn.Weapon.IsFiring())
                {
                    // End:0x132
                    if(Outer.vsPawn.NumTimesFiredWeapon >= 4)
                    {
                        Outer.vsPawn.SetActiveVSWeapon(1);
                    }
                }                
            }
            else
            {
                // End:0x234
                if(int(Outer.vsPawn.GetActiveWeaponID()) == int(1))
                {
                    // End:0x234
                    if(!Outer.vsPawn.Weapon.IsFiring() && Outer.vsPawn.NumTimesFiredWeapon >= 1)
                    {
                        Outer.vsPawn.SetActiveVSWeapon(0);
                    }
                }
            }
            return;
        }
        FireWasp = LPAIPawnMedFlyer(EnemyForAttack);
        // End:0x29A
        if(FireWasp != none)
        {
            Outer.vsPawn.SetActiveVSWeapon(1);
            return;
        }
        Sepia = LPAIPawnSepia(EnemyForAttack);
        // End:0x2FE
        if(Sepia != none)
        {
            Outer.vsPawn.SetActiveVSWeapon(0);
            return;
        }
        //return;        
    }

    function TimerTransitions()
    {
        SelectWeapon();
        //return;        
    }
Begin:

    Outer.SetTimer(0.1500000, true, 'TimerTransitions', self);
    RangedAttackCmd = Outer.CmdRangedAttack(EnemyForAttack);
    RangedAttackCmd = none;
    Outer.PopCommand(self);
    stop;                    
}

state GrenadeLauncherStunned
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.vsPawn.SetStunned(true);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x43
        if(SpecialMoveCmd != none)
        {
            Outer.AbortCommand(SpecialMoveCmd);
            SpecialMoveCmd = none;
        }
        Outer.vsPawn.StopShieldEffect();
        Outer.vsPawn.SetStunned(false);
        Outer.ClearTimer('RecoverFromStunned', self);
        //return;        
    }

    event NotifyReceivedDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

        super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
        //return;        
    }

    function RecoverFromStunned()
    {
        // End:0x9C
        if((SpecialMoveCmd != none) && ClassIsChildOf(SpecialMoveCmd.SpecialMoveClass, Class'LPSM_VSISSStage1StunLoop'))
        {
            Outer.AbortCommand(SpecialMoveCmd);
            Outer.vsPawn.SetStunned(false);
        }
        //return;        
    }
Begin:

    SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSStage1StunIn', true, 0.0000000, 4.0000000);
    Outer.vsPawn.StartShieldEffect();
    SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSStage1StunLoop', true, 0.0000000, Outer.vsPawn.TuneDataVsISS.Stage1TimeStunned);
    Outer.vsPawn.StopShieldEffect();
    SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSStage1StunOut', true, 0.0000000, 4.0000000);
    SpecialMoveCmd = none;
    StageSelection();
    stop;                
}

state Stage2SalvoLauncher
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        Outer.SetKismetEvent(1);
        Outer.vsPawn.PlayMissileLauncherUpAnimation();
        Outer.vsPawn.SetActiveVSWeapon(2, 0);
        SelectWeapon();
        Outer.vsPawn.PlayRateForTransitionComponent = 1.1000000;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(RangedAttackCmd);
        RangedAttackCmd = none;
        Outer.ClearTimer('TimerTransitions', self);
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function SelectWeapon()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FireWasp, Sepia;

        // End:0x3AF
        if(EnemyForAttack.IsHumanControlled())
        {
            // End:0x168
            if((int(Outer.vsPawn.GetActiveWeaponID()) == int(2)) && int(Outer.vsPawn.GetCurrentFireMode()) == int(0))
            {
                // End:0x165
                if(!Outer.vsPawn.Weapon.IsFiring() && Outer.vsPawn.NumTimesFiredWeapon >= 3)
                {
                    Outer.vsPawn.SetActiveVSWeapon(2, 1);
                }                
            }
            else
            {
                // End:0x2AC
                if((int(Outer.vsPawn.GetActiveWeaponID()) == int(2)) && int(Outer.vsPawn.GetCurrentFireMode()) == int(1))
                {
                    // End:0x2A9
                    if(!Outer.vsPawn.Weapon.IsFiring() && Outer.vsPawn.NumTimesFiredWeapon >= 2)
                    {
                        Outer.vsPawn.SetActiveVSWeapon(1);
                    }                    
                }
                else
                {
                    // End:0x3AD
                    if(int(Outer.vsPawn.GetActiveWeaponID()) == int(1))
                    {
                        // End:0x3AD
                        if(!Outer.vsPawn.Weapon.IsFiring() && Outer.vsPawn.NumTimesFiredWeapon >= 2)
                        {
                            Outer.vsPawn.SetActiveVSWeapon(2, 0);
                        }
                    }
                }
            }
            return;
        }
        FireWasp = LPAIPawnMedFlyer(EnemyForAttack);
        // End:0x413
        if(FireWasp != none)
        {
            Outer.vsPawn.SetActiveVSWeapon(1);
            return;
        }
        Sepia = LPAIPawnSepia(EnemyForAttack);
        // End:0x478
        if(Sepia != none)
        {
            Outer.vsPawn.SetActiveVSWeapon(2, 0);
            return;
        }
        //return;        
    }

    function TimerTransitions()
    {
        SelectWeapon();
        //return;        
    }
Begin:

    Outer.SetTimer(0.2500000, true, 'TimerTransitions', self);
    RangedAttackCmd = Outer.CmdRangedAttack(EnemyForAttack);
    RangedAttackCmd = none;
    Outer.PopCommand(self);
    stop;                    
}

state MissileLauncherStunned
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.vsPawn.SetStunned(true);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x43
        if(SpecialMoveCmd != none)
        {
            Outer.AbortCommand(SpecialMoveCmd);
            SpecialMoveCmd = none;
        }
        Outer.vsPawn.StopShieldEffect();
        Outer.vsPawn.SetStunned(false);
        Outer.ClearTimer('RecoverFromStunned', self);
        //return;        
    }

    event NotifyReceivedDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

        super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
        //return;        
    }

    function RecoverFromStunned()
    {
        // End:0x9C
        if((SpecialMoveCmd != none) && ClassIsChildOf(SpecialMoveCmd.SpecialMoveClass, Class'LPSM_VSISSStage2StunLoop'))
        {
            Outer.AbortCommand(SpecialMoveCmd);
            Outer.vsPawn.SetStunned(false);
        }
        //return;        
    }
Begin:

    SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSStage2StunIn', true, 0.0000000, 4.0000000);
    Outer.vsPawn.StartShieldEffect();
    SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSStage2StunLoop', true, 0.0000000, Outer.vsPawn.TuneDataVsISS.Stage2TimeStunned);
    Outer.vsPawn.StopShieldEffect();
    SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSStage2StunOut', true, 0.0000000, 4.0000000);
    SpecialMoveCmd = none;
    StageSelection();
    stop;                
}

state Stage3Railgun
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Railgun;

        super(SPStateObject).BeginState(PreviousStateName);
        Outer.SetKismetEvent(2);
        Railgun = LPWeaponVSISSRailgun(Outer.vsPawn.VSWeapons[1]);
        Railgun.FireInterval[0] = Railgun.TuneDataRailgun.FireIntervalIn3rdStage;
        Railgun.TimeShoulderHold = Railgun.TuneDataRailgun.TimeShoulderHoldIn3rdStage;
        Outer.vsPawn.PlayRateForTransitionComponent = 1.2500000;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(RangedAttackCmd);
        RangedAttackCmd = none;
        Outer.ClearTimer('TimerTransitions', self);
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function SelectWeapon()
    {
        Outer.vsPawn.SetActiveVSWeapon(1);
        //return;        
    }
Begin:

    SelectWeapon();
    RangedAttackCmd = Outer.CmdRangedAttack(EnemyForAttack);
    RangedAttackCmd = none;
    Outer.PopCommand(self);
    stop;            
}

state RailgunStunned
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.vsPawn.SetStunned(true);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x43
        if(SpecialMoveCmd != none)
        {
            Outer.AbortCommand(SpecialMoveCmd);
            SpecialMoveCmd = none;
        }
        Outer.vsPawn.StopShieldEffect();
        Outer.vsPawn.SetStunned(false);
        Outer.ClearTimer('RecoverFromStunned', self);
        //return;        
    }

    event NotifyReceivedDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

        super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
        //return;        
    }

    function RecoverFromStunned()
    {
        // End:0x9C
        if((SpecialMoveCmd != none) && ClassIsChildOf(SpecialMoveCmd.SpecialMoveClass, Class'LPSM_VSISSStage3StunLoop'))
        {
            Outer.AbortCommand(SpecialMoveCmd);
            Outer.vsPawn.SetStunned(false);
        }
        //return;        
    }
Begin:

    SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSStage3StunIn', true, 0.0000000, 4.0000000);
    Outer.vsPawn.StartShieldEffect();
    SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSStage3StunLoop', true, 0.0000000, Outer.vsPawn.TuneDataVsISS.Stage3TimeStunned);
    Outer.vsPawn.StopShieldEffect();
    SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSStage3StunOut', true, 0.0000000, 4.0000000);
    SpecialMoveCmd = none;
    StageSelection();
    stop;                
}

state StageKamikaze
{
    ignores EndState;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SetInterruptible(false);
        Outer.vsPawn.PlayRateForTransitionComponent = 1.4000000;
        Outer.vsPawn.EnableCoreById(4, true);
        Outer.vsPawn.EnableCoreById(3, true);
        ClearUtilityRigTimer();
        //return;        
    }
Begin:

    Outer.Sleep(Outer.vsPawn.TuneDataVsISS.KamikazeStartLag);
    J0x60:

    // End:0x18F [Loop If]
    if(true)
    {
        MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, EnemyForAttack, 0.1000000,, 1,, false);
        // End:0x12C
        if((Outer.WorldInfo.TimeSeconds - Outer.vsPawn.TimeStampCloseRangeExplosion) > 2.0000000)
        {
            GotoState('KamikazeCloseRange');
        }
        Outer.Sleep(Outer.vsPawn.TuneDataVsISS.KamikazeWaitWhenTouched);
        // [Loop Continue]
        goto J0x60;
    }
    stop;                    
}

state KamikazeCloseRange
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeStampCloseRangeStrike = Outer.WorldInfo.TimeSeconds;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.vsPawn.StopCloseRangeCharge();
        StopSpecialMove();
        //return;        
    }

    function StopSpecialMove()
    {
        // End:0x43
        if(SpecialMoveCmd != none)
        {
            Outer.AbortCommand(SpecialMoveCmd);
            SpecialMoveCmd = none;
        }
        //return;        
    }
    J0x00:
    // End:0x6C [Loop If]
    if(Outer.MySPPawn.TransitionComponent.IsDoingTransition())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x00;
    }
    Outer.PawnLookAtActor(EnemyForAttack);
    Outer.vsPawn.StarCloseRangeCharge();
    SpecialMoveCmd = Outer.CmdSpecialMove(Class'LPSM_VSISSChargeLoop', true, 0.0000000, Outer.vsPawn.TuneDataVsISS.MaxTimeCharginEffect);
    SpecialMoveCmd = none;
    // End:0x1C1
    if(Outer.vsPawn.bPlayingCloseRangeCharge)
    {
        Outer.vsPawn.CloseRangeFire();
    }
    Outer.Sleep(Outer.vsPawn.TuneDataVsISS.KamikazeWaitWhenTouched);
    GotoState('StageKamikaze');
    stop;                    
}

state AttackUtilityRig
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        TimeStartedAttackingRig = Outer.WorldInfo.TimeSeconds;
        Outer.vsPawn.SetActiveVSWeapon(1);
        DamageAttackingRig = 0;
        ClearUtilityRigTimer();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('CheckAttackPlayerBack', self);
        StopFiring();
        StopMoving();
        //return;        
    }

    function StopFiring()
    {
        // End:0x43
        if(FireFromOpenCmd != none)
        {
            Outer.AbortCommand(FireFromOpenCmd);
            FireFromOpenCmd = none;
        }
        //return;        
    }

    function StopMoving()
    {
        // End:0x43
        if(MoveToActorCmd != none)
        {
            Outer.AbortCommand(MoveToActorCmd);
            MoveToActorCmd = none;
        }
        //return;        
    }

    event NotifyReceivedDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

        super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
        // End:0x50
        if((Damage == 0) && DamageInstigator == EnemyForAttack)
        {
            Damage = 5;
        }
        DamageAttackingRig += Damage;
        // End:0xB4
        if((WantsToAttackPlayerBack()) && Outer.WeaponIsFiring())
        {
            Outer.WeaponQuickFinish();
        }
        //return;        
    }

    function CheckAttackPlayerBack()
    {
        // End:0x21
        if(WantsToAttackPlayerBack())
        {
            StartUtilityRigTimer();
            StageSelection();
        }
        //return;        
    }

    function WantsToAttackPlayerBack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x8D
        if((Outer.WorldInfo.TimeSeconds - TimeStartedAttackingRig) < Outer.vsPawn.TuneDataVsISS.MinTimeAttackRig)
        {
            return false;
        }
        // End:0xE6
        if((EnemySeperation2D()) < Outer.vsPawn.TuneDataVsISS.DistanceGoBackToPlayer)
        {
            return true;
        }
        // End:0x13E
        if(DamageAttackingRig > Outer.vsPawn.TuneDataVsISS.DamageGoBackToPlayer)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function SelectWeapon()
    {
        // End:0x18A
        if((int(Outer.vsPawn.GetActiveWeaponID()) == int(2)) && int(Outer.vsPawn.GetCurrentFireMode()) == int(0))
        {
            // End:0x187
            if(!Outer.vsPawn.Weapon.IsFiring() && Outer.vsPawn.NumTimesFiredWeapon >= Outer.vsPawn.TuneDataVsISS.NumMissilesShots)
            {
                Outer.vsPawn.SetActiveVSWeapon(1);
            }            
        }
        else
        {
            // End:0x311
            if(int(Outer.vsPawn.GetActiveWeaponID()) == int(1))
            {
                // End:0x311
                if(Outer.vsPawn.GetCoreHealth(2) > 0.0000000)
                {
                    // End:0x311
                    if(!Outer.vsPawn.Weapon.IsFiring() && Outer.vsPawn.NumTimesFiredWeapon >= Outer.vsPawn.TuneDataVsISS.NumRailgunShots)
                    {
                        Outer.vsPawn.SetActiveVSWeapon(2, 0);
                    }
                }
            }
        }
        //return;        
    }
    J0x00:
    // End:0x6C [Loop If]
    if(Outer.MySPPawn.TransitionComponent.IsDoingTransition())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x00;
    }
    Outer.AISetFireTarget(Outer.UtilityRig);
    // End:0x278
    if(VSize(Outer.UtilityRig.Location - Outer.vsPawn.Location) > Outer.vsPawn.TuneDataVsISS.DesiredDistanceToRig)
    {
        Outer.SetTimer(0.1500000, true, 'CheckAttackPlayerBack', self);
        MoveToActorCmd = Outer.CmdMoveToActor(Outer.UtilityRig, Outer.UtilityRig, Outer.vsPawn.TuneDataVsISS.DesiredDistanceToRig * 0.9000000,, 1,, false);
        MoveToActorCmd = none;
        Outer.ClearTimer('CheckAttackPlayerBack', self);
    }
    J0x278:

    // End:0x385 [Loop If]
    if(true)
    {
        SelectWeapon();
        FireFromOpenCmd = Outer.CmdFireFromOpen();
        FireFromOpenCmd = none;
        CheckAttackPlayerBack();
        Outer.SetTimer(0.1500000, true, 'CheckAttackPlayerBack', self);
        Outer.Sleep(Outer.vsPawn.TuneDataVsISS.DelayBetweenShotsToRig);
        Outer.ClearTimer('CheckAttackPlayerBack', self);
        CheckAttackPlayerBack();
        // [Loop Continue]
        goto J0x278;
    }
    stop;            
}
