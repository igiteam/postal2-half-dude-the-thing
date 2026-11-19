class LPThermalEnergy extends Inventory
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel TEnergyData energy[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DroppedPickUpClassCylinderHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxEnergy;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalLimit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FXLastTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FXTimeDelay;

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825];

    Record.InventoryClassPath = PathName(Class);
    Record.MaxEnergy = int(MaxEnergy);
    Record.TotalLimit = int(TotalLimit);
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25296897];

    MaxEnergy = float(Record.MaxEnergy);
    TotalLimit = float(Record.TotalLimit);
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    super(Actor).ReplicatedEvent(VarName);
    // End:0x34
    if(VarName == 'energy')
    {
        HandleEnergyCountChanged();
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    //return;    
}

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    InitPlayerTEnergy();
    //return;    
}

simulated function InitPlayerTEnergy()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP, LPPP, LPPC, PRI;
    local /*0x97E50000-0x00000000*/ private float RestorePercent, InitialEnergyCount;

    LPP = LPBasePlayerPawn(Owner);
    // End:0x4F7
    if(LPP != none)
    {
        MaxEnergy = LPP.GetMaxTEnergyCapacity();
        LPPP = LPPlayerPawn(LPP);
        // End:0x4F7
        if(LPPP != none)
        {
            LPPC = LPPlayerController(LPPP.Controller);
            // End:0x163
            if(int(WorldInfo.NetMode) == int(NM_Standalone))
            {
                InitialEnergyCount = LPPP.TuneDataPlayerPawn.InitialTEngCount.GetValue(LPPC);
                InitialEnergyCount -= LPPP.GetInitialTEnergyAdjustment();                
            }
            else
            {
                // End:0x44A
                if(LPPC.bPersistentDataInit && LPPP.bProfileLoadOutInitialized)
                {
                    PRI = LPPRI(LPPC.PlayerReplicationInfo);
                    // End:0x3C0
                    if((PRI != none) && PRI.TEnergyAtDeath >= 0.0000000)
                    {
                        RestorePercent = LPPP.TuneDataPlayerPawn.DeathTEngPctRestored.GetValue(LPPC);
                        // End:0x308
                        if((PRI.LastKillerPRI == PRI) || ClassIsChildOf(PRI.LastKillerDamageType, Class'Engine.DmgType_Suicided'))
                        {
                            InitialEnergyCount = PRI.TEnergyAtDeath * FMin(RestorePercent, 1.0000000);                            
                        }
                        else
                        {
                            InitialEnergyCount = PRI.TEnergyAtDeath * RestorePercent;
                            InitialEnergyCount += LPPP.TuneDataPlayerPawn.DeathTEngCountChange.GetValue(LPPC);
                        }
                        PRI.TEnergyAtDeath = -1.0000000;                        
                    }
                    else
                    {
                        InitialEnergyCount = LPPP.TuneDataPlayerPawn.InitialTEngCount.GetValue(LPPC);
                        InitialEnergyCount -= LPPP.GetInitialTEnergyAdjustment();
                    }                    
                }
                else
                {
                    SetTimer(0.1000000, false, 'InitPlayerTEnergy');
                    return;
                }
            }
            InitialEnergyCount = FClamp(InitialEnergyCount, 0.0000000, LPPP.GetMaxTEnergyCapacity());
            AddEnergy(InitialEnergyCount, false, true);
            LPP.TEnergyLevel = (GetEnergyCount()) / LPPP.GetMaxTEnergyCapacity();
        }
    }
    //return;    
}

simulated function HandleEnergyCountChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x11
    if(Instigator == none)
    {
        return;
    }
    // End:0x69
    if(energy.bDoFX)
    {
        DoPickupFX(LPPawn(Instigator), energy.EnergyDelta);
    }
    LPPC = LPPlayerController(Instigator.Controller);
    // End:0x103
    if((LPPC != none) && LPPC.myLPHUD != none)
    {
        LPPC.myLPHUD.NotifyThermalEnergyChanged();
    }
    //return;    
}

simulated function GetDropEnergy()
{
    local /*0x97E50000-0x00000000*/ private @NULL DropPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Min, Max;
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private float fVal;

    // End:0x2F
    if(int(DropPawn.Physics) == int(7))
    {
        return 0.0000000;
    }
    LPP = LPPlayerPawn(DropPawn);
    // End:0x134
    if(LPP != none)
    {
        fVal = GetEnergyCount();
        fVal *= LPP.TuneDataPlayerPawn.PercentageTEngDropOnDeath;
        fVal = FClamp(fVal, LPP.TuneDataPlayerPawn.MinTEngCountDropOnDeath, LPP.TuneDataPlayerPawn.MaxTEngCountDropOnDeath);
        return fVal;        
    }
    else
    {
        // End:0x239
        if(DropPawn != none)
        {
            Min = DropPawn.TuneDataPawn.TEnergyDropMin.GetValue();
            Max = DropPawn.TuneDataPawn.TEnergyDropMax.GetValue();
            // End:0x213
            if(Max < Min)
            {
                Max = Min;
            }
            return Min + float(Rand(int(Max - Min)));
        }
    }
    //return ReturnValue;    
}

simulated function AddEnergy()
{
    local /*0x97E50000-0x00000000*/ private float EnergyToAdd[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoFX[9437185], bInitialEnergy;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPP, LPC;
    local /*0x97E50000-0x00000000*/ private float CurrentEnergyCount;

    true
    false
    CurrentEnergyCount = GetEnergyCount();
    LPP = LPBasePlayerPawn(Instigator);
    // End:0x72
    if(LPP != none)
    {
        MaxEnergy = LPP.GetMaxTEnergyCapacity();
    }
    // End:0xB2
    if((CurrentEnergyCount + EnergyToAdd) > MaxEnergy)
    {
        EnergyToAdd = MaxEnergy - CurrentEnergyCount;
    }
    // End:0xE3
    if((CurrentEnergyCount + EnergyToAdd) < float(0))
    {
        EnergyToAdd = -CurrentEnergyCount;
    }
    CurrentEnergyCount += EnergyToAdd;
    SetEnergyCount(CurrentEnergyCount);
    energy.EnergyDelta = EnergyToAdd;
    energy.bDoFX = bDoFX;
    energy.RepCounter++;
    // End:0x1A8
    if(bDoFX)
    {
        DoPickupFX(LPPawn(Instigator), EnergyToAdd);
    }
    // End:0x33A
    if(LPP != none)
    {
        CurrentEnergyCount = GetEnergyCount();
        LPP.TEnergyLevel = CurrentEnergyCount / LPP.GetMaxTEnergyCapacity();
        // End:0x33A
        if(EnergyToAdd != float(0))
        {
            // End:0x33A
            if(int(WorldInfo.NetMode) != int(NM_Standalone))
            {
                LPC = LPPlayerController(LPP.Controller);
                // End:0x33A
                if(LPC != none)
                {
                    // End:0x2E4
                    if(LPC.IsLocalPlayerController())
                    {
                        LPC.myLPHUD.NotifyThermalEnergyChanged();
                    }
                    // End:0x33A
                    if(!bInitialEnergy && EnergyToAdd > float(0))
                    {
                        LPC.ModifyStat('Stat_TEnergyGained', int(EnergyToAdd));
                    }
                }
            }
        }
    }
    return EnergyToAdd;
    //return ReturnValue;    
}

reliable client simulated function ClientGivenTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewOwner[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    super.ClientGivenTo(NewOwner, bDoNotActivate);
    LPC = LPPlayerController(NewOwner.Controller);
    // End:0xB5
    if((LPC != none) && LPC.IsLocalPlayerController())
    {
        LPC.myLPHUD.NotifyThermalEnergyChanged();
    }
    //return;    
}

function DenyPickupQuery()
{
    local /*0x97E50000-0x00000000*/ private class ItemClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Pickup[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function DoPickupFX()
{
    local /*0x97E50000-0x00000000*/ private @NULL LP[8388609];
    local /*0x97E50000-0x00000000*/ private float EnergyAmt[8388609], T;
    local /*0x97E50000-0x00000000*/ private @NULL LPP, LPPC;

    // End:0x35
    if((LP != none) && LP.bInRestartQuitePeriod)
    {
        return;
    }
    LPP = LPPlayerPawn(LP);
    LPPC = LPPlayerController(LP.Controller);
    // End:0x14A
    if(LPP != none)
    {
        // End:0xF4
        if(EnergyAmt > float(0))
        {
            LPP.SetTEnergyGlowTimer(LPP.TuneDataPlayerPawn.TEnergyGlowDuration);
        }
        // End:0x14A
        if((LPPC != none) && EnergyAmt != float(0))
        {
            LPPC.myLPHUD.PickedUpThermalEnergy();
        }
    }
    // End:0x2D2
    if((LP != none) && LPP != none)
    {
        // End:0x1E5
        if(EnergyAmt > float(0))
        {
            LP.LocalParticleFX('TEnergyPickup', vect(0.0000000, -25.0000000, 0.0000000), rot(0, 0, -16384));
            LP.LocalSoundFX('TEnergyPickup');
        }
        // End:0x2D2
        if(EnergyAmt < float(0))
        {
            T = WorldInfo.TimeSeconds;
            // End:0x2D2
            if((T - FXLastTime) > FXTimeDelay)
            {
                LPP.LocalParticleFX('TEnergyTransfer', vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, -16384));
                LPP.LocalSoundFX('TEnergyTransfer');
                FXLastTime = WorldInfo.TimeSeconds;
            }
        }
    }
    //return;    
}

simulated function SetEnergyCount()
{
    local /*0x97E50000-0x00000000*/ private float InCount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    // End:0x7A
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        PRI = Class'LPPlayerController'.static.GetPRI();
        PRI.TEnergyAmount = InCount;
    }
    energy.EnergyCount = InCount;
    //return;    
}

simulated function GetEnergyCount()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    // End:0x71
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        PRI = Class'LPPlayerController'.static.GetPRI();
        return PRI.TEnergyAmount;
    }
    return energy.EnergyCount;
    //return ReturnValue;    
}

simulated function GetEnergyDelta()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return energy.EnergyDelta;
    //return ReturnValue;    
}

function DropFrom()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLocation[8388609], StartVelocity;

    //return;    
}

function ManualDrop()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLocation[8388609], StartVelocity;
    local /*0x97E50000-0x00000000*/ private float TEngAmount[9437185];
    local /*0x97E50000-0x00000000*/ private int TEngCount[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL EnergyPool[9437185], P, Loc, Rot, Norm, Extent;

    local /*0x97E50000-0x00000000*/ private float Dist;
    local /*0x97E50000-0x00000000*/ private @NULL DropPawn;
    local /*0x97E50000-0x00000000*/ private float TSpread, TScale;
    local /*0x97E50000-0x00000000*/ private int TCount, I;
    local /*0x97E50000-0x00000000*/ private float MaxPossible;
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private float DropAmount;
    local /*0x97E50000-0x00000000*/ private bool bHasVelocity;

    0.0000000
    0
    none
    TSpread = 0.0000000;
    TScale = 1.0000000;
    TCount = 0;
    DropPawn = LPPawn(Instigator);
    // End:0x150
    if(DropPawn != none)
    {
        TCount = ((TEngCount > 0) ? TEngCount : int(DropPawn.TuneDataPawn.TEnergyCount.GetValue()));
        TSpread = DropPawn.TuneDataPawn.TEnergySpread;
        TScale = DropPawn.TuneDataPawn.TEnergyScale;
    }
    bHasVelocity = !IsZero(StartVelocity);
    DropAmount = ((TEngAmount > float(0)) ? TEngAmount : GetDropEnergy(DropPawn));
    // End:0x1E7
    if(EnergyPool != none)
    {
        DropAmount = EnergyPool.AddEnergy(-DropAmount, false);
    }
    // End:0x20E
    if((DroppedPickupClass == none) || DropAmount == float(0))
    {
        Destroy();
        return;
    }
    LPP = LPPlayerPawn(Instigator);
    // End:0x367
    if(LPP != none)
    {
        MaxPossible = LPP.GetMaxTEnergyCapacity() * LPP.TuneDataPlayerPawn.PercentageTEngDropOnDeath;
        TScale = DropAmount / MaxPossible;
        TScale = LPP.TuneDataPlayerPawn.MinScaleTEngDropOnDeath + (TScale * (LPP.TuneDataPlayerPawn.MaxScaleTEngDropOnDeath - LPP.TuneDataPlayerPawn.MinScaleTEngDropOnDeath));
    }
    I = 0;
    J0x372:

    // End:0xA5E [Loop If]
    if(I < TCount)
    {
        CheckTEnergyLimit();
        Loc = StartLocation;
        Rot = rot(0, 0, 0);
        // End:0x620
        if(!bHasVelocity)
        {
            // End:0x4B2
            if(Instigator.Mesh != none)
            {
                // End:0x49B
                if(Instigator.Mesh.GetSocketByName('Center') != none)
                {
                    // End:0x49B
                    if(!Instigator.Mesh.GetSocketWorldLocationAndRotation('Center', Loc, Rot))
                    {
                        Loc = StartLocation;
                    }
                }
                Rot = rot(0, 0, 0);
            }
            // End:0x55F
            if(TCount > 1)
            {
                Loc.X = Loc.X + ((FRand() - 0.5000000) * TSpread);
                Loc.Y = Loc.Y + ((FRand() - 0.5000000) * TSpread);
            }
            Extent = vect(0.0000000, 0.0000000, 0.0000000);
            Loc += vect(0.0000000, 0.0000000, 10.0000000);
            Class'SPEngine.SPUtil'.static.DistanceToGround(Loc, Extent, Norm, Dist);
            Loc.Z -= Dist;
            Loc.Z += DroppedPickUpClassCylinderHeight;
        }
        P = LPThermalEnergyPickup(Spawn(DroppedPickupClass,,, Loc,,, true));
        // End:0x669
        if(P == none)
        {
            Destroy();
            return;
        }
        // End:0x693
        if(bHasVelocity)
        {
            P.SetPhysics(2);            
        }
        else
        {
            P.SetPhysics(0);
        }
        P.Inventory = self;
        P.InventoryClass = Class;
        P.Velocity = StartVelocity;
        P.Instigator = Instigator;
        P.ParticleScale = TScale;
        P.SetPickupMesh(DroppedPickupMesh);
        // End:0x9F5
        if(DropPawn != none)
        {
            P.LifeSpan = DropPawn.TuneDataPawn.TEnergyDecayEnd.GetValue();
            P.EnergyCount = int(DropAmount);
            P.SetCustomParticles(DropPawn.TuneDataPawn.TEnergyDropParticles);
            P.DecaySpeed = DropPawn.TuneDataPawn.TEnergyDecayEnd.GetValue() - DropPawn.TuneDataPawn.TEnergyDecayBegin.GetValue();
            P.DecayBegin = DropPawn.TuneDataPawn.TEnergyDecayBegin.GetValue();
            P.SpreadRate = DropPawn.TuneDataPawn.TEnergySpreadRate;
        }
        P.bKillDuringLevelTransition = true;
        // End:0xA50
        if(Instigator != none)
        {
            Instigator.AddToActorFactorySpawnedList(P);            
        }
        I++;
        // [Loop Continue]
        goto J0x372;
    }
    Instigator = none;
    GotoState('None');
    Destroy();
    //return;    
}

function CheckTEnergyLimit()
{
    local /*0x97E50000-0x00000000*/ private @NULL A, P, OldestP;
    local /*0x97E50000-0x00000000*/ private float OldestTime;
    local /*0x97E50000-0x00000000*/ private int Total;

    OldestTime = -1.0000000;
    // End:0xEA
    foreach AllActors(DroppedPickupClass, A)
    {
        P = LPThermalEnergyPickup(A);
        // End:0xE9
        if(P != none)
        {
            Total++;
            // End:0xE9
            if(!P.IsDecaying())
            {
                // End:0xE9
                if(P.RunningTime > OldestTime)
                {
                    OldestP = P;
                    OldestTime = P.RunningTime;
                }
            }
        }        
    }    
    // End:0x134
    if((float(Total) >= TotalLimit) && OldestP != none)
    {
        OldestP.ForceDecay();
    }
    //return;    
}

defaultproperties
{
    MaxEnergy=100.0000000
    TotalLimit=10.0000000
    FXTimeDelay=1.0000000
    RespawnTime=5.0000000
    DroppedPickupClass=none
    bOnlyRelevantToOwner=false
    bAlwaysRelevant=true
    bReplicateInstigator=true
    bOnlyDirtyReplication=false
}