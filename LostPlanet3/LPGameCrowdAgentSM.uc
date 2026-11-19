class LPGameCrowdAgentSM extends SPGameCrowdAgentSM
    hidecategories(AnimDependency,Navigation,Advanced,Attachment,Collision,Object);

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPGameCrowdAgentSM.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    Mesh=StaticMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPGameCrowdAgentSM.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
}