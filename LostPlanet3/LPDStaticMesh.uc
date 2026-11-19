class LPDStaticMesh extends SPDStaticMesh
    hidecategories(AnimDependency,Navigation);

struct native LPSpawnedStaticMeshInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeshInfo;
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL LightingBuildComponent[537395201];

    structdefaultproperties
    {
        MeshInfo=(StaticMesh=none,DrawScale=(X=0.0000000,Y=0.0000000,Z=0.0000000),PositionOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000))
        LightingBuildComponent=none
    }
};

var(0.25_Pct) /*0x7E2D0000-0x00000000*/ private bool bForceStaticLightingOnDestructibles[65537];
var(0.25_Pct) /*0x7E2D0000-0x00000000*/ private bool bForceOnlyStaticShadowing[65537];
var(0.25_Pct) /*0x7E2D0000-0x00000000*/ private bool bForceDrawScaleOnDestructibles[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StaticLightingInfos[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array DPStaticMeshCache[131073];

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPDStaticMesh.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPDStaticMesh.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPDStaticMesh.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    // Reference: SPActorDestructComponent'Default__LPDStaticMesh.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[2]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__LPDStaticMesh.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0
    end object
    Components[3]=SPDestructibleStateComponent0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=StaticMeshComponent0
}