class LPDStaticMesh_VSGrabbable extends LPDStaticMesh
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DamageTypeUpgrade;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSIP[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHitSomething;

function RegisterVSIP()
{
    local /*0x97E50000-0x00000000*/ private @NULL newIP[8388609];

    VSIP = newIP;
    //return;    
}

simulated function DoVSCrushTossAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL TossPawn[8388609], TossVelocity;
    local /*0x97E50000-0x00000000*/ private class DamageClass[9437185];

    vect(0.0000000, 0.0000000, -100.0000000)
    Class'LPDamageTypeVSMelee'
    SetBase(none);
    SetPhysics(6);
    // End:0x10D
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        Velocity.X = TossVelocity.X * float(3);
        Velocity.Y = TossVelocity.Y * float(3);
        Velocity.Z = TossVelocity.Z;        
    }
    else
    {
        Velocity = TossVelocity * float(2);
    }
    DamageTypeUpgrade = DamageClass;
    // End:0x181
    if(TossVelocity != vect(0.0000000, 0.0000000, -100.0000000))
    {
        TossPawn.TriggerEventClass(Class'LPSeqEvent_VitalSuitWinch', self, 2);
    }
    // End:0x1AA
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
    }
    GotoState('Firing');
    //return;    
}

function RemoveME()
{
    Destroy();
    //return;    
}

state Firing
{
    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        // End:0x2A
        if(VSize2D(Velocity) < 25.0000000)
        {
            ExplodeMe();            
        }
        else
        {
            Velocity.X *= 0.9700000;
            Velocity.Y *= 0.9700000;
            Velocity.Z += (((GetGravityZ()) * DeltaTime) * float(2));
        }
        //return;        
    }

    event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

        // End:0x6A
        if((LPVSPlayerPawn(Other) != none) && LPProj_VSWinch(Other) != none)
        {
            super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
            ExplodeMe();
        }
        //return;        
    }

    event @NULL HitWall()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp;

        ExplodeMe();
        //return;        
    }

    function ExplodeMe()
    {
        // End:0x5F
        if(!bHitSomething)
        {
            bHitSomething = true;
            TakeDamage(1000, none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeVSMelee');
            SetTimer(1.0000000, false, 'RemoveME');
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    DamageTypeUpgrade=Class'LPDamageTypeVSMelee'
    // Reference: StaticMeshComponent'Default__LPDStaticMesh_VSGrabbable.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPDStaticMesh_VSGrabbable.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPDStaticMesh_VSGrabbable.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    // Reference: SPActorDestructComponent'Default__LPDStaticMesh_VSGrabbable.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[2]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__LPDStaticMesh_VSGrabbable.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0
    end object
    Components[3]=SPDestructibleStateComponent0
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=StaticMeshComponent0
    SupportedEvents=/* Array type was not detected. */
}