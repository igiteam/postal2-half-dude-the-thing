class LPThermalEnergyFannyPack extends Inventory
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxCapacity;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentCapacity[2097153];

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825];

    Record.InventoryClassPath = PathName(Class);
    Record.MaxCapacity = MaxCapacity;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25296897];

    MaxCapacity = Record.MaxCapacity;
    //return;    
}

simulated function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    super(Actor).PostBeginPlay();
    LPP = LPBasePlayerPawn(Owner);
    // End:0xA9
    if(LPP != none)
    {
        // End:0xA9
        if(LPPlayerPawn(LPP) != none)
        {
            MaxCapacity = LPPlayerPawn(LPP).TuneDataPlayerPawn.MaxTEngFannyPackCapacity.GetValue();
        }
    }
    CurrentCapacity = 0.0000000;
    //return;    
}

simulated function GetCurrentCapacity()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CurrentCapacity;
    //return ReturnValue;    
}

simulated function GetMaxCapacity()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return MaxCapacity;
    //return ReturnValue;    
}

simulated function GetNormalizedCurrentCapacity()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return CurrentCapacity / MaxCapacity;
    //return ReturnValue;    
}

simulated function AddEnergy()
{
    local /*0x97E50000-0x00000000*/ private float EnergyToAdd[8388609], ReturnValue, E;

    // End:0x33
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return EnergyToAdd;
    }
    E = EnergyToAdd;
    // End:0xA7
    if((CurrentCapacity + EnergyToAdd) > MaxCapacity)
    {
        E = (CurrentCapacity + EnergyToAdd) - MaxCapacity;
        CurrentCapacity = MaxCapacity;        
    }
    else
    {
        CurrentCapacity += E;
    }
    return E;
    //return ReturnValue;    
}

defaultproperties
{
    MaxCapacity=100.0000000
    DroppedPickupClass=none
    bOnlyRelevantToOwner=false
    bAlwaysRelevant=true
    bReplicateInstigator=true
    bOnlyDirtyReplication=false
}