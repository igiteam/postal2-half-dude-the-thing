class LPAIControllerSpitter extends LPAIControllerAkridLarge
    config(AI)
    hidecategories(AnimDependency,Navigation);

const INVALID_SEPERATION = -99999;

enum SpitterSMMode
{
    SpitterSMMode_OneTime,          // 0
    SpitterSMMode_Loop,             // 1
    SpitterSMMode_LoopCount,        // 2
    SpitterSMMode_MAX               // 3
};

enum SpitterTauntMode
{
    SpitterTaunt_Short,             // 0
    SpitterTaunt_Long,              // 1
    SpitterTaunt_Announce,          // 2
    SpitterTaunt_DuringAttack,      // 3
    SpitterTaunt_MAX                // 4
};

struct native SpitterSMEntry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class SMClass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Mode;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LoopTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LoopCount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInterruptible;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsMeleeHit;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowChoreography;

    structdefaultproperties
    {
        SMClass=none
        Mode=SpitterSMMode.SpitterSMMode_OneTime
        LoopTime=1.0000000
        LoopCount=1
        bInterruptible=false
        bIsMeleeHit=false
        bAllowChoreography=true
    }
};

struct native MeleeDmgInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL DmgInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIgnore;

    structdefaultproperties
    {
        DmgInfo=(ImpactInfo=(Impact=(HitActor=none,HitLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000),HitNormal=(X=0.0000000,Y=0.0000000,Z=0.0000000),RayDir=(X=0.0000000,Y=0.0000000,Z=0.0000000),StartTrace=(X=0.0000000,Y=0.0000000,Z=0.0000000),HitInfo=(Material=none,PhysMaterial=none,Item=0,LevelIndex=0,BoneName="None",HitComponent=none)),SplineName="None"),DamageAmount=0.0000000,TheDamageType=none)
        bIgnore=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitterPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTailIntact;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowMoreDebug;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugAttackReactive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDelayMeleeDmg[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTuneSpit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextEnemySightedTauntTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStrikeEnd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSpitStrikeEnd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeTauntEnd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DebugExclusiveAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array PendingMeleeDmg[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextTailIkCheck;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_ChargeAttack[524289];

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    SpitterPawn = LPAIPawnSpitter(inPawn);
    TimeStrikeEnd = -1.0000000;
    TimeSpitStrikeEnd = -1.0000000;
    DebugExclusiveAttack = -1;
    CmdStatus_ChargeAttack = new (self) Class'LPAICmdStatus_ChargeAttack';
    CmdStatus_ChargeAttack.SetDefaults();
    //return;    
}

event UnPossess()
{
    CmdStatus_ChargeAttack = none;
    super(LPAIController).UnPossess();
    //return;    
}

function SetAttackResourceNames()
{
    MeleeResourceName = 'IceCrabMelee';
    StrikeResourceName = 'strike';
    RangedResourceName = 'SpitterRangedFormation';
    FireResourceName = 'SpitterFire';
    //return;    
}

function GetDamageDoneToRanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, pofPawn;

    vsPawn = LPBaseVSPlayerPawn(Other);
    // End:0x75
    if(vsPawn != none)
    {
        return SpitterPawn.TuneDataSpitter.DamageToVsFromMovementHit.GetValue();
    }
    pofPawn = LPPlayerPawn(Other);
    // End:0xEA
    if(pofPawn != none)
    {
        return SpitterPawn.TuneDataSpitter.DamageToHumanFromMovementHit.GetValue();
    }
    return SpitterPawn.TuneDataSpitter.DamageToOtherFromMovementHit.GetValue();
    //return ReturnValue;    
}

function GetDamageTypeDoneToRanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, pofPawn;

    vsPawn = LPBaseVSPlayerPawn(Other);
    // End:0x5F
    if(vsPawn != none)
    {
        return SpitterPawn.TuneDataSpitter.DamageTypeToVsFromMovementHit;
    }
    pofPawn = LPPlayerPawn(Other);
    // End:0xBE
    if(pofPawn != none)
    {
        return SpitterPawn.TuneDataSpitter.DamageTypeToHumanFromMovementHit;
    }
    return SpitterPawn.TuneDataSpitter.DamageTypeToOtherFromMovementHit;
    //return ReturnValue;    
}

simulated event CoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SpitterTag;

    super(LPAIController).CoreDestroyed(CoreTag, CoreIndex);
    SpitterTag = LPPhysMatPropTag_SpitterCoreId(CoreTag);
    // End:0x84
    if(SpitterTag != none)
    {
        // End:0x84
        if(int(SpitterTag.CoreID) == int(3))
        {
            AbortAttack();
            StartTailBurnTwitchAnim();
        }
    }
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];

    super(LPAIController).NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage);
    // End:0x83
    if(SpitterPawn.CanCoreDamageInterruptTailAttack(HitCoreIndex, TypeOfDamage))
    {
        SpitterPawn.AddToDamageTracking(AmountOfDamage, true, 0);
    }
    //return;    
}

function NotifyJustReleasedFromGrapple()
{
    local /*0x97E50000-0x00000000*/ private @NULL MoveEnding[8388609], GrapplerReleasingMe;
    local /*0x97E50000-0x00000000*/ private bool bGrabAbruptRelease[8388609];
    local /*0x97E50000-0x00000000*/ private int TailCoreIdx;

    TailCoreIdx = SpitterPawn.GetCoreIndexForThisCoreId(0);
    // End:0x10C
    if((float(SpitterPawn.Health) <= SpitterPawn.HealthThresoldToDismemberTail) && ClassIsChildOf(MoveEnding.Class, Class'LPSM_ForkArmGrabVictim_Dismember'))
    {
        SpitterPawn.DismemberPart(SpitterPawn.MyCoreData[TailCoreIdx].DismembermentInfo.BoneName);
    }
    //return;    
}

function NotifyPreTailIkStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpitCmd;

    SpitCmd = LPAICmd_SpitterSpitStrike(GetActiveCommand());
    // End:0x4E
    if(SpitCmd != none)
    {
        SpitCmd.SetInitialSpitTargetAtIkStart();        
    }
    //return;    
}

function SetCSA()
{
    local /*0x97E50000-0x00000000*/ private byte eNewCsa[9437185];

    0
    // End:0x39
    if(!IsTailIntact())
    {
        SpitterPawn.SetCSA(1);        
    }
    else
    {
        SpitterPawn.SetCSA(eNewCsa);
    }
    //return;    
}

function NotifyCmdOfSpitStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL CmdStrike;

    CmdStrike = LPAICmd_SpitterSpitStrike(LPFindFirstAICommandOfClassInStack(Class'LPAICmd_SpitterSpitStrike'));
    // End:0x55
    if(CmdStrike != none)
    {
        CmdStrike.NotifySpitStarted();
    }
    //return;    
}

function AllowLineSweepHitTesterDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL DmgInfo[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MeleeDmg;

    // End:0x9E
    if(bDelayMeleeDmg && LPPawn(DmgInfo.ImpactInfo.Impact.HitActor) != none)
    {
        MeleeDmg.DmgInfo = DmgInfo;
        PendingMeleeDmg.AddItem(MeleeDmg);        
        return false;
    }
    return true;
    //return ReturnValue;    
}

function NotifyCmdOfHitActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], CmdStrike;

    // End:0x6D
    if(HitActor != none)
    {
        CmdStrike = LPAICmd_SpitterStrike(LPFindFirstAICommandOfClassInStack(Class'LPAICmd_SpitterStrike'));
        // End:0x6D
        if(CmdStrike != none)
        {
            CmdStrike.DelayedMeleeHitSomething(HitActor);
        }
    }
    //return;    
}

function DoPendingDelayedMeleeDamage()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL MeleeDmg;

    I = 0;
    J0x0B:

    // End:0x10A [Loop If]
    if(I < PendingMeleeDmg.Length)
    {
        MeleeDmg = PendingMeleeDmg[I];
        // End:0xFC
        if(!MeleeDmg.bIgnore)
        {
            NotifyCmdOfHitActor(MeleeDmg.DmgInfo.ImpactInfo.Impact.HitActor);
            SpitterPawn.LineSweepHitTesterDoPendingDamageAndEffects(MeleeDmg.DmgInfo);
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    PendingMeleeDmg.Length = 0;
    bDelayMeleeDmg = false;
    //return;    
}

function EnableDelayedMeleeDamage()
{
    bDelayMeleeDmg = true;
    PendingMeleeDmg.Length = 0;
    //return;    
}

function IgnoreDelayedMeleeDamageOn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xC7 [Loop If]
    if(I < PendingMeleeDmg.Length)
    {
        // End:0xB9
        if(PendingMeleeDmg[I].DmgInfo.ImpactInfo.Impact.HitActor == inActor)
        {
            PendingMeleeDmg[I].bIgnore = true;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    PendingMeleeDmg.Length = 0;
    //return;    
}

function NotifyDodgeWindowClosed()
{
    DoPendingDelayedMeleeDamage();
    //return;    
}

function ResetHitTests()
{
    SpitterPawn.LineSweepHitTesterResetHitTest();
    PendingMeleeDmg.Length = 0;
    bDelayMeleeDmg = false;
    //return;    
}

function GetPlayerPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], CurPawn, PlayerPawn;

    CurPawn = SpitterPawn.WorldInfo.PawnList;
    J0x3D:

    // End:0xAC [Loop If]
    if(CurPawn != none)
    {
        PlayerPawn = LPPlayerPawn(CurPawn);
        // End:0x81
        if(PlayerPawn != none)
        {
            return PlayerPawn;
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x3D;
    }
    return none;
    //return ReturnValue;    
}

function CmdSpitStrikePofDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], EnemyForDebug;

    EnemyForDebug = GetPlayerPawn();
    // End:0x6C
    if(EnemyForDebug != none)
    {
        bTuneSpit = true;
        AIObjectiveManager.EnableTicking(false);
        return CmdSpitStrike(EnemyForDebug, 0.0000000, false,, 0);
    }
    //return ReturnValue;    
}

function CmdSpitStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float WaitTimeBeforeAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFake[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterSpitStrike'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterSpitStrike(GetActiveCommand());
    // End:0x138
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.bFakeStrike = bFake;
        // End:0x138
        if(!bFake)
        {
            myCommand.WaitTimeBeforeAttack = WaitTimeBeforeAttack;
        }
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSpitStrikeVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float WaitTimeBeforeAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFake[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterSpitStrikeVS'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterSpitStrikeVS(GetActiveCommand());
    // End:0x138
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.bFakeStrike = bFake;
        // End:0x138
        if(!bFake)
        {
            myCommand.WaitTimeBeforeAttack = WaitTimeBeforeAttack;
        }
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTailSting()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float WaitTimeBeforeAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool bReactive[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    false
    CmdStatus_Strike
    1
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterTailSting'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterTailSting(GetActiveCommand());
    // End:0x12E
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.bReactive = bReactive;
        myCommand.WaitTimeBeforeAttack = WaitTimeBeforeAttack;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTailStingVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float WaitTimeBeforeAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool bReactive[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    false
    CmdStatus_Strike
    1
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterTailStingVS'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterTailStingVS(GetActiveCommand());
    // End:0x12E
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.bReactive = bReactive;
        myCommand.WaitTimeBeforeAttack = WaitTimeBeforeAttack;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTailStingResponseToVsHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterTailStingResponseToVsHit'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterTailStingResponseToVsHit(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTailStingQuick()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float WaitTimeBeforeAttack[8388609];
    local /*0x97E50000-0x00000000*/ private int RepeatCount[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    1
    CmdStatus_Strike
    1
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterTailStingQuick'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterTailStingQuick(GetActiveCommand());
    // End:0x12C
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.RepeatCount = RepeatCount;
        myCommand.WaitTimeBeforeAttack = WaitTimeBeforeAttack;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTailStingQuickVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float WaitTimeBeforeAttack[8388609];
    local /*0x97E50000-0x00000000*/ private int RepeatCount[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    1
    CmdStatus_Strike
    1
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterTailStingQuickVS'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterTailStingQuickVS(GetActiveCommand());
    // End:0x12C
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.RepeatCount = RepeatCount;
        myCommand.WaitTimeBeforeAttack = WaitTimeBeforeAttack;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTalonStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterAttackTalon'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterAttackTalon(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTailSwingStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterAttackTailSwing'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterAttackTailSwing(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetReturnCmdStatus(CmdStatus);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSpitterTaunt()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForTaunt[8388609];
    local /*0x97E50000-0x00000000*/ private byte Mode[8388609];
    local /*0x97E50000-0x00000000*/ private float TauntTime[8388609];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    1
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterTaunt'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterTaunt(GetActiveCommand());
    // End:0x11A
    if(myCommand != none)
    {
        myCommand.InteractionActor = EnemyForTaunt;
        myCommand.EnemyForTaunt = EnemyForTaunt;
        myCommand.Mode = Mode;
        myCommand.TauntTime = TauntTime;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSpitterStun()
{
    local /*0x97E50000-0x00000000*/ private @NULL InteractionActor[8388609];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterSMPlayer'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterSMPlayer(GetActiveCommand());
    // End:0x385
    if(myCommand != none)
    {
        myCommand.InteractionActor = InteractionActor;
        myCommand.Description = "Stun";
        myCommand.SMList.Length = 0;
        myCommand.SMList.Add(3);        
        myCommand.SMList[0].SMClass = Class'LPSM_SpitterStunStart';
        myCommand.SMList[0].Mode = 0;
        myCommand.SMList[0].bInterruptible = false;
        myCommand.SMList[1].SMClass = Class'LPSM_SpitterStunHold';
        myCommand.SMList[1].Mode = 1;
        myCommand.SMList[1].LoopTime = SpitterPawn.TuneDataSpitter.Time_VsHit_Stun.GetValue();
        myCommand.SMList[1].bInterruptible = false;
        myCommand.SMList[2].SMClass = Class'LPSM_SpitterStunFinish';
        myCommand.SMList[2].Mode = 0;
        myCommand.SMList[2].bInterruptible = false;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSpitterDefaultStun()
{
    local /*0x97E50000-0x00000000*/ private @NULL InteractionActor[8388609];
    local /*0x97E50000-0x00000000*/ private float StunnedDuration[8388609];
    local /*0x97E50000-0x00000000*/ private class MoveCycle[9437185], MoveIn, MoveOut;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;
    local /*0x97E50000-0x00000000*/ private int Idx;

    0
    // End:0x31
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterSMPlayer'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterSMPlayer(GetActiveCommand());
    // End:0x436
    if(myCommand != none)
    {
        myCommand.InteractionActor = InteractionActor;
        myCommand.Description = "DefaultStun";
        myCommand.SMList.Length = 0;
        Idx = 0;
        // End:0x1F9
        if(MoveIn != none)
        {
            myCommand.SMList.Add(1);            
            myCommand.SMList[Idx].SMClass = MoveIn;
            myCommand.SMList[Idx].Mode = 0;
            myCommand.SMList[Idx].bInterruptible = false;
            ++Idx;
        }
        // End:0x33A
        if(MoveCycle != none)
        {
            myCommand.SMList.Add(1);            
            myCommand.SMList[Idx].SMClass = MoveCycle;
            myCommand.SMList[Idx].Mode = 1;
            myCommand.SMList[Idx].LoopTime = StunnedDuration;
            myCommand.SMList[Idx].bInterruptible = false;
            ++Idx;
        }
        // End:0x436
        if(MoveOut != none)
        {
            myCommand.SMList.Add(1);            
            myCommand.SMList[Idx].SMClass = MoveOut;
            myCommand.SMList[Idx].Mode = 0;
            myCommand.SMList[Idx].bInterruptible = false;
            ++Idx;
        }
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSpitterHobble()
{
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterSMPlayer'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterSMPlayer(GetActiveCommand());
    // End:0x37F
    if(myCommand != none)
    {
        myCommand.InteractionActor = none;
        myCommand.Description = "Hobble";
        myCommand.SMList.Length = 0;
        myCommand.SMList.Add(3);        
        myCommand.SMList[0].SMClass = Class'LPSM_SpitterStunStart';
        myCommand.SMList[0].Mode = 0;
        myCommand.SMList[0].bInterruptible = false;
        myCommand.SMList[1].SMClass = Class'LPSM_SpitterStunHold';
        myCommand.SMList[1].Mode = 1;
        myCommand.SMList[1].LoopTime = SpitterPawn.TuneDataSpitter.Time_Leg_Stun.GetValue();
        myCommand.SMList[1].bInterruptible = false;
        myCommand.SMList[2].SMClass = Class'LPSM_SpitterStunFinish';
        myCommand.SMList[2].Mode = 0;
        myCommand.SMList[2].bInterruptible = false;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSpitterTailBreakReaction()
{
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterSMPlayer'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterSMPlayer(GetActiveCommand());
    // End:0x1B9
    if(myCommand != none)
    {
        myCommand.InteractionActor = none;
        myCommand.Description = "Tail Break Reaction";
        myCommand.SMList.Length = 0;
        myCommand.SMList.Add(1);        
        myCommand.SMList[0].SMClass = Class'LPSM_SpitterStunTailBreak';
        myCommand.SMList[0].Mode = 0;
        myCommand.SMList[0].bInterruptible = false;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSpitterTailAttackAbortWithHitReaction()
{
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterSMPlayer'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterSMPlayer(GetActiveCommand());
    // End:0x1BB
    if(myCommand != none)
    {
        myCommand.InteractionActor = none;
        myCommand.Description = "Tail Attack Abort Hit";
        myCommand.SMList.Length = 0;
        myCommand.SMList.Add(1);        
        myCommand.SMList[0].SMClass = Class'LPSM_SpitterAttackTailInterrupt';
        myCommand.SMList[0].Mode = 0;
        myCommand.SMList[0].bInterruptible = false;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSpitterHunkerDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609], DesiredFocus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    1
    // End:0x1F6
    if(LPBaseVSPlayerPawn(EnemyForAttack) == none)
    {
        // End:0x4B
        if(int(CmdOption) == int(0))
        {
            AbortCommand(CommandList);
        }
        Class'LPAICmd_SpitterSMPlayer'.static.InitCommand(self);
        myCommand = LPAICmd_SpitterSMPlayer(GetActiveCommand());
        // End:0x1F6
        if(myCommand != none)
        {
            myCommand.InteractionActor = none;
            myCommand.DesiredFocus = DesiredFocus;
            myCommand.Description = "Hunker Down";
            myCommand.SMList.Length = 0;
            myCommand.SMList.Add(1);            
            myCommand.SMList[0].SMClass = Class'LPSM_SpitterAttackHunkerDown';
            myCommand.SMList[0].Mode = 0;
            myCommand.SMList[0].bInterruptible = false;
        }
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdSpitterHunkerDownForSpit()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609], DesiredFocus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    1
    // End:0x1F6
    if(LPBaseVSPlayerPawn(EnemyForAttack) == none)
    {
        // End:0x4B
        if(int(CmdOption) == int(0))
        {
            AbortCommand(CommandList);
        }
        Class'LPAICmd_SpitterSMPlayer'.static.InitCommand(self);
        myCommand = LPAICmd_SpitterSMPlayer(GetActiveCommand());
        // End:0x1F6
        if(myCommand != none)
        {
            myCommand.InteractionActor = none;
            myCommand.DesiredFocus = DesiredFocus;
            myCommand.Description = "Hunker Down";
            myCommand.SMList.Length = 0;
            myCommand.SMList.Add(1);            
            myCommand.SMList[0].SMClass = Class'LPSM_SpitterAttackHunkerDownForSpit';
            myCommand.SMList[0].Mode = 0;
            myCommand.SMList[0].bInterruptible = false;
        }
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdFlee()
{
    local /*0x97E50000-0x00000000*/ private float Duration[9437185], MaxFleeDist, DesiredSeperationFromDanger;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool bFinishWhenSafe[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    2.0000000
    10000.0000000
    200.0000000    
    0
    true
    // End:0x4F
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterFlee'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterFlee(GetActiveCommand());
    // End:0x185
    if(myCommand != none)
    {
        myCommand.Duration = Duration;
        myCommand.SetMaxFleeDistance(MaxFleeDist);
        myCommand.SetDesiredSeperationFromDanger(DesiredSeperationFromDanger);
        myCommand.SetFleeFromActors(FleeFrom);
        myCommand.SetFinishWhenSafe(bFinishWhenSafe);
        myCommand.bAllowInterruptionOfFlee = true;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdShortFlee()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float Time[8388609];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCandidate, Cmd;

    1
    // End:0x2B
    if(CurEnemy != none)
    {
        FleeFrom.AddItem(CurEnemy);        
    }
    I = 0;
    J0x36:

    // End:0xD1 [Loop If]
    if(I < TargetList.Length)
    {
        EnemyCandidate = TargetList[I].Actor;
        // End:0xC3
        if((CanBeMyEnemy(EnemyCandidate)) && CurEnemy != EnemyCandidate)
        {
            FleeFrom.AddItem(EnemyCandidate);            
        }
        ++I;
        // [Loop Continue]
        goto J0x36;
    }
    // End:0xF2
    if(Time < float(2))
    {
        Time = 2.0000000;
    }
    Cmd = LPAICmd_SpitterFlee(CmdFlee(Time, 4000.0000000, 2000.0000000, FleeFrom, CmdOption));
    // End:0x18D
    if(Cmd != none)
    {
        Cmd.ActorToFocus = CurEnemy;
        Cmd.bAllowInterruptionOfFlee = false;
    }
    return Cmd;
    //return ReturnValue;    
}

function CmdCloseCombat()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterAttackCloseCombatPof_MP'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterAttackCloseCombatPof_MP(GetActiveCommand());
    // End:0xAF
    if(myCommand != none)
    {
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function StartSpit()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609];

    SpitterPawn.SetSpitTarget(Target);
    SpitterPawn.StartSpitting();
    //return;    
}

function StopSpit()
{
    SpitterPawn.SetSpitTarget(none);
    SpitterPawn.StopSpitting(false);
    //return;    
}

function NotifyTailDestroyed()
{
    bTailIntact = false;
    //return;    
}

function IsTailIntact()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bTailIntact;
    //return ReturnValue;    
}

function IsSpitPossible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (IsTailIntact()) && !IsTailBurning();
    //return ReturnValue;    
}

function IsChargeAttackPossible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IsTailBurning()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float SpitHoleHealth;
    local /*0x97E50000-0x00000000*/ private bool bSpitHoleRegenerating;

    SpitHoleHealth = SpitterPawn.GetCoreHealth(3);
    bSpitHoleRegenerating = SpitterPawn.IsCoreRegenerating(3);
    // End:0x79
    if((SpitHoleHealth <= float(0)) || bSpitHoleRegenerating)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetCurrentStrikeCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Cmd, CmdStrike;

    Cmd = CommandList;
    J0x13:

    // End:0x82 [Loop If]
    if(Cmd != none)
    {
        CmdStrike = LPAICmd_SpitterStrike(Cmd);
        // End:0x57
        if(CmdStrike != none)
        {
            return CmdStrike;
        }
        Cmd = Cmd.ChildCommand;
        // [Loop Continue]
        goto J0x13;
    }
    return none;
    //return ReturnValue;    
}

function IsInStrikeCmd()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (GetCurrentStrikeCmd()) != none;
    //return ReturnValue;    
}

function IsStriking()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStrike;

    CmdStrike = GetCurrentStrikeCmd();
    // End:0x43
    if(CmdStrike != none)
    {
        return CmdStrike.IsStriking();
    }
    return false;
    //return ReturnValue;    
}

function WorldTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return SpitterPawn.WorldInfo.TimeSeconds;
    //return ReturnValue;    
}

function IsInAttackRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL Range[25296897];
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5B
    if((Seperation >= Range.Min) && Seperation <= Range.Max)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function IsInAttackRangeMin()
{
    local /*0x97E50000-0x00000000*/ private @NULL Range[25296897];
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(Seperation >= Range.Min)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function IsInAttackRangeMax()
{
    local /*0x97E50000-0x00000000*/ private @NULL Range[25296897];
    local /*0x97E50000-0x00000000*/ private float Seperation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(Seperation <= Range.Max)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function CanAttackForRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackRange[25296897], InEnemy;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Seperation;

    Seperation = SeperationToPawn2D(InEnemy);
    return IsInAttackRange(AttackRange, Seperation);
    //return ReturnValue;    
}

function CanAttackForRangeMin()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackRange[25296897], InEnemy;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Seperation;

    Seperation = SeperationToPawn2D(InEnemy);
    return IsInAttackRangeMin(AttackRange, Seperation);
    //return ReturnValue;    
}

function CanAttackForRangeMax()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackRange[25296897], InEnemy;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Seperation;

    Seperation = SeperationToPawn2D(InEnemy);
    return IsInAttackRangeMax(AttackRange, Seperation);
    //return ReturnValue;    
}

function SetExclusiveAttack()
{
    local /*0x97E50000-0x00000000*/ private int InAttack[9437185];

    -1
    DebugExclusiveAttack = InAttack;
    // End:0x57
    if(InAttack < 0)
    {
        bTuneSpit = false;
        AIObjectiveManager.EnableTicking(true);
    }
    bDebugAttackReactive = false;
    //return;    
}

function DebugAttackReactiveOnly()
{
    SetExclusiveAttack();
    bDebugAttackReactive = true;
    //return;    
}

function ResetStrikeTime()
{
    TimeStrikeEnd = -10000.0000000;
    //return;    
}

function CmdFollowPath()
{
    local /*0x97E50000-0x00000000*/ private @NULL FollowPathData[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand, SpitterFollowPathData;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    SpitterFollowPathData = LPAIOD_SpitterFollowPath(FollowPathData);
    // End:0xD1
    if((int(WorldInfo.NetMode) == int(NM_Standalone)) || SpitterFollowPathData == none)
    {
        Class'LPAICmd_FollowPath'.static.InitCommand(self);
        myCommand = LPAICmd_FollowPath(GetActiveCommand());        
    }
    else
    {
        Class'LPAICmd_SpitterFollowPath'.static.InitCommand(self);
        myCommand = LPAICmd_SpitterFollowPath(GetActiveCommand());
    }
    // End:0x16D
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetFollowPathData(FollowPathData);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdGotoFleePoint()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleePoint[8388609];
    local /*0x97E50000-0x00000000*/ private bool RotateToFaceSameDirectionAsFleePoint[8388609], InterpolateToExactPosition;
    local /*0x97E50000-0x00000000*/ private @NULL ActorToFaceWhileMoving[8388609], ActorToAvoidWhileMoving;
    local /*0x97E50000-0x00000000*/ private float SpeedScale[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    0
    // End:0x33
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_GotoFleePointSpitter'.static.InitCommand(self);
    myCommand = LPAICmd_GotoFleePointSpitter(GetActiveCommand());
    // End:0x173
    if(myCommand != none)
    {
        myCommand.SetFleePoint(FleePoint);
        myCommand.RotateToFaceSameDirectionAsFleePoint = RotateToFaceSameDirectionAsFleePoint;
        myCommand.ActorToFaceWhileMoving = ActorToFaceWhileMoving;
        myCommand.ActorToAvoidWhileMoving = ActorToAvoidWhileMoving;
        myCommand.InterpolateToExactPosition = InterpolateToExactPosition;
        myCommand.SpeedScale = SpeedScale;
    }
    SpitterPawn.DisableTailIKImmediate();
    return myCommand;
    //return ReturnValue;    
}

function AbortAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackCmd;

    AttackCmd = LPAICmd_SpitterAttack(LPFindFirstAICommandOfClassInStack(Class'LPAICmd_SpitterAttack'));
    // End:0x4A
    if(AttackCmd != none)
    {
        AbortCommand(AttackCmd);
    }
    //return;    
}

function StartTailBurnTwitchAnim()
{
    // End:0x2D
    if(IsTailBurning())
    {
        SpitterPawn.EnableTailTwitch(true);
    }
    //return;    
}

function IsTaunting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPAICmd_SpitterTaunt(GetActiveCommand()) != none;
    //return ReturnValue;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(Actor).Tick(DeltaTime);
    // End:0xF5
    if(SpitterPawn.IsSinglePlayerGame() && NextTailIkCheck < SpitterPawn.WorldInfo.TimeSeconds)
    {
        // End:0xF5
        if((LPFindFirstAICommandOfClassInStack(Class'LPAICmd_SpitterSpitStrike')) == none)
        {
            SpitterPawn.DisableTailIKImmediate();
            NextTailIkCheck = SpitterPawn.WorldInfo.TimeSeconds + 2.0000000;
        }
    }
    //return;    
}

function @NULL IsOffNavMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL DesiredPos[8388609], EnemyForCheck;
    local /*0x97E50000-0x00000000*/ private float DesiredSeperation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle;
    local /*0x97E50000-0x00000000*/ private float ReachDistance, ExtentHeight, ExtentRadius;

    BotHandle = SPKynapseBotHandle(myAIPawn.myKynapseHandle);
    // End:0x222
    if((BotHandle != none) && !BotHandle.PathFinder_IsLocationInNavMesh(DesiredPos))
    {
        DesiredPos.Z = (EnemyForCheck.Location.Z - EnemyForCheck.CylinderComponent.CollisionHeight) + myAIPawn.CylinderComponent.CollisionHeight;
        ReachDistance = MyKynapseRadius + DesiredSeperation;
        ExtentHeight = myAIPawn.CylinderComponent.CollisionHeight - (myAIPawn.MaxStepHeight * float(2));
        ExtentRadius = 1.0000000;
        // End:0x222
        if(!BotHandle.PathFinder_CanReach(DesiredPos, ReachDistance, myAIPawn.MaxStepHeight, ExtentRadius, ExtentHeight))
        {
            return true;            
        }
    }
    return false;
    //return ReturnValue;    
}

function IsEnemyReachable()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForCheck[8388609];
    local /*0x97E50000-0x00000000*/ private float DesiredSeperation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsOffNavMesh(EnemyForCheck.Location, EnemyForCheck, DesiredSeperation);
    //return ReturnValue;    
}

simulated function GetChargeStrikeHitDamageForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPBaseVSPlayerPawn(HitPawn);
    // End:0x130
    if(vsPawn != none)
    {
        // End:0xE6
        if(float(vsPawn.Health) >= SpitterPawn.TuneDataSpitter.MinAmountOfHealthForVsToTakeNonShutdownHitDamage.GetValue())
        {
            return SpitterPawn.TuneDataSpitter.ChargeHitDamageVS.GetValue();            
        }
        else
        {
            return SpitterPawn.TuneDataSpitter.ChargeHitDamageShutdownVS.GetValue();
        }
    }
    return SpitterPawn.TuneDataSpitter.ChargeHitDamagePoF.GetValue();
    //return ReturnValue;    
}

function GetChargeBrushDamageForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPBaseVSPlayerPawn(HitPawn);
    // End:0x130
    if(vsPawn != none)
    {
        // End:0xE6
        if(float(vsPawn.Health) >= SpitterPawn.TuneDataSpitter.MinAmountOfHealthForVsToTakeNonShutdownHitDamage.GetValue())
        {
            return SpitterPawn.TuneDataSpitter.ChargeBrushDamageVs.GetValue();            
        }
        else
        {
            return SpitterPawn.TuneDataSpitter.ChargeBrushDamageShutdownVs.GetValue();
        }
    }
    return SpitterPawn.TuneDataSpitter.ChargeBrushDamagePoF.GetValue();
    //return ReturnValue;    
}

function GetMinDistanceAwayToStartChargingStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfStrike[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x7E
    if((TargetOfStrike != none) && TargetOfStrike.IsA('LPBaseVSPlayerPawn'))
    {
        return SpitterPawn.TuneDataSpitter.MinDistanceAwayToStartChargingStrikeAgainstVs.GetValue();
    }
    return SpitterPawn.TuneDataSpitter.MinDistanceAwayToStartChargingStrike.GetValue();
    //return ReturnValue;    
}

function IsVitalSuitInTheWay()
{
    local /*0x97E50000-0x00000000*/ private @NULL DesiredPos[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, FromLocation, ToLocation, NearestLocation, VSLocation;

    local /*0x97E50000-0x00000000*/ private float CombinedRadiusSq;

    ToLocation = DesiredPos;
    ToLocation.Z = 0.0000000;
    FromLocation = SpitterPawn.Location;
    FromLocation.Z = 0.0000000;
    // End:0x24A
    foreach SpitterPawn.WorldInfo.AllPawns(Class'LPBaseVSPlayerPawn', vsPawn)
    {
        VSLocation = vsPawn.Location;
        VSLocation.Z = 0.0000000;
        // End:0x249
        if(((ToLocation - VSLocation) Dot (ToLocation - FromLocation)) > float(0))
        {
            NearestLocation = Class'SPEngine.SPUtil'.static.NearestPointOnLineSegment(FromLocation, ToLocation, VSLocation);
            CombinedRadiusSq = SpitterPawn.CylinderComponent.CollisionRadius + vsPawn.CylinderComponent.CollisionRadius;
            CombinedRadiusSq = CombinedRadiusSq * CombinedRadiusSq;
            // End:0x249
            if(VSizeSq2D(NearestLocation - VSLocation) < CombinedRadiusSq)
            {                
                return true;
            }
        }        
    }    
    return false;
    //return ReturnValue;    
}

function IsCurrentlyDoingCloseCombat()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(LPAICmd_SpitterAttackCloseCombatPof_MP(CurrentObjective.CurrentCommand) != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldCloseCombat()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private float MaxHeightDelta[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float HeightDelta, MyFloorZ, EnemyFloorZ, Seperation;

    999999.0000000
    // End:0x23
    if(!IsEnemyVisible(EnemyToCheck))
    {
        return false;
    }
    // End:0x85
    if(EnemyToCheck.IsHiddenByCover(EnemyToCheck.Location - Pawn.Location))
    {
        return false;
    }
    Seperation = SeperationToPawn2D(EnemyToCheck);
    MyFloorZ = Pawn.Location.Z - Pawn.CylinderComponent.CollisionHeight;
    EnemyFloorZ = EnemyToCheck.Location.Z - EnemyToCheck.CylinderComponent.CollisionHeight;
    HeightDelta = Abs(EnemyFloorZ - MyFloorZ);
    // End:0x1BB
    if(HeightDelta > MaxHeightDelta)
    {
        return false;
    }
    // End:0x23E
    if((EnemyToCheck == (GetEnemy())) && IsCurrentlyDoingCloseCombat())
    {
        // End:0x23B
        if(Seperation > SpitterPawn.TuneDataSpitter.CloseCombatMaxDist.GetValue())
        {
            return false;
        }        
    }
    else
    {
        // End:0x297
        if(Seperation > SpitterPawn.TuneDataSpitter.CloseCombatMinDist.GetValue())
        {
            return false;
        }
    }
    // End:0x2E2
    if(!IsEnemyReachable(EnemyToCheck, SpitterPawn.AttackSeperation_TailStingPof.Max))
    {
        return false;
    }
    // End:0x2FC
    if(!CanHaveStrikeAccess(EnemyToCheck))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function PawnDied()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    CmdStatus_ChargeAttack.CloseDodgeWindow();
    super(SPGFCoverAIController).PawnDied(inPawn);
    //return;    
}

function CmdPerformChargingStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterChargingStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterChargingStrikePof(GetActiveCommand());
    // End:0xED
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(CmdStatus.GetTargetPawn());
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformChargingStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterChargingStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterChargingStrikeVs(GetActiveCommand());
    // End:0xED
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(CmdStatus.GetTargetPawn());
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformChargeAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float reachDist[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterChargeAttackPof'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterChargeAttackPof(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformChargeAttackVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float reachDist[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_SpitterChargeAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_SpitterChargeAttackVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    bTailIntact=true
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerSpitter.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerSpitter.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerSpitter.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerSpitter.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerSpitter.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    MeleeResourceName="SpitterCloseCombat"
    RangedResourceName="SpitterRangedFormation"
    FireResourceName="SpitterFire"
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerSpitter.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    HitReactionCmdClass=Class'LPAICmd_SpitterHitReaction'
    // Reference: SPAIReactionManager'Default__LPAIControllerSpitter.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerSpitter.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    bAILogToWindow=true
    Components[0]=LPAIObjectiveManager0
}