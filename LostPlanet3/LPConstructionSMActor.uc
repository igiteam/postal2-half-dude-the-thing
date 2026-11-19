class LPConstructionSMActor extends LPDStaticMesh
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSIP[536870913];

function RegisterVSIP()
{
    local /*0x97E50000-0x00000000*/ private @NULL newIP[8388609];

    VSIP = newIP;
    //return;    
}

simulated event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0xB1
    if((DamageType == Class'LPDamageTypeVSWelder') && VSIP.VSPawnOwner != none)
    {
        super(Actor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        VSIP.NotifyConstructionActorHit(self, HitLocation);
    }
    //return;    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPConstructionSMActor.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPConstructionSMActor.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPConstructionSMActor.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    // Reference: SPActorDestructComponent'Default__LPConstructionSMActor.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[2]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__LPConstructionSMActor.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0
    end object
    Components[3]=SPDestructibleStateComponent0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=StaticMeshComponent0
}