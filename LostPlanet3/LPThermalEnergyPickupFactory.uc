class LPThermalEnergyPickupFactory extends LPCustomizablePickupFactory
    abstract
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Display);

var(0.25_Pct) /*0x894A0000-0x00000000*/ private float MinEnergyToGive[65537];
var(0.25_Pct) /*0x894A0000-0x00000000*/ private float MaxEnergyToGive[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGiveToPlayerIfDoesNotHave;
var(0.25_Pct) /*0x894A0000-0x00000000*/ private bool bDestroyUponPickup[65537];
var(0.25_Pct) /*0x894A0000-0x00000000*/ private bool bAutoFaceActor[65537];

simulated function CanBePickedUpBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    // End:0x37
    if((Blocker != none) && !Blocker.bExploded)
    {
        return false;
    }
    // End:0xBF
    if(LPBaseVSPlayerPawn(P) != none)
    {
        PC = LPPlayerController(P.Controller);
        // End:0xBF
        if(PC != none)
        {
            // End:0xBD
            if(PC.HasUpgrade(Class'LPVSUpgrade_ThermalEnergyAbsorber'))
            {
                return true;
            }
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function GiveEnergyTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL IM;
    local /*0x97E50000-0x00000000*/ private float EnergyToGive;
    local /*0x97E50000-0x00000000*/ private @NULL Inv, TE;

    IM = SPEngineInventoryManager(P.InvManager);
    // End:0x42
    if(IM == none)
    {
        return false;
    }
    EnergyToGive = MinEnergyToGive + float(Rand(int(MaxEnergyToGive - MinEnergyToGive)));
    Inv = IM.FindInventoryType(Class'LPThermalEnergy', true);
    // End:0x153
    if(Inv == none)
    {
        // End:0xC4
        if(!bGiveToPlayerIfDoesNotHave)
        {
            return false;
        }
        Inv = P.InvManager.Spawn(Class'LPThermalEnergy');
        // End:0x153
        if((Inv == none) || !IM.AddInventory(Inv, true))
        {
            return false;
        }
    }
    TE = LPThermalEnergy(Inv);
    // End:0x222
    if((TE != none) && TE.GetEnergyCount() < TE.MaxEnergy)
    {
        Inv.AnnouncePickup(P);
        LPThermalEnergy(Inv).AddEnergy(EnergyToGive);
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function GiveTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    // End:0x23
    if(bRequiresUserInteraction)
    {
        super(LPPickupFactory).GiveTo(P);        
    }
    else
    {
        // End:0x5C
        if(GiveEnergyTo(P))
        {
            PickedUpBy(P);
            // End:0x5C
            if(bDestroyUponPickup)
            {
                Destroy();
            }
        }
    }
    //return;    
}

function PickedUpItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    // End:0x39
    if(GiveEnergyTo(P))
    {
        PickedUpBy(P);
        // End:0x39
        if(bDestroyUponPickup)
        {
            Destroy();
        }
    }
    //return;    
}

auto state Pickup
{
    simulated function CanBePickedUpBy()
    {
        local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL PC, IM, Inv, TE;

        // End:0x37
        if((Blocker != none) && !Blocker.bExploded)
        {
            return false;
        }
        // End:0x146
        if(LPPlayerPawn(P) != none)
        {
            IM = SPEngineInventoryManager(P.InvManager);
            // End:0x91
            if(IM == none)
            {
                return false;
            }
            Inv = IM.FindInventoryType(Class'LPThermalEnergy', true);
            TE = LPThermalEnergy(Inv);
            // End:0xFD
            if(TE == none)
            {
                return bGiveToPlayerIfDoesNotHave;                
            }
            else
            {
                // End:0x144
                if(TE.GetEnergyCount() < TE.MaxEnergy)
                {
                    return true;                    
                }
                else
                {
                    return false;
                }
            }
        }
        // End:0x1CE
        if(LPBaseVSPlayerPawn(P) != none)
        {
            PC = LPPlayerController(P.Controller);
            // End:0x1CE
            if(PC != none)
            {
                // End:0x1CC
                if(PC.HasUpgrade(Class'LPVSUpgrade_ThermalEnergyAbsorber'))
                {
                    return true;
                }
                return false;
            }
        }
        return true;
        //return ReturnValue;        
    }
    stop;    
}

defaultproperties
{
    MinEnergyToGive=10.0000000
    MaxEnergyToGive=15.0000000
    bGiveToPlayerIfDoesNotHave=true
    // Reference: LPLocTextSelector'Default__LPThermalEnergyPickupFactory.TxtSelectorName'
    begin object name=TxtSelectorName
    end object
    PickupName=TxtSelectorName
    // Reference: StaticMeshComponent'Default__LPThermalEnergyPickupFactory.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    FXMesh=StaticMeshComponent0
    // Reference: ParticleSystemComponent'Default__LPThermalEnergyPickupFactory.PSC0'
    begin object name=PSC0
    end object
    FXParticles=PSC0
    // Reference: DynamicLightEnvironmentComponent'Default__LPThermalEnergyPickupFactory.PickupLightEnvironment'
    begin object name=PickupLightEnvironment
    end object
    MyLightEnvironment=PickupLightEnvironment
    RespawnTime=-1.0000000
    // Reference: CylinderComponent'Default__LPThermalEnergyPickupFactory.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=PickupLightEnvironment
    Components[6]=StaticMeshComponent0
    Components[7]=PSC0
    CollisionComponent=CollisionCylinder
}