class LPSurveyMapPickupFactory extends LPCustomizablePickupFactory
    abstract
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Display);

defaultproperties
{
    // Reference: LPLocTextSelector'Default__LPSurveyMapPickupFactory.TxtSelectorName'
    begin object name=TxtSelectorName
    end object
    PickupName=TxtSelectorName
    bDisableOnQuestEntryCompletion=true
    PickUpSpecialMoveClass=Class'LPSM_PlayerPickUpSurveyMap'
    // Reference: StaticMeshComponent'Default__LPSurveyMapPickupFactory.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    FXMesh=StaticMeshComponent0
    // Reference: ParticleSystemComponent'Default__LPSurveyMapPickupFactory.PSC0'
    begin object name=PSC0
    end object
    FXParticles=PSC0
    // Reference: DynamicLightEnvironmentComponent'Default__LPSurveyMapPickupFactory.PickupLightEnvironment'
    begin object name=PickupLightEnvironment
    end object
    MyLightEnvironment=PickupLightEnvironment
    // Reference: CylinderComponent'Default__LPSurveyMapPickupFactory.CollisionCylinder'
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