class LPVSFuturePlayerPawn extends LPBaseVSPlayerPawn
    abstract
    nativereplication
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

struct native SavedKillerInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Controller;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Pawn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DamageType;

    structdefaultproperties
    {
        Controller=none
        Pawn=none
        DamageType=none
    }
};

struct native VSReplicateDamageEffects
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ReplicateMe;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEffectsOn;

    structdefaultproperties
    {
        ReplicateMe=0
        bEffectsOn=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefaultVSWeapons;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VSWeapons;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SavedController;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private SavedKillerInfoStruct SavedKillerInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bVSIsCritical[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL OverloadEffectComponent[524289];
var(0.25_Pct_15728639) /*0x97E50000-0x00000000*/ private @NULL VSFutureHUD_PanelsStaticInfo[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FXAction_Color;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LinearColor EmissiveColor[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array DamageEffectComponents[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array DamageAudioComponents[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel VSReplicateDamageEffects ReplicatedDamageEffects[538968065];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PreviousDamageThresholdArrayIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_FiringCycle_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_RocketFiringCycle_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AdditiveFiringAnimSeq[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_FiringCycle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_RocketFiringCycle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AdditiveAnimInfoForRocket;

// Export ULPVSFuturePlayerPawn::execRemoteClientGetInventoryByClass(FFrame&, void* const)
native simulated function RemoteClientGetInventoryByClass()
{
    local /*0x97E50000-0x00000000*/ private class InvClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function PlayerCanEnter()
{
    local /*0x97E50000-0x00000000*/ private @NULL EntryPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x69
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return (Vector(Rotation) Dot Normal(EntryPawn.Location - Location)) > 0.8000000;
    }
    return true;
    //return ReturnValue;    
}

simulated event PostBeginPlay()
{
    GiveDefaultVSWeapons();
    super.PostBeginPlay();
    FXAction_Color = LPFXAction_FutureVSColor(FXActionManagerInstance.StartFXAction(Class'LPFXAction_FutureVSColor'));
    SetTurnInPlaceSpineControlStrength(1.0000000);
    PreviousDamageThresholdArrayIndex = -1;
    ReplicatedDamageEffects.bEffectsOn = false;
    ReplicatedDamageEffects.ReplicateMe = 0;
    //return;    
}

function HandleInstantDestroy()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x55
    foreach WorldInfo.AllControllers(Class'LPPlayerController', LPPC)
    {
        LPPC.SetFutureVSCritical(self);        
    }    
    DestroyVS();
    //return;    
}

simulated function SetCritical()
{
    bVSIsCritical = true;
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x17
    if(bVSIsCritical)
    {
        BlowUp();
    }
    super(LPBasePlayerPawn).Destroyed();
    I = 0;
    J0x2C:

    // End:0x8D [Loop If]
    if(I < VSWeapons.Length)
    {
        // End:0x7F
        if(VSWeapons[I] != none)
        {
            VSWeapons[I].Destroy();
        }
        I++;
        // [Loop Continue]
        goto J0x2C;
    }
    VSWeapons.Length = 0;
    PreviousDamageThresholdArrayIndex = -1;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x28
    if(VarName == 'bVSIsCritical')
    {
        GotoState('VSCritical');        
    }
    else
    {
        // End:0x55
        if(VarName == 'EmissiveColor')
        {
            SetEmissiveColor(EmissiveColor);            
        }
        else
        {
            // End:0xA6
            if(VarName == 'ReplicatedDamageEffects')
            {
                // End:0x99
                if(ReplicatedDamageEffects.bEffectsOn)
                {
                    UpdateDamagedEffects();                    
                }
                else
                {
                    KillDamageEffects();
                }                
            }
            else
            {
                super(LPBasePlayerPawn).ReplicatedEvent(VarName);
            }
        }
    }
    //return;    
}

function GiveDefaultVSWeapons()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL SpawnedWeapon;

    // End:0x12
    if(VSWeapons.Length > 0)
    {
        return;
    }
    I = 0;
    J0x1D:

    // End:0x91 [Loop If]
    if(I < DefaultVSWeapons.Length)
    {
        SpawnedWeapon = Spawn(DefaultVSWeapons[I], none);
        SpawnedWeapon.GiveTo(self);
        I++;
        // [Loop Continue]
        goto J0x1D;
    }
    //return;    
}

simulated function OnGiveInventory()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx, I;
    local /*0x97E50000-0x00000000*/ private class InvClass;
    local /*0x97E50000-0x00000000*/ private @NULL SpawnedWeapon;

    // End:0x9A
    if(inAction.bClearExisting)
    {
        I = 0;
        J0x2D:

        // End:0x8E [Loop If]
        if(I < VSWeapons.Length)
        {
            // End:0x80
            if(VSWeapons[I] != none)
            {
                VSWeapons[I].Destroy();
            }
            I++;
            // [Loop Continue]
            goto J0x2D;
        }
        VSWeapons.Length = 0;
    }
    // End:0x1E6
    if(inAction.InventoryList.Length > 0)
    {
        Idx = 0;
        J0xCA:

        // End:0x1E3 [Loop If]
        if(Idx < inAction.InventoryList.Length)
        {
            InvClass = inAction.InventoryList[Idx];
            // End:0x188
            if(InvClass != none)
            {
                SpawnedWeapon = LPBaseVSWeapon(Spawn(InvClass, none));
                SpawnedWeapon.GiveTo(self);                
            }
            else
            {
                inAction.ScriptLog("WARNING: Attempting to give NULL inventory!");
            }
            Idx++;
            // [Loop Continue]
            goto J0xCA;
        }        
    }
    else
    {
        inAction.ScriptLog("WARNING: Give Inventory without any inventory specified!");
    }
    //return;    
}

simulated function @NULL UpdateDamagedEffects()
{
    local /*0x97E50000-0x00000000*/ private int I, iThresholdIndex;
    local /*0x97E50000-0x00000000*/ private float HealthPercent;
    local /*0x97E50000-0x00000000*/ private @NULL TD, PSC, AC, VSD;
    local /*0x97E50000-0x00000000*/ private int iHandled;

    HealthPercent = float(Health) / float(HealthMax);
    TD = LPTuneDataVSFuturePlayerPawn(TuneDataVSPlayerPawn);
    iHandled = 0;
    iThresholdIndex = 0;
    J0x54:

    // End:0x486 [Loop If]
    if(iThresholdIndex < TD.DamageThresholdList.Length)
    {
        VSD = TD.DamageThresholdList[iThresholdIndex];
        // End:0x478
        if((HealthPercent >= VSD.DamageEffectsThresholdMin) && HealthPercent <= VSD.DamageEffectsThresholdMax)
        {
            // End:0x14A
            if(ReplicatedDamageEffects.bEffectsOn)
            {
                // End:0x14A
                if(iThresholdIndex != PreviousDamageThresholdArrayIndex)
                {
                    KillDamageEffects();
                }
            }
            // End:0x46A
            if(!ReplicatedDamageEffects.bEffectsOn)
            {
                I = 0;
                J0x177:

                // End:0x2F9 [Loop If]
                if(I < VSD.DamageParticles.Length)
                {
                    // End:0x2EB
                    if(VSD.DamageParticles[I].ParticleSystem != none)
                    {
                        PSC = SPEmitterPool(WorldInfo.MyEmitterPool).SPSpawnEmitterMeshAttachment(VSD.DamageParticles[I].ParticleSystem, Mesh, VSD.DamageParticles[I].SocketName, true);
                        // End:0x2EB
                        if(PSC != none)
                        {
                            PSC.ActivateSystem();
                            DamageEffectComponents.AddItem(PSC);                            
                        }
                    }
                    I++;
                    // [Loop Continue]
                    goto J0x177;
                }
                I = 0;
                J0x304:

                // End:0x41A [Loop If]
                if(I < VSD.DamageSounds.Length)
                {
                    AC = AudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx(VSD.DamageSounds[I], 'None', self, none, none));
                    AC.bAutoDestroy = false;
                    AC.bUseOwnerLocation = true;
                    AC.Play();
                    DamageAudioComponents.AddItem(AC);                    
                    I++;
                    // [Loop Continue]
                    goto J0x304;
                }
                ReplicatedDamageEffects.bEffectsOn = true;
                ++ReplicatedDamageEffects.ReplicateMe;
                PreviousDamageThresholdArrayIndex = iThresholdIndex;
            }
            ++iHandled;
            // [Explicit Break]
            goto J0x486;
        }
        ++iThresholdIndex;
        // [Loop Continue]
        goto J0x54;
    }
    J0x486:

    // End:0x4C1
    if((iHandled == 0) && ReplicatedDamageEffects.bEffectsOn)
    {
        KillDamageEffects();
    }
    //return;    
}

simulated function KillDamageEffects()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = DamageEffectComponents.Length - 1;
    J0x17:

    // End:0x72 [Loop If]
    if(I >= 0)
    {
        DamageEffectComponents[I].DeactivateSystem();
        DamageEffectComponents.Remove(I, 1);        
        I--;
        // [Loop Continue]
        goto J0x17;
    }
    I = DamageAudioComponents.Length - 1;
    J0x89:

    // End:0x10D [Loop If]
    if(I >= 0)
    {
        DamageAudioComponents[I].Stop();
        DamageAudioComponents[I].DetachFromAny();
        DamageAudioComponents.Remove(I, 1);        
        I--;
        // [Loop Continue]
        goto J0x89;
    }
    ReplicatedDamageEffects.bEffectsOn = false;
    ++ReplicatedDamageEffects.ReplicateMe;
    PreviousDamageThresholdArrayIndex = -1;
    //return;    
}

event HealDamage()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], ReturnVal;

    ReturnVal = super(SPPawn).HealDamage(Amount, Healer, DamageType);
    UpdateDamagedEffects();
    return ReturnVal;
    //return ReturnValue;    
}

simulated function ShouldAllowFullBodyHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((!InStruggleMode && !bBearTrapped) && ((((TakeDamageParams.DamageCauser != none) && LPBaseVSPlayerPawn(TakeDamageParams.DamageCauser) != none) && LPBaseVSPlayerPawn(TakeDamageParams.DamageCauser).GetTeam() != (GetTeam())) || TakeDamageParams.DamageCauser == none) || LPBaseVSPlayerPawn(TakeDamageParams.DamageCauser) == none) && !bIncapacitated;
    //return ReturnValue;    
}

simulated function ShouldAllowFullBodyHitReactionForDamageType()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function ShouldPlayHitReactionAnimationForLargeNearByGroundHit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function ShouldPlayHitReactionAnimationForElectricalHit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function NotifyNearbyLargeGroundHit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function NotifyElectricalHit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function PlayHitReactionAnimation()
{
    local /*0x97E50000-0x00000000*/ private bool bShouldOverride, bAllowFullBodyReaction;
    local /*0x97E50000-0x00000000*/ private class SPDT;

    // End:0x24
    if(TakeDamageParams.Damage <= 0)
    {
        return;
    }
    bShouldOverride = !ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeBallistic');
    SPDT = class<SPDamageType>(TakeDamageParams.DamageType);
    // End:0xBE
    if((SPDT != none) && SPDT.default.bAdditiveHitReaction)
    {        
    }
    else
    {
        bAllowFullBodyReaction = (ShouldAllowFullBodyHitReaction()) && ShouldAllowFullBodyHitReactionForDamageType(SPDT);
        // End:0x16D
        if(bAllowFullBodyReaction)
        {
            // End:0x16D
            if(SPDT != none)
            {
                // End:0x117
                if(ShouldPlayHitReactionAnimationForLargeNearByGroundHit())
                {                    
                }
                else
                {
                    // End:0x124
                    if(ShouldPlayHitReactionAnimationForElectricalHit())
                    {
                    }
                    // End:0x16D
                    if(int(Role) == int(ROLE_Authority))
                    {
                        ServerDoSpecialMove(SPDT.default.HitReactionSpecialMove, bShouldOverride);
                    }
                }
            }
        }
    }
    //return;    
}

simulated function SetHUDDirectionalDamage()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    myLPHUD = LPPlayerController(Controller).myLPHUD;
    // End:0x68
    if(myLPHUD != none)
    {
        myLPHUD.SetDirectionalDamage(AngleInDegrees);
    }
    //return;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser, TD, vF, vDamagePos, vDamageDir;

    local /*0x97E50000-0x00000000*/ private float dotprod;

    super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    // End:0x10D
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0xDE
        if((LPAIPawnSpitter(DamageCauser) != none) && LPAIPawnSpitter(DamageCauser).IsTeenSpitter())
        {
            // End:0xDE
            if(InDamage >= 2)
            {
                InDamage = InDamage / 2;
            }
        }
        // End:0x10D
        if(LPAIPawnAlphaPackHunter(DamageCauser) != none)
        {
            InDamage = InDamage * 6;
        }
    }
    vF = Vector(Rotation);
    // End:0x1B1
    if(((InstigatedBy != none) && InstigatedBy.Pawn != none) && LPExplosionActor(DamageCauser) == none)
    {
        vDamagePos = InstigatedBy.Pawn.Location;        
    }
    else
    {
        // End:0x1EB
        if(DamageCauser != none)
        {
            vDamagePos = DamageCauser.Location;            
        }
        else
        {
            return;
        }
    }
    vDamageDir = Normal(HitLocation - vDamagePos);
    dotprod = Class'SPEngine.SPUtil'.static.Dot2D(vF, vDamageDir);
    // End:0x315
    if(dotprod > float(0))
    {
        TD = LPTuneDataVSFuturePlayerPawn(TuneDataVSPlayerPawn);
        // End:0x315
        if(dotprod >= Cos(TD.RearWeakSpotAngle.GetValue() * 0.0174533))
        {
            InDamage = FCeil(float(InDamage) * TD.RearWeakSpotDamageBonus.GetValue());
        }
    }
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private int PrevHealth;

    PrevHealth = Health;
    super(LPBasePlayerPawn).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    // End:0x1DA
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x120
        if(((PrevHealth >= TuneDataVSPlayerPawn.MaxHealthForLowHealthWarning) && Health < TuneDataVSPlayerPawn.MaxHealthForLowHealthWarning) && Health > 0)
        {
            LPPlayerController(Controller).BroadcastChatter(12);            
        }
        else
        {
            // End:0x1DA
            if((((PrevHealth > 0) && Health <= 0) && IsVitalSuit()) && (Controller != none) && int(Controller.GetTeamNum()) != int(EventInstigator.GetTeamNum()))
            {
                LPPlayerController(EventInstigator).ServerIncrementStat('Stat_VSDestroyed');
            }
        }
    }
    UpdateDamagedEffects();
    // End:0x221
    if((DamageType == Class'LPDamageTypeEncroachment') && PrevHealth > 0)
    {
        Health = 0;
        HandleInstantDestroy();
    }
    //return;    
}

function Died()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bVSIsCritical)
    {
        return true;
    }
    bVSIsCritical = true;
    bForceNetUpdate = true;
    SavedKillerInfo.Controller = Killer;
    SavedKillerInfo.Pawn = ((Killer != none) ? Killer.Pawn : none);
    SavedKillerInfo.DamageType = DamageType;
    GotoState('VSCritical');
    SetTimer(LPTuneDataVSFuturePlayerPawn(TuneDataVSPlayerPawn).TimeBetweenCriticalAndExplode, false, 'DestroyVS');
    Health = 0;
    return true;
    //return ReturnValue;    
}

function NotifyGameInfoVSPlayerDied()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyPC, MyPRI;

    // End:0x145
    if(Controller != none)
    {
        WorldInfo.Game.Killed(Killer, Controller, self, DamageType);
        MyPC = LPPlayerController(Controller);
        // End:0x142
        if(MyPC != none)
        {
            MyPRI = LPPRI(PlayerReplicationInfo);
            // End:0x142
            if(MyPRI != none)
            {
                MyPC.ModifyStat('Stat_TotalDamageTaken', MyPC.HumanPlayerPawn.Health);
                MyPRI.ScoreDeath(Killer, DamageType);
            }
        }        
    }
    else
    {
        WorldInfo.Game.Killed(Killer, Controller(Owner), self, DamageType);
    }
    //return;    
}

function DestroyVS()
{
    KillDamageEffects();
    Destroy();
    //return;    
}

simulated function BlowUp()
{
    local /*0x97E50000-0x00000000*/ private @NULL explosionActor, Killer;
    local /*0x97E50000-0x00000000*/ private class DamageType;
    local /*0x97E50000-0x00000000*/ private @NULL LPAIC;

    Killer = SavedKillerInfo.Controller;
    DamageType = SavedKillerInfo.DamageType;
    // End:0x1BD
    if(Controller != none)
    {
        // End:0x14F
        if((Killer != none) && Killer.Pawn != none)
        {
            LPAIC = LPAIController(Killer);
            // End:0xF9
            if(LPAIC != none)
            {
                SetLastKillerInfo(LPAIC.GetAssociatedPlayerPRI(), Killer, DamageType);                
            }
            else
            {
                SetLastKillerInfo(Killer.PlayerReplicationInfo, Killer, DamageType);
            }
            NotifyGameInfoVSPlayerDied(Killer, DamageType);
        }
        LPPRI(PlayerReplicationInfo).TEnergyAtDeath = LPPlayerPawn(LPPlayerController(Controller).HumanPlayerPawn).GetEnergyCount();
    }
    // End:0x20A
    if(OverloadEffectComponent != none)
    {
        OverloadEffectComponent.DetachFromAny();
        OverloadEffectComponent.DeactivateSystem();
    }
    // End:0x2BB
    if(Controller != none)
    {
        // End:0x2B8
        if(int(WorldInfo.NetMode) != int(NM_Client))
        {
            LPPlayerController(Controller).VSExploded(Location, Killer, DamageType, Location, LPGameMP_COOP(WorldInfo.Game) != none);
        }        
    }
    else
    {
        // End:0x382
        if((SavedController != none) && IsDoingSpecialMove_OF_Class(Class'LPSM_VSPlayerExit'))
        {
            // End:0x382
            if(int(WorldInfo.NetMode) != int(NM_Client))
            {
                SavedController.VSExploded(Location, Killer, LPTuneDataVSFuturePlayerPawn(TuneDataVSPlayerPawn).VSExplosionTemplate.MyDamageType, Location, true);
            }
        }
    }
    explosionActor = Spawn(Class'LPExplosionActor',,, Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    // End:0x4A8
    if(explosionActor != none)
    {
        explosionActor.TheWeaponThatSpawnedMe = self;
        explosionActor.Instigator = SavedKillerInfo.Pawn;
        explosionActor.InstigatorController = SavedKillerInfo.Controller;
        explosionActor.Explode(LPTuneDataVSFuturePlayerPawn(TuneDataVSPlayerPawn).VSExplosionTemplate);
    }
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Col;

    super.PossessedBy(C, bVehicleTransition);
    Col = FXAction_Color.GetTeamColor(C);
    SetEmissiveColor(Col);
    ForceProjectileExplosionTexturesRelevant();
    //return;    
}

function UnPossessed()
{
    local /*0x97E50000-0x00000000*/ private @NULL Col;

    super.UnPossessed();
    Col = FXAction_Color.GetTeamColor(none);
    SetEmissiveColor(Col);
    ClearTimer('ForceProjectileExplosionTexturesRelevant');
    //return;    
}

simulated function SetEmissiveColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Col[8388609];

    FXAction_Color.SetColor(Col);
    EmissiveColor = Col;
    //return;    
}

simulated function ForceProjectileExplosionTexturesRelevant()
{
    local /*0x97E50000-0x00000000*/ private bool bIsMP;
    local /*0x97E50000-0x00000000*/ private @NULL TestWeapon;
    local /*0x97E50000-0x00000000*/ private class ProjectileClass, GrenadeClass;

    bIsMP = int(WorldInfo.NetMode) > int(NM_Standalone);
    // End:0xD0
    foreach VSWeapons(TestWeapon)
    {
        // End:0xCE
        foreach TestWeapon.WeaponProjectiles(ProjectileClass)
        {
            GrenadeClass = class<LPProj_Grenade>(ProjectileClass);
            // End:0xCD
            if(GrenadeClass != none)
            {
                GrenadeClass.static.StaticForceExplosionTexturesRelevant(bIsMP, 1.0000000);
            }            
        }                
    }    
    SetTimer(0.5000000, false, 'ForceProjectileExplosionTexturesRelevant');
    //return;    
}

simulated function InitAnimTemplates()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array MoveNames, MoveNodes;
    local /*0x97E50000-0x00000000*/ private int I;

    super.InitAnimTemplates();
    // End:0xDA
    if(PlayerVSLogicAnimTree != none)
    {
        MoveNames.AddItem(AnimTemplateLogic_FiringCycle_Name);        
        MoveNames.AddItem(AnimTemplateLogic_RocketFiringCycle_Name);        
        PlayerVSLogicAnimTree.FindAnimNodes(MoveNames, MoveNodes, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
        I = 0;
        AnimTemplateLogic_FiringCycle = SPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
        AnimTemplateLogic_RocketFiringCycle = SPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
    }
    //return;    
}

simulated function @NULL PerformPostInitAnimTreeActions()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super.PerformPostInitAnimTreeActions(SkelComp);
    AdditiveAnimInfoForRocket.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(AdditiveAnimInfoForRocket.AnimNodeSlotName));
    //return;    
}

simulated function StartVSFire()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609], FireModeNum;

    // End:0x39
    if((int(WeaponID) >= VSWeapons.Length) || VSWeapons[int(WeaponID)] == none)
    {
        return;
    }
    VSWeapons[int(WeaponID)].StartFire(FireModeNum);
    //return;    
}

simulated function StopVSFire()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609], FireModeNum;

    // End:0x39
    if((int(WeaponID) >= VSWeapons.Length) || VSWeapons[int(WeaponID)] == none)
    {
        return;
    }
    VSWeapons[int(WeaponID)].StopFire(FireModeNum);
    //return;    
}

simulated function WeaponFired()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[9437185];

    super(LPPawn).WeaponFired(InWeapon, bViaReplication, HitLocation);
    // End:0x4C
    if(LPWeaponVSChaingun(InWeapon) != none)
    {
        StartAdditiveFireAnimation();        
    }
    else
    {
        // End:0x6E
        if(LPWeaponVSRocketLauncher(InWeapon) != none)
        {
            StartAdditiveRocketFireAnimation();
        }
    }
    //return;    
}

simulated function WeaponStoppedFiring()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];

    // End:0x22
    if(LPWeaponVSChaingun(InWeapon) != none)
    {
        StopAdditiveFireAnimation();
    }
    ShotCount = 0;
    //return;    
}

simulated function StartAdditiveRocketFireAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = AnimTemplateLogic_RocketFiringCycle.GetBestSequenceTemplate(self);
    AdditiveAnimInfoForRocket.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.1000000, false, true, 0, 0, false, 3);
    //return;    
}

simulated function StartAdditiveFireAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    // End:0xA8
    if(AdditiveFiringAnimSeq == none)
    {
        AnimSeqTemplate = AnimTemplateLogic_FiringCycle.GetBestSequenceTemplate(self);
        AdditiveFiringAnimSeq = AdditiveAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.1000000, true, true, 0, 0, false, 3);
    }
    //return;    
}

simulated function StopAdditiveFireAnimation()
{
    AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.2500000);
    AdditiveFiringAnimSeq = none;
    //return;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

state VSCritical
{
    ignores EndState;

    simulated function @NULL BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000400*/ private @NULL CriticalWarningSound;

        SavedController = LPPlayerController(Controller);
        // End:0x9B
        if((SavedController != none) && SavedController.IsLocalController())
        {
            CriticalWarningSound = AudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSCriticalWarningAlarm', 'None', self, none, none));            
        }
        else
        {
            CriticalWarningSound = AudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSCriticalWarning', 'None', self, none, none));
        }
        // End:0x156
        if(CriticalWarningSound != none)
        {
            CriticalWarningSound.bAutoDestroy = false;
            CriticalWarningSound.bStopWhenOwnerDestroyed = true;
            CriticalWarningSound.bUseOwnerLocation = true;
        }
        OverloadEffectComponent = TuneDataPawnFXEventBindings.PlayEventFX('VSOverloading', self, Mesh, none);
        // End:0x212
        if(OverloadEffectComponent != none)
        {
            OverloadEffectComponent.SetOwnerNoSee(true);
            OverloadEffectComponent.__OnSystemFinished__Delegate = None;
            OverloadEffectComponent.ActivateSystem(true);
        }
        TriggerEventClass(Class'LPSeqEvent_Death', self);
        // End:0x296
        if(Controller != none)
        {
            LPPlayerController(Controller).ExitVSPawn = self;
            // End:0x296
            if(IsLocallyControlled())
            {
                LPPlayerController(Controller).NotifyVSCritical();
            }
        }
        //return;        
    }
Begin:

    stop;                
}

defaultproperties
{
    EmissiveColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    AdditiveAnimInfoForRocket=(AnimNodeSlotName="AdditiveSlotNode2",AnimNodeSlot=none)
    // Reference: LPAIResDefenderVS'Default__LPVSFuturePlayerPawn.LPAIResDefenderVS'
    begin object name=LPAIResDefenderVS
    end object
    AIResDefenderVS=LPAIResDefenderVS
    // Reference: LPAIResNushiSporeVS'Default__LPVSFuturePlayerPawn.LPAIResNushiSporeVS'
    begin object name=LPAIResNushiSporeVS
    end object
    AIResNushiSporeVS=LPAIResNushiSporeVS
    // Reference: LPRepairableVSComponent'Default__LPVSFuturePlayerPawn.RepairObj'
    begin object name=RepairObj
    end object
    RepairableComponent=RepairObj
    EnterPromptString="<Strings:LostPlanetGame.Tutorials.VSENTERPROMPT>"
    ExitPromptString="<Strings:LostPlanetGame.Tutorials.VSEXITPROMPT>"
    RotateVSPromptString="<Strings:LostPlanetGame.Tutorials.VSROTATEPROMPT>"
    // Reference: LPAIResManPlayer'Default__LPVSFuturePlayerPawn.LPAIResManPlayer'
    begin object name=LPAIResManPlayer
    end object
    AIResourceManager=LPAIResManPlayer
    // Reference: LPAimControlPlayerControlled'Default__LPVSFuturePlayerPawn.AimControl'
    begin object name=AimControl
    end object
    AimController=AimControl
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPVSFuturePlayerPawn.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPVSFuturePlayerPawn.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPVSFuturePlayerPawn.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPDamageOverTimeComponent'Default__LPVSFuturePlayerPawn.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPVSFuturePlayerPawn.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    SlideOffWallInfo=(WallSlideOffCylinder=// Reference: CylinderComponent'Default__LPVSFuturePlayerPawn.WallSlideCylinder'
    begin object name=WallSlideCylinder
    end object
    WallSlideOffCylinder=WallSlideCylinder)
    // Reference: KynapseBodyHandle'Default__LPVSFuturePlayerPawn.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPVSFuturePlayerPawn.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPVSFuturePlayerPawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    InventoryManagerClass=none
    // Reference: AudioComponent'Default__LPVSFuturePlayerPawn.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=myKynapseBodyHandle
    Components[4]=MyLightEnvironment
    Components[5]=SPPawnMesh
    Components[6]=FaceAudioComponent
    Components[7]=SPDamageOverTimeComponentObj
    Components[8]=FXActionManagerDefObj0
    Components[9]=LPAIResManPlayer
    // Reference: SPDamageStateComponent'Default__LPVSFuturePlayerPawn.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[10]=DamageStateComponentDefObj
    Components[11]=RepairObj
    // Reference: LPActorInteractionMetaData'Default__LPVSFuturePlayerPawn.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}