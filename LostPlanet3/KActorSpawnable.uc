class KActorSpawnable extends KActor
    notplaceable
    hidecategories(AnimDependency);

var(*) /*0x35EA0000-0x00000000*/ private bool bRecycleScaleToZero;
var(*) /*0x35EA0000-0x00000000*/ private bool bScalingToZero;

simulated function Initialize()
{
    bScalingToZero = false;
    SetDrawScale(default.DrawScale);
    ClearTimer('Recycle');
    SetHidden(false);
    StaticMeshComponent.SetHidden(false);
    SetTickIsDisabled(false);
    SetPhysics(10);
    SetCollision(true, false);
    //return;    
}

simulated function Recycle()
{
    // End:0x1F
    if(bRecycleScaleToZero == true)
    {
        bScalingToZero = true;        
    }
    else
    {
        RecycleInternal();
    }
    //return;    
}

simulated event RecycleInternal()
{
    SetHidden(true);
    StaticMeshComponent.SetHidden(true);
    SetPhysics(0);
    SetCollision(false, false);
    ClearTimer('Recycle');
    SetTickIsDisabled(true);
    //return;    
}

// Export UKActorSpawnable::execResetComponents(FFrame&, void* const)
native final function ResetComponents();

defaultproperties
{
    // Reference: StaticMeshComponent'Default__KActorSpawnable.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__KActorSpawnable.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__KActorSpawnable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    bNoDelete=false
    CollisionComponent=StaticMeshComponent0
}