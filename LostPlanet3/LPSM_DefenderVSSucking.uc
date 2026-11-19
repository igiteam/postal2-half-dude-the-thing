class LPSM_DefenderVSSucking extends LPSM_DefenderVsBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponentLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL HitInfoForVsDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float accumulatedDamage[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    PlaySoundEvent('DefenderSuckingTEng');
    vsPawn = LPBaseVSPlayerPawn(DefenderPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0x98
    if(vsPawn == none)
    {
        return;
    }
    AttachToVS();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    DetachToVS();
    super.SpecialMoveEnded(PrevMove, NextMove);
    vsPawn = none;
    ClearSoundLoop();
    //return;    
}

function AttachToVS()
{
    local /*0x97E50000-0x00000000*/ private int iterDis;
    local /*0x97E50000-0x00000000*/ private name SocketName;

    DefenderPawn.Mesh.MinLodModel = 0;
    DefenderPawn.Mesh.ForcedLodModel = 1;
    DefenderPawn.SetHardAttach(false);
    DefenderPawn.SetBase(none);
    DefenderPawn.SetCollisionType(1);
    SocketName = vsPawn.TuneDataVSPlayerPawn.DefenderAttackSlotSockets[DefenderPawn.LandOnVsAttackSlotSocketIdx].EndSocketName;
    DefenderPawn.SetCollisionType(3);
    DefenderPawn.SetHardAttach(true);
    DefenderPawn.SetBase(vsPawn,, vsPawn.Mesh, SocketName);
    DefenderPawn.bApplyRagdollImpulse = false;
    // End:0x242
    if(DefenderPawn.PawnThatLaunchedMe != none)
    {
        DefenderPawn.PawnThatLaunchedMe.NotifyLaunchedPawnDown(DefenderPawn);
    }
    // End:0x345
    if(DefenderPawn.TuneDataDefender.bUnHideWingsOnAttachToVs)
    {
        iterDis = 0;
        J0x284:

        // End:0x345 [Loop If]
        if(iterDis < DefenderPawn.TuneDataMedFlyer.WingNamesToHideOnSpawn.Length)
        {
            DefenderPawn.Mesh.UnHideBoneByName(DefenderPawn.TuneDataMedFlyer.WingNamesToHideOnSpawn[iterDis]);
            ++iterDis;
            // [Loop Continue]
            goto J0x284;
        }
    }
    //return;    
}

function DetachToVS()
{
    local /*0x97E50000-0x00000000*/ private int iterDis;

    DefenderPawn.Mesh.MinLodModel = 1;
    DefenderPawn.Mesh.ForcedLodModel = 0;
    DefenderPawn.SetHardAttach(false);
    DefenderPawn.SetBase(none);
    DefenderPawn.SetCollisionType(2);
    // End:0x1CC
    if(DefenderPawn.TuneDataDefender.bUnHideWingsOnAttachToVs)
    {
        iterDis = 0;
        J0x109:

        // End:0x1CC [Loop If]
        if(iterDis < DefenderPawn.TuneDataMedFlyer.WingNamesToHideOnSpawn.Length)
        {
            DefenderPawn.Mesh.HideBoneByName(DefenderPawn.TuneDataMedFlyer.WingNamesToHideOnSpawn[iterDis], 2);
            ++iterDis;
            // [Loop Continue]
            goto J0x109;
        }
    }
    //return;    
}

function PlaySoundEvent()
{
    local /*0x97E50000-0x00000000*/ private name SoundEventName[8388609];

    // End:0x19
    if(SoundComponentLoop != none)
    {
        ClearSoundLoop();
    }
    SoundComponentLoop = MySPPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx(SoundEventName, 'None', MySPPawn, none, none, SoundComponentLoop);
    //return;    
}

function ClearSoundLoop()
{
    // End:0x43
    if(SoundComponentLoop != none)
    {
        SoundComponentLoop.FadeOut(0.5000000, 0.0000000);
        SoundComponentLoop = none;
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    SuckEnergyOutOfVS(DeltaTime);
    HandlePossibleDamageToTheVs(DeltaTime);
    super(SPSM_PlayAnimBase).Tick(DeltaTime);
    //return;    
}

function SuckEnergyOutOfVS()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], energySuckedThisFrame;

    // End:0xA9
    if((DefenderPawn != none) && vsPawn != none)
    {
        energySuckedThisFrame = DefenderPawn.TuneDataDefender.AmountOfTEnergyToSuckOffOfVsPerSec.GetValue() * DeltaTime;
        vsPawn.AddThermalEnergy(-energySuckedThisFrame);
    }
    //return;    
}

event HandlePossibleDamageToTheVs()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], damageToVsPawn;
    local /*0x97E50000-0x00000000*/ private @NULL StartTrace, EndTrace, TraceHitLocation, TraceHitNormal, LocalUp;

    // End:0x39E
    if(((DefenderPawn != none) && vsPawn != none) && DefenderPawn.TuneDataDefender.bCauseDamageWhileSuckingOffVs.GetValue() != float(0))
    {
        // End:0x22C
        if(HitInfoForVsDamage.BoneName == 'None')
        {
            LocalUp = vect(0.0000000, 0.0000000, 1.0000000);
            LocalUp = TransformVectorByRotation(DefenderPawn.Rotation, LocalUp);
            StartTrace = DefenderPawn.Location + (LocalUp * DefenderPawn.TuneDataDefender.DistanceFromLocToSearchForHitLocWhileSuckingOffVs);
            EndTrace = DefenderPawn.Location - (LocalUp * DefenderPawn.TuneDataDefender.DistanceFromLocToSearchForHitLocWhileSuckingOffVs);
            vsPawn.TraceComponent(TraceHitLocation, TraceHitNormal, vsPawn.Mesh, EndTrace, StartTrace,, HitInfoForVsDamage, true);
        }
        // End:0x39E
        if(HitInfoForVsDamage.BoneName != 'None')
        {
            damageToVsPawn = DefenderPawn.TuneDataDefender.DamageToVsPerSecWhileSuckingOffVs.GetValue() * DeltaTime;
            accumulatedDamage += damageToVsPawn;
            // End:0x39E
            if(accumulatedDamage >= 1.0000000)
            {
                vsPawn.TakeDamage(int(accumulatedDamage), DefenderPawn.Controller, TraceHitLocation, DefenderPawn.Velocity, DefenderPawn.TuneDataDefender.DamageTypeToVsWhileSuckingOffVs, HitInfoForVsDamage, DefenderPawn);
                accumulatedDamage = 0.0000000;
            }
        }
    }
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}