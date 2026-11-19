class LPCustomizablePickupFactory extends LPPickupFactory
    abstract
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Display);

var(0.25_Pct) /*0x7CF00000-0x00000400*/ private export @NULL PickupFactoryMesh[589825];
var(0.25_Pct) /*0x7CF00000-0x00000400*/ private editfixedsize @NULL PickupName[589825];
var(0.25_Pct) /*0x7CF00000-0x00000400*/ private editfixedsize @NULL QuestEntry[589825];
var(0.25_Pct) /*0x7CF00000-0x00000000*/ private bool bDisableOnQuestEntryCompletion[65537];
var(0.25_Pct) /*0x7CF00000-0x00000000*/ private bool bDisableOnPickUp[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class PickUpSpecialMoveClass;
var(0.25_Pct) /*0x7CF00000-0x00000000*/ private @NULL PickupSound[65537];
var(0.25_Pct) /*0x7CF00000-0x00000000*/ private byte AnimatedPickupHeight[65537];
var(0.25_Pct) /*0x7CF00000-0x00000400*/ private export @NULL FXMesh[589825];
var(0.25_Pct) /*0x7CF00000-0x00000400*/ private export @NULL FXParticles[589825];
var(0.25_Pct) /*0x7CF00000-0x00000000*/ private @NULL Blocker[65537];

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL Objective;

    super(SPPickupFactory).PostBeginPlay();
    // End:0x9D
    if((QuestEntry != none) && bDisableOnQuestEntryCompletion)
    {
        Objective = SPQO_ObjectiveBool(QuestEntry.GetQuestObject());
        // End:0x9D
        if(Objective != none)
        {
            // End:0x9D
            if(int(Objective.GetQuestStatus()) == int(4))
            {
                ShutDown();
            }
        }
    }
    // End:0xBF
    if(FXParticles != none)
    {
        PlayParticles(FXParticles);
    }
    //return;    
}

simulated function @NULL PlayParticles()
{
    local /*0x97E50000-0x00000400*/ private @NULL Particles[8388609];

    // End:0x70
    if((Particles.Template != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        Particles.SetActive(true);
    }
    //return;    
}

simulated event SetPickupMeshEvent()
{
    SetPickupMesh();
    //return;    
}

simulated function SetPickupMesh()
{
    local /*0x97E50000-0x00000000*/ private bool bMeshIsCollisionComponent;

    // End:0x4C
    if(PickupMesh != none)
    {
        bMeshIsCollisionComponent = CollisionComponent == PickupMesh;
        DetachComponent(PickupMesh);
        PickupMesh = none;
    }
    // End:0xE7
    if(PickupFactoryMesh != none)
    {
        PickupMesh = new (self) PickupFactoryMesh.Class (PickupFactoryMesh);
        // End:0xB0
        if(bMeshIsCollisionComponent)
        {
            CollisionComponent = PickupMesh;
        }
        AttachComponent(PickupMesh);
        // End:0xDD
        if(bPickupHidden)
        {
            SetPickupHidden();            
        }
        else
        {
            SetPickupVisible();
        }
    }
    super(SPPickupFactory).SetPickupMesh();
    //return;    
}

function ValidTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function GiveToImmediately()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], PlayerPawn;

    // End:0x52
    if(!ValidTouch(P) || (Blocker != none) && Blocker.bExploded == false)
    {
        return;
    }
    // End:0x77
    if(PickUpSpecialMoveClass == none)
    {
        PickedUpItem(P);        
    }
    else
    {
        PlayerPawn = LPPlayerPawn(P);
        // End:0x109
        if(PlayerPawn != none)
        {
            PlayerPawn.TemplateLogicData.AnimatedPickupHeight = AnimatedPickupHeight;
            PlayerPawn.ServerDoSpecialMove(PickUpSpecialMoveClass, false, true,, self);
        }
    }
    //return;    
}

function PickedUpItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    // End:0x20
    if(bDisableOnPickUp)
    {
        PickedUpBy(P);
    }
    CompleteQuestOnPickup();
    // End:0x66
    if(PickupSound != none)
    {
        P.PlaySound(PickupSound);
    }
    //return;    
}

function CompleteQuestOnPickup()
{
    local /*0x97E50000-0x00000000*/ private @NULL Objective;

    // End:0x75
    if(QuestEntry != none)
    {
        Objective = SPQO_ObjectiveBool(QuestEntry.GetQuestObject());
        // End:0x75
        if(Objective != none)
        {
            Objective.AdjustQuestProgress(1.0000000);
        }
    }
    //return;    
}

function OnApplyQuestObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    QuestEntry = Action.QuestEntry;
    //return;    
}

simulated function GetHUDPromptItemName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return PickupName.LocalizedTextMarkUp;
    //return ReturnValue;    
}

simulated function SetPickupHidden()
{
    super(SPPickupFactory).SetPickupHidden();
    // End:0x39
    if(FXMesh != none)
    {
        FXMesh.SetHidden(true);
    }
    // End:0x68
    if(FXParticles != none)
    {
        FXParticles.SetHidden(true);
    }
    //return;    
}

simulated function SetPickupVisible()
{
    super(SPPickupFactory).SetPickupVisible();
    // End:0x39
    if(FXMesh != none)
    {
        FXMesh.SetHidden(false);
    }
    // End:0x68
    if(FXParticles != none)
    {
        FXParticles.SetHidden(false);
    }
    //return;    
}

auto state Pickup
{
    simulated function CanBePickedUpBy()
    {
        local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x47
        if(super.CanBePickedUpBy(P))
        {
            return (Blocker == none) || Blocker.bExploded;
        }
        return false;
        //return ReturnValue;        
    }
    stop;    
}

defaultproperties
{
    // Reference: LPLocTextSelector'Default__LPCustomizablePickupFactory.TxtSelectorName'
    begin object name=TxtSelectorName class=Class'LPLocTextSelector'
    end object
    PickupName=TxtSelectorName
    bDisableOnPickUp=true
    // Reference: StaticMeshComponent'Default__LPCustomizablePickupFactory.StaticMeshComponent0'
    begin object name=StaticMeshComponent0 class=Class'Engine.StaticMeshComponent'
    end object
    FXMesh=StaticMeshComponent0
    // Reference: ParticleSystemComponent'Default__LPCustomizablePickupFactory.PSC0'
    begin object name=PSC0 class=Class'Engine.ParticleSystemComponent'
    end object
    FXParticles=PSC0
    bRequiresUserInteraction=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPCustomizablePickupFactory.PickupLightEnvironment'
    begin object name=PickupLightEnvironment
    end object
    MyLightEnvironment=PickupLightEnvironment
    RespawnTime=0.0000000
    bIgnoreIntermediateCollision=true
    InventoryType=Class'Engine.Inventory'
    // Reference: CylinderComponent'Default__LPCustomizablePickupFactory.CollisionCylinder'
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
    bNoDelete=false
    bSaveToPersistentDataManager=true
    CollisionComponent=CollisionCylinder
}