class LPInterpActorDamagebleRepairable extends LPInterpActor
    abstract
    hidecategories(Navigation);

var(0.25_Pct) /*0x80120000-0x00000000*/ private int Health[2162689];
var(0.25_Pct) /*0x80120000-0x00000000*/ private int HealthMax[2162689];
var(0.25_Pct) /*0xABD20000-0x00000000*/ private @NULL RepairInfographic[65537];
var(0.25_Pct) /*0xABD20000-0x00000400*/ private const export @NULL RepairableComponent[589825];

simulated event PostBeginPlay()
{
    super(InterpActor).PostBeginPlay();
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    super(Actor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    Health -= DamageAmount;
    // End:0x79
    if(Health < 0)
    {
        Health = 0;
    }
    //return;    
}

event HealDamage()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x45
    if(Health < HealthMax)
    {
        Health = Min(HealthMax, Health + Amount);
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    super(InterpActor).CreateCheckpointRecord(Record);
    Record.Health = Health;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    super(InterpActor).ApplyCheckpointRecord(Record);
    Health = Record.Health;
    //return;    
}

defaultproperties
{
    Health=1000
    HealthMax=1000
    // Reference: LPRepairableInterpDRComponent'Default__LPInterpActorDamagebleRepairable.RepairObj'
    begin object name=RepairObj class=Class'LPRepairableInterpDRComponent'
    end object
    RepairableComponent=RepairObj
    // Reference: StaticMeshComponent'Default__LPInterpActorDamagebleRepairable.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPInterpActorDamagebleRepairable.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPInterpActorDamagebleRepairable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    Components[2]=RepairObj
    Physics=EPhysics.PHYS_None
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionComponent=StaticMeshComponent0
    SupportedEvents=/* Array type was not detected. */
}