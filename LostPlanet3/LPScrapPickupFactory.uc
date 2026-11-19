class LPScrapPickupFactory extends LPCustomizablePickupFactory
    abstract
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Display);

var(0.25_Pct) /*0x82460000-0x00000000*/ private int ScrapAmount[65537];
var(0.25_Pct) /*0x82460000-0x00000000*/ private bool bAutoFaceActor[65537];

function PickedUpItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    super.PickedUpItem(P);
    LPPlayerController(P.Controller).AddScrap(ScrapAmount, true, LPPlayerPawn(P).TuneDataPlayerPawn.ScrapPickupMessageDisplayTime);
    //return;    
}

defaultproperties
{
    ScrapAmount=1
    bAutoFaceActor=true
    // Reference: LPLocTextSelector'Default__LPScrapPickupFactory.TxtSelectorName'
    begin object name=TxtSelectorName
    end object
    PickupName=TxtSelectorName
    PickUpSpecialMoveClass=Class'LPSM_PlayerPickUpScrap'
    // Reference: StaticMeshComponent'Default__LPScrapPickupFactory.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    FXMesh=StaticMeshComponent0
    // Reference: ParticleSystemComponent'Default__LPScrapPickupFactory.PSC0'
    begin object name=PSC0
    end object
    FXParticles=PSC0
    // Reference: DynamicLightEnvironmentComponent'Default__LPScrapPickupFactory.PickupLightEnvironment'
    begin object name=PickupLightEnvironment
    end object
    MyLightEnvironment=PickupLightEnvironment
    // Reference: CylinderComponent'Default__LPScrapPickupFactory.CollisionCylinder'
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