class SkeletalMeshActor extends Actor
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(SkeletalMeshes);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SavedGuid;
    var(*) /*0x35EA0000-0x00000000*/ private bool bReplicated;
    var(*) /*0x35EA0000-0x00000000*/ private bool bHidden;
    var(*) /*0x35EA0000-0x00000000*/ private bool bSavedPosition;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Rotation;
    var(*) /*0x35EA0000-0x00000000*/ private int VisibilityState;
    var(*) /*0x35EA0000-0x00000000*/ private int DeploymentState;
    var(*) /*0x35EA0000-0x00000000*/ private int DamageTaken;
    var(*) /*0x35EA0000-0x00000000*/ private int Health;
    var(*) /*0x35EA0000-0x00000000*/ private float DeflationAnimStartTime;
    var(*) /*0x35EA0000-0x00000000*/ private int AssociatedTeamIndex;
    var(*) /*0x35EA0000-0x00000000*/ private float CurrentBatteryCapacity;
    var(*) /*0x35EA0000-0x00000000*/ private bool bDelayRecharging;

    structdefaultproperties
    {
        SavedGuid=(A=0,B=0,C=0,D=0)
        bReplicated=false
        bHidden=false
        bSavedPosition=false
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        VisibilityState=0
        DeploymentState=0
        DamageTaken=0
        Health=0
        DeflationAnimStartTime=0.0000000
        AssociatedTeamIndex=0
        CurrentBatteryCapacity=0.0000000
        bDelayRecharging=false
    }
};

struct native SkelMeshActorControlTarget
{
    var(*) /*0x479B0000-0x00000000*/ private name ControlName[65537];
    var(*) /*0x479B0000-0x00000000*/ private @NULL TargetActor[65537];

    structdefaultproperties
    {
        ControlName="None"
        TargetActor=none
    }
};

var(*) /*0x47880000-0x00000000*/ private bool bDamageAppliesImpulse[65537];
var(*) /*0x47880000-0x00000000*/ private bool bShouldDoAnimNotifies[65537];
var(*) /*0x47880000-0x00000000*/ private bool bForceSaveInCheckpoint[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bCollideActors_OldValue;
var(*) /*0x47880000-0x00000000*/ private bool bShouldShadowParentAllAttachedActors[65537];
var(*) /*0x47880000-0x00000400*/ private export @NULL SkeletalMeshComponent[589825];
var(*) /*0x47880000-0x00000400*/ private const export @NULL LightEnvironment[720897];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL FacialAudioComp[524289];
var(*) /*0x35EA0000-0x00000000*/ private travel SkeletalMesh ReplicatedMesh[538968065];
var(*) /*0x35EA0000-0x00000000*/ private travel MaterialInterface ReplicatedMaterial0[2097153];
var(*) /*0x35EA0000-0x00000000*/ private travel MaterialInterface ReplicatedMaterial1[2097153];
var(*) /*0x47880000-0x00000000*/ private editfixedsize array ControlTargets[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array InterpGroupList[536870913];
var(*) /*0x35EA0000-0x00000000*/ private name SavedAnimSeqName[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float SavedCurrentTime[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyGuid;

simulated event PostBeginPlay()
{
    // End:0x4D
    if((int(Role) == int(ROLE_Authority)) && SkeletalMeshComponent != none)
    {
        ReplicatedMesh = SkeletalMeshComponent.SkeletalMesh;
    }
    // End:0x76
    if(bShouldShadowParentAllAttachedActors)
    {
        SetShadowParentOnAllAttachedComponents(SkeletalMeshComponent, LightEnvironment);
    }
    // End:0xE9
    if((SkeletalMeshComponent != none) && SkeletalMeshComponent.PhysicsAssetInstance != none)
    {
        SkeletalMeshComponent.PhysicsAssetInstance.SetFullAnimWeightBonesFixed(false, SkeletalMeshComponent);
    }
    // End:0x116
    if(bHidden)
    {
        SkeletalMeshComponent.SetClothFrozen(true);
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    InterpGroupList.Length = 0;
    UpdateAnimSetList();
    //return;    
}

// Export USkeletalMeshActor::execUpdateAnimSetList(FFrame&, void* const)
native simulated function UpdateAnimSetList();

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x43
    if(VarName == 'ReplicatedMesh')
    {
        SkeletalMeshComponent.SetSkeletalMesh(ReplicatedMesh);        
    }
    else
    {
        // End:0x86
        if(VarName == 'ReplicatedMaterial0')
        {
            SkeletalMeshComponent.SetMaterial(0, ReplicatedMaterial0);            
        }
        else
        {
            // End:0xC9
            if(VarName == 'ReplicatedMaterial1')
            {
                SkeletalMeshComponent.SetMaterial(1, ReplicatedMaterial1);                
            }
            else
            {
                super.ReplicatedEvent(VarName);
            }
        }
    }
    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609], SeqNode;

    SeqNode = AnimNodeSequence(SkeletalMeshComponent.Animations);
    // End:0x257
    if(SeqNode != none)
    {
        // End:0xFF
        if(Action.InputLinks[0].bHasImpulse)
        {
            // End:0xFC
            if(!SeqNode.bPlaying)
            {
                SeqNode.PlayAnim(SeqNode.bLooping, SeqNode.Rate, 0.0000000);
            }            
        }
        else
        {
            // End:0x17A
            if(Action.InputLinks[1].bHasImpulse)
            {
                // End:0x177
                if(SeqNode.bPlaying)
                {
                    SeqNode.StopAnim();
                }                
            }
            else
            {
                // End:0x257
                if(Action.InputLinks[2].bHasImpulse)
                {
                    // End:0x1F6
                    if(SeqNode.bPlaying)
                    {
                        SeqNode.StopAnim();                        
                    }
                    else
                    {
                        SeqNode.PlayAnim(SeqNode.bLooping, SeqNode.Rate, 0.0000000);
                    }
                }
            }
        }
    }
    //return;    
}

function OnSetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    SkeletalMeshComponent.SetMaterial(Action.MaterialIndex, Action.NewMaterial);
    // End:0xB1
    if(Action.MaterialIndex == 0)
    {
        ReplicatedMaterial0 = Action.NewMaterial;
        ForceNetRelevant();
    }
    // End:0x107
    if(Action.MaterialIndex == 1)
    {
        ReplicatedMaterial1 = Action.NewMaterial;
        ForceNetRelevant();
    }
    //return;    
}

simulated event BeginAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];

    MAT_BeginAnimControl(InInterpGroup);
    //return;    
}

// Export USkeletalMeshActor::execMAT_BeginAnimControl(FFrame&, void* const)
native function MAT_BeginAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];


}

simulated event SetAnimPosition()
{
    local /*0x35EA0000-0x00000000*/ private name SlotName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ChannelIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private name InAnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private float InPosition[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFireNotifies[8388609], bLooping, bEnableRootMotion;
    local /*0x35EA0000-0x00000000*/ private @NULL SeqNode;

    SkeletalMeshComponent.LastRenderTime = WorldInfo.TimeSeconds;
    SeqNode = AnimNodeSequence(SkeletalMeshComponent.Animations);
    // End:0x153
    if(SeqNode != none)
    {
        // End:0xF7
        if((SeqNode.AnimSeqName != InAnimSeqName) || SeqNode.AnimSeq == none)
        {
            SeqNode.SetAnim(InAnimSeqName);
        }
        SeqNode.bLooping = bLooping;
        SeqNode.SetPosition(InPosition, bFireNotifies);
    }
    //return;    
}

simulated event FinishAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];

    MAT_FinishAnimControl(InInterpGroup);
    //return;    
}

// Export USkeletalMeshActor::execMAT_FinishAnimControl(FFrame&, void* const)
native function MAT_FinishAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];


}

simulated event PlayActorFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimSet[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string GroupName[8388609], SeqName;
    local /*0x35EA0000-0x00000000*/ private @NULL SoundCueToPlay[8388609], AkEventToPlay, AkCBInfo;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return SkeletalMeshComponent.PlayFaceFXAnim(AnimSet, SeqName, GroupName, SoundCueToPlay, AkEventToPlay, AkCBInfo);
    //return ReturnValue;    
}

simulated event StopActorFaceFXAnim()
{
    SkeletalMeshComponent.StopFaceFXAnim();
    //return;    
}

simulated event @NULL GetFaceFXAudioComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];

    return FacialAudioComp;
    //return ReturnValue;    
}

simulated function OnPlayFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609], PC;

    SkeletalMeshComponent.PlayFaceFXAnim(inAction.FaceFXAnimSetRef, inAction.FaceFXAnimName, inAction.FaceFXGroupName, inAction.SoundCueToPlay, inAction.AkEventToPlay);
    // End:0x1CE
    foreach WorldInfo.AllControllers(Class'PlayerController', PC)
    {
        // End:0x1CD
        if(NetConnection(PC.Player) != none)
        {
            PC.ClientPlayActorFaceFXAnim(self, inAction.FaceFXAnimSetRef, inAction.FaceFXGroupName, inAction.FaceFXAnimName, inAction.SoundCueToPlay, inAction.AkEventToPlay);
        }        
    }    
    //return;    
}

simulated event GetActorFaceFXAsset()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x81
    if((SkeletalMeshComponent.SkeletalMesh != none) && !SkeletalMeshComponent.bDisableFaceFX)
    {
        return SkeletalMeshComponent.SkeletalMesh.FaceFXAsset;        
    }
    else
    {
        return none;
    }
    //return ReturnValue;    
}

simulated function IsActorPlayingFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return (SkeletalMeshComponent != none) && SkeletalMeshComponent.IsPlayingFaceFXAnim();
    //return ReturnValue;    
}

event OnSetMesh()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0xF6
    if(int(Action.MeshType) == int(1))
    {
        // End:0xF6
        if((Action.NewSkeletalMesh != none) && Action.NewSkeletalMesh != SkeletalMeshComponent.SkeletalMesh)
        {
            SkeletalMeshComponent.SetSkeletalMesh(Action.NewSkeletalMesh);
            ReplicatedMesh = Action.NewSkeletalMesh;
        }
    }
    //return;    
}

simulated event OnUpdatePhysBonesFromAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x99
    if(Action.InputLinks[0].bHasImpulse)
    {
        SkeletalMeshComponent.ForceSkelUpdate();
        SkeletalMeshComponent.UpdateRBBonesFromSpaceBases(true, true);
        SkeletalMeshComponent.ForceApexClothingTeleportAndReset();        
    }
    else
    {
        // End:0x12C
        if(Action.InputLinks[1].bHasImpulse)
        {
            // End:0x129
            if(SkeletalMeshComponent.PhysicsAssetInstance != none)
            {
                SkeletalMeshComponent.PhysicsAssetInstance.SetAllBodiesFixed(true);
            }            
        }
        else
        {
            // End:0x1C6
            if(Action.InputLinks[2].bHasImpulse)
            {
                // End:0x1C6
                if(SkeletalMeshComponent.PhysicsAssetInstance != none)
                {
                    SkeletalMeshComponent.PhysicsAssetInstance.SetFullAnimWeightBonesFixed(false, SkeletalMeshComponent);
                }
            }
        }
    }
    //return;    
}

simulated event OnSetSkelControlTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x55
    if((Action.SkelControlName == 'None') || Action.TargetActors.Length == 0)
    {
        return;
    }
    I = 0;
    J0x60:

    // End:0x141 [Loop If]
    if(I < ControlTargets.Length)
    {
        // End:0x133
        if(ControlTargets[I].ControlName == Action.SkelControlName)
        {
            ControlTargets[I].TargetActor = Actor(Action.TargetActors[Rand(Action.TargetActors.Length)]);
            return;
        }
        I++;
        // [Loop Continue]
        goto J0x60;
    }
    ControlTargets.Length = ControlTargets.Length + 1;
    ControlTargets[ControlTargets.Length - 1].ControlName = Action.SkelControlName;
    ControlTargets[ControlTargets.Length - 1].TargetActor = Actor(Action.TargetActors[Rand(Action.TargetActors.Length)]);
    //return;    
}

function DoKismetAttachment()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Attachment[8388609], Action;
    local /*0x35EA0000-0x00000000*/ private bool bOldCollideActors, bOldBlockActors, bValidBone, bValidSocket;

    // End:0xF7
    if((SkeletalMeshComponent != none) && Action.BoneName != 'None')
    {
        bValidSocket = SkeletalMeshComponent.GetSocketByName(Action.BoneName) != none;
        bValidBone = SkeletalMeshComponent.MatchRefBone(Action.BoneName) != -1;
        // End:0xF7
        if(!bValidBone && !bValidSocket)
        {
        }
    }
    // End:0x44F
    if(bValidBone || bValidSocket)
    {
        bOldCollideActors = Attachment.bCollideActors;
        bOldBlockActors = Attachment.bBlockActors;
        Attachment.SetCollision(false, false);
        Attachment.SetHardAttach(Action.bHardAttach);
        // End:0x2DF
        if(bValidBone && !bValidSocket)
        {
            // End:0x256
            if(Action.bUseRelativeOffset)
            {
                Attachment.SetLocation(SkeletalMeshComponent.GetBoneLocation(Action.BoneName));
            }
            // End:0x2DF
            if(Action.bUseRelativeRotation)
            {
                Attachment.SetRotation(QuatToRotator(SkeletalMeshComponent.GetBoneQuaternion(Action.BoneName)));
            }
        }
        Attachment.SetBase(self,, SkeletalMeshComponent, Action.BoneName);
        // End:0x3A0
        if(Action.bUseRelativeRotation)
        {
            Attachment.SetRelativeRotation(Attachment.RelativeRotation + Action.RelativeRotation);
        }
        // End:0x41F
        if(Action.bUseRelativeOffset)
        {
            Attachment.SetRelativeLocation(Attachment.RelativeLocation + Action.RelativeOffset);
        }
        Attachment.SetCollision(bOldCollideActors, bOldBlockActors);        
    }
    else
    {
        super.DoKismetAttachment(Attachment, Action);
    }
    //return;    
}

event TakeDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser, ApplyImpulse;

    super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    // End:0x14F
    if(bDamageAppliesImpulse && DamageType.default.KDamageImpulse > float(0))
    {
        // End:0x97
        if(VSize(Momentum) < 0.0010000)
        {
            return;
        }
        ApplyImpulse = Normal(Momentum) * DamageType.default.KDamageImpulse;
        // End:0x14F
        if(HitInfo.HitComponent != none)
        {
            HitInfo.HitComponent.AddImpulse(ApplyImpulse, HitLocation, HitInfo.BoneName);
        }
    }
    //return;    
}

function ShouldSaveForCheckpoint()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return ((int(RemoteRole) != int(ROLE_None)) || bForceSaveInCheckpoint) || IsInPersistentLevel(true);
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25165825];

    Record.SavedGuid = MyGuid;
    Record.bReplicated = int(RemoteRole) != int(ROLE_None);
    Record.bHidden = bHidden;
    // End:0x105
    if(bForceSaveInCheckpoint || IsInPersistentLevel(true))
    {
        Record.bSavedPosition = true;
        Record.Location = Location;
        Record.Rotation = Rotation;
    }
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897];

    SetHidden(Record.bHidden);
    // End:0x8C
    if(Record.bSavedPosition)
    {
        SetLocation(Record.Location);
        SetRotation(Record.Rotation);
    }
    // End:0xF3
    if(Record.bReplicated)
    {
        ForceNetRelevant();
        // End:0xF3
        if(int(RemoteRole) != int(ROLE_None))
        {
            SetForcedInitialReplicatedProperty(BoolProperty'Actor.bHidden', bHidden == default.bHidden);
        }
    }
    //return;    
}

event @NULL PlayParticleEffect()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNotifyData[8519681];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Loc, Rot, PSC;
    local /*0x35EA0000-0x00000000*/ private bool bPlayNonExtreme;

    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        return true;
    }
    bPlayNonExtreme = (AnimNotifyData.bIsExtremeContent == true) && WorldInfo.GRI.ShouldShowGore() == false;
    // End:0xDB
    if((bShouldDoAnimNotifies == false) || bPlayNonExtreme && AnimNotifyData.PSNonExtremeContentTemplate == none)
    {
        return true;
    }
    // End:0x303
    if(AnimNotifyData.bAttach == true)
    {
        PSC = new (self) Class'ParticleSystemComponent';
        PSC.SecondsBeforeInactive = 0.0000000;
        // End:0x189
        if(bPlayNonExtreme)
        {
            PSC.SetTemplate(AnimNotifyData.PSNonExtremeContentTemplate);            
        }
        else
        {
            PSC.SetTemplate(AnimNotifyData.PSTemplate);
        }
        // End:0x23B
        if(AnimNotifyData.SocketName != 'None')
        {
            SkeletalMeshComponent.AttachComponentToSocket(PSC, AnimNotifyData.SocketName);            
        }
        else
        {
            // End:0x2B0
            if(AnimNotifyData.BoneName != 'None')
            {
                SkeletalMeshComponent.AttachComponent(PSC, AnimNotifyData.BoneName);
            }
        }
        PSC.ActivateSystem();
        PSC.__OnSystemFinished__Delegate = SkelMeshActorOnParticleSystemFinished;        
    }
    else
    {
        // End:0x382
        if(AnimNotifyData.SocketName != 'None')
        {
            SkeletalMeshComponent.GetSocketWorldLocationAndRotation(AnimNotifyData.SocketName, Loc, Rot);            
        }
        else
        {
            // End:0x44B
            if(AnimNotifyData.BoneName != 'None')
            {
                Loc = SkeletalMeshComponent.GetBoneLocation(AnimNotifyData.BoneName);
                Rot = QuatToRotator(SkeletalMeshComponent.GetBoneQuaternion(AnimNotifyData.BoneName));                
            }
            else
            {
                Loc = Location;
                Rot = rot(0, 0, 1);
            }
        }
        PSC = WorldInfo.MyEmitterPool.SpawnEmitter(AnimNotifyData.PSTemplate, Loc, Rot);
    }
    // End:0x562
    if((PSC != none) && AnimNotifyData.BoneSocketModuleActorName != 'None')
    {
        PSC.SetActorParameter(AnimNotifyData.BoneSocketModuleActorName, self);
    }
    return true;
    //return ReturnValue;    
}

simulated function @NULL SkelMeshActorOnParticleSystemFinished()
{
    local /*0x35EA0000-0x00000400*/ private @NULL PSC[8388609];

    SkeletalMeshComponent.DetachComponent(PSC);
    //return;    
}

event @NULL CreateForceField()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimNotifyData[8519681];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000400*/ private @NULL NewForceFieldComponent;

    NewForceFieldComponent = new (SkeletalMeshComponent) AnimNotifyData.ForceFieldComponent.Class (AnimNotifyData.ForceFieldComponent);
    NewForceFieldComponent.DoInitRBPhys();
    // End:0xFB
    if(AnimNotifyData.SocketName != 'None')
    {
        SkeletalMeshComponent.AttachComponentToSocket(NewForceFieldComponent, AnimNotifyData.SocketName);        
    }
    else
    {
        // End:0x170
        if(AnimNotifyData.BoneName != 'None')
        {
            SkeletalMeshComponent.AttachComponent(NewForceFieldComponent, AnimNotifyData.BoneName);
        }
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    bShouldDoAnimNotifies=true
    // Reference: SkeletalMeshComponent'Default__SkeletalMeshActor.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0 class=Class'SkeletalMeshComponent'
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__SkeletalMeshActor.MyLightEnvironment'
    begin object name=MyLightEnvironment class=Class'DynamicLightEnvironmentComponent'
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__SkeletalMeshActor.FaceAudioComponent'
    begin object name=FaceAudioComponent class=Class'AudioComponent'
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    bNoDelete=true
    bProjTarget=true
    bNoEncroachCheck=true
    bEdShouldSnap=true
    CollisionComponent=SkeletalMeshComponent0
}