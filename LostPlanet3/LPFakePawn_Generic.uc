class LPFakePawn_Generic extends LPFakePawn
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPFakePawn_Generic.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPFakePawn_Generic.CollisionCylinderA'
    begin object name=CollisionCylinderA
    end object
    CylinderComponent=CollisionCylinderA
    Components[0]=CollisionCylinderA
    Components[1]=MyLightEnvironment
    // Reference: SPActorDestructComponent'Default__LPFakePawn_Generic.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[2]=SPActorDestructComponent0
    // Reference: LPTeamAssignmentInteractionMetaData'Default__LPFakePawn_Generic.IntMetaA'
    begin object name=IntMetaA
    end object
    InteractionMetaData=IntMetaA
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=CollisionCylinderA
}