class LPFakePawn extends SPGFFakePawn
    abstract
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPFakePawn.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPFakePawn.CollisionCylinderA'
    begin object name=CollisionCylinderA
    end object
    CylinderComponent=CollisionCylinderA
    Components[0]=CollisionCylinderA
    Components[1]=MyLightEnvironment
    // Reference: SPActorDestructComponent'Default__LPFakePawn.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[2]=SPActorDestructComponent0
    // Reference: LPTeamAssignmentInteractionMetaData'Default__LPFakePawn.IntMetaA'
    begin object name=IntMetaA class=Class'LPTeamAssignmentInteractionMetaData'
        TeamNumber=ELPTeams.LPTeam_Akrid
    end object
    InteractionMetaData=IntMetaA
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=CollisionCylinderA
}