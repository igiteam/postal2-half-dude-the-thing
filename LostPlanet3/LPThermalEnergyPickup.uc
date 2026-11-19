class LPThermalEnergyPickup extends LPDroppedPickup
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataSoundEventBindings;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataFXEventBindings;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataFXEventBindings_MP;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL CustomParticleComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ParticleScale[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int EnergyCount[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DecaySpeed[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DecayBegin[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DecayScale[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpreadRate[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RunningTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel name FXName[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bForceDecay[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDecaying;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBarrelDropped;

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x2D
    if(VarName == 'FXName')
    {
        SetCustomParticles(FXName);        
    }
    else
    {
        // End:0x61
        if(VarName == 'bForceDecay')
        {
            // End:0x5E
            if(bForceDecay == true)
            {
                ForceDecay();
            }            
        }
        else
        {
            super(DroppedPickup).ReplicatedEvent(VarName);
        }
    }
    //return;    
}

// Export ULPThermalEnergyPickup::execRegisterWithMapInfo(FFrame&, void* const)
native final simulated function RegisterWithMapInfo();

// Export ULPThermalEnergyPickup::execRemoveFromMapInfo(FFrame&, void* const)
native final simulated function RemoveFromMapInfo();

simulated function ForceDecay()
{
    bForceDecay = true;
    bIsDecaying = true;
    RunningTime = DecayBegin;
    DecayScale = 1.0000000;
    LifeSpan = DecaySpeed;
    // End:0x61
    if(LifeSpan < float(0))
    {
        Destroy();
    }
    //return;    
}

simulated function IsDecaying()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bIsDecaying;
    //return ReturnValue;    
}

function GiveTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], TE, InvMan, LPP;

    InvMan = SPInventoryManager(P.InvManager);
    // End:0xDF
    if(InvMan == none)
    {
        // End:0xDF
        if(LPVSFuturePlayerPawn(P) != none)
        {
            LPP = LPPlayerController(P.Controller).GetMyPlayerPawn();
            // End:0xDF
            if(LPP != none)
            {
                InvMan = SPInventoryManager(LPP.InvManager);
            }
        }
    }
    // End:0x254
    if(InvMan != none)
    {
        TE = LPThermalEnergy(InvMan.FindInventoryType(InventoryClass, true));
        // End:0x1A0
        if(TE == none)
        {
            TE = LPThermalEnergy(Spawn(InventoryClass));
            // End:0x19D
            if(TE != none)
            {
                TE.GiveTo(P);
            }            
        }
        else
        {
            // End:0x254
            if(TE.GetEnergyCount() < TE.MaxEnergy)
            {
                TE.AddEnergy(float(EnergyCount));
                TE.AnnouncePickup(P);
                PickedUpBy(P);
                Inventory = none;
            }
        }
    }
    //return;    
}

simulated function CanBePickedUpBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TE;

    // End:0xE9
    if(super(SPInventoryDroppedPickup).CanBePickedUpBy(P))
    {
        // End:0xE9
        if(P.InvManager != none)
        {
            TE = LPThermalEnergy(SPInventoryManager(P.InvManager).FindInventoryType(InventoryClass, true));
            // End:0xE9
            if((TE == none) || TE.GetEnergyCount() < TE.MaxEnergy)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

simulated event @NULL SetPickupParticles()
{
    local /*0x97E50000-0x00000400*/ private @NULL PickupParticles[8388609];

    //return;    
}

simulated function @NULL SetCustomParticles()
{
    local /*0x97E50000-0x00000000*/ private name FXEVent[8388609];
    local /*0x97E50000-0x00000400*/ private @NULL Comp, Trans;

    FXName = FXEVent;
    Trans = Location;
    Trans.Z = Trans.Z - CylinderComponent(CollisionComponent).CollisionHeight;
    // End:0x10C
    if((int(WorldInfo.NetMode) == int(NM_Standalone)) || TuneDataFXEventBindings_MP == none)
    {
        Comp = TuneDataFXEventBindings.PlayEventFXAtLoc(FXEVent, Trans, Rotation, self, none, none);        
    }
    else
    {
        Comp = TuneDataFXEventBindings_MP.PlayEventFXAtLoc(FXEVent, Trans, Rotation, self, none, none);
    }
    Comp.SetScale(ParticleScale);
    CustomParticleComp = Comp;
    //return;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], prevScale;

    super(Actor).Tick(DeltaTime);
    RunningTime += DeltaTime;
    // End:0x162
    if(CustomParticleComp != none)
    {
        prevScale = DecayScale;
        // End:0xBA
        if(RunningTime > DecayBegin)
        {
            bIsDecaying = true;
            DecayScale = DecayScale - (DeltaTime / DecaySpeed);
            // End:0xB7
            if(DecayScale < 0.0000000)
            {
                DecayScale = 0.0000000;
            }            
        }
        else
        {
            DecayScale = DecayScale + (DeltaTime / SpreadRate);
            // End:0x105
            if(DecayScale > 1.0000000)
            {
                DecayScale = 1.0000000;
            }
        }
        // End:0x162
        if(DecayScale != prevScale)
        {
            CustomParticleComp.SetScale(ParticleScale * DecayScale);
            prevScale = DecayScale;
        }
    }
    //return;    
}

simulated event @NULL Destroyed()
{
    local /*0x97E50000-0x00000400*/ private @NULL PDLE, PSC;

    // End:0x1C3
    if(CustomParticleComp != none)
    {
        CustomParticleComp.DetachFromAny();
        CustomParticleComp.SetActive(false);
        PSC = CustomParticleComp;
        PDLE = ParticleLightEnvironmentComponent(PSC.LightEnvironment);
        // End:0x19B
        if(((PDLE != none) && !PDLE.IsPendingKill()) && !PDLE.bAllowDLESharing)
        {
            // End:0x132
            if(!PSC.IsPendingKill())
            {
                PSC.SetLightEnvironment(none);
            }
            // End:0x173
            if(PDLE.bAttached)
            {
                PDLE.DetachFromAny();
            }
            Class'Engine.SPObject'.static.MarkObjectAsPendingKill(PDLE);
        }
        Class'Engine.SPObject'.static.MarkObjectAsPendingKill(PSC);
    }
    CustomParticleComp = none;
    super(DroppedPickup).Destroyed();
    //return;    
}

function TEValidTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    // End:0xCA
    if((((Other == none) || !Other.bCanPickupInventory) || (Other.DrivenVehicle == none) && Other.Controller == none) || (LPPlayerPawn(Other) != none) && LPPlayerPawn(Other).bIncapacitated)
    {
        return false;
    }
    // End:0x11F
    if(((int(Physics) == int(2)) && Other == Instigator) && Velocity.Z > float(0))
    {
        return false;
    }
    // End:0x1A7
    if(LPBaseVSPlayerPawn(Other) != none)
    {
        PC = LPPlayerController(Other.Controller);
        // End:0x1A7
        if(PC != none)
        {
            // End:0x1A7
            if(!PC.HasUpgrade(Class'LPVSUpgrade_ThermalEnergyAbsorber'))
            {
                return false;
            }
        }
    }
    // End:0x216
    if(Inventory != none)
    {
        return WorldInfo.Game.PickupQuery(Other, Inventory.Class, self);        
    }
    else
    {
        return WorldInfo.Game.PickupQuery(Other, Class'LPThermalEnergy', self);
    }
    return true;
    //return ReturnValue;    
}

auto state Pickup
{
    function ValidTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return TEValidTouch(Other);
        //return ReturnValue;        
    }

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        RegisterWithMapInfo();
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        RemoveFromMapInfo();
        //return;        
    }
    stop;    
}

state FadeOut
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        bFadeOut = true;
        //return;        
    }

    function ValidTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return TEValidTouch(Other);
        //return ReturnValue;        
    }
    stop;    
}

defaultproperties
{
    ParticleScale=1.0000000
    bDoNotAddToNavPointOnLand=true
    bForceZeroExtentMovement=true
    Components[0]=none
    // Reference: CylinderComponent'Default__LPThermalEnergyPickup.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[1]=CollisionCylinder
    bReplicateInstigator=true
    LifeSpan=20.0000000
    CollisionComponent=CollisionCylinder
}