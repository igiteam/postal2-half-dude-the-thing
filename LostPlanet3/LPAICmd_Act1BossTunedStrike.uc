class LPAICmd_Act1BossTunedStrike extends LPAICmd_Act1BossStrikeBase within LPAIControllerAct1Boss;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TuneStrikeList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL CurrentStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PreviousAttackType[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentAttackType[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayStart[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHitPlayer[536870913];

static function IsDodgeCloseEnough()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPlayer[8388609], inSpecialDodgeActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Boss, TongueStartLoc, TongueEndLoc;
    local /*0x97E50000-0x00000000*/ private float DistanceToTongueSq;

    // End:0x31
    if(!ClassIsChildOf(inSpecialDodgeActor.Class, Class'LPAIPawnAct1Boss'))
    {
        return false;
    }
    Boss = LPAIPawnAct1Boss(inSpecialDodgeActor);
    // End:0x9C
    if(!Boss.Mesh.GetSocketWorldLocationAndRotation('TongueG', TongueStartLoc))
    {
        return false;
    }
    // End:0xEB
    if(!Boss.Mesh.GetSocketWorldLocationAndRotation('TongueZ', TongueEndLoc))
    {
        return false;
    }
    DistanceToTongueSq = Boss.PointDistToLine(InPlayer.Location, TongueEndLoc - TongueStartLoc, TongueStartLoc);
    // End:0x1C8
    if(DistanceToTongueSq > (Boss.TuneDataBoss.MaxDistanceForTongueDodge * Boss.TuneDataBoss.MaxDistanceForTongueDodge))
    {
        return false;
    }
    // End:0x240
    if(DistanceToTongueSq < (Boss.TuneDataBoss.MinDistanceForTongueDodge * Boss.TuneDataBoss.MinDistanceForTongueDodge))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super(LPAICmd_Strike).Popped();
    ResetAnimScaleForTongueSwipe();
    HandleAnimNotifyMeleeStrikeEnd(Outer.ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes);
    Outer.Focus = none;
    Outer.bCoresVulnerable = false;
    //return;    
}

function ResetAnimScaleForTongueSwipe()
{
    Outer.BossPawn.Mesh.GlobalAnimRateScale = 1.0000000;
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x126
    if(((bHitPlayer == false) && EnemyForStrike != none) && Info.Impact.HitActor == EnemyForStrike)
    {
        // End:0x126
        if(((!EnemyForStrike.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerDodgeBossTongueRight2') && !EnemyForStrike.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerDodgeBossTongueLeft2')) && !EnemyForStrike.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerDodgeBossTongueRight')) && !EnemyForStrike.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerDodgeBossTongueLeft'))
        {
            bHitPlayer = true;
        }
    }
    //return;    
}

simulated function FaceEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewRot;

    Outer.Focus = EnemyForStrike;
    // End:0x133
    if(EnemyForStrike != none)
    {
        Outer.BossPawn.SetMovementPhysics();
        NewRot = MyPawn.Rotation;
        NewRot.Yaw = Rotator(EnemyForStrike.Location - MyPawn.Location).Yaw;
        MyPawn.SetDesiredRotation(NewRot,,, 0.3300000);
    }
    //return;    
}

simulated function StartStrike()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array StrikeList[8388609];
    local /*0x97E50000-0x00000000*/ private int strikeIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL strike, validity;
    local /*0x97E50000-0x00000000*/ private float randomVal, TotalWeight;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ValidStrikes;

    // End:0x12
    if(StrikeList.Length == 0)
    {
        return;
    }
    TotalWeight = 0.0000000;
    ValidStrikes.Length = StrikeList.Length;
    // End:0x119
    foreach StrikeList(strike, strikeIndex)
    {
        ValidStrikes[strikeIndex] = true;
        // End:0xDA
        foreach strike.ValidityChecks(validity)
        {
            // End:0xD9
            if(!validity.IsValid(Outer))
            {
                ValidStrikes[strikeIndex] = false;                
            }
            else
            {                
            }
        }        
        // End:0x118
        if(ValidStrikes[strikeIndex])
        {
            TotalWeight += strike.Weight;
        }        
    }    
    ++Outer.NumberOfStrikesPerformed;
    // End:0x14D
    if(TotalWeight <= float(0))
    {
        return;
    }
    randomVal = RandRange(0.0000000, TotalWeight);
    // End:0x1F9
    foreach StrikeList(strike, strikeIndex)
    {
        // End:0x1AA
        if(!ValidStrikes[strikeIndex])
        {
            continue;            
        }
        else
        {
            randomVal -= strike.Weight;
            // End:0x1F8
            if(randomVal <= float(0))
            {
                CurrentStrike = strike;                
            }
            else
            {                
            }
        }
    }    
    // End:0x22B
    if(CurrentStrike.AttackList.Length == 0)
    {
        GotoState('EndStrike');
    }
    CurrentAttackType = 24;
    CurrentAttack = 0;
    // End:0x294
    if(CurrentStrike.AttackList[CurrentAttack].DelayBeforeAttack > float(0))
    {
        GotoState('Delay');        
    }
    else
    {
        GotoState('Attack');
    }
    //return;    
}

simulated function StartNextAttack()
{
    local /*0x97E50000-0x00000000*/ private int NewAttack;

    NewAttack = ((bHitPlayer) ? CurrentStrike.AttackList[CurrentAttack].NextOnHit : CurrentStrike.AttackList[CurrentAttack].NextOnMiss);
    // End:0xD7
    if((NewAttack < 0) || NewAttack >= CurrentStrike.AttackList.Length)
    {
        GotoState('EndStrike');
        return;
    }
    CurrentAttack = NewAttack;
    // End:0x13C
    if(CurrentStrike.AttackList[NewAttack].DelayBeforeAttack > float(0))
    {
        GotoState('Delay');        
    }
    else
    {
        GotoState('Attack');
    }
    //return;    
}

simulated function RandomLeftRight()
{
    local /*0x97E50000-0x00000000*/ private byte Left[8388609], Right, ReturnValue;

    // End:0x2B
    if(RandRange(0.0000000, 100.0000000) < 50.0000000)
    {
        return Left;        
    }
    else
    {
        return Right;
    }
    //return ReturnValue;    
}

simulated function OppositeLast()
{
    local /*0x97E50000-0x00000000*/ private byte Left[8388609], Right, ReturnValue;

    // End:0x34
    if(int(PreviousAttackType) == int(24))
    {
        return RandomLeftRight(Left, Right);        
    }
    else
    {
        // End:0x5C
        if(int(PreviousAttackType) == int(Right))
        {
            return Left;            
        }
        else
        {
            return Right;
        }
    }
    //return ReturnValue;    
}

simulated function StartAttack()
{
    // End:0x57
    if(int(CurrentStrike.AttackList[CurrentAttack].AttackType) != int(15))
    {
        PreviousAttackType = CurrentAttackType;
    }
    CurrentAttackType = CurrentStrike.AttackList[CurrentAttack].AttackType;
    bHitPlayer = false;
    switch(CurrentAttackType)
    {
        // End:0xD9
        case 5:
            CurrentAttackType = RandomLeftRight(3, 4);
            // End:0x22B
            break;
        // End:0xF9
        case 6:
            CurrentAttackType = OppositeLast(3, 4);
            // End:0x22B
            break;
        // End:0x119
        case 9:
            CurrentAttackType = RandomLeftRight(7, 8);
            // End:0x22B
            break;
        // End:0x139
        case 10:
            CurrentAttackType = OppositeLast(7, 8);
            // End:0x22B
            break;
        // End:0x159
        case 13:
            CurrentAttackType = RandomLeftRight(11, 12);
            // End:0x22B
            break;
        // End:0x179
        case 14:
            CurrentAttackType = OppositeLast(11, 12);
            // End:0x22B
            break;
        // End:0x199
        case 21:
            CurrentAttackType = RandomLeftRight(19, 20);
            // End:0x22B
            break;
        // End:0x1B9
        case 22:
            CurrentAttackType = OppositeLast(19, 20);
            // End:0x22B
            break;
        // End:0x228
        case 15:
            bHitPlayer = RandRange(0.0000000, 100.0000000) < CurrentStrike.AttackList[CurrentAttack].DelayBeforeAttack;
            GotoState('NextAttack');
            return;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x27A
    if(((int(PreviousAttackType) == int(0)) && int(CurrentAttackType) != int(2)) && int(CurrentAttackType) != int(1))
    {
        CurrentAttackType = 1;        
    }
    else
    {
        // End:0x2C6
        if(((int(CurrentAttackType) == int(2)) || int(CurrentAttackType) == int(1)) && int(PreviousAttackType) != int(0))
        {
            CurrentAttackType = 24;
        }
    }
    // End:0x2FA
    if(int(CurrentAttackType) != int(24))
    {
        ++Outer.NumberOfAttacksPerformed;
    }
    switch(CurrentAttackType)
    {
        // End:0x323
        case 0:
            GotoState('TongueStabAttack');
            // End:0x470
            break;
        // End:0x339
        case 1:
            GotoState('TongueExit');
            // End:0x470
            break;
        // End:0x34F
        case 2:
            GotoState('TongueSwipe');
            // End:0x470
            break;
        // End:0x365
        case 3:
            GotoState('ClawBladeAttackLeft');
            // End:0x470
            break;
        // End:0x37B
        case 4:
            GotoState('ClawBladeAttackRight');
            // End:0x470
            break;
        // End:0x391
        case 7:
            GotoState('ClawFastAttackLeft');
            // End:0x470
            break;
        // End:0x3A7
        case 8:
            GotoState('ClawFastAttackRight');
            // End:0x470
            break;
        // End:0x3BD
        case 11:
            GotoState('SwipeAttackLeft');
            // End:0x470
            break;
        // End:0x3D3
        case 12:
            GotoState('SwipeAttackRight');
            // End:0x470
            break;
        // End:0x3E9
        case 16:
            GotoState('ClawDrop');
            // End:0x470
            break;
        // End:0x3FF
        case 17:
            GotoState('Bite');
            // End:0x470
            break;
        // End:0x415
        case 18:
            GotoState('VSTongue');
            // End:0x470
            break;
        // End:0x42B
        case 19:
            GotoState('VSClawLeft');
            // End:0x470
            break;
        // End:0x441
        case 20:
            GotoState('VSClawRight');
            // End:0x470
            break;
        // End:0x457
        case 23:
            GotoState('Taunt');
            // End:0x470
            break;
        // End:0x46D
        case 24:
            GotoState('EndStrike');
            // End:0x470
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

state Delay
{Begin:

    // End:0x170
    if(int(CurrentStrike.AttackList[CurrentAttack].AttackType) != int(15))
    {
        DelayStart = Outer.BossPawn.WorldInfo.TimeSeconds;
        Outer.PlaySM(Class'LPSM_Act1BossIdle');
        J0xBF:

        // End:0x170 [Loop If]
        if((DelayStart - Outer.BossPawn.WorldInfo.TimeSeconds) < CurrentStrike.AttackList[CurrentAttack].DelayBeforeAttack)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0xBF;
        }
    }
    GotoState('Attack');
    stop;        
}

state Attack
{Begin:

    Outer.Focus = none;
    StartAttack();
    GotoState('EndStrike');
    stop;                
}

state EndStrike
{Begin:

    Outer.bCoresVulnerable = false;
    Outer.PopCommand(self);
    Outer.Sleep(0.0000000);
    stop;        
}

state NextAttack
{Begin:

    StartNextAttack();
    GotoState('EndStrike');
    stop;                
}

state PlaySMState
{
    ignores DoSm;
Begin:

    DoSm();
    J0x0A:

    // End:0x4C [Loop If]
    if(Outer.bSpecialMovePlaying)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x0A;
    }
    GotoState('NextAttack');
    stop;        
}

state Taunt extends PlaySMState
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeOfLastTaunt = Outer.WorldInfo.TimeSeconds;
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function DoSm()
    {
        Outer.PlaySM(Class'LPSM_Act1BossTaunt', EnemyForStrike);
        //return;        
    }
    stop;    
}

state TongueStabAttack extends PlaySMState
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeOfLastTongueAttack = Outer.WorldInfo.TimeSeconds;
        Outer.bIsInTongueAttack = true;
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.bIsInTongueAttack = false;
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function DoSm()
    {
        FaceEnemy();
        Outer.PlaySM(Class'LPSM_Act1BossTongueStrikeBegin', EnemyForStrike);
        //return;        
    }
    stop;    
}

state TongueExit extends PlaySMState
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.bIsInTongueAttack = false;
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function DoSm()
    {
        Outer.PlaySM(Class'LPSM_Act1BossTongueExit', EnemyForStrike);
        //return;        
    }
    stop;    
}

state TongueSwipe
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeOfLastTongueAttack = Outer.WorldInfo.TimeSeconds;
        Outer.bIsInTongueAttack = true;
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ResetAnimScaleForTongueSwipe();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event NotifyThatSpecialDodgeActorDodged()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
        local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];

        // End:0x80
        if(ClassIsChildOf(DodgePerforming, Class'LPSM_PlayerDodgeBossTongueRight2') || ClassIsChildOf(DodgePerforming, Class'LPSM_PlayerDodgeBossTongueLeft2'))
        {
            Outer.BossPawn.Mesh.GlobalAnimRateScale = 0.1000000;
        }
        super(LPAICommand).NotifyThatSpecialDodgeActorDodged(Dodger, DodgePerforming);
        //return;        
    }

    event NotifyThatSpecialDodgeReady()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];

        ResetAnimScaleForTongueSwipe();
        //return;        
    }
Begin:

    Outer.DelayedTurnToCenter(0.4000000);
    // End:0x1A2
    if((EnemyForStrike.Location - Outer.BossPawn.Location) Cross (Vector(Outer.BossPawn.Rotation) * 500.0000000).Z < float(0))
    {
        Outer.PlaySM(Class'LPSM_Act1BossTongueRollLeft', EnemyForStrike);
        J0x101:

        // End:0x143 [Loop If]
        if(Outer.bSpecialMovePlaying)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x101;
        }
        ResetAnimScaleForTongueSwipe();
        Outer.bIsInTongueAttack = false;
        Outer.PlaySM(Class'LPSM_Act1BossTongueSwipeRLExit', EnemyForStrike);        
    }
    else
    {
        Outer.PlaySM(Class'LPSM_Act1BossTongueRollRight', EnemyForStrike);
        J0x1D3:

        // End:0x215 [Loop If]
        if(Outer.bSpecialMovePlaying)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x1D3;
        }
        ResetAnimScaleForTongueSwipe();
        Outer.bIsInTongueAttack = false;
        Outer.PlaySM(Class'LPSM_Act1BossTongueSwipeLRExit', EnemyForStrike);
    }
    J0x271:

    // End:0x2B3 [Loop If]
    if(Outer.bSpecialMovePlaying)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x271;
    }
    GotoState('NextAttack');
    stop;            
}

state ClawAttack extends PlaySMState
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeOfLastClawAttack = Outer.WorldInfo.TimeSeconds;
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }
    stop;    
}

state ClawBladeAttackLeft extends ClawAttack
{
    function DoSm()
    {
        FaceEnemy();
        Outer.PlaySM(Class'LPSM_Act1BossLeftBladeAttack', EnemyForStrike);
        //return;        
    }
    stop;    
}

state ClawBladeAttackRight extends ClawAttack
{
    function DoSm()
    {
        FaceEnemy();
        Outer.PlaySM(Class'LPSM_Act1BossRightBladeAttack', EnemyForStrike);
        //return;        
    }
    stop;    
}

state ClawFastAttackLeft extends ClawAttack
{
    function DoSm()
    {
        FaceEnemy();
        Outer.PlaySM(Class'LPSM_Act1BossLeftBladeAttackFast', EnemyForStrike);
        //return;        
    }
    stop;    
}

state ClawFastAttackRight extends ClawAttack
{
    function DoSm()
    {
        FaceEnemy();
        Outer.PlaySM(Class'LPSM_Act1BossRightBladeAttackFast', EnemyForStrike);
        //return;        
    }
    stop;    
}

state SwipeAttackLeft extends ClawFastAttackLeft
{    stop;    
}

state SwipeAttackRight extends ClawFastAttackRight
{    stop;    
}

state ClawDrop
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeOfLastClawAttack = Outer.WorldInfo.TimeSeconds;
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function IsWithinCenter()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL ToCenter, ToSide;
        local /*0x97E50000-0x00000000*/ private float dotVal;

        ToCenter = Vector(Outer.BossPawn.Rotation);
        ToSide = ToCenter Cross vect(0.0000000, 0.0000000, 1.0000000);
        dotVal = (Outer.BossPawn.Location - EnemyForStrike.Location) Dot ToSide;
        // End:0xF7
        if((dotVal < float(350)) && dotVal > float(-350))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.DelayedTurnToCenter(0.4000000);
    Outer.PlaySM(Class'LPSM_Act1BossClawDrop', EnemyForStrike);
    J0x55:

    // End:0x97 [Loop If]
    if(Outer.bSpecialMovePlaying)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x55;
    }
    // End:0xD8
    if(IsWithinCenter())
    {
        Outer.PlaySM(Class'LPSM_Act1BossClawDropCenter', EnemyForStrike);        
    }
    else
    {
        // End:0x1B8
        if((EnemyForStrike.Location - Outer.BossPawn.Location) Cross (Vector(Outer.BossPawn.Rotation) * 500.0000000).Z < float(0))
        {
            Outer.PlaySM(Class'LPSM_Act1BossClawDropRight', EnemyForStrike);            
        }
        else
        {
            Outer.PlaySM(Class'LPSM_Act1BossClawDropLeft', EnemyForStrike);
        }
    }
    J0x1E9:

    // End:0x22B [Loop If]
    if(Outer.bSpecialMovePlaying)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x1E9;
    }
    GotoState('NextAttack');
    stop;            
}

state Bite extends PlaySMState
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeOfLastBiteAttack = Outer.WorldInfo.TimeSeconds;
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function DoSm()
    {
        FaceEnemy();
        Outer.PlaySM(Class'LPSM_Act1BossBite', EnemyForStrike);
        //return;        
    }
    stop;    
}

state VSTongue extends PlaySMState
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Outer.TimeOfLastTongueAttack = Outer.WorldInfo.TimeSeconds;
        Outer.bIsInTongueAttack = true;
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function DoSm()
    {
        FaceEnemy();
        Outer.PlaySM(Class'LPSM_Act1BossVSAttack', EnemyForStrike);
        //return;        
    }
    stop;    
}

state VSClawLeft extends ClawAttack
{
    function DoSm()
    {
        FaceEnemy();
        Outer.PlaySM(Class'LPSM_Act1BossVSClawLeft', EnemyForStrike);
        //return;        
    }
    stop;    
}

state VSClawRight extends ClawAttack
{
    function DoSm()
    {
        FaceEnemy();
        Outer.PlaySM(Class'LPSM_Act1BossVSClawRight', EnemyForStrike);
        //return;        
    }
    stop;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x78
        if(Outer.TimeFirstAttack == float(0))
        {
            Outer.TimeFirstAttack = Outer.WorldInfo.TimeSeconds;
        }
        //return;        
    }
Begin:

    StartStrike(Outer.BossPawn.TuneDataBoss.TunedStrikes);
    GotoState('EndStrike');
    stop;                
}
