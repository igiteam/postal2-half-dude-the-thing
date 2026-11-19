class LPAIPawnBaseSnowCrab extends LPAIPawnAkridLarge
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

enum ESnowCrabGrabPoints
{
    egpRightClaw,                   // 0
    egpLeftClaw,                    // 1
    egpRightStump,                  // 2
    egpLeftStump,                   // 3
    ESnowCrabGrabPoints_MAX         // 4
};

enum eClawState
{
    eClawState_None,                // 0
    eClawState_Striking,            // 1
    eClawState_Stuck,               // 2
    eClawState_Recovering,          // 3
    eClawState_SlapingAside,        // 4
    eClawState_JustDismembered,     // 5
    eClawState_Dismembered,         // 6
    eClawState_ShoulderingAside,    // 7
    eClawState_MAX                  // 8
};

struct native ClawStatus
{
    var(0.25_Pct) /*0x22540000-0x00000000*/ private byte CurClawState[65537];
    var(0.25_Pct) /*0x22540000-0x00000000*/ private float TimeClawDismembered[65537];
    var(0.25_Pct) /*0x22540000-0x00000000*/ private float LastTimeStumpBled[65537];
    var(0.25_Pct) /*0x22540000-0x00000000*/ private int NumOfTicksSinceLastTimeStumpBled[65537];
    var(0.25_Pct) /*0x22540000-0x00000000*/ private name HighResStumpBleedEffectName[65537];
    var(0.25_Pct) /*0x22540000-0x00000000*/ private name LowResStumpBleedEffectName[65537];

    structdefaultproperties
    {
        CurClawState=eClawState.eClawState_None
        TimeClawDismembered=0.0000000
        LastTimeStumpBled=0.0000000
        NumOfTicksSinceLastTimeStumpBled=0
        HighResStumpBleedEffectName="None"
        LowResStumpBleedEffectName="None"
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyBaseCrabController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ImpactParticles_ParticleSystem;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ParticleSystemScale;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataIceCrab[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class BackInnerShellClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class BackOuterShellClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class CapShellClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackInnerShell[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackOuterShell[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CapShell[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LeftClawStatus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightClawStatus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MouthGlowFactor[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedMouthGlowFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedMouthGlowRampRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EffectiveScriptedMouthGlowFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_ClawSlapRight_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_ClawSlapLeft_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_ClawSlapRight[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_ClawSlapLeft[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_BulletInMouthHitReaction_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_BulletInMouthHitReaction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel @NULL ReplicatedLeftClawStatus[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel @NULL ReplicatedRightClawStatus[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VSKnockOutChance[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableGroundPound[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableClawSwipe[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool MP_LargeAreaCrab[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DamageTypeChargeHit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DamageTypeChargeBrush;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeForSimpleTaunt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ChanceOfPlayingAggressiveClawStrike[1073741825];

// Export ULPAIPawnBaseSnowCrab::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnBaseSnowCrab::execGetBodyDamageFactor(FFrame&, void* const)
native simulated function GetBodyDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnBaseSnowCrab::execGetMouthDamageFactor(FFrame&, void* const)
native final simulated function GetMouthDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnBaseSnowCrab::execGetLeftArmDamageFactor(FFrame&, void* const)
native final simulated function GetLeftArmDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnBaseSnowCrab::execGetRightArmDamageFactor(FFrame&, void* const)
native final simulated function GetRightArmDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    switch(VarName)
    {
        // End:0x37
        case 'ReplicatedLeftClawStatus':
            HandleReplicatedMemberStatus(6, ReplicatedLeftClawStatus);
            // End:0x5E
            break;
        // End:0x5B
        case 'ReplicatedRightClawStatus':
            HandleReplicatedMemberStatus(5, ReplicatedRightClawStatus);
            // End:0x5E
            break;
        // End:0xFFFF
        default:
            break;
    }
    super(LPPawn).ReplicatedEvent(VarName);
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    MouthGlowFactor = 0.0000000;
    ScriptedMouthGlowFactor = 0.0000000;
    ScriptedMouthGlowRampRate = 1.0000000;
    EffectiveScriptedMouthGlowFactor = 0.0000000;
    LeftClawStatus.CurClawState = 0;
    RightClawStatus.CurClawState = 0;
    LeftClawStatus.TimeClawDismembered = -1.0000000;
    RightClawStatus.TimeClawDismembered = -1.0000000;
    LeftClawStatus.NumOfTicksSinceLastTimeStumpBled = 2147483647;
    RightClawStatus.NumOfTicksSinceLastTimeStumpBled = 2147483647;
    LeftClawStatus.HighResStumpBleedEffectName = 'BleedFromLeftStump';
    RightClawStatus.HighResStumpBleedEffectName = 'BleedFromRightStump';
    LeftClawStatus.LowResStumpBleedEffectName = 'BleedFromLeftStumpLowRes';
    RightClawStatus.LowResStumpBleedEffectName = 'BleedFromRightStumpLowRes';
    // End:0x217
    if((TuneDataIceCrab != none) && TuneDataIceCrab.VSKnockOutChanceStart != none)
    {
        VSKnockOutChance = TuneDataIceCrab.VSKnockOutChanceStart.GetValue();
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataIceCrab = LPTuneDataIceCrab(TuneData);
    super(LPAIPawnAkrid).InitTuneData(TuneData);
    TimeForSimpleTaunt = 0.0000000;
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super(LPAIPawn).PossessedBy(C, bVehicleTransition);
    MyBaseCrabController = LPAIControllerBaseSnowCrab(C);
    //return;    
}

function UnPossessed()
{
    super(LPAIPawn).UnPossessed();
    MyBaseCrabController = none;
    //return;    
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
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x10E
    if(AttackAnimTree != none)
    {
        MoveNames.AddItem(AnimTemplateLogic_ClawSlapRight_Name);        
        MoveNames.AddItem(AnimTemplateLogic_ClawSlapLeft_Name);        
        MoveNames.AddItem(AnimTemplateLogic_BulletInMouthHitReaction_Name);        
        AttackAnimTree.FindAnimNodes(MoveNames, MoveNodes, Class'LPAnimNodeTemplateLogicNamedRoot');
        I = 0;
        AnimTemplateLogic_ClawSlapRight = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
        AnimTemplateLogic_ClawSlapLeft = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
        AnimTemplateLogic_BulletInMouthHitReaction = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
    }
    super(LPPawn).InitAnimTemplates();
    //return;    
}

simulated function InitAllCoreShields()
{
    // End:0x33
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        InitCrabShield();
    }
    //return;    
}

function InitCrabShield()
{
    AttachBackOuterShell();
    AttachBackInnerShell();
    // End:0x54
    if((BackInnerShell != none) && BackOuterShell != none)
    {
        BackInnerShell.SetVisibility(false);
    }
    //return;    
}

simulated function NotifyShieldAttached()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;

    super(LPAIPawn).NotifyShieldAttached(Shield, AttachSocket, ShieldId);
    // End:0x83
    if(Shield.AttachInfo.ShieldId == 'BackInnerShell')
    {
        BackInnerShell = LPCrabShell(Shield);        
    }
    else
    {
        // End:0xE1
        if(Shield.AttachInfo.ShieldId == 'BackOuterShell')
        {
            BackOuterShell = LPCrabShell(Shield);            
        }
        else
        {
            // End:0x13C
            if(Shield.AttachInfo.ShieldId == 'CapShell')
            {
                CapShell = LPCrabShellCap(Shield);
            }
        }
    }
    // End:0x17C
    if((BackInnerShell != none) && BackOuterShell != none)
    {
        BackInnerShell.SetVisibility(false);
    }
    //return;    
}

simulated function AttachBackInnerShell()
{
    // End:0xC9
    if(BackInnerShell == none)
    {
        BackInnerShell = LPCrabShell(InitCoreShield(BackInnerShellClass, 'JO_iceShell', 'BackInnerShell'));
        // End:0xC9
        if(BackInnerShell != none)
        {
            SPActorDestructComponent(BackInnerShell.DestructComponent).HitPoints = int(TuneDataIceCrab.HitPointsBackInnerShell.GetValue());
        }
    }
    //return;    
}

simulated function AttachBackOuterShell()
{
    // End:0xC9
    if(BackOuterShell == none)
    {
        BackOuterShell = LPCrabShell(InitCoreShield(BackOuterShellClass, 'JO_iceShell', 'BackOuterShell'));
        // End:0xC9
        if(BackOuterShell != none)
        {
            SPActorDestructComponent(BackOuterShell.DestructComponent).HitPoints = int(TuneDataIceCrab.HitPointsBackOuterShell.GetValue());
        }
    }
    //return;    
}

simulated function OnToggleCoreShieldGlow()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x259
    if(Action.InputLinks[0].bHasImpulse)
    {
        // End:0xEC
        if(CapShell != none)
        {
            CapShell.SetGlow(TuneDataIceCrab.CapOnStartToggleGlowEmissive.GetValue());
            CapShell.SetGlowStrength(TuneDataIceCrab.CapOnStartToggleGlowBrightness.GetValue());
        }
        // End:0x1A1
        if(BackOuterShell != none)
        {
            BackOuterShell.SetGlow(TuneDataIceCrab.OuterShellOnStartToggleGlowEmissive.GetValue());
            BackOuterShell.SetGlowStrength(TuneDataIceCrab.OuterShellOnStartToggleGlowBrightness.GetValue());
        }
        // End:0x256
        if(BackInnerShell != none)
        {
            BackInnerShell.SetGlow(TuneDataIceCrab.InnerShellOnStartToggleGlowEmissive.GetValue());
            BackInnerShell.SetGlowStrength(TuneDataIceCrab.InnerShellOnStartToggleGlowBrightness.GetValue());
        }        
    }
    else
    {
        // End:0x32C
        if(Action.InputLinks[1].bHasImpulse)
        {
            // End:0x2C3
            if(CapShell != none)
            {
                CapShell.SetGlow(0.0000000);
            }
            // End:0x2F6
            if(BackOuterShell != none)
            {
                BackOuterShell.SetGlow(0.0000000);
            }
            // End:0x329
            if(BackInnerShell != none)
            {
                BackInnerShell.SetGlow(0.0000000);
            }            
        }
        else
        {
            // End:0x48A
            if(Action.InputLinks[2].bHasImpulse)
            {
                // End:0x3C6
                if(CapShell != none)
                {
                    CapShell.SetGlow(((CapShell.EmissiveGlow == 0.0000000) ? 1.0000000 : 0.0000000));
                }
                // End:0x428
                if(BackOuterShell != none)
                {
                    BackOuterShell.SetGlow(((BackOuterShell.EmissiveGlow == 0.0000000) ? 1.0000000 : 0.0000000));
                }
                // End:0x48A
                if(BackInnerShell != none)
                {
                    BackInnerShell.SetGlow(((BackInnerShell.EmissiveGlow == 0.0000000) ? 1.0000000 : 0.0000000));
                }
            }
        }
    }
    //return;    
}

final simulated function GetMouthGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x43
    if(EffectiveScriptedMouthGlowFactor < ScriptedMouthGlowFactor)
    {
        EffectiveScriptedMouthGlowFactor = FMax(EffectiveScriptedMouthGlowFactor + ScriptedMouthGlowRampRate, ScriptedMouthGlowFactor);        
    }
    else
    {
        // End:0x83
        if(EffectiveScriptedMouthGlowFactor > ScriptedMouthGlowFactor)
        {
            EffectiveScriptedMouthGlowFactor = FMax(EffectiveScriptedMouthGlowFactor - ScriptedMouthGlowRampRate, ScriptedMouthGlowFactor);
        }
    }
    return FMax(EffectiveScriptedMouthGlowFactor, MouthGlowFactor);
    //return ReturnValue;    
}

final simulated function EnableMouthGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    MouthGlowFactor = ((bEnable) ? 1.0000000 : 0.0000000);
    //return;    
}

function OnSetIceCrabMouthGlow()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    ScriptedMouthGlowFactor = inAction.GlowValue;
    ScriptedMouthGlowRampRate = inAction.RampRate;
    //return;    
}

function DoKismetAttachment()
{
    local /*0x97E50000-0x00000000*/ private @NULL Attachment[8388609], Action, Cap;

    Cap = LPCrabShellCap(Attachment);
    // End:0xA5
    if(Cap != none)
    {
        // End:0xA2
        if(CapShell == none)
        {
            // End:0xA2
            if(Cap.AttachToPawn(self, 'JO_iceShell', 'CapShell'))
            {
                CapShell = Cap;
                CapShell.SetVisibility(true);
            }
        }        
    }
    else
    {
        super(Pawn).DoKismetAttachment(Attachment, Action);
    }
    //return;    
}

simulated function ShieldDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609], EventInstigator;

    super(LPAIPawn).ShieldDestroyed(Shield);
    // End:0xE2
    if(Shield == CapShell)
    {
        // End:0xDF
        if(BackOuterShell != none)
        {
            BackOuterShell.SetGlowStrength(TuneDataIceCrab.OuterShellOnCapDestructionGlowBrightness.GetValue());
            BackOuterShell.SetGlow(TuneDataIceCrab.OuterShellOnCapDestructionGlowEmissive.GetValue());
        }        
    }
    else
    {
        // End:0x1E6
        if(Shield == BackOuterShell)
        {
            ExplodeCap();
            BackOuterShell = none;
            // End:0x1E3
            if(BackInnerShell != none)
            {
                BackInnerShell.SetVisibility(true);
                BackInnerShell.SetGlowStrength(TuneDataIceCrab.InnerShellOnOuterShellDestructionGlowBrightness.GetValue());
                BackInnerShell.SetGlow(TuneDataIceCrab.InnerShellOnOuterShellDestructionGlowEmissive.GetValue());
            }            
        }
        else
        {
            // End:0x258
            if(Shield == BackInnerShell)
            {
                // End:0x224
                if(BackOuterShell != none)
                {
                    BackOuterShell.Destroy();
                }
                ExplodeCap();
                EventInstigator = self;
                TriggerEventClass(Class'LPSeqEvent_CoreExposed', EventInstigator);
            }
        }
    }
    //return;    
}

simulated event ReceivedNewEvent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Evt[8388609];

    super(Pawn).ReceivedNewEvent(Evt);
    //return;    
}

simulated function ExplodeCap()
{
    // End:0x2E
    if(CapShell != none)
    {
        CapShell.Explode();
    }
    SetTimer(1.0000000, false, 'DestroyCap');
    //return;    
}

simulated function DestroyCap()
{
    // End:0x32
    if(CapShell != none)
    {
        CapShell.Destroy();
        CapShell = none;
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    DestroyShields();
    //return;    
}

simulated function EndTasedRoarLoopingSoundSound()
{
    TurnOffRoarAudioComponent();
    //return;    
}

simulated function HasAnyDismemberables()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (((!IsClawRightDismembered() || !IsClawLeftDismembered()) || CapShell != none) || BackOuterShell != none) || BackInnerShell != none;
    //return ReturnValue;    
}

simulated function DestroyShields()
{
    // End:0x32
    if(BackInnerShell != none)
    {
        BackInnerShell.Destroy();
        BackInnerShell = none;
    }
    // End:0x64
    if(BackOuterShell != none)
    {
        BackOuterShell.Destroy();
        BackOuterShell = none;
    }
    DestroyCap();
    //return;    
}

simulated event CoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool HideClaw[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL FreezeClawEffect;

    false
    // End:0xCA
    if(CoreTag.GetCoreId() == 6)
    {
        ClawLeftDestroyed();
        // End:0xC7
        if(!HideClaw && FXActionManagerInstance != none)
        {
            FreezeClawEffect = LPFXAction_FreezeClaw(FXActionManagerInstance.GetFXAction(Class'LPFXAction_FreezeClawLeft'));
            // End:0xC7
            if(FreezeClawEffect != none)
            {
                FXActionManagerInstance.StartFXAction(Class'LPFXAction_FreezeClawLeft');
            }
        }        
    }
    else
    {
        ClawRightDestroyed();
        // End:0x166
        if(!HideClaw && FXActionManagerInstance != none)
        {
            FreezeClawEffect = LPFXAction_FreezeClaw(FXActionManagerInstance.GetFXAction(Class'LPFXAction_FreezeClawRight'));
            // End:0x166
            if(FreezeClawEffect != none)
            {
                FXActionManagerInstance.StartFXAction(Class'LPFXAction_FreezeClawRight');
            }
        }
    }
    super(LPAIPawn).CoreDestroyed(CoreTag, CoreIndex);
    // End:0x1EA
    if(HideClaw)
    {
        Mesh.HideBoneByName(MyCoreData[CoreIndex].DismembermentInfo.BoneName, 1);
    }
    //return;    
}

simulated event DismemberPart()
{
    local /*0x97E50000-0x00000000*/ private name BoneName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Impulse[9437185], HitLocation;
    local /*0x97E50000-0x00000000*/ private bool bVelChange[9437185];
    local /*0x97E50000-0x00000000*/ private int LeftClawCoreIdx, RightClawCoreIdx;

    LeftClawCoreIdx = GetCoreIndexForThisCoreId(6);
    RightClawCoreIdx = GetCoreIndexForThisCoreId(5);
    // End:0x98
    if(BoneName == MyCoreData[LeftClawCoreIdx].DismembermentInfo.BoneName)
    {
        ReplicatedLeftClawStatus.bPartDismembered = true;        
    }
    else
    {
        // End:0xFE
        if(BoneName == MyCoreData[RightClawCoreIdx].DismembermentInfo.BoneName)
        {
            ReplicatedRightClawStatus.bPartDismembered = true;
        }
    }
    super(LPAIPawn).DismemberPart(BoneName, Impulse, HitLocation, bVelChange);
    //return;    
}

event AnimDismemberPart()
{
    local /*0x97E50000-0x00000000*/ private @NULL NotifyDismember[8388609];

    // End:0x163
    if(NotifyDismember.CoreToDismember.GetCoreId() == 4)
    {
        // End:0x156
        if(((CapShell != none) || BackOuterShell != none) || BackInnerShell != none)
        {
            // End:0xE0
            if(NotifyDismember.EventName != 'None')
            {
                TuneDataPawnFXEventBindings.PlayEventFX(NotifyDismember.EventName, self, Mesh, none);
            }
            // End:0x156
            if(NotifyDismember.SoundName != 'None')
            {
                TuneDataPawnSoundEventBindings.PlayEventSoundLocally(NotifyDismember.SoundName, 'None', self, none, none);
            }
        }
        DestroyShields();        
    }
    else
    {
        super(LPAIPawn).AnimDismemberPart(NotifyDismember);
    }
    //return;    
}

simulated function SetStunnedGrabPointsEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

    //return;    
}

simulated function PlayGrenadeInInternalGrenadeExplosionEffects()
{
    TuneDataPawnFXEventBindings.PlayEventFX('GrenadeInMouthExplosion', self, Mesh, none);
    TuneDataPawnSoundEventBindings.PlayEventSoundLocally('GrenadeExplosionInMouth', 'None', self, none, none);
    //return;    
}

simulated function HandleInternalGrenadeCoreExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenExploding[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];

    // End:0x1AA
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0xBD
        if(CapShell != none)
        {
            CapShell.bDoHighRedCapExplosion = false;
            CapShell.PercentageOfEachMeshToFrag = 0.0000000;
            DestroyCap();
            TuneDataPawnFXEventBindings.PlayEventFX('IceCrabShellGreandeBlowout', self, Mesh, none);            
        }
        else
        {
            // End:0x11A
            if(BackOuterShell != none)
            {
                BackOuterShell.Destroy();
                TuneDataPawnFXEventBindings.PlayEventFX('IceCrabShellGreandeBlowout', self, Mesh, none);                
            }
            else
            {
                // End:0x177
                if(BackInnerShell != none)
                {
                    BackInnerShell.Destroy();
                    TuneDataPawnFXEventBindings.PlayEventFX('IceCrabShellGreandeBlowout', self, Mesh, none);                    
                }
                else
                {
                    TuneDataPawnFXEventBindings.PlayEventFX('IceCrabBackCoreGrenadeBlowOut', self, Mesh, none);
                }
            }
        }
    }
    //return;    
}

simulated function AttachedGrenadeJustExploded()
{
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];

    super(LPAIPawnAkrid).AttachedGrenadeJustExploded(CoreAttachedTo);
    //return;    
}

simulated function @NULL NotifyOfGrenadeGettingStuckTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609], ComponentGrenOn, HitNormal, PhysMat;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAIPawnAkrid).NotifyOfGrenadeGettingStuckTo(GrenGettingStuck, ComponentGrenOn, HitNormal, PhysMat);
    //return ReturnValue;    
}

simulated function GetNameOfBoneToAttackGrenadeToBasedOnPhysicalMaterial()
{
    local /*0x97E50000-0x00000000*/ private @NULL PhysMatToTest[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL hitCoreTag;
    local /*0x97E50000-0x00000000*/ private int coreIdOn, iter;

    // End:0x140
    if(PhysMatToTest != none)
    {
        hitCoreTag = LPPhysMatPropTag_CoreId(PhysMatToTest.GetTag(Class'LPPhysMatPropTag_CoreId'));
        coreIdOn = hitCoreTag.GetCoreId();
        iter = 0;
        J0x7E:

        // End:0x140 [Loop If]
        if(iter < TuneDataIceCrab.BoneAttachPointByCore.Length)
        {
            // End:0x132
            if(int(TuneDataIceCrab.BoneAttachPointByCore[iter].CoreID) == coreIdOn)
            {
                return TuneDataIceCrab.BoneAttachPointByCore[iter].BoneName;
            }
            ++iter;
            // [Loop Continue]
            goto J0x7E;
        }
    }
    //return ReturnValue;    
}

simulated function IsThisCoreAStickGrenadeToCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreIdToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x93 [Loop If]
    if(iter < TuneDataIceCrab.BoneAttachPointByCore.Length)
    {
        // End:0x85
        if(int(TuneDataIceCrab.BoneAttachPointByCore[iter].CoreID) == CoreIdToTest)
        {
            return true;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

simulated function GetLocationForExplosionForGrenadeStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreIdToTest[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0xED [Loop If]
    if(iter < TuneDataIceCrab.BoneAttachPointByCore.Length)
    {
        // End:0xDF
        if(int(TuneDataIceCrab.BoneAttachPointByCore[iter].CoreID) == CoreIdToTest)
        {
            return Mesh.GetBoneLocation(TuneDataIceCrab.BoneAttachPointByCore[iter].BoneName);
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return Location;
    //return ReturnValue;    
}

simulated function CheckExitVSDangerousRange()
{
    local /*0x97E50000-0x00000000*/ private float inDistanceSq[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL meleeCmd;

    meleeCmd = MyBaseCrabController.FindCommandOfClass(Class'LPAICmd_CrabMelee');
    // End:0x91
    if((meleeCmd != none) && meleeCmd.IsInState('WithdrawForChargeAtEnemy') || meleeCmd.IsInState('ChargeEnemy'))
    {
        return true;
    }
    return super(LPAIPawnAkrid).CheckExitVSDangerousRange(inDistanceSq);
    //return ReturnValue;    
}

simulated function CheckVSKnockOutChance()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function PlayChargeClawHitBlurEffects()
{
    local /*0x97E50000-0x00000000*/ private name SocketName[8388609];

    //return;    
}

simulated function PlayVsClawPushBlurEffects()
{
    local /*0x97E50000-0x00000000*/ private name SocketName[8388609];

    //return;    
}

simulated function NotifyStartOfCrabTauntRoar()
{
    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_SnowCrabStartTauntRoar, self);
    //return;    
}

simulated function StopTheReleaseToKillVs()
{
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], Pct;

    super(LPPawn).Tick(DeltaTime);
    // End:0xFF
    if(ExplosionRadialBlur != none)
    {
        // End:0xB1
        if(RadialBlurFadeTimeRemaining > 0.0000000)
        {
            Pct = RadialBlurFadeTimeRemaining / RadialBlurFadeTime;
            Pct *= Pct;
            ExplosionRadialBlur.SetBlurScale(Pct * RadialBlurMaxBlurAmount);
            RadialBlurFadeTimeRemaining -= DeltaTime;            
        }
        else
        {
            ExplosionRadialBlur.SetBlurScale(0.0000000);
            ExplosionRadialBlur.DetachFromAny();
            ExplosionRadialBlur = none;
        }
    }
    DismemberedBleed(DeltaTime);
    //return;    
}

final simulated function DismemberedBleed()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x44
    if(LeftClawStatus.NumOfTicksSinceLastTimeStumpBled < 2147483647)
    {
        LeftClawStatus.NumOfTicksSinceLastTimeStumpBled++;
    }
    // End:0x88
    if(RightClawStatus.NumOfTicksSinceLastTimeStumpBled < 2147483647)
    {
        RightClawStatus.NumOfTicksSinceLastTimeStumpBled++;
    }
    // End:0x126
    if(TuneDataIceCrab.bUsePostDismembermentStumpAutoBleed && DeltaTime < TuneDataIceCrab.MaxUpdateDeltaToAllowDismemberedBleed_Tunable.GetValue())
    {
        HandleClawDismembermentBleed(DeltaTime, LeftClawStatus);
        HandleClawDismembermentBleed(DeltaTime, RightClawStatus);
    }
    //return;    
}

final simulated function HandleClawDismembermentBleed()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ClawHandling[25165825];
    local /*0x97E50000-0x00000000*/ private float TimeSince, avgFps;

    // End:0x343
    if(IsThisClawStateADismemberedState(ClawHandling.CurClawState))
    {
        TimeSince = WorldInfo.TimeSeconds - ClawHandling.TimeClawDismembered;
        // End:0x343
        if(((TimeSince < TuneDataIceCrab.DurationOfStumpBleedingAfterDismemberement_Tunable.GetValue()) || TuneDataIceCrab.DurationOfStumpBleedingAfterDismemberement_Tunable.GetValue() < 0.0000000) || int(ClawHandling.CurClawState) == int(5))
        {
            TimeSince = WorldInfo.TimeSeconds - ClawHandling.LastTimeStumpBled;
            // End:0x343
            if(TimeSince >= TuneDataIceCrab.WaitTimeBetweenStumpBleedsAfterDismemberement_Tunable.GetValue())
            {
                ClawHandling.LastTimeStumpBled = WorldInfo.TimeSeconds;
                avgFps = TimeSince / float(ClawHandling.NumOfTicksSinceLastTimeStumpBled);
                ClawHandling.NumOfTicksSinceLastTimeStumpBled = 0;
                // End:0x2FD
                if((DeltaTime < TuneDataIceCrab.MaxUpdateDeltaToAllowHighRedDismemberedBleed_Tunable.GetValue()) && avgFps < TuneDataIceCrab.MaxUpdateDeltaToAllowHighRedDismemberedBleed_Tunable.GetValue())
                {
                    TuneDataPawnFXEventBindings.PlayEventFX(ClawHandling.HighResStumpBleedEffectName, self, Mesh, none);                    
                }
                else
                {
                    TuneDataPawnFXEventBindings.PlayEventFX(ClawHandling.LowResStumpBleedEffectName, self, Mesh, none);
                }
            }
        }
    }
    //return;    
}

function Cripple()
{
    local /*0x97E50000-0x00000000*/ private int I;

    DestroyShields();
    I = 0;
    J0x15:

    // End:0x67 [Loop If]
    if(I < MyCoreData.Length)
    {
        MyCoreData[I].Health = 1.0000000;
        ++I;
        // [Loop Continue]
        goto J0x15;
    }
    Health = 1;
    //return;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    // End:0x29
    if(WantsToPlayDieAnim(DamageType))
    {
        PlayDyingSpecialMove(Class'LPSM_SnowCrabDie');
    }
    //return;    
}

private final simulated function IsThisClawStateADismemberedState()
{
    local /*0x97E50000-0x00000000*/ private byte State2Test[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x42
    if(((int(State2Test) == int(6)) || int(State2Test) == int(7)) || int(State2Test) == int(5))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

private final simulated function IsThisClawStateAStrikingState()
{
    local /*0x97E50000-0x00000000*/ private byte State2Test[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x58
    if((((int(State2Test) == int(1)) || int(State2Test) == int(2)) || int(State2Test) == int(3)) || int(State2Test) == int(5))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

private final simulated function IsThisClawStateTheStrikeJustStartedState()
{
    local /*0x97E50000-0x00000000*/ private byte State2Test[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x16
    if(int(State2Test) == int(1))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

private final simulated function IsThisClawStateANeedLineSweepTestingState()
{
    local /*0x97E50000-0x00000000*/ private byte State2Test[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x42
    if(((int(State2Test) == int(1)) || int(State2Test) == int(4)) || int(State2Test) == int(7))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

private final simulated function IsThisClawStateAReadyToSlapAsideState()
{
    local /*0x97E50000-0x00000000*/ private byte State2Test[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if((int(State2Test) == int(0)) || int(State2Test) == int(6))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function AreClawsBothDismembered()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x56
    if(IsThisClawStateADismemberedState(LeftClawStatus.CurClawState) && IsThisClawStateADismemberedState(RightClawStatus.CurClawState))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function GetClawLeftState()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return LeftClawStatus.CurClawState;
    //return ReturnValue;    
}

final simulated function GetClawRightState()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return RightClawStatus.CurClawState;
    //return ReturnValue;    
}

final simulated function IsClawLeftAbleToAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x29
    if(int(LeftClawStatus.CurClawState) == int(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function IsClawRightAbleToAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x29
    if(int(RightClawStatus.CurClawState) == int(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function IsClawLeftBeingUsedInStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(IsThisClawStateAStrikingState(LeftClawStatus.CurClawState))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function IsClawRightBeingUsedInStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(IsThisClawStateAStrikingState(RightClawStatus.CurClawState))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function DidTheLeftClawJustStartStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(IsThisClawStateTheStrikeJustStartedState(LeftClawStatus.CurClawState))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function DidTheRightClawJustStartStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(IsThisClawStateTheStrikeJustStartedState(RightClawStatus.CurClawState))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function DoesClawLeftNeedLineSweepTesting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(IsThisClawStateANeedLineSweepTestingState(LeftClawStatus.CurClawState))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function DoesClawRightNeedLineSweepTesting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(IsThisClawStateANeedLineSweepTestingState(RightClawStatus.CurClawState))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function IsClawLeftDismembered()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(IsThisClawStateADismemberedState(LeftClawStatus.CurClawState))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function IsClawRightDismembered()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(IsThisClawStateADismemberedState(RightClawStatus.CurClawState))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function GetClawLeftTimeDismembered()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return LeftClawStatus.TimeClawDismembered;
    //return ReturnValue;    
}

final simulated function GetClawRightTimeDismembered()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RightClawStatus.TimeClawDismembered;
    //return ReturnValue;    
}

final simulated function HasClawLeftJustBeenDismembered()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x29
    if(int(LeftClawStatus.CurClawState) == int(5))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function HasClawRightJustBeenDismembered()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x29
    if(int(RightClawStatus.CurClawState) == int(5))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function ClawLeftSetToStrikingWith()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4C
    if(!IsThisClawStateADismemberedState(LeftClawStatus.CurClawState))
    {
        LeftClawStatus.CurClawState = 1;
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function ClawRightSetToStrikingWith()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4C
    if(!IsThisClawStateADismemberedState(RightClawStatus.CurClawState))
    {
        RightClawStatus.CurClawState = 1;
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function ClawLeftSetToStuckWith()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4C
    if(!IsThisClawStateADismemberedState(LeftClawStatus.CurClawState))
    {
        LeftClawStatus.CurClawState = 2;
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function ClawRightSetToStuckWith()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4C
    if(!IsThisClawStateADismemberedState(RightClawStatus.CurClawState))
    {
        RightClawStatus.CurClawState = 2;
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function ClawLeftSetToRecoveringWith()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4C
    if(!IsThisClawStateADismemberedState(LeftClawStatus.CurClawState))
    {
        LeftClawStatus.CurClawState = 3;
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function ClawRightSetToRecoveringWith()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4C
    if(!IsThisClawStateADismemberedState(RightClawStatus.CurClawState))
    {
        RightClawStatus.CurClawState = 3;
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function ClawLeftSetToStrikeDoneWith()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4C
    if(!IsThisClawStateADismemberedState(LeftClawStatus.CurClawState))
    {
        LeftClawStatus.CurClawState = 0;
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function ClawRightSetToStrikeDoneWith()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4C
    if(!IsThisClawStateADismemberedState(RightClawStatus.CurClawState))
    {
        RightClawStatus.CurClawState = 0;
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function ClawLeftResetAfterSlapAside()
{
    // End:0x4B
    if(IsThisClawStateADismemberedState(LeftClawStatus.CurClawState))
    {
        LeftClawStatus.CurClawState = 6;        
    }
    else
    {
        LeftClawStatus.CurClawState = 0;
    }
    //return;    
}

final simulated function ClawRightResetAfterSlapAside()
{
    // End:0x4B
    if(IsThisClawStateADismemberedState(RightClawStatus.CurClawState))
    {
        RightClawStatus.CurClawState = 6;        
    }
    else
    {
        RightClawStatus.CurClawState = 0;
    }
    //return;    
}

function IsClawLeftSlapingOrShoulderingAside()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x52
    if((int(LeftClawStatus.CurClawState) == int(7)) || int(LeftClawStatus.CurClawState) == int(4))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsClawRightSlapingOrShoulderingAside()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x52
    if((int(RightClawStatus.CurClawState) == int(7)) || int(RightClawStatus.CurClawState) == int(4))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final simulated function ClawLeftSetToUsingForSlapAside()
{
    // End:0x4B
    if(IsThisClawStateADismemberedState(LeftClawStatus.CurClawState))
    {
        LeftClawStatus.CurClawState = 7;        
    }
    else
    {
        LeftClawStatus.CurClawState = 4;
    }
    //return;    
}

final simulated function ClawRightSetToUsingForSlapAside()
{
    // End:0x4B
    if(IsThisClawStateADismemberedState(RightClawStatus.CurClawState))
    {
        RightClawStatus.CurClawState = 7;        
    }
    else
    {
        RightClawStatus.CurClawState = 4;
    }
    //return;    
}

simulated function IsClawRightAbleToBeUsedForSlapAside()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(IsThisClawStateAReadyToSlapAsideState(RightClawStatus.CurClawState))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function IsClawLeftAbleToBeUsedForSlapAside()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(IsThisClawStateAReadyToSlapAsideState(LeftClawStatus.CurClawState))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function EnableBackCoreShellDamage()
{
    TuneDataPawnFXEventBindings.PlayEventFX('IceCrabShellGreandeBlowout', self, Mesh, none);
    // End:0xB4
    if(SPActorDestructComponent(BackOuterShell.DestructComponent).bDisable)
    {
        SPActorDestructComponent(BackOuterShell.DestructComponent).bDisable = false;
        return;
    }
    // End:0x133
    if(SPActorDestructComponent(BackInnerShell.DestructComponent).bDisable)
    {
        SPActorDestructComponent(BackInnerShell.DestructComponent).bDisable = false;
    }
    //return;    
}

final simulated function ClawLeftDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL mySnowCtrl;

    LeftClawStatus.CurClawState = 5;
    LeftClawStatus.TimeClawDismembered = WorldInfo.TimeSeconds;
    ReplicatedLeftClawStatus.bCoreDestroyed = true;
    ReplicatedLeftClawStatus.TimeDismembered = WorldInfo.TimeSeconds;
    SetGrabPointDestroyedByIndex(1, true);
    // End:0x117
    if(IsClawRightDismembered())
    {
        mySnowCtrl = LPAIControllerBaseSnowCrab(Controller);
        // End:0x117
        if(mySnowCtrl != none)
        {
            mySnowCtrl.NotifyCrabBothClawsAreDisabledForAttack();
        }
    }
    //return;    
}

final simulated function ClawLeftSetDoneReactingToBeingDismemberd()
{
    LeftClawStatus.CurClawState = 6;
    //return;    
}

final simulated function ClawRightDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL mySnowCtrl;

    RightClawStatus.CurClawState = 5;
    RightClawStatus.TimeClawDismembered = WorldInfo.TimeSeconds;
    ReplicatedRightClawStatus.bCoreDestroyed = true;
    ReplicatedRightClawStatus.TimeDismembered = WorldInfo.TimeSeconds;
    SetGrabPointDestroyedByIndex(0, true);
    // End:0x117
    if(IsClawLeftDismembered())
    {
        mySnowCtrl = LPAIControllerBaseSnowCrab(Controller);
        // End:0x117
        if(mySnowCtrl != none)
        {
            mySnowCtrl.NotifyCrabBothClawsAreDisabledForAttack();
        }
    }
    //return;    
}

final simulated function ClawRightSetDoneReactingToBeingDismemberd()
{
    RightClawStatus.CurClawState = 6;
    //return;    
}

function CauseClawPlayerStumble()
{
    local /*0x97E50000-0x00000000*/ private name ClawSocketName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPP, socketLoc, SocketRot;

    Mesh.GetSocketWorldLocationAndRotation(ClawSocketName, socketLoc, SocketRot);
    // End:0xB3
    foreach CollidingActors(Class'LPPlayerPawn', LPPP, TuneDataIceCrab.ClawAttackPlayerStumbleRadius_Tunable.GetValue(), socketLoc)
    {
        LPPP.NotifyShouldStumble();        
    }    
    //return;    
}

simulated function IsItBased()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x37
    if((FracAct != none) && FracAct.Base != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated event DoIBreakFracturedMeshOfThisType()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !IsItBased(FracAct);
    //return ReturnValue;    
}

simulated event DoIExplodeFracturedMeshOfThisType()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated event HandleAnimNotifyAkridRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609], SocketLocation, SocketRotation;

    // End:0x96
    if(LPAnimNotify_IceCrabRam(Notify) != none)
    {
        // End:0x80
        if(!Mesh.GetSocketWorldLocationAndRotation(TuneDataIceCrab.RamAttackSocket, SocketLocation, SocketRotation))
        {
            SocketLocation = Location;
        }
        DoRamExplosion(SocketLocation);        
    }
    else
    {
        // End:0xC1
        if(LPAnimNotify_IceCrabGroundPoundExplosion(Notify) != none)
        {
            DoGroundPoundExplosion(Location);
        }
    }
    //return;    
}

simulated function DoRamExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExplosionLoc[8388609], explosionActor;

    // End:0x1C9
    if(TuneDataIceCrab.RamAttackExplosionTemplate != none)
    {
        explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
        // End:0x1C9
        if(explosionActor != none)
        {
            explosionActor.TheWeaponThatSpawnedMe = self;
            explosionActor.Instigator = self;
            explosionActor.InstigatorController = Controller;
            explosionActor.bDrawDebug = TuneDataIceCrab.bRamAttackDebugDraw;
            explosionActor.ExplosionPhysMaterial = ((Mesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(Mesh.PhysMaterialOverride) : none);
            explosionActor.Explode(TuneDataIceCrab.RamAttackExplosionTemplate, Vector(Rotation));
        }
    }
    //return;    
}

simulated function DoGroundPoundExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExplosionLoc[8388609], explosionActor;

    // End:0x1AB
    if(TuneDataIceCrab.ExplosiveGroundPoundExplosionTemplate != none)
    {
        explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
        // End:0x1AB
        if(explosionActor != none)
        {
            explosionActor.TheWeaponThatSpawnedMe = self;
            explosionActor.Instigator = self;
            explosionActor.InstigatorController = Controller;
            explosionActor.bDrawDebug = false;
            explosionActor.ExplosionPhysMaterial = ((Mesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(Mesh.PhysMaterialOverride) : none);
            explosionActor.Explode(TuneDataIceCrab.ExplosiveGroundPoundExplosionTemplate, Vector(Rotation));
        }
    }
    //return;    
}

simulated function StartAdditiveNudgeLeftAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = AnimTemplateLogic_ClawSlapLeft.GetBestSequenceTemplate(self);
    PlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, 1.0000000, 0.0000000, 0.0000000, false, false);
    //return;    
}

simulated function StartAdditiveNudgeRightAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = AnimTemplateLogic_ClawSlapRight.GetBestSequenceTemplate(self);
    PlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, 1.0000000, 0.0000000, 0.0000000, false, false);
    //return;    
}

simulated function ShouldActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private @NULL ActiveD[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x18
    if(super(LPPawn).ShouldActiveDefense(ActiveD))
    {
        return true;
    }
    // End:0x27
    if(AreClawsBothDismembered())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

state Dying
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    ParticleSystemScale=0.5000000
    DamageTypeChargeHit=Class'LPDamageTypeCrabChargeStrike'
    DamageTypeChargeBrush=Class'LPDamageTypeCrabChargeBrush'
    ChanceOfPlayingAggressiveClawStrike=0.7000000
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnBaseSnowCrab.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    bCanCauseFractureOnTouch=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnBaseSnowCrab.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnBaseSnowCrab.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    SpecialMoves=/* Array type was not detected. */
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnBaseSnowCrab.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnBaseSnowCrab.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnBaseSnowCrab.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnBaseSnowCrab.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnBaseSnowCrab.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnBaseSnowCrab.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnBaseSnowCrab.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPAIPawnBaseSnowCrab.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    Components[10]=DamageStateComponentDefObj
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnBaseSnowCrab.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}