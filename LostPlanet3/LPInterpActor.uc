class LPInterpActor extends SPInterpActor
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x800E0000-0x00000000*/ private bool bDestroyEncroachedOnActors[65537];
var(0.25_Pct) /*0x800E0000-0x00000000*/ private class DamageTypeToDestroyEncroachedOnActorsWith[65537];

event EncroachingOn()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x6A
    if(bDestroyEncroachedOnActors)
    {
        Other.TakeDamage(9999999, none, Other.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageTypeToDestroyEncroachedOnActorsWith);
        return false;
    }
    return super(InterpActor).EncroachingOn(Other);
    //return ReturnValue;    
}

defaultproperties
{
    DamageTypeToDestroyEncroachedOnActorsWith=Class'LPDamageTypeEncroachment'
    // Reference: StaticMeshComponent'Default__LPInterpActor.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPInterpActor.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPInterpActor.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    CollisionComponent=StaticMeshComponent0
}