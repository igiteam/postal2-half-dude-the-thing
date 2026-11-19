class LPCrabShellCap extends LPCrabShell
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoHighRedCapExplosion;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PercentageOfEachMeshToFrag;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int Exploded[2097153];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    super(LPCoreShield).ReplicatedEvent(VarName);
    switch(VarName)
    {
        // End:0x3F
        case 'Exploded':
            DoExplode();
            // End:0x42
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

protected simulated function InternalAttachToPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyAkrid[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x36
    if(super(LPCoreShield).InternalAttachToPawn(MyAkrid, AttachSocket, ShieldId))
    {
        SetCollisionType(1);
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected simulated function InternalSetVisibility()
{
    super(LPCoreShield).InternalSetVisibility();
    SetCollisionType(1);
    //return;    
}

protected simulated function DoExplode()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL FractureMesh;

    // End:0xCC
    if(Exploded != 0)
    {
        I = 0;
        J0x1A:

        // End:0xCC [Loop If]
        if(I < Attached.Length)
        {
            FractureMesh = SPFracturedStaticMeshActor(Attached[I]);
            // End:0xBE
            if(FractureMesh != none)
            {
                // End:0x96
                if(bDoHighRedCapExplosion)
                {
                    FractureMesh.Explode();                    
                }
                else
                {
                    FractureMesh.LowResExplode(PercentageOfEachMeshToFrag);
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    //return;    
}

simulated function Explode()
{
    Exploded = 1;
    DoExplode();
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL ActorAttached;

    I = Attached.Length - 1;
    J0x17:

    // End:0x94 [Loop If]
    if(I >= 0)
    {
        ActorAttached = Attached[I];
        // End:0x86
        if(ActorAttached != none)
        {
            ActorAttached.SetBase(none);
            ActorAttached.Destroy();
        }
        --I;
        // [Loop Continue]
        goto J0x17;
    }
    super(LPCoreShield).Destroyed();
    //return;    
}

defaultproperties
{
    bDoHighRedCapExplosion=true
    PercentageOfEachMeshToFrag=1.0000000
    // Reference: StaticMeshComponent'Default__LPCrabShellCap.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPCrabShellCap.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    // Reference: SPActorDestructComponent'Default__LPCrabShellCap.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[2]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__LPCrabShellCap.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0
    end object
    Components[3]=SPDestructibleStateComponent0
    bHidden=true
    bCollideActors=false
    bBlockActors=false
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=StaticMeshComponent0
}