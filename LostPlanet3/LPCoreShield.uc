class LPCoreShield extends LPDStaticMesh
    abstract
    hidecategories(AnimDependency,Navigation);

struct native AttachInfoStruct
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
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Damager[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel AttachInfoStruct AttachInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int Visibility[2097153];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    super(DynamicSMActor).ReplicatedEvent(VarName);
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

    // End:0x95
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
    local /*0x97E50000-0x00000000*/ private @NULL AttachLocation, AttachRotation;

    // End:0x182
    if((MyAkrid != none) && MyAkrid.Mesh != none)
    {
        SetHardAttach(false);
        SetBase(none);
        SetCollisionType(1);
        // End:0xAA
        if(!MyAkrid.Mesh.GetSocketWorldLocationAndRotation(AttachSocket, AttachLocation, AttachRotation))
        {
            return false;
        }
        SetLocation(AttachLocation);
        SetRotation(AttachRotation);
        SetCollisionType(4);
        SetHardAttach(true);
        SetBase(MyAkrid,, MyAkrid.Mesh, AttachSocket);
        // End:0x15A
        if(int(Role) < int(ROLE_Authority))
        {
            MyAkrid.NotifyShieldAttached(self, AttachSocket, ShieldId);
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
        SetCollisionType(4);
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

    super(DynamicSMActor).Attach(Other);
    DLE = DynamicLightEnvironmentComponent(StaticMeshComponent.LightEnvironment);
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
        if(StaticMeshComponent.ShadowParent != none)
        {
            FSM.FracturedStaticMeshComponent.SetShadowParent(StaticMeshComponent.ShadowParent);            
        }
        else
        {
            FSM.FracturedStaticMeshComponent.SetShadowParent(StaticMeshComponent);
        }
        FSM.FracturedStaticMeshComponent.SetLightingChannels(StaticMeshComponent.LightingChannels);
        FSM.FracturedStaticMeshComponent.SetLightEnvironment(StaticMeshComponent.LightEnvironment);
    }
    LPCS = LPCoreShield(Other);
    // End:0x5FF
    if(LPCS != none)
    {
        // End:0x2AC
        if(DLE != none)
        {
            DLE.bSynthesizeSHLight = false;
        }
        LPCS.StaticMeshComponent.SetShadowParent(StaticMeshComponent);
        LPCS.StaticMeshComponent.SetLightingChannels(StaticMeshComponent.LightingChannels);
        LPCS.StaticMeshComponent.SetLightEnvironment(StaticMeshComponent.LightEnvironment);
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
                if(StaticMeshComponent.ShadowParent != none)
                {
                    FSM.FracturedStaticMeshComponent.SetShadowParent(StaticMeshComponent.ShadowParent);                    
                }
                else
                {
                    FSM.FracturedStaticMeshComponent.SetShadowParent(StaticMeshComponent);
                }
                FSM.FracturedStaticMeshComponent.SetLightingChannels(StaticMeshComponent.LightingChannels);
                FSM.FracturedStaticMeshComponent.SetLightEnvironment(StaticMeshComponent.LightEnvironment);
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
    local /*0x97E50000-0x00000000*/ private @NULL LPCS, FSM;

    super(DynamicSMActor).Detach(Other);
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
        MyAkridPawn.RegisterShieldProtectingCore(self, ProtectedCoreIDs[Idx]);
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

    ShieldMatInstances.Length = StaticMeshComponent.GetNumElements();
    I = 0;
    J0x35:

    // End:0xAA [Loop If]
    if(I < ShieldMatInstances.Length)
    {
        MIC = StaticMeshComponent.CreateAndSetMaterialInstanceConstant(I);
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

function SetGlowStrength()
{
    local /*0x97E50000-0x00000000*/ private float val[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x85 [Loop If]
    if(I < ShieldMatInstances.Length)
    {
        // End:0x77
        if(ShieldMatInstances[I] != none)
        {
            ShieldMatInstances[I].SetScalarParameterValue('GlowStrength', val);
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated event Destroyed()
{
    TriggerEventClass(Class'Engine.SeqEvent_Destroyed', Damager);
    RemoveProtection();
    MyAkridPawn.ShieldDestroyed(self);
    ShieldMatInstances.Length = 0;
    super(Actor).Destroyed();
    //return;    
}

simulated event ReceivedNewEvent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Evt[8388609];

    super(Actor).ReceivedNewEvent(Evt);
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
        MyAkridPawn.UnregisterShieldProtectingCore(self, ProtectedCoreIDs[Idx]);
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
    local /*0x97E50000-0x00000000*/ private @NULL localHit, BoneLocation;

    // End:0x263
    if((MyAkridPawn != none) && MyAkridPawn.bShowHitLocationDebugInfo)
    {
        localHit.BoneHitName = MyAkridPawn.Mesh.GetSocketBoneName(AttachInfo.SocketName);
        BoneLocation = MyAkridPawn.Mesh.GetBoneLocation(localHit.BoneHitName);
        localHit.BoneOffsetLoc = HitLocation - BoneLocation;
        localHit.bHitShield = true;
        localHit.bHitCore = false;
        // End:0x238
        if(MyAkridPawn.RecentLocalSpaceHits.Length > MyAkridPawn.TuneDataAIPawn.NumOfLastHitsToShow)
        {
            MyAkridPawn.RecentLocalSpaceHits.Remove(0, MyAkridPawn.RecentLocalSpaceHits.Length - MyAkridPawn.TuneDataAIPawn.NumOfLastHitsToShow);            
        }
        MyAkridPawn.RecentLocalSpaceHits.AddItem(localHit);        
    }
    // End:0x274
    if(!bCanTakeDamage)
    {
        return;
    }
    // End:0x292
    if(MyAkridPawn == none)
    {
        bProcess = true;        
    }
    else
    {
        // End:0x2F3
        if((MyAkridPawn.Controller != none) && MyAkridPawn.Controller == EventInstigator)
        {
            bProcess = false;            
        }
        else
        {
            // End:0x32A
            if((DamageCauser != none) && DamageCauser == MyAkridPawn)
            {
                bProcess = false;                
            }
            else
            {
                // End:0x364
                if(EventInstigator != none)
                {
                    Damager = EventInstigator.Pawn;                    
                }
                else
                {
                    Damager = DamageCauser;
                }
                // End:0x396
                if(ProtectedCoreIDs.Length == 0)
                {
                    bProcess = true;                    
                }
                else
                {
                    Idx = 0;
                    J0x3A1:

                    // End:0x41F [Loop If]
                    if(Idx < ProtectedCoreIDs.Length)
                    {
                        // End:0x411
                        if(!MyAkridPawn.IsDamageFilteredForCore(ProtectedCoreIDs[Idx], DamageType, Damager))
                        {
                            bProcess = true;
                            // [Explicit Break]
                            goto J0x41F;
                        }
                        Idx++;
                        // [Loop Continue]
                        goto J0x3A1;
                    }
                }
            }
        }
    }
    J0x41F:

    // End:0x4B0
    if(bProcess)
    {
        MyAkridPawn.NotifyCoreShieldDamaged(EventInstigator, HitLocation, DamageType, self);
        super(Actor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x97
    if(((MyAkridPawn != none) && Other != MyAkridPawn) && float(MyAkridPawn.Health) > 0.0000000)
    {
        MyAkridPawn.Touch(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x8E
    if(((MyAkridPawn != none) && Other != MyAkridPawn) && float(MyAkridPawn.Health) > 0.0000000)
    {
        MyAkridPawn.Bump(Other, OtherComp, HitNormal);
    }
    //return;    
}

defaultproperties
{
    bCanTakeDamage=true
    Visibility=1
    // Reference: StaticMeshComponent'Default__LPCoreShield.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    KynapseObstacleComponent=none
    // Reference: DynamicLightEnvironmentComponent'Default__LPCoreShield.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    // Reference: SPActorDestructComponent'Default__LPCoreShield.SPActorDestructComponent0'
    begin object name=SPActorDestructComponent0
    end object
    Components[2]=SPActorDestructComponent0
    // Reference: SPDestructibleStateComponent'Default__LPCoreShield.SPDestructibleStateComponent0'
    begin object name=SPDestructibleStateComponent0
    end object
    Components[3]=SPDestructibleStateComponent0
    Physics=EPhysics.PHYS_Interpolating
    bIgnoreEncroachers=true
    bPushedByEncroachers=false
    bShadowParented=false
    DestructComponent=SPActorDestructComponent0
    CollisionComponent=StaticMeshComponent0
}