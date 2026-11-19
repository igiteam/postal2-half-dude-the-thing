class LPCoreShieldSkeletal extends LPDSkeletalMesh
    abstract
    hidecategories(AnimDependency,Navigation);

struct AttachInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SocketName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int bAttachChanged;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ShieldId;

    structdefaultproperties
    {
        SocketName="None"
        bAttachChanged=0
        ShieldId="None"
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyAkridPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ProtectedCoreIDs;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ShieldMatInstances;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EmissiveGlow[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanTakeDamage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel AttachInfoStruct AttachInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int Visibility[2097153];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    super(SPSkeletalMeshActor).ReplicatedEvent(VarName);
    switch(VarName)
    {
        // End:0x3F
        case 'AttachInfo':
            ReattachForClient();
            // End:0x5B
            break;
        // End:0x58
        case 'Visibility':
            InternalSetVisibility();
            // End:0x5B
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function AttachToPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyAkrid[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x94
    if(InternalAttachToPawn(MyAkrid, AttachSocket, ShieldId))
    {
        AttachInfo.SocketName = AttachSocket;
        AttachInfo.bAttachChanged++;
        AttachInfo.ShieldId = ShieldId;
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected simulated function ReattachForClient()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyAkrid;

    MyAkrid = LPAIPawnAkrid(Base);
    // End:0x41
    if(MyAkrid == none)
    {
        SetTimer(0.1000000, true, 'NeedToReattachTimer');        
    }
    else
    {
        InternalAttachToPawn(MyAkrid, AttachInfo.SocketName, AttachInfo.ShieldId);
    }
    //return;    
}

simulated function NeedToReattachTimer()
{
    // End:0x2D
    if(Base != none)
    {
        ReattachForClient();
        ClearTimer('NeedToReattachTimer');
    }
    //return;    
}

protected simulated function InternalAttachToPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyAkrid[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x155
    if((MyAkrid != none) && MyAkrid.Mesh != none)
    {
        SetHardAttach(false);
        SetBase(none);
        SetCollisionType(1);
        SetLocation(MyAkrid.Location);
        SetRotation(MyAkrid.Rotation);
        SetCollisionType(3);
        SetHardAttach(true);
        SetBase(MyAkrid,, MyAkrid.Mesh, AttachSocket);
        // End:0x12D
        if(int(Role) < int(ROLE_Authority))
        {
            MyAkrid.NotifyShieldAttachedSkeletal(self, AttachSocket, ShieldId);
        }
        MyAkridPawn = MyAkrid;
        AttachedToCore(MyAkrid);
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function SetVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool bVisible[8388609];

    Visibility = ((bVisible) ? 1 : 0);
    InternalSetVisibility();
    //return;    
}

protected simulated function InternalSetVisibility()
{
    // End:0x29
    if(Visibility != 0)
    {
        SetCollisionType(3);
        SetHidden(false);        
    }
    else
    {
        SetCollisionType(1);
        SetHidden(true);
    }
    //return;    
}

simulated event @NULL Attach()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private int AttachIdx;
    local /*0x97E50000-0x00000000*/ private @NULL LPCS, FSM, DLE;

    super(Actor).Attach(Other);
    DLE = DynamicLightEnvironmentComponent(SkeletalMeshComponent.LightEnvironment);
    FSM = FracturedStaticMeshActor(Other);
    // End:0x251
    if(FSM != none)
    {
        // End:0x9F
        if(DLE != none)
        {
            DLE.bSynthesizeSHLight = false;
        }
        // End:0xF7
        if(FSM.KynapseObstacleComponent != none)
        {
            FSM.KynapseObstacleComponent.DetachFromAny();
        }
        // End:0x170
        if(SkeletalMeshComponent.ShadowParent != none)
        {
            FSM.FracturedStaticMeshComponent.SetShadowParent(SkeletalMeshComponent.ShadowParent);            
        }
        else
        {
            FSM.FracturedStaticMeshComponent.SetShadowParent(SkeletalMeshComponent);
        }
        FSM.FracturedStaticMeshComponent.SetLightingChannels(SkeletalMeshComponent.LightingChannels);
        FSM.FracturedStaticMeshComponent.SetLightEnvironment(SkeletalMeshComponent.LightEnvironment);
    }
    LPCS = LPCoreShieldSkeletal(Other);
    // End:0x5FF
    if(LPCS != none)
    {
        // End:0x2AC
        if(DLE != none)
        {
            DLE.bSynthesizeSHLight = false;
        }
        LPCS.SkeletalMeshComponent.SetShadowParent(SkeletalMeshComponent);
        LPCS.SkeletalMeshComponent.SetLightingChannels(SkeletalMeshComponent.LightingChannels);
        LPCS.SkeletalMeshComponent.SetLightEnvironment(SkeletalMeshComponent.LightEnvironment);
        AttachIdx = 0;
        J0x398:

        // End:0x5FF [Loop If]
        if(AttachIdx < LPCS.Attached.Length)
        {
            FSM = FracturedStaticMeshActor(LPCS.Attached[AttachIdx]);
            // End:0x5F1
            if(FSM != none)
            {
                // End:0x43F
                if(DLE != none)
                {
                    DLE.bSynthesizeSHLight = false;
                }
                // End:0x497
                if(FSM.KynapseObstacleComponent != none)
                {
                    FSM.KynapseObstacleComponent.DetachFromAny();
                }
                // End:0x510
                if(SkeletalMeshComponent.ShadowParent != none)
                {
                    FSM.FracturedStaticMeshComponent.SetShadowParent(SkeletalMeshComponent.ShadowParent);                    
                }
                else
                {
                    FSM.FracturedStaticMeshComponent.SetShadowParent(SkeletalMeshComponent);
                }
                FSM.FracturedStaticMeshComponent.SetLightingChannels(SkeletalMeshComponent.LightingChannels);
                FSM.FracturedStaticMeshComponent.SetLightEnvironment(SkeletalMeshComponent.LightEnvironment);
            }
            AttachIdx++;
            // [Loop Continue]
            goto J0x398;
        }
    }
    //return;    
}

simulated event Detach()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private int AttachIdx;
    local /*0x97E50000-0x00000000*/ private @NULL LPCS, LPCS_Skeletal, FSM;

    super(Actor).Detach(Other);
    FSM = FracturedStaticMeshActor(Other);
    // End:0x203
    if((FSM != none) && !FSM.IsPendingKill())
    {
        // End:0x100
        if((FSM.KynapseObstacleComponent != none) && !FSM.KynapseObstacleComponent.bAttached)
        {
            FSM.AttachComponent(FSM.KynapseObstacleComponent);
        }
        FSM.FracturedStaticMeshComponent.SetShadowParent(none);
        FSM.FracturedStaticMeshComponent.SetLightingChannels(FSM.FracturedStaticMeshComponent.LightingChannels);
        FSM.FracturedStaticMeshComponent.SetLightEnvironment(FSM.FracturedStaticMeshComponent.LightEnvironment);
    }
    LPCS = LPCoreShield(Other);
    // End:0x5AC
    if((LPCS != none) && !LPCS.IsPendingKill())
    {
        LPCS.StaticMeshComponent.SetShadowParent(none);
        LPCS.StaticMeshComponent.SetLightingChannels(LPCS.StaticMeshComponent.LightingChannels);
        LPCS.StaticMeshComponent.SetLightEnvironment(LPCS.StaticMeshComponent.LightEnvironment);
        AttachIdx = 0;
        J0x362:

        // End:0x5AC [Loop If]
        if(AttachIdx < LPCS.Attached.Length)
        {
            FSM = FracturedStaticMeshActor(LPCS.Attached[AttachIdx]);
            // End:0x59E
            if((FSM != none) && !FSM.IsPendingKill())
            {
                // End:0x49B
                if((FSM.KynapseObstacleComponent != none) && !FSM.KynapseObstacleComponent.bAttached)
                {
                    FSM.AttachComponent(FSM.KynapseObstacleComponent);
                }
                FSM.FracturedStaticMeshComponent.SetShadowParent(none);
                FSM.FracturedStaticMeshComponent.SetLightingChannels(FSM.FracturedStaticMeshComponent.LightingChannels);
                FSM.FracturedStaticMeshComponent.SetLightEnvironment(FSM.FracturedStaticMeshComponent.LightEnvironment);
            }
            AttachIdx++;
            // [Loop Continue]
            goto J0x362;
        }
    }
    LPCS_Skeletal = LPCoreShieldSkeletal(Other);
    // End:0x955
    if((LPCS_Skeletal != none) && !LPCS_Skeletal.IsPendingKill())
    {
        LPCS_Skeletal.SkeletalMeshComponent.SetShadowParent(none);
        LPCS_Skeletal.SkeletalMeshComponent.SetLightingChannels(LPCS_Skeletal.SkeletalMeshComponent.LightingChannels);
        LPCS_Skeletal.SkeletalMeshComponent.SetLightEnvironment(LPCS_Skeletal.SkeletalMeshComponent.LightEnvironment);
        AttachIdx = 0;
        J0x70B:

        // End:0x955 [Loop If]
        if(AttachIdx < LPCS_Skeletal.Attached.Length)
        {
            FSM = FracturedStaticMeshActor(LPCS_Skeletal.Attached[AttachIdx]);
            // End:0x947
            if((FSM != none) && !FSM.IsPendingKill())
            {
                // End:0x844
                if((FSM.KynapseObstacleComponent != none) && !FSM.KynapseObstacleComponent.bAttached)
                {
                    FSM.AttachComponent(FSM.KynapseObstacleComponent);
                }
                FSM.FracturedStaticMeshComponent.SetShadowParent(none);
                FSM.FracturedStaticMeshComponent.SetLightingChannels(FSM.FracturedStaticMeshComponent.LightingChannels);
                FSM.FracturedStaticMeshComponent.SetLightEnvironment(FSM.FracturedStaticMeshComponent.LightEnvironment);
            }
            AttachIdx++;
            // [Loop Continue]
            goto J0x70B;
        }
    }
    //return;    
}

function AttachedToCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL AkridPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;

    MyAkridPawn = AkridPawn;
    Idx = 0;
    J0x1E:

    // End:0x77 [Loop If]
    if(Idx < ProtectedCoreIDs.Length)
    {
        MyAkridPawn.RegisterShieldSkeletalProtectingCore(self, ProtectedCoreIDs[Idx]);
        Idx++;
        // [Loop Continue]
        goto J0x1E;
    }
    CreateMaterialInstances();
    //return;    
}

function CreateMaterialInstances()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL MIC;

    ShieldMatInstances.Length = SkeletalMeshComponent.GetNumElements();
    I = 0;
    J0x35:

    // End:0xAA [Loop If]
    if(I < ShieldMatInstances.Length)
    {
        MIC = SkeletalMeshComponent.CreateAndSetMaterialInstanceConstant(I);
        ShieldMatInstances[I] = MIC;
        ++I;
        // [Loop Continue]
        goto J0x35;
    }
    SetGlow(0.0000000);
    //return;    
}

function SetGlow()
{
    local /*0x97E50000-0x00000000*/ private float val[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    EmissiveGlow = val;
    I = 0;
    J0x1E:

    // End:0x98 [Loop If]
    if(I < ShieldMatInstances.Length)
    {
        // End:0x8A
        if(ShieldMatInstances[I] != none)
        {
            ShieldMatInstances[I].SetScalarParameterValue('Emissive', EmissiveGlow);
        }
        ++I;
        // [Loop Continue]
        goto J0x1E;
    }
    //return;    
}

simulated event Destroyed()
{
    RemoveProtection();
    MyAkridPawn.ShieldDestroyedSkeletal(self);
    ShieldMatInstances.Length = 0;
    super(SkeletalMeshActor).Destroyed();
    //return;    
}

simulated function RemoveProtection()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x64 [Loop If]
    if(Idx < ProtectedCoreIDs.Length)
    {
        MyAkridPawn.UnregisterShieldSkeletalProtectingCore(self, ProtectedCoreIDs[Idx]);
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private bool bProcess;
    local /*0x97E50000-0x00000000*/ private @NULL Damager;

    // End:0x13
    if(!bCanTakeDamage)
    {
        return;
    }
    // End:0x31
    if(MyAkridPawn == none)
    {
        bProcess = true;        
    }
    else
    {
        // End:0x6B
        if(EventInstigator != none)
        {
            Damager = EventInstigator.Pawn;            
        }
        else
        {
            Damager = DamageCauser;
        }
        Idx = 0;
        J0x89:

        // End:0x107 [Loop If]
        if(Idx < ProtectedCoreIDs.Length)
        {
            // End:0xF9
            if(!MyAkridPawn.IsDamageFilteredForCore(ProtectedCoreIDs[Idx], DamageType, Damager))
            {
                bProcess = true;
                // [Explicit Break]
                goto J0x107;
            }
            Idx++;
            // [Loop Continue]
            goto J0x89;
        }
    }
    J0x107:

    // End:0x15D
    if(bProcess)
    {
        super(SkeletalMeshActor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x52
    if(MyAkridPawn != none)
    {
        MyAkridPawn.Touch(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x49
    if(MyAkridPawn != none)
    {
        MyAkridPawn.Bump(Other, OtherComp, HitNormal);
    }
    //return;    
}

defaultproperties
{
    bCanTakeDamage=true
    Visibility=1
    // Reference: SPHeadTrackComponent'Default__LPCoreShieldSkeletal.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__LPCoreShieldSkeletal.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPCoreShieldSkeletal.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPCoreShieldSkeletal.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    // Reference: SPActorDestructComponent'Default__LPCoreShieldSkeletal.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[4]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__LPCoreShieldSkeletal.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0
    end object
    Components[5]=SPDestructibleStateComponent0
    Physics=EPhysics.PHYS_Interpolating
    bIgnoreEncroachers=true
    bPushedByEncroachers=false
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=SkeletalMeshComponent0
}