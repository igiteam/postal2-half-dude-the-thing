class LPSquad extends SPGFSquad
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampGrenadeWarningSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampJimKilledSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampMoveForwardSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampPlayerSeenSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampGeneric1Sound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampGeneric2Sound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampHitByBulletSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampDeathSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampGrenadeDeathSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampAnySound;

// Export ULPSquad::execProcessStimulus(FFrame&, void* const)
native function ProcessStimulus()
{
    local /*0x97E50000-0x00000000*/ private @NULL AI[8519681], Enemy;
    local /*0x97E50000-0x00000000*/ private byte Type[8388609];
    local /*0x97E50000-0x00000000*/ private name EventName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPSquad::execCanPlayChatter(FFrame&, void* const)
native final function CanPlayChatter()
{
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPSquad::execPlayPlayerSeenSound(FFrame&, void* const)
native final function PlayPlayerSeenSound()
{
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCtrl[8388609];


}

event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HumanCtrl;

    super(Actor).Tick(DeltaTime);
    // End:0x146
    if((SquadMembers.Length > 0) && EnemyList.Length > 0)
    {
        HumanCtrl = LPAIControllerHumanSoldier(SquadMembers[0].Member);
        // End:0x146
        if(HumanCtrl != none)
        {
            // End:0x146
            if((WorldInfo.TimeSeconds - TimeStampAnySound) > HumanCtrl.HumanSoldierPawn.TuneDataHumanSoldier.MaxTimeNoSoundTryAGeneric)
            {
                // End:0x120
                if(FRand() > 0.5000000)
                {
                    PlayGeneric1Sound(HumanCtrl);
                    PlayGeneric2Sound(HumanCtrl);                    
                }
                else
                {
                    PlayGeneric2Sound(HumanCtrl);
                    PlayGeneric1Sound(HumanCtrl);
                }
            }
        }
    }
    //return;    
}

function IsSomeoneShootingAtMyTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL Attacker[8388609], EnemyForAttack;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(SquadMembers.Length <= 1)
    {
        return false;
    }
    // End:0x92
    if((EnemyForAttack.AIResourceManager != none) && EnemyForAttack.AIResourceManager.GetAUser(Attacker.FireResourceName) != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function SetSquadReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL AI[8388609];

    super.SetSquadReference(AI);
    LPAIController(AI).MyLPSquad = self;
    //return;    
}

final function CanPlayDamagedSound()
{
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

final function PlayGrenadeWarningSound()
{
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private float TimeSinceLast;
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldier;

    // End:0x1A
    if(!CanPlayChatter(HumanSoldierCtrl))
    {
        return;
    }
    HumanSoldier = HumanSoldierCtrl.HumanSoldierPawn;
    // End:0x7D
    if(!HumanSoldier.TuneDataHumanSoldier.bEnableHSSGrenadeWarning)
    {
        return;
    }
    TimeSinceLast = WorldInfo.TimeSeconds - TimeStampAnySound;
    // End:0xF3
    if(TimeSinceLast < HumanSoldier.TuneDataHumanSoldier.MinTimeRepeatSoundGlobal)
    {
        return;
    }
    TimeSinceLast = WorldInfo.TimeSeconds - TimeStampGrenadeWarningSound;
    // End:0x169
    if(TimeSinceLast < HumanSoldier.TuneDataHumanSoldier.MinTimeRepeatSoundGrenadeWarning)
    {
        return;
    }
    TimeStampAnySound = WorldInfo.TimeSeconds;
    TimeStampGrenadeWarningSound = WorldInfo.TimeSeconds;
    HumanSoldier.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('HSGrenadeWarning', 'None', HumanSoldier, none, none, true);
    //return;    
}

final function PlayJimKilledSound()
{
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCtrl[8388609];

    // End:0x1A
    if(!CanPlayChatter(HumanSoldierCtrl))
    {
        return;
    }
    // End:0x6A
    if(!HumanSoldierCtrl.HumanSoldierPawn.TuneDataHumanSoldier.bEnableHSSJimKilled)
    {
        return;
    }
    TimeStampAnySound = WorldInfo.TimeSeconds;
    TimeStampJimKilledSound = WorldInfo.TimeSeconds;
    HumanSoldierCtrl.HumanSoldierPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('HSJimKilled', 'None', HumanSoldierCtrl.HumanSoldierPawn, none, none, true);
    //return;    
}

final function PlayMoveForwardSound()
{
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private float TimeSinceLast;
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldier;

    // End:0x1A
    if(!CanPlayChatter(HumanSoldierCtrl))
    {
        return;
    }
    HumanSoldier = HumanSoldierCtrl.HumanSoldierPawn;
    // End:0x7D
    if(!HumanSoldier.TuneDataHumanSoldier.bEnableHSSMoveForward)
    {
        return;
    }
    TimeSinceLast = WorldInfo.TimeSeconds - TimeStampAnySound;
    // End:0xF3
    if(TimeSinceLast < HumanSoldier.TuneDataHumanSoldier.MinTimeRepeatSoundGlobal)
    {
        return;
    }
    TimeSinceLast = WorldInfo.TimeSeconds - TimeStampMoveForwardSound;
    // End:0x169
    if(TimeSinceLast < HumanSoldier.TuneDataHumanSoldier.MinTimeRepeatSoundMoveForward)
    {
        return;
    }
    TimeStampAnySound = WorldInfo.TimeSeconds;
    TimeStampMoveForwardSound = WorldInfo.TimeSeconds;
    HumanSoldier.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('HSMoveForward', 'None', HumanSoldier, none, none, true);
    //return;    
}

final function PlayGeneric1Sound()
{
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private float TimeSinceLast;
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldier;

    // End:0x1A
    if(!CanPlayChatter(HumanSoldierCtrl))
    {
        return;
    }
    HumanSoldier = HumanSoldierCtrl.HumanSoldierPawn;
    // End:0x7D
    if(!HumanSoldier.TuneDataHumanSoldier.bEnableHSSGeneric1)
    {
        return;
    }
    TimeSinceLast = WorldInfo.TimeSeconds - TimeStampAnySound;
    // End:0xF3
    if(TimeSinceLast < HumanSoldier.TuneDataHumanSoldier.MinTimeRepeatSoundGlobal)
    {
        return;
    }
    TimeSinceLast = WorldInfo.TimeSeconds - TimeStampGeneric1Sound;
    // End:0x169
    if(TimeSinceLast < HumanSoldier.TuneDataHumanSoldier.MinTimeRepeatSoundGeneric1)
    {
        return;
    }
    TimeStampAnySound = WorldInfo.TimeSeconds;
    TimeStampGeneric1Sound = WorldInfo.TimeSeconds;
    HumanSoldier.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('HSGeneric1Sound', 'None', HumanSoldier, none, none, true);
    //return;    
}

final function PlayGeneric2Sound()
{
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private float TimeSinceLast;
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldier;

    // End:0x1A
    if(!CanPlayChatter(HumanSoldierCtrl))
    {
        return;
    }
    HumanSoldier = HumanSoldierCtrl.HumanSoldierPawn;
    // End:0x7D
    if(!HumanSoldier.TuneDataHumanSoldier.bEnableHSSGeneric2)
    {
        return;
    }
    TimeSinceLast = WorldInfo.TimeSeconds - TimeStampAnySound;
    // End:0xF3
    if(TimeSinceLast < HumanSoldier.TuneDataHumanSoldier.MinTimeRepeatSoundGlobal)
    {
        return;
    }
    TimeSinceLast = WorldInfo.TimeSeconds - TimeStampGeneric2Sound;
    // End:0x169
    if(TimeSinceLast < HumanSoldier.TuneDataHumanSoldier.MinTimeRepeatSoundGeneric2)
    {
        return;
    }
    TimeStampAnySound = WorldInfo.TimeSeconds;
    TimeStampGeneric2Sound = WorldInfo.TimeSeconds;
    HumanSoldier.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('HSGeneric2Sound', 'None', HumanSoldier, none, none, true);
    //return;    
}

final function PlayHitByBulletSound()
{
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private float TimeSinceLast;
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldier;

    // End:0x1A
    if(!CanPlayDamagedSound(HumanSoldierCtrl))
    {
        return;
    }
    HumanSoldier = HumanSoldierCtrl.HumanSoldierPawn;
    // End:0x7D
    if(!HumanSoldier.TuneDataHumanSoldier.bEnableHSSHitByBullet)
    {
        return;
    }
    TimeSinceLast = WorldInfo.TimeSeconds - TimeStampHitByBulletSound;
    // End:0xF3
    if(TimeSinceLast < HumanSoldier.TuneDataHumanSoldier.MinTimeRepeatSoundHitByBullet)
    {
        return;
    }
    TimeStampHitByBulletSound = WorldInfo.TimeSeconds;
    HumanSoldier.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('HSHitByBulletSound', 'None', HumanSoldier, none, none, true);
    //return;    
}

final function PlayDeathSound()
{
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private float TimeSinceLast;
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldier;

    // End:0x1A
    if(!CanPlayDamagedSound(HumanSoldierCtrl))
    {
        return;
    }
    HumanSoldier = HumanSoldierCtrl.HumanSoldierPawn;
    // End:0x7D
    if(!HumanSoldier.TuneDataHumanSoldier.bEnableHSSDeath)
    {
        return;
    }
    TimeSinceLast = WorldInfo.TimeSeconds - TimeStampDeathSound;
    // End:0xF3
    if(TimeSinceLast < HumanSoldier.TuneDataHumanSoldier.MinTimeRepeatSoundDeath)
    {
        return;
    }
    TimeStampAnySound = WorldInfo.TimeSeconds;
    TimeStampDeathSound = WorldInfo.TimeSeconds;
    HumanSoldier.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('HSDeathSound', 'None', HumanSoldier, none, none, true);
    //return;    
}

final function PlayGrenadeDeathSound()
{
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCtrl[8388609];
    local /*0x97E50000-0x00000000*/ private float TimeSinceLast;
    local /*0x97E50000-0x00000000*/ private @NULL HumanSoldier;

    // End:0x1A
    if(!CanPlayDamagedSound(HumanSoldierCtrl))
    {
        return;
    }
    HumanSoldier = HumanSoldierCtrl.HumanSoldierPawn;
    // End:0x7D
    if(!HumanSoldier.TuneDataHumanSoldier.bEnableHSSDeathGrenade)
    {
        return;
    }
    TimeSinceLast = WorldInfo.TimeSeconds - TimeStampGrenadeDeathSound;
    // End:0xF3
    if(TimeSinceLast < HumanSoldier.TuneDataHumanSoldier.MinTimeRepeatSoundGrenadeDeath)
    {
        return;
    }
    TimeStampAnySound = WorldInfo.TimeSeconds;
    TimeStampGrenadeDeathSound = WorldInfo.TimeSeconds;
    HumanSoldier.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('HSGrenadeDeathSound', 'None', HumanSoldier, none, none, true);
    //return;    
}
