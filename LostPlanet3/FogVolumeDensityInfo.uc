class FogVolumeDensityInfo extends Info
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation,Collision)
    classgroup(Fog)
    autoexpandcategories(FogVolumeDensityInfo);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bEnabled;

    structdefaultproperties
    {
        bEnabled=false
    }
};

var(*) /*0x23D50000-0x00000400*/ private export @NULL DensityComponent[589825];
var(*) /*0x23D50000-0x00000400*/ private export @NULL AutomaticMeshComponent[589825];
var(*) /*0x35EA0000-0x00000000*/ private travel bool bEnabled[2097153];

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x43
    if(DensityComponent != none)
    {
        bEnabled = DensityComponent.bEnabled;
    }
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x43
    if(VarName == 'bEnabled')
    {
        DensityComponent.SetEnabled(bEnabled);        
    }
    else
    {
        super(Actor).ReplicatedEvent(VarName);
    }
    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x5A
    if(Action.InputLinks[0].bHasImpulse)
    {
        DensityComponent.SetEnabled(true);        
    }
    else
    {
        // End:0xB4
        if(Action.InputLinks[1].bHasImpulse)
        {
            DensityComponent.SetEnabled(false);            
        }
        else
        {
            // End:0x12C
            if(Action.InputLinks[2].bHasImpulse)
            {
                DensityComponent.SetEnabled(!DensityComponent.bEnabled);
            }
        }
    }
    bEnabled = DensityComponent.bEnabled;
    ForceNetRelevant();
    SetForcedInitialReplicatedProperty(BoolProperty'FogVolumeDensityInfo.bEnabled', bEnabled == default.bEnabled);
    //return;    
}

function ShouldSaveForCheckpoint()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return int(RemoteRole) != int(ROLE_None);
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25165825];

    Record.bEnabled = bEnabled;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897];

    bEnabled = Record.bEnabled;
    DensityComponent.SetEnabled(bEnabled);
    ForceNetRelevant();
    SetForcedInitialReplicatedProperty(BoolProperty'FogVolumeDensityInfo.bEnabled', bEnabled == default.bEnabled);
    //return;    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__FogVolumeDensityInfo.AutomaticMeshComponent0'
    begin object name=AutomaticMeshComponent0 class=Class'StaticMeshComponent'
    end object
    AutomaticMeshComponent=AutomaticMeshComponent0
    Components[0]=none
    Components[1]=AutomaticMeshComponent0
    bNoDelete=true
}