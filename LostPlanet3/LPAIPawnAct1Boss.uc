class LPAIPawnAct1Boss extends LPAIPawnAkrid
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum EAct1BossGrabPoints
{
    ebgpTongue,                     // 0
    ebgpWinch,                      // 1
    EAct1BossGrabPoints_MAX         // 2
};

enum EAct1BossWinchPoints
{
    EA1BWP_Tongue,                  // 0
    EA1BWP_MAX                      // 1
};

enum EAct1BossPhase
{
    ebpIdleOnly,                    // 0
    ebpWeatherStation,              // 1
    ebpDeprecated,                  // 2
    ebpControlRoom,                 // 3
    ebpLightningRods,               // 4
    ebpFinalFight,                  // 5
    ebpNotApplicable,               // 6
    EAct1BossPhase_MAX              // 7
};

struct native ShellInfo
{
    var(0.25_Pct) /*0xB7960000-0x00000000*/ private @NULL Mesh[65537];
    var(0.25_Pct) /*0xB7960000-0x00000000*/ private bool bUseOwnLighting[65537];
    var(0.25_Pct) /*0xB7960000-0x00000000*/ private @NULL LightingOverride[65537];
    var(0.25_Pct) /*0xB7960000-0x00000000*/ private @NULL Properties[65537];
    var(0.25_Pct) /*0xB7960000-0x00000000*/ private int HitPoints[65537];
    var(0.25_Pct) /*0xB7960000-0x00000000*/ private name AttachToSocket[65537];
    var(0.25_Pct) /*0xB7960000-0x00000000*/ private bool bDestroyForNextPhase[65537];

    structdefaultproperties
    {
        Mesh=none
        bUseOwnLighting=false
        LightingOverride=(bCastShadow=EBooleanOverride.EBO_NOOVERRIDE,bCastDynamicShadow=EBooleanOverride.EBO_NOOVERRIDE,bAcceptsLights=EBooleanOverride.EBO_NOOVERRIDE,bAcceptsDynamicLights=EBooleanOverride.EBO_NOOVERRIDE,bUsePrecomputedShadows=EBooleanOverride.EBO_NOOVERRIDE,LightingChannels=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,LightChannels=(bInitialized=false,BSP=false,Static=false,Dynamic=false,CompositeDynamic=false,Skybox=false,SPBackground=false,GeneratedMeshAreaLight=false,Unnamed_1=false,Unnamed_2=false,Unnamed_3=false,Unnamed_4=false,Unnamed_5=false,Unnamed_6=false,Cinematic_1=false,Cinematic_2=false,Cinematic_3=false,Cinematic_4=false,Cinematic_5=false,Cinematic_6=false,Cinematic_7=false,Cinematic_8=false,Cinematic_9=false,Cinematic_10=false,Gameplay_1=false,Gameplay_2=false,Gameplay_3=false,Gameplay_4=false,Crowd=false)),DynamicLightEnvironmentOverride=(bEnabled=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bForceNonCompositeDynamicLights=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=false),InvisibleUpdateTime=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=5.0000000),MinTimeBetweenFullUpdates=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=1.0000000),NumVolumeVisibilitySamples=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=1),AmbientShadowColor=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.0010000,G=0.0010000,B=0.0010000,A=1.0000000)),AmbientShadowSourceDirection=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(X=0.0100000,Y=0.0000000,Z=0.9900000)),AmbientGlow=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)),LightDesaturation=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=0.0000000),LightDistance=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=10.0000000),ShadowDistance=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=5.0000000),bCastShadows=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bCompositeShadowsFromDynamicLights=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),ModShadowFadeoutTime=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=0.7500000),ModShadowFadeoutExponent=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=3.0000000),MaxModulatedShadowColor=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.5000000,G=0.5000000,B=0.5000000,A=1.0000000)),bDynamic=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bSynthesizeDirectionalLight=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bSynthesizeSHLight=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),MinShadowAngle=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=35.0000000),bRequiresNonLatentUpdates=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=false)))
        Properties=none
        HitPoints=0
        AttachToSocket="None"
        bDestroyForNextPhase=false
    }
};

struct BossSpawnInfo
{
    var(0.25_Pct) /*0x14F30000-0x00000000*/ private byte Phase[65537];
    var(0.25_Pct) /*0x14F30000-0x00000000*/ private @NULL BossTrans[65537];
    var(0.25_Pct) /*0x14F30000-0x00000000*/ private @NULL BossRotation[65537];
    var(0.25_Pct) /*0x14F30000-0x00000000*/ private editfixedsize array Shells[65537];
    var(0.25_Pct) /*0x14F30000-0x00000000*/ private editfixedsize array ShellsNoDamage[65537];

    structdefaultproperties
    {
        Phase=EAct1BossPhase.ebpIdleOnly
        BossTrans=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        BossRotation=(Pitch=0,Yaw=0,Roll=0)
        Shells=none
        ShellsNoDamage=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataBoss[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte Phase;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_Hit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TetherLoc;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TetherVel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBirthLeeches;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseSpawnOffset;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsWinched;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bApplyIntroDamageFilter[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpawnOffset;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name LeechTubeNames[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LeechTubeIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TubeLeftGlowFactorActual;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TubeLeftGlowFactorDesired;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TubeLeftGlowFactorRampRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TubeRightGlowFactorActual;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TubeRightGlowFactorDesired;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TubeRightGlowFactorRampRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BodyGlowFactorActual;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BodyGlowFactorDesired;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BodyGlowFactorRampRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AttachedShells;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AttachedNoDamageShells;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IntroDamageFilter[536870913];

// Export ULPAIPawnAct1Boss::execGetCoreDamageFactor(FFrame&, void* const)
native simulated function GetCoreDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnAct1Boss::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnAct1Boss::execSetupShellLighting(FFrame&, void* const)
native function SetupShellLighting()
{
    local /*0x97E50000-0x00000000*/ private @NULL InShellActor[8388609], InLighting;


}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL P;

    super(LPAIPawn).PostBeginPlay();
    // End:0x68
    foreach WorldInfo.AllPawns(Class'LPAIPawnAct1Boss', P)
    {
        // End:0x67
        if(P != self)
        {
            P.Destroy();
        }        
    }    
    InitPhase();
    SetPhysics(0);
    // End:0xBC
    if(Mesh != none)
    {
        Mesh.PhysicsAssetInstance.SetAllBodiesFixed(true);
    }
    // End:0xE0
    if(bUseSpawnOffset)
    {
        SetLocation(Location + SpawnOffset);
    }
    //return;    
}

function TongueCollisionOff()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Body;

    I = 0;
    J0x0B:

    // End:0x160 [Loop If]
    if(I < Mesh.PhysicsAsset.BodySetup.Length)
    {
        // End:0x152
        if(Mesh.BoneIsChildOf(Mesh.PhysicsAsset.BodySetup[I].BoneName, 'JO_Tongue_A'))
        {
            Body = Mesh.PhysicsAssetInstance.Bodies[I];
            Body.SetBlockRigidBody(false);
            Body.bBlockNonZeroExtent = false;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function TongueCollisionOn()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Body;

    I = 0;
    J0x0B:

    // End:0x160 [Loop If]
    if(I < Mesh.PhysicsAsset.BodySetup.Length)
    {
        // End:0x152
        if(Mesh.BoneIsChildOf(Mesh.PhysicsAsset.BodySetup[I].BoneName, 'JO_Tongue_A'))
        {
            Body = Mesh.PhysicsAssetInstance.Bodies[I];
            Body.SetBlockRigidBody(true);
            Body.bBlockNonZeroExtent = true;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function SetMovementPhysics()
{
    SetPhysics(0);
    //return;    
}

function SetDyingPhysics()
{
    SetPhysics(0);
    //return;    
}

simulated event CanUseFloorConforming()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super(SPPawn).GetAnimTemplateTreeForSpecialMove(SpecialMove);
    // End:0x36
    if(MyAnimTree != none)
    {
        return MyAnimTree;
    }
    return AttackAnimTree;
    //return ReturnValue;    
}

simulated function InitAnimTemplates()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array MoveNames, MoveNodes;

    // End:0x7D
    if(HitReactLogicAnimTree != none)
    {
        MoveNames.AddItem('HitReact');        
        HitReactLogicAnimTree.FindAnimNodes(MoveNames, MoveNodes, Class'LPAnimNodeTemplateLogicNamedRoot');
        AnimTemplateLogic_Hit = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[0]);
    }
    super(LPPawn).InitAnimTemplates();
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataBoss = LPTuneDataAct1Boss(TuneData);
    super.InitTuneData(TuneData);
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFacingTether, bMovingTowards;
    local /*0x97E50000-0x00000000*/ private @NULL NewLocation;

    // End:0x27
    if(bHidden && IsInMatinee())
    {
        hide(false);
    }
    super(LPPawn).Tick(DeltaTime);
    // End:0x163
    if(int(Phase) == int(5))
    {
        // End:0x13F
        if(bIsWinched)
        {
            NewLocation = Location + ((Velocity * vect(1.0000000, 1.0000000, 0.0000000)) * DeltaTime);
            bFacingTether = (Vector(Rotation) Dot (TetherLoc - Location)) > 0.0000000;
            bMovingTowards = ((NewLocation - Location) Dot (TetherLoc - Location)) > 0.0000000;
            // End:0x13C
            if(!bFacingTether || bFacingTether && bMovingTowards)
            {
                SetLocation(NewLocation);
            }            
        }
        else
        {
            // End:0x163
            if(!IsZero(TetherLoc))
            {
                MyMove(TetherLoc);
            }
        }
    }
    //return;    
}

simulated function AttachShell()
{
    local /*0x97E50000-0x00000000*/ private @NULL shellInf[8388609];
    local /*0x97E50000-0x00000000*/ private bool inAllowDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL shellObj;

    // End:0xB6
    if((((shellInf.Mesh == none) || inAllowDamage && shellInf.HitPoints <= 0) || inAllowDamage && shellInf.Properties == none) || shellInf.AttachToSocket == 'None')
    {
        return;
    }
    shellObj = Spawn(Class'LPAct1BossShell',,, Location, Rotation,, true);
    // End:0xFB
    if(shellObj == none)
    {
        return;
    }
    shellObj.SetStaticMesh(shellInf.Mesh);
    shellObj.SetDestructibleProperties(shellInf.Properties);
    shellObj.DamageStateComponent.Init();
    // End:0x1FE
    if(!shellInf.bUseOwnLighting)
    {
        SetupShellLighting(shellObj, SpawnedFromActorFactory.LightingOverride);        
    }
    else
    {
        SetupShellLighting(shellObj, shellInf.LightingOverride);
    }
    // End:0x289
    if(!shellObj.AttachToPawn(self, shellInf.AttachToSocket))
    {
        shellObj.Destroy();
        return;
    }
    // End:0x379
    if(inAllowDamage)
    {
        shellObj.MyActorDestructComponent.HitPoints = shellInf.HitPoints;
        shellObj.HitPointsMax = float(shellInf.HitPoints);
        shellObj.bDestroyForNextPhase = shellInf.bDestroyForNextPhase;
        AttachedShells.AddItem(shellObj);                
    }
    else
    {
        shellObj.bCanTakeDamage = false;
        shellObj.MyActorDestructComponent.HitPoints = 1;
        shellObj.HitPointsMax = 1.0000000;
        AttachedNoDamageShells.AddItem(shellObj);        
    }
    SetCollisionOnCoreBodies(false, 0);
    //return;    
}

simulated function NotifyShieldAttached()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;

    super(LPAIPawn).NotifyShieldAttached(Shield, AttachSocket, ShieldId);
    // End:0x56
    if(!ClassIsChildOf(Shield.Class, Class'LPAct1BossShell'))
    {
        return;
    }
    // End:0x9A
    if(Shield.bCanTakeDamage)
    {
        AttachedShells.AddItem(LPAct1BossShell(Shield));                
    }
    else
    {
        AttachedNoDamageShells.AddItem(LPAct1BossShell(Shield));        
    }
    //return;    
}

simulated function ShieldDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;

    super(LPAIPawn).ShieldDestroyed(Shield);
    // End:0x3E
    if(int(Phase) == int(4))
    {
        TriggerEventClass(Class'LPSeqEvent_CoreExposed', self);
    }
    // End:0xF3
    if(Shield.bCanTakeDamage)
    {
        Idx = AttachedShells.Find(Shield);        
        // End:0xA4
        if(Idx >= 0)
        {
            AttachedShells.Remove(Idx, 1);            
        }
        // End:0xF0
        if(LPAct1BossShell(Shield).bDestroyForNextPhase && int(Phase) != int(6))
        {
            KismetNotifyCoreDestroyed();
        }        
    }
    else
    {
        Idx = AttachedNoDamageShells.Find(Shield);        
        // End:0x137
        if(Idx >= 0)
        {
            AttachedNoDamageShells.Remove(Idx, 1);            
        }
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    DestroyShields();
    //return;    
}

simulated function DestroyShields()
{
    J0x00:
    // End:0x2D [Loop If]
    if(AttachedShells.Length > 0)
    {
        AttachedShells[0].Destroy();
        // [Loop Continue]
        goto J0x00;
    }
    J0x2D:

    // End:0x5A [Loop If]
    if(AttachedNoDamageShells.Length > 0)
    {
        AttachedNoDamageShells[0].Destroy();
        // [Loop Continue]
        goto J0x2D;
    }
    AttachedShells.Length = 0;
    AttachedNoDamageShells.Length = 0;
    //return;    
}

function hide()
{
    local /*0x97E50000-0x00000000*/ private bool inHide[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL shellObj;

    // End:0x41
    foreach AttachedShells(shellObj)
    {
        shellObj.SetHidden(inHide);        
    }    
    // End:0x83
    foreach AttachedNoDamageShells(shellObj)
    {
        shellObj.SetHidden(inHide);        
    }    
    SetHidden(inHide);
    //return;    
}

simulated function KismetNotifyCoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private bool bAll[9437185];

    false
    TriggerEventClass(Class'LPSeqEvent_Act1BossCoreDestroyed', self, 0);
    TriggerEventClass(Class'LPSeqEvent_Act1BossCoreDestroyed', self, int(Phase));
    //return;    
}

simulated function NumCoresDestroyed()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I, Index, CoresDestroyed;

    I = 0;
    J0x0B:

    // End:0x7E [Loop If]
    if(I < 1)
    {
        Index = GetCoreIndexForThisCoreId(I);
        // End:0x70
        if(MyCoreData[Index].Health < float(1))
        {
            CoresDestroyed++;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return CoresDestroyed;
    //return ReturnValue;    
}

simulated function PlayDying()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    LPAIControllerAct1Boss(Controller).AllArmsPlaySpecialMove(Class'LPSM_Act1BossArmDescend');
    super(LPPawn).PlayDying(DamageType, HitLoc);
    //return;    
}

simulated function GetTimeBetweenAttacks()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return TuneDataBoss.MinTimeBetweenAttacks.GetValue();
    //return ReturnValue;    
}

simulated function GetTimeBetweenAttacksVS()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return TuneDataBoss.MinTimeBetweenAttacks.GetValue();
    //return ReturnValue;    
}

simulated function GetTimeBetweenLeechSpawns()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return TuneDataBoss.LeechSpawnDelay.GetValue();
    //return ReturnValue;    
}

simulated function GetFollowingDelay()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return TuneDataBoss.FollowingDelay.GetValue();
    //return ReturnValue;    
}

event HandleNotifyPlayerDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private byte AttackType[8388609], DodgePhase;
    local /*0x97E50000-0x00000000*/ private @NULL InEnemyToNotify[8388609];

    super(LPAIPawn).HandleNotifyPlayerDodgeWindow(AttackType, DodgePhase, InEnemyToNotify);
    // End:0x52
    if((GetFollowingDelay()) > float(0))
    {
        SetTimer(GetFollowingDelay(), false, 'StopFollowingEnemy');        
    }
    else
    {
        StopFollowingEnemy();
    }
    //return;    
}

function StopFollowingEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIC;

    AIC = LPAIControllerAct1Boss(Controller);
    // End:0x4A
    if(AIC != none)
    {
        AIC.StopFollowingEnemy();
    }
    //return;    
}

function MyMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dest[8388609], Dir;
    local /*0x97E50000-0x00000000*/ private float Dist;

    Dir = Dest - Location;
    // End:0x44
    if(!IsZero(Dir))
    {
        Dist = VSize(Dir);
    }
    // End:0x9C
    if(Dist > float(150))
    {
        Dir = Dir / Dist;
        Acceleration = (Dir * AccelRate) * 0.1000000;        
    }
    else
    {
        Acceleration = Velocity * -0.1000000;
    }
    Velocity += Acceleration;
    // End:0x103
    if(VSize(Velocity) > TetherVel)
    {
        Velocity = Normal(Velocity) * TetherVel;
    }
    SetLocation(Location + Velocity);
    //return;    
}

simulated function SpawnLeechSack()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL projLoc, projDir, fireVel, projRot;
    local /*0x97E50000-0x00000000*/ private bool bFireSolutionPossible;
    local /*0x97E50000-0x00000000*/ private @NULL SpawnedProjectile;

    bFireSolutionPossible = false;
    // End:0x1D7
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        GetLobProjectileFirePositionAndRotation(projLoc, projDir, projRot);
        SpawnedProjectile = Spawn(LobFireProjtileClass, self,, projLoc, rot(0, 0, 0));
        // End:0x1D7
        if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
        {
            projDir = Normal(Dest - projLoc);
            SpawnedProjectile.Init(projDir);
            bFireSolutionPossible = FindTossVelocity(fireVel, Dest, projLoc, 3000.0000000, 500.0000000, 5000.0000000, 0.0000000, 0.0000000,,, WorldInfo.WorldGravityZ * SpawnedProjectile.CustomGravityScale, true, vect(0.0000000, 0.0000000, 0.0000000),, true, false, -1);
            SpawnedProjectile.Velocity = fireVel;
        }
    }
    return bFireSolutionPossible;
    //return ReturnValue;    
}

simulated function GetLobProjectileFirePositionAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ProjLoc[25165825], out_ProjDir, out_ProjRot;

    LeechTubeIndex = 1 - LeechTubeIndex;
    Mesh.GetSocketWorldLocationAndRotation(LeechTubeNames[LeechTubeIndex], out_ProjLoc, out_ProjRot);
    out_ProjDir = Vector(out_ProjRot);
    //return;    
}

function OnAct1BossMoreLeeches()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x40
    if(Controller != none)
    {
        LPAIControllerAct1Boss(Controller).OnAct1BossMoreLeeches(inAction);
    }
    //return;    
}

function OnAct1BossExitLeechWait()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x40
    if(Controller != none)
    {
        LPAIControllerAct1Boss(Controller).OnAct1BossExitLeechWait(inAction);
    }
    //return;    
}

function OnAct1BossForceAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x40
    if(Controller != none)
    {
        LPAIControllerAct1Boss(Controller).OnAct1BossForceAction(inAction);
    }
    //return;    
}

function OnAct1BossApplyDamageFilter()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x6E
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bApplyIntroDamageFilter = true;
        IntroDamageFilter = inAction.DamageMultiplier;        
    }
    else
    {
        // End:0xB1
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bApplyIntroDamageFilter = false;
        }
    }
    //return;    
}

function NotifySpawnLeeches()
{
    // End:0x37
    if(Controller != none)
    {
        LPAIControllerAct1Boss(Controller).NotifySpawnLeeches();
    }
    //return;    
}

function NotifyPlayerStumble()
{
    // End:0x37
    if(Controller != none)
    {
        LPAIControllerAct1Boss(Controller).NotifyPlayerStumble();
    }
    //return;    
}

function SetPhase()
{
    local /*0x97E50000-0x00000000*/ private byte a_Phase[8388609];

    // End:0x38
    if(int(Phase) != int(a_Phase))
    {
        Phase = a_Phase;
        InitPhase();
    }
    //return;    
}

function InitPhase()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    DestroyShields();
    EnableAllCores();
    Idx = 0;
    J0x1F:

    // End:0x59 [Loop If]
    if(Idx < WinchPoints.Length)
    {
        SetWinchPointEnabledByIndex(Idx, false);
        ++Idx;
        // [Loop Continue]
        goto J0x1F;
    }
    //return;    
}

event PostOverride()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL SInfo, shellInf;

    // End:0x149
    foreach TuneDataBoss.BossSpawnList(SInfo)
    {
        // End:0x148
        if(int(SInfo.Phase) == int(Phase))
        {
            TetherLoc = SInfo.BossTrans;
            SetLocation(SInfo.BossTrans);
            SetRotation(SInfo.BossRotation);
            // End:0x104
            foreach SInfo.Shells(shellInf)
            {
                AttachShell(shellInf, true);                
            }            
            // End:0x144
            foreach SInfo.ShellsNoDamage(shellInf)
            {
                AttachShell(shellInf, false);                
            }                        
        }
        else
        {            
        }
    }    
    //return;    
}

function DestroyCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609];

    // End:0x67
    if((GetCoreDamageFactor(CoreID)) < 1.0000000)
    {
        MyCoreData[GetCoreIndexForThisCoreId(CoreID)].Health = 0.0000000;
        SetGrabPointEnabledByCoreID(CoreID, false);
    }
    //return;    
}

function GetPressureDepletionRate()
{
    local /*0x97E50000-0x00000000*/ private @NULL inHoldSM[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return super(LPAIPawn).GetPressureDepletionRate(inHoldSM) / TuneDataBoss.VSHoldTimeScaler.GetValue();
    //return ReturnValue;    
}

function EnableAllCores()
{
    // End:0x20
    if(int(Phase) == int(5))
    {
        EnableCoreById(0, true);
    }
    //return;    
}

function Died()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAIPawn).Died(Killer, DamageType, HitLocation);
    //return ReturnValue;    
}

simulated function PlayTakeDamageEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPhysMat, TagCore;

    LPPhysMat = LPPhysicalMaterial(TakeDamageParams.HitInfo.PhysMaterial);
    // End:0x8C
    if(LPPhysMat != none)
    {
        TagCore = LPPhysMatPropTag_CoreId(LPPhysMat.GetTag(Class'LPPhysMatPropTag_CoreId'));
    }
    // End:0xD9
    if((IsValidCoreTagType(TagCore)) && LPAIControllerAct1Boss(Controller).bCoresVulnerable)
    {
        super(LPPawn).PlayTakeDamageEffects();
    }
    //return;    
}

function NotifyCoreShieldDamaged()
{
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitShield[8388609];

    // End:0x2E
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeDNATag'))
    {
        ConditionalAttachDNATag(HitLocation);        
    }
    else
    {
        TriggerEventClass(Class'LPSeqEvent_Act1BossShellDamaged', EventInstigator);
    }
    super(LPAIPawn).NotifyCoreShieldDamaged(EventInstigator, HitLocation, DamageType, HitShield);
    //return;    
}

simulated event HandleAnimNotifyAct1BossWinch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];

    SetWinchPointEnabledByIndex(0, Notify.bWinchEnabled);
    //return;    
}

simulated function GetCore1DamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetCoreDamageFactor(0);
    //return ReturnValue;    
}

simulated event HandleAnimNotifyGlow()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609], NotifyBoss;

    super(LPPawn).HandleAnimNotifyGlow(Notify);
    NotifyBoss = LPAnimNotify_GlowBoss(Notify);
    // End:0x40
    if(NotifyBoss == none)
    {
        return;
    }
    // End:0xE4
    if((int(NotifyBoss.GlowPart) == int(0)) || int(NotifyBoss.GlowPart) == int(2))
    {
        TubeLeftGlowFactorDesired = NotifyBoss.GlowFactor;
        TubeLeftGlowFactorRampRate = NotifyBoss.GlowRampRate;
    }
    // End:0x188
    if((int(NotifyBoss.GlowPart) == int(1)) || int(NotifyBoss.GlowPart) == int(2))
    {
        TubeRightGlowFactorDesired = NotifyBoss.GlowFactor;
        TubeRightGlowFactorRampRate = NotifyBoss.GlowRampRate;
    }
    // End:0x201
    if(int(NotifyBoss.GlowPart) == int(3))
    {
        BodyGlowFactorDesired = NotifyBoss.GlowFactor;
        BodyGlowFactorRampRate = NotifyBoss.GlowRampRate;
    }
    // End:0x225
    if(TubeLeftGlowFactorDesired < float(0))
    {
        TubeLeftGlowFactorDesired = default.TubeLeftGlowFactorDesired;
    }
    // End:0x249
    if(TubeLeftGlowFactorRampRate <= float(0))
    {
        TubeLeftGlowFactorRampRate = default.TubeLeftGlowFactorRampRate;
    }
    // End:0x26D
    if(TubeRightGlowFactorDesired < float(0))
    {
        TubeRightGlowFactorDesired = default.TubeRightGlowFactorDesired;
    }
    // End:0x291
    if(TubeRightGlowFactorRampRate <= float(0))
    {
        TubeRightGlowFactorRampRate = default.TubeRightGlowFactorRampRate;
    }
    // End:0x2B5
    if(BodyGlowFactorDesired < float(0))
    {
        BodyGlowFactorDesired = default.BodyGlowFactorDesired;
    }
    // End:0x2D9
    if(BodyGlowFactorRampRate <= float(0))
    {
        BodyGlowFactorRampRate = default.BodyGlowFactorRampRate;
    }
    //return;    
}

simulated function GetTubeLeftGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x69
    if(TubeLeftGlowFactorDesired < TubeLeftGlowFactorActual)
    {
        TubeLeftGlowFactorActual = float(Min(int(TubeLeftGlowFactorDesired), int(TubeLeftGlowFactorActual + (TubeLeftGlowFactorRampRate * WorldInfo.DeltaSeconds))));        
    }
    else
    {
        // End:0xCF
        if(TubeLeftGlowFactorDesired > TubeLeftGlowFactorActual)
        {
            TubeLeftGlowFactorActual = float(Max(int(TubeLeftGlowFactorDesired), int(TubeLeftGlowFactorActual - (TubeLeftGlowFactorRampRate * WorldInfo.DeltaSeconds))));
        }
    }
    return TubeLeftGlowFactorActual;
    //return ReturnValue;    
}

simulated function GetTubeRightGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x69
    if(TubeRightGlowFactorDesired < TubeRightGlowFactorActual)
    {
        TubeRightGlowFactorActual = float(Min(int(TubeRightGlowFactorDesired), int(TubeRightGlowFactorActual + (TubeRightGlowFactorRampRate * WorldInfo.DeltaSeconds))));        
    }
    else
    {
        // End:0xCF
        if(TubeRightGlowFactorDesired > TubeRightGlowFactorActual)
        {
            TubeRightGlowFactorActual = float(Max(int(TubeRightGlowFactorDesired), int(TubeRightGlowFactorActual - (TubeRightGlowFactorRampRate * WorldInfo.DeltaSeconds))));
        }
    }
    return TubeRightGlowFactorActual;
    //return ReturnValue;    
}

simulated function GetBodyGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x69
    if(BodyGlowFactorDesired < BodyGlowFactorActual)
    {
        BodyGlowFactorActual = float(Min(int(BodyGlowFactorDesired), int(BodyGlowFactorActual + (BodyGlowFactorRampRate * WorldInfo.DeltaSeconds))));        
    }
    else
    {
        // End:0xCF
        if(BodyGlowFactorDesired > BodyGlowFactorActual)
        {
            BodyGlowFactorActual = float(Max(int(BodyGlowFactorDesired), int(BodyGlowFactorActual - (BodyGlowFactorRampRate * WorldInfo.DeltaSeconds))));
        }
    }
    return BodyGlowFactorActual;
    //return ReturnValue;    
}

defaultproperties
{
    Phase=EAct1BossPhase.ebpNotApplicable
    TetherVel=8.0000000
    bBirthLeeches=true
    LeechTubeNames[0]="LeechTubeLeft"
    LeechTubeNames[1]="LeechTubeRight"
    TubeLeftGlowFactorRampRate=1.0000000
    TubeRightGlowFactorRampRate=1.0000000
    BodyGlowFactorRampRate=1.0000000
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnAct1Boss.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnAct1Boss.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnAct1Boss.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnAct1Boss.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnAct1Boss.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnAct1Boss.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnAct1Boss.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnAct1Boss.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnAct1Boss.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnAct1Boss.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=myKynapseBodyHandle
    Components[4]=MyLightEnvironment
    Components[5]=SPPawnMesh
    Components[6]=FaceAudioComponent
    Components[7]=SPDamageOverTimeComponentObj
    Components[8]=SMTC
    Components[9]=FXActionManagerDefObj0
    bHidden=true
    bCollideWorld=false
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnAct1Boss.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}