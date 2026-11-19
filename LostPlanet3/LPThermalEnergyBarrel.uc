class LPThermalEnergyBarrel extends LPInterpActorDamagebleRepairable
    hidecategories(Navigation);

defaultproperties
{
    // Reference: LPRepairableInterpDRComponent'Default__LPThermalEnergyBarrel.RepairObj'
    begin object name=RepairObj
    end object
    RepairableComponent=RepairObj
    // Reference: StaticMeshComponent'Default__LPThermalEnergyBarrel.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPThermalEnergyBarrel.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPThermalEnergyBarrel.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    Components[2]=RepairObj
    CollisionComponent=StaticMeshComponent0
}