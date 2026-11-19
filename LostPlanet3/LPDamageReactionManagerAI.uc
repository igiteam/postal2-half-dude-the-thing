class LPDamageReactionManagerAI extends LPDamageReactionManager
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL myAIPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ReactionAdditiveTemplateRoot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> ReactionCommandDelegate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL hitCoreTag;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int HitCoreIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CoreDamageHandler;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL LastPassibleDotInfoGrabbed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDidDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCoreDestroyed_ServerOnly;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PotentialDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> DamageFilterCB;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AccumulatedMeleeDamageForFullHitReaction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AccumulatedMeleeDamageForStun;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VSMeleeDamageForFullHitReactionDecayRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VSMeleeDamageForStunDecayRate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnReactionCommandDelegate__Delegate;

// Export ULPDamageReactionManagerAI::execUpdateCoreDamageActionData(FFrame&, void* const)
native simulated function UpdateCoreDamageActionData()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPDamageReactionManagerAI::execTurnOffThisLoopingDamageAction(FFrame&, void* const)
native simulated function @NULL TurnOffThisLoopingDamageAction()
{
    local /*0x97E50000-0x00000400*/ private @NULL PartSysToEnd[8388609];


}

// Export ULPDamageReactionManagerAI::execUpdate(FFrame&, void* const)
native function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

delegate OnReactionCommandDelegate()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    //return;    
}

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    myAIPawn = LPAIPawn(inPawn);
    myAIPawn.DamageReactionManagerAI = self;
    VSMeleeDamageForFullHitReactionDecayRate = myAIPawn.TuneDataAIPawn.VSMeleeDamageForFullHitReactionDecayRate.GetValue();
    VSMeleeDamageForStunDecayRate = myAIPawn.TuneDataAIPawn.VSMeleeDamageForStunDecayRate.GetValue();
    //return;    
}

simulated function TurnOffAnyLoopingDamageActions()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0xC8 [Loop If]
    if(iter < myAIPawn.MyCoreDamageActionData.Length)
    {
        TurnOffThisLoopingDamageAction(myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop);
        myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop = none;
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function ReplicateTakeDamageEffects()
{
    super.ReplicateTakeDamageEffects();
    // End:0xB6
    if(int(myAIPawn.WorldInfo.NetMode) != int(NM_Standalone))
    {
        myAIPawn.ReplicatedLastAITakeHitInfo.Count++;
        myAIPawn.ReplicatedLastAITakeHitInfo.AdditiveTemplateRootNode = ReactionAdditiveTemplateRoot;
    }
    //return;    
}

function ServerCacheDamageAttributes()
{
    super.ServerCacheDamageAttributes();
    // End:0x21
    if(bIsVSMeleeDamage)
    {
        TrackVSMeleeDamage();
    }
    //return;    
}

function TrackVSMeleeDamage()
{
    AccumulatedMeleeDamageForFullHitReaction += float(MyLPPawn.TakeDamageParams.Damage);
    // End:0xE8
    if(AccumulatedMeleeDamageForFullHitReaction > MyLPPawn.TuneDataPawn.VSMeleeDamageForFullHitReaction.GetValue())
    {
        AccumulatedMeleeDamageForFullHitReaction = MyLPPawn.TuneDataPawn.VSMeleeDamageForFullHitReaction.GetValue();
    }
    AccumulatedMeleeDamageForStun += float(MyLPPawn.TakeDamageParams.Damage);
    // End:0x1D0
    if(AccumulatedMeleeDamageForStun > MyLPPawn.TuneDataPawn.VSMeleeDamageForStun.GetValue())
    {
        AccumulatedMeleeDamageForStun = MyLPPawn.TuneDataPawn.VSMeleeDamageForStun.GetValue();
    }
    //return;    
}

function HasReachedVSMeleeFullHitReactionThreshold()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xDB
    if(AccumulatedMeleeDamageForFullHitReaction >= MyLPPawn.TuneDataPawn.VSMeleeDamageForFullHitReaction.GetValue())
    {
        // End:0xDB
        if(ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeEndCombo') || ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeTwoHandBash'))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function HasReachedVSMeleeStunThreshold()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xDB
    if(AccumulatedMeleeDamageForStun >= MyLPPawn.TuneDataPawn.VSMeleeDamageForStun.GetValue())
    {
        // End:0xDB
        if(ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeEndCombo') || ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeTwoHandBash'))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function ClientCacheDamageAttributes()
{
    local /*0x97E50000-0x00000000*/ private @NULL PhysMat;

    super.ClientCacheDamageAttributes();
    ReactionAdditiveTemplateRoot = myAIPawn.ReplicatedLastAITakeHitInfo.AdditiveTemplateRootNode;
    PhysMat = LPPhysicalMaterial(myAIPawn.TakeDamageParams.HitInfo.PhysMaterial);
    hitCoreTag = LPPhysMatPropTag_CoreId(PhysMat.GetTag(Class'LPPhysMatPropTag_CoreId'));
    CoreDamageHandler = LPPhysMatPropTag_DamageHandler(PhysMat.GetTag(Class'LPPhysMatPropTag_DamageHandler'));
    HitCoreIndex = myAIPawn.GetCoreIndexFromTag(hitCoreTag);
    PotentialDamage = float(myAIPawn.TakeDamageParams.Damage);
    // End:0x1EB
    if(HitCoreIndex >= 0)
    {
        DamageFilterCB = myAIPawn.MyCoreData[HitCoreIndex].DamageFilter.DamageFilterCB;        
    }
    else
    {
        DamageFilterCB = None;
    }
    //return;    
}

function SetHitCoreProperties()
{
    local /*0x97E50000-0x00000000*/ private @NULL PhysMat;
    local /*0x97E50000-0x00000000*/ private float passThroughFactor;
    local /*0x97E50000-0x00000000*/ private bool bDamagePart;

    PhysMat = LPPhysicalMaterial(MyLPPawn.TakeDamageParams.HitInfo.PhysMaterial);
    bDidDamage = true;
    hitCoreTag = none;
    CoreDamageHandler = none;
    bCoreDestroyed_ServerOnly = false;
    HitCoreIndex = -1;
    PotentialDamage = 0.0000000;
    DamageFilterCB = None;
    passThroughFactor = 1.0000000;
    // End:0x152
    if(PhysMat != none)
    {
        hitCoreTag = LPPhysMatPropTag_CoreId(PhysMat.GetTag(Class'LPPhysMatPropTag_CoreId'));
        CoreDamageHandler = LPPhysMatPropTag_DamageHandler(PhysMat.GetTag(Class'LPPhysMatPropTag_DamageHandler'));
    }
    // End:0x448
    if(hitCoreTag != none)
    {
        HitCoreIndex = myAIPawn.GetCoreIndexFromTag(hitCoreTag);
        bDidDamage = CanDamageCore(hitCoreTag);
        PotentialDamage = float(myAIPawn.TakeDamageParams.Damage);
        // End:0x255
        if(HitCoreIndex >= 0)
        {
            DamageFilterCB = myAIPawn.MyCoreData[HitCoreIndex].DamageFilter.DamageFilterCB;
        }
        // End:0x445
        if(bDidDamage && CoreDamageHandler != none)
        {
            bDamagePart = int(CoreDamageHandler.ApplyDamageTo) == int(0);
            // End:0x36F
            if(!Class'SPEngine.SPUtil'.static.IsSinglePlayerGame())
            {
                // End:0x31D
                if(int(myAIPawn.MyCoreData[HitCoreIndex].MPDamagePassthrough) == int(1))
                {
                    bDamagePart = false;                    
                }
                else
                {
                    // End:0x36F
                    if(int(myAIPawn.MyCoreData[HitCoreIndex].MPDamagePassthrough) == int(2))
                    {
                        bDamagePart = true;
                    }
                }
            }
            // End:0x3EC
            if(bDamagePart)
            {
                bDidDamage = false;
                bCoreDestroyed_ServerOnly = CoreTakeDamage(hitCoreTag, 1);
                // End:0x3E9
                if(bCoreDestroyed_ServerOnly)
                {
                    myAIPawn.TakeDamageParams.bShouldPlayHitReactAnim = true;
                }                
            }
            else
            {
                passThroughFactor = GetPassThroughFactor(HitCoreIndex);
                myAIPawn.TakeDamageParams.Damage *= passThroughFactor;
            }
        }        
    }
    else
    {
        bDidDamage = myAIPawn.CanTakeNonCoreDamage(myAIPawn.TakeDamageParams.DamageType);
    }
    // End:0x4E5
    if(!bDidDamage)
    {
        myAIPawn.TakeDamageParams.Damage = 0;
    }
    //return;    
}

function DetermineDamageReaction()
{
    ResetDamageReaction();
    SetDefaultDamageReaction();
    // End:0x6D
    if(myAIPawn.MyLpAiController != none)
    {
        myAIPawn.MyLpAiController.OverrideDamageReaction(self);
    }
    //return;    
}

final function ResetDamageReaction()
{
    ReactionCommandDelegate = None;
    ReactionAdditiveTemplateRoot = none;
    //return;    
}

function SetDefaultDamageReaction()
{
    // End:0x5F
    if((myAIPawn.TakeDamageParams.Damage <= 0) || myAIPawn.Health <= 0)
    {
        return;
    }
    // End:0x9E
    if(myAIPawn.MyLpAiController != none)
    {
        SetAIReactionDelegate(DHD_BasicHitReaction);
    }
    //return;    
}

function ExecuteDamageReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL InstigatorPawn;

    // End:0x75
    if(ReactionAdditiveTemplateRoot != none)
    {
        myAIPawn.PlayAdditiveHitReactionAnimationSequence(ReactionAdditiveTemplateRoot.GetBestSequenceTemplate(myAIPawn), None, 0, 1.0000000, 0.1000000);
    }
    // End:0x119
    if(int(myAIPawn.WorldInfo.NetMode) != int(NM_Client))
    {
        // End:0x119
        if((myAIPawn.MyLpAiController != none) && ReactionCommandDelegate != none)
        {
            OnReactionCommandDelegate(myAIPawn.MyLpAiController);
        }
    }
    // End:0x15F
    if(DamageFilterCB != none)
    {
        DamageFilterCBDelegate(myAIPawn);
        DamageFilterCB = None;
    }
    // End:0x1B3
    if(bCoreDestroyed_ServerOnly && HitCoreIndex != -1)
    {
        myAIPawn.CoreDestroyed(hitCoreTag, HitCoreIndex);
    }
    // End:0x2BC
    if(hitCoreTag != none)
    {
        InstigatorPawn = myAIPawn.TakeDamageParams.InstigatedByPawn;
        // End:0x2BC
        if((InstigatorPawn != none) && InstigatorPawn.Controller != none)
        {
            InstigatorPawn.Controller.TriggerEventClass(Class'LPSeqEvent_PlayerDidCoreDamage', myAIPawn);
            // End:0x2BC
            if(bCoreDestroyed_ServerOnly)
            {
                myAIPawn.TriggerEventClass(Class'LPSeqEvent_PlayerDestroyedCore', myAIPawn);
            }
        }
    }
    //return;    
}

function GetCoreIdToApplyDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return CoreTag.GetCoreId();
    //return ReturnValue;    
}

function CoreTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private byte CanDamageCoreOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CoreID, I;
    local /*0x97E50000-0x00000000*/ private float passThroughFactor, damageToApplyToCore, prevCoreHealth;

    0
    // End:0x47F
    if((int(CanDamageCoreOption) == int(1)) || CanDamageCore(CoreTag))
    {
        CoreID = GetCoreIdToApplyDamage(CoreTag);
        I = 0;
        J0x5A:

        // End:0x47F [Loop If]
        if(I < myAIPawn.MyCoreData.Length)
        {
            // End:0x471
            if(CoreID == myAIPawn.MyCoreData[I].CoreID)
            {
                // End:0x423
                if(myAIPawn.MyCoreData[I].Health > float(0))
                {
                    passThroughFactor = GetPassThroughFactor(HitCoreIndex);
                    damageToApplyToCore = float(myAIPawn.TakeDamageParams.Damage) * passThroughFactor;
                    prevCoreHealth = myAIPawn.MyCoreData[I].Health;
                    myAIPawn.MyCoreData[I].Health -= damageToApplyToCore;
                    // End:0x287
                    if(myAIPawn.MyCoreData[I].Health < float(0))
                    {
                        myAIPawn.MyCoreData[I].Health = 0.0000000;
                    }
                    myAIPawn.CoreTookDamage(CoreTag, I, prevCoreHealth);
                    ProcessForCoreDamageActionData(CoreTag, I, myAIPawn.MyCoreData[I].Health);
                    ProcessForDotDamagePassing(I, myAIPawn.MyCoreData[I].Health);
                    ProcessCoreForGibbing(I, myAIPawn.MyCoreData[I].Health);
                    // End:0x420
                    if(myAIPawn.MyCoreData[I].Health <= float(0))
                    {
                        return myAIPawn.ShouldReportCoreAsDestroyed(I);
                    }                    
                }
                else
                {
                    ProcessForDotDamagePassing(I, myAIPawn.MyCoreData[I].Health);
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x5A;
        }
    }
    return false;
    //return ReturnValue;    
}

function HandleAnimNotifyFinishDestroyingCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTagForDestroyOnAnimNotify[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceDestroyCore[8388609];

    ProcessForAnyCoreDamageActionsWaitingOnAnimNotify();
    ProcessCoreForGibbingAnyCoreWaitingOnAnimNotify();
    //return;    
}

function ProcessForCoreDamageActionData()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CurrentCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float CurrentCoreHealth[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CoreID, iter;
    local /*0x97E50000-0x00000000*/ private float currentPercentOfHealth;

    CoreID = CoreTag.GetCoreId();
    iter = 0;
    J0x34:

    // End:0xB63 [Loop If]
    if(iter < myAIPawn.MyCoreDamageActionData.Length)
    {
        // End:0xB55
        if((CoreID == myAIPawn.MyCoreDamageActionData[iter].CoreID) && !myAIPawn.MyCoreDamageActionData[iter].bActivated)
        {
            currentPercentOfHealth = CurrentCoreHealth / myAIPawn.MyCoreData[CurrentCoreIndex].MaxHealth;
            // End:0xB55
            if(currentPercentOfHealth <= myAIPawn.MyCoreDamageActionData[iter].PercentOfHealth)
            {
                // End:0x244
                if(myAIPawn.MyCoreDamageActionData[iter].bOnlyActivateOnAnimNotify)
                {
                    myAIPawn.MyCoreDamageActionData[iter].bWaitingOnAnimNotifyToActivate = true;
                    myAIPawn.MyCoreDamageActionData[iter].bActivated = true;                    
                }
                else
                {
                    myAIPawn.MyCoreDamageActionData[iter].bActivated = true;
                    myAIPawn.Mesh.HideBoneByName(myAIPawn.MyCoreDamageActionData[iter].BoneToTurnOff, 1);
                    myAIPawn.Mesh.UnHideBoneByName(myAIPawn.MyCoreDamageActionData[iter].BoneToTurnOn);
                    // End:0x3FE
                    if(myAIPawn.MyCoreDamageActionData[iter].CoreToTurnOnId >= 0)
                    {
                        myAIPawn.EnableCoreById(myAIPawn.MyCoreDamageActionData[iter].CoreToTurnOnId, true);
                    }
                    // End:0x49A
                    if(myAIPawn.MyCoreDamageActionData[iter].GrabPointToTurnOn >= 0)
                    {
                        myAIPawn.SetGrabPointEnabledByIndex(myAIPawn.MyCoreDamageActionData[iter].GrabPointToTurnOn, true);
                    }
                    // End:0x536
                    if(myAIPawn.MyCoreDamageActionData[iter].GrabPointToTurnOff >= 0)
                    {
                        myAIPawn.SetGrabPointEnabledByIndex(myAIPawn.MyCoreDamageActionData[iter].GrabPointToTurnOff, false);
                    }
                    // End:0x5D2
                    if(myAIPawn.MyCoreDamageActionData[iter].WinchPointToTurnOn >= 0)
                    {
                        myAIPawn.SetWinchPointEnabledByIndex(myAIPawn.MyCoreDamageActionData[iter].WinchPointToTurnOn, true);
                    }
                    // End:0x66E
                    if(myAIPawn.MyCoreDamageActionData[iter].WinchPointToTurnOff >= 0)
                    {
                        myAIPawn.SetWinchPointEnabledByIndex(myAIPawn.MyCoreDamageActionData[iter].WinchPointToTurnOff, false);
                    }
                    DeactiveCoreLoopFxOnNewAction(CoreID);
                    // End:0x761
                    if(myAIPawn.MyCoreDamageActionData[iter].NameOfTempTuneDataFx != 'None')
                    {
                        myAIPawn.TuneDataPawnFXEventBindings.PlayEventFX(myAIPawn.MyCoreDamageActionData[iter].NameOfTempTuneDataFx, myAIPawn, myAIPawn.Mesh, none);
                    }
                    // End:0x87D
                    if(myAIPawn.MyCoreDamageActionData[iter].NameOfLoopingTuneDataFx != 'None')
                    {
                        myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop = myAIPawn.TuneDataPawnFXEventBindings.PlayEventFX(myAIPawn.MyCoreDamageActionData[iter].NameOfLoopingTuneDataFx, myAIPawn, myAIPawn.Mesh, none);
                    }
                    // End:0xA88
                    if(myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop != none)
                    {
                        myAIPawn.MyCoreDamageActionData[iter].TimeLoopingTuneDataFxStarted = myAIPawn.WorldInfo.TimeSeconds;
                        myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop.SetTickGroup(3);
                        myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop.__OnSystemFinished__Delegate = None;
                        myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop.bAutoActivate = false;
                        myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop.SetActive(true);
                    }
                    // End:0xB55
                    if(myAIPawn.MyCoreDamageActionData[iter].NameOfTempTuneDataSfx != 'None')
                    {
                        myAIPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally(myAIPawn.MyCoreDamageActionData[iter].NameOfTempTuneDataSfx, 'None', myAIPawn, none, none);
                    }
                }
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0x34;
    }
    return false;
    //return ReturnValue;    
}

function ProcessForAnyCoreDamageActionsWaitingOnAnimNotify()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0xA05 [Loop If]
    if(iter < myAIPawn.MyCoreDamageActionData.Length)
    {
        // End:0x9F7
        if((myAIPawn.MyCoreDamageActionData[iter].bActivated && myAIPawn.MyCoreDamageActionData[iter].bOnlyActivateOnAnimNotify) && myAIPawn.MyCoreDamageActionData[iter].bWaitingOnAnimNotifyToActivate)
        {
            myAIPawn.MyCoreDamageActionData[iter].bWaitingOnAnimNotifyToActivate = false;
            myAIPawn.Mesh.HideBoneByName(myAIPawn.MyCoreDamageActionData[iter].BoneToTurnOff, 1);
            myAIPawn.Mesh.UnHideBoneByName(myAIPawn.MyCoreDamageActionData[iter].BoneToTurnOn);
            // End:0x2B3
            if(myAIPawn.MyCoreDamageActionData[iter].CoreToTurnOnId >= 0)
            {
                myAIPawn.EnableCoreById(myAIPawn.MyCoreDamageActionData[iter].CoreToTurnOnId, true);
            }
            // End:0x34F
            if(myAIPawn.MyCoreDamageActionData[iter].GrabPointToTurnOn >= 0)
            {
                myAIPawn.SetGrabPointEnabledByIndex(myAIPawn.MyCoreDamageActionData[iter].GrabPointToTurnOn, true);
            }
            // End:0x3EB
            if(myAIPawn.MyCoreDamageActionData[iter].GrabPointToTurnOff >= 0)
            {
                myAIPawn.SetGrabPointEnabledByIndex(myAIPawn.MyCoreDamageActionData[iter].GrabPointToTurnOff, false);
            }
            // End:0x487
            if(myAIPawn.MyCoreDamageActionData[iter].WinchPointToTurnOn >= 0)
            {
                myAIPawn.SetWinchPointEnabledByIndex(myAIPawn.MyCoreDamageActionData[iter].WinchPointToTurnOn, true);
            }
            // End:0x523
            if(myAIPawn.MyCoreDamageActionData[iter].WinchPointToTurnOff >= 0)
            {
                myAIPawn.SetWinchPointEnabledByIndex(myAIPawn.MyCoreDamageActionData[iter].WinchPointToTurnOff, false);
            }
            // End:0x603
            if(myAIPawn.MyCoreDamageActionData[iter].NameOfTempTuneDataFx != 'None')
            {
                myAIPawn.TuneDataPawnFXEventBindings.PlayEventFX(myAIPawn.MyCoreDamageActionData[iter].NameOfTempTuneDataFx, myAIPawn, myAIPawn.Mesh, none);
            }
            // End:0x71F
            if(myAIPawn.MyCoreDamageActionData[iter].NameOfLoopingTuneDataFx != 'None')
            {
                myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop = myAIPawn.TuneDataPawnFXEventBindings.PlayEventFX(myAIPawn.MyCoreDamageActionData[iter].NameOfLoopingTuneDataFx, myAIPawn, myAIPawn.Mesh, none);
            }
            // End:0x92A
            if(myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop != none)
            {
                myAIPawn.MyCoreDamageActionData[iter].TimeLoopingTuneDataFxStarted = myAIPawn.WorldInfo.TimeSeconds;
                myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop.SetTickGroup(3);
                myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop.__OnSystemFinished__Delegate = None;
                myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop.bAutoActivate = false;
                myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop.SetActive(true);
            }
            // End:0x9F7
            if(myAIPawn.MyCoreDamageActionData[iter].NameOfTempTuneDataSfx != 'None')
            {
                myAIPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally(myAIPawn.MyCoreDamageActionData[iter].NameOfTempTuneDataSfx, 'None', myAIPawn, none, none);
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function ProcessForDotDamagePassing()
{
    local /*0x97E50000-0x00000000*/ private int CurrentCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float CurrentCoreHealth[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float currentPercentOfHealth;
    local /*0x97E50000-0x00000000*/ private class typeOfDamageToTestAgainst;
    local /*0x97E50000-0x00000000*/ private @NULL dotInfoForOtherCore;

    iter = 0;
    J0x0B:

    // End:0x684 [Loop If]
    if(iter < myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List.Length)
    {
        // End:0x676
        if(!myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].bDamageHasBeenPassed)
        {
            typeOfDamageToTestAgainst = myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].TypeOfDamageAllowedToPass;
            // End:0x42E
            if(ClassIsChildOf(myAIPawn.TakeDamageParams.DamageType, typeOfDamageToTestAgainst))
            {
                // End:0x24D
                if(myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].InfoForDot.DamageCauser == none)
                {
                    SetUpPassDotInfo(dotInfoForOtherCore, CurrentCoreIndex, iter);
                    myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].InfoForDot = dotInfoForOtherCore;
                }
                currentPercentOfHealth = CurrentCoreHealth / myAIPawn.MyCoreData[CurrentCoreIndex].MaxHealth;
                // End:0x42B
                if(currentPercentOfHealth <= myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].HealthPercentToPassAt)
                {
                    myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].bDamageHasBeenPassed = true;
                    dotInfoForOtherCore = myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].InfoForDot;
                    StartDotOnOtherCore(dotInfoForOtherCore, myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].IndexOtherCoreToPassTo);
                }                
            }
            else
            {
                typeOfDamageToTestAgainst = myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].TypeOfDamagePrecursorToLookFor;
                // End:0x676
                if(ClassIsChildOf(myAIPawn.TakeDamageParams.DamageType, typeOfDamageToTestAgainst))
                {
                    // End:0x676
                    if(myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].InfoForDot.DamageCauser == none)
                    {
                        SetUpPassDotInfo(dotInfoForOtherCore, CurrentCoreIndex, iter);
                        myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].InfoForDot = dotInfoForOtherCore;
                        // End:0x676
                        if(myAIPawn.MyCoreData[CurrentCoreIndex].Health <= float(0))
                        {
                            StartDotOnOtherCore(dotInfoForOtherCore, myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[iter].IndexOtherCoreToPassTo);
                        }
                    }
                }
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function SetUpPassDotInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutDotInfo[25165825];
    local /*0x97E50000-0x00000000*/ private int CurrentCoreIndex[8388609], OutherCoreIter;
    local /*0x97E50000-0x00000000*/ private bool bdotDataFound;

    // End:0x403
    if(myAIPawn.TakeDamageParams.InstigatedByPawn != none)
    {
        bdotDataFound = myAIPawn.TakeDamageParams.InstigatedByPawn.GetDOTInfoFromAttacker(myAIPawn, myAIPawn.TakeDamageParams, OutDotInfo);
        // End:0x10B
        if(!bdotDataFound && LastPassibleDotInfoGrabbed.DamageCauser != none)
        {
            OutDotInfo = LastPassibleDotInfoGrabbed;
            bdotDataFound = true;
        }
        // End:0x403
        if(bdotDataFound)
        {
            myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[OutherCoreIter].IndexOtherCoreToPassTo = myAIPawn.GetCoreIndexForThisCoreId(myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[OutherCoreIter].OtherCoreToPassTo);
            OutDotInfo.EffectBoneName = myAIPawn.MyCoreData[myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[OutherCoreIter].IndexOtherCoreToPassTo].DOTEffectSocketName;
            // End:0x309
            if(OutDotInfo.EffectBoneName == 'None')
            {
                OutDotInfo.EffectBoneName = myAIPawn.TuneDataAIPawn.DefaultDOTEffectSocketName;
            }
            // End:0x3B5
            if(!OutDotInfo.CausedByDamageType.default.bCausesPoison)
            {
                OutDotInfo.EffectPhysicalMaterial = myAIPawn.MyCoreData[CurrentCoreIndex].CoresToAlsoDamageWhenDOT_List[OutherCoreIter].PhysicalMaterialForOtherCore;
            }
            OutDotInfo.HitComponent = myAIPawn.Mesh;
            LastPassibleDotInfoGrabbed = OutDotInfo;
        }
    }
    //return;    
}

function StartDotOnOtherCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL DOTInfo[25296897];
    local /*0x97E50000-0x00000000*/ private int CoreIdx[8388609];

    myAIPawn.ForceActivateDOT(DOTInfo);
    //return;    
}

simulated function ProcessCoreForGibbing()
{
    local /*0x97E50000-0x00000000*/ private int CurrentCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float CurrentCoreHealth[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float currentPercentOfHealth;
    local /*0x97E50000-0x00000000*/ private @NULL SPPC;
    local /*0x97E50000-0x00000000*/ private bool bshouldSpawn;
    local /*0x97E50000-0x00000000*/ private float randChanceToSpawn;

    // End:0x38
    foreach myAIPawn.LocalPlayerControllers(Class'SPEngine.SPPlayerController', SPPC)
    {
        // End:0x38
        break;        
    }    
    currentPercentOfHealth = CurrentCoreHealth / myAIPawn.MyCoreData[CurrentCoreIndex].MaxHealth;
    iter = 0;
    J0x94:

    // End:0x792 [Loop If]
    if(iter < myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList.Length)
    {
        bshouldSpawn = true;
        // End:0x784
        if(((((SPPC != none) && SPPC.CurNumOfDamageGibInstigated < SPPC.GetMaxNumberOfDamageGibsForThisController()) && myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].TheGib == none) && myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].TheGibInfo != none) && currentPercentOfHealth <= myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].HealthPercentToGibAt)
        {
            // End:0x357
            if(myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].ChanceToSpawn < 0.9900000)
            {
                randChanceToSpawn = FRand();
                // End:0x348
                if(randChanceToSpawn <= myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].ChanceToSpawn)
                {
                    bshouldSpawn = true;                    
                }
                else
                {
                    bshouldSpawn = false;
                }                
            }
            else
            {
                bshouldSpawn = true;
            }
            // End:0x784
            if(bshouldSpawn)
            {
                // End:0x5C8
                if(myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].bOnlyActivateOnAnimNotify)
                {
                    myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].bWaitingOnAnimNotifyToGib = true;
                    myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].HitLocationForDelayedGibbing = myAIPawn.TakeDamageParams.HitLocation;
                    myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].DamageTypeForDelayedGibbing = myAIPawn.TakeDamageParams.DamageType;
                    myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].InstigatedByPawnForDelayedGibbing = myAIPawn.TakeDamageParams.InstigatedByPawn;                    
                }
                else
                {
                    myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].TheGib = myAIPawn.SpawnGib(myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].TheGibInfo, myAIPawn.MyCoreData[CurrentCoreIndex].CoreGibStatusList[iter].TheGibOverrideInfo, myAIPawn.TakeDamageParams.InstigatedByPawn, myAIPawn.TakeDamageParams.DamageType, myAIPawn.TakeDamageParams.HitLocation, true);
                }
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0x94;
    }
    //return;    
}

simulated function ProcessCoreForGibbingAnyCoreWaitingOnAnimNotify()
{
    local /*0x97E50000-0x00000000*/ private int iterGib, iterCore;
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc;

    iterCore = 0;
    J0x0B:

    // End:0x45C [Loop If]
    if(iterCore < myAIPawn.MyCoreData.Length)
    {
        iterGib = 0;
        J0x43:

        // End:0x44E [Loop If]
        if(iterGib < myAIPawn.MyCoreData[iterCore].CoreGibStatusList.Length)
        {
            // End:0x440
            if(myAIPawn.MyCoreData[iterCore].CoreGibStatusList[iterGib].bOnlyActivateOnAnimNotify && myAIPawn.MyCoreData[iterCore].CoreGibStatusList[iterGib].bWaitingOnAnimNotifyToGib)
            {
                myAIPawn.MyCoreData[iterCore].CoreGibStatusList[iterGib].bWaitingOnAnimNotifyToGib = false;
                HitLoc = myAIPawn.MyCoreData[iterCore].CoreGibStatusList[iterGib].HitLocationForDelayedGibbing;
                myAIPawn.MyCoreData[iterCore].CoreGibStatusList[iterGib].TheGib = myAIPawn.SpawnGib(myAIPawn.MyCoreData[iterCore].CoreGibStatusList[iterGib].TheGibInfo, myAIPawn.MyCoreData[iterCore].CoreGibStatusList[iterGib].TheGibOverrideInfo, myAIPawn.MyCoreData[iterCore].CoreGibStatusList[iterGib].InstigatedByPawnForDelayedGibbing, myAIPawn.MyCoreData[iterCore].CoreGibStatusList[iterGib].DamageTypeForDelayedGibbing, HitLoc, true);
                myAIPawn.MyCoreData[iterCore].CoreGibStatusList[iterGib].InstigatedByPawnForDelayedGibbing = none;
            }
            ++iterGib;
            // [Loop Continue]
            goto J0x43;
        }
        ++iterCore;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

final function GetPassThroughFactor()
{
    local /*0x97E50000-0x00000000*/ private int CoreHitIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int ifilter;
    local /*0x97E50000-0x00000000*/ private class CurrentDmgTypeChecking;

    ifilter = 0;
    J0x0B:

    // End:0x1D8 [Loop If]
    if(ifilter < myAIPawn.MyCoreData[CoreHitIndex].ByDamageTypePassThroughFilter.Length)
    {
        CurrentDmgTypeChecking = myAIPawn.MyCoreData[CoreHitIndex].ByDamageTypePassThroughFilter[ifilter].DamageType;
        // End:0x1CA
        if(ClassIsChildOf(myAIPawn.TakeDamageParams.DamageType, CurrentDmgTypeChecking))
        {
            // End:0x15B
            if(myAIPawn.MyCoreData[CoreHitIndex].ByDamageTypePassThroughFilter[ifilter].DamageFactor == none)
            {
                return 1.0000000;
            }
            return myAIPawn.MyCoreData[CoreHitIndex].ByDamageTypePassThroughFilter[ifilter].DamageFactor.GetValue();
        }
        ++ifilter;
        // [Loop Continue]
        goto J0x0B;
    }
    return myAIPawn.MyCoreData[CoreHitIndex].DefaultDamagePassThroughFactor;
    //return ReturnValue;    
}

function CanVSMeleeDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CanDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((((CoreTag != none) && !bIsVSMeleeDamage || CanVSMeleeDamageCore(CoreTag)) && myAIPawn.IsValidCoreTagType(CoreTag)) && myAIPawn.CanDamageCoreID(CoreTag.GetCoreId(), myAIPawn.TakeDamageParams.DamageType, myAIPawn.TakeDamageParams.DamageCauser)) && LPAIControllerAkrid(myAIPawn.Controller).CanDamageCore(CoreTag);
    //return ReturnValue;    
}

function GetDOTEffectSocketName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x96
    if((HitCoreIndex >= 0) && myAIPawn.MyCoreData[HitCoreIndex].DOTEffectSocketName != 'None')
    {
        return myAIPawn.MyCoreData[HitCoreIndex].DOTEffectSocketName;
    }
    return myAIPawn.TuneDataBasePawn.DefaultDOTEffectSocketName;
    //return ReturnValue;    
}

function GetTakeDamageAmount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return int(FMax(PotentialDamage, float(myAIPawn.TakeDamageParams.Damage)));
    //return ReturnValue;    
}

final function SetAIReactionDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];

    ReactionCommandDelegate = InDelegate;
    //return;    
}

final function SetAdditiveTemplateRoot()
{
    local /*0x97E50000-0x00000000*/ private @NULL Root[8388609];

    ReactionAdditiveTemplateRoot = Root;
    //return;    
}

final function GetAdditiveTemplateRoot()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ReactionAdditiveTemplateRoot;
    //return ReturnValue;    
}

function DHD_BasicHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    LPC.CmdHitReaction(0.0000000);
    //return;    
}

simulated function DeactiveCoreLoopFxOnNewAction()
{
    local /*0x97E50000-0x00000000*/ private int CoreID[8388609], iter;

    iter = 0;
    J0x0B:

    // End:0x19C [Loop If]
    if(iter < myAIPawn.MyCoreDamageActionData.Length)
    {
        // End:0x84
        if(myAIPawn.MyCoreDamageActionData[iter].CoreID != CoreID)
        {            
        }
        else
        {
            // End:0xC8
            if(myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop == none)
            {                
            }
            else
            {
                // End:0x10C
                if(!myAIPawn.MyCoreDamageActionData[iter].bDestroyLoopFxOnNextCoreHealthAction)
                {                    
                }
                else
                {
                    TurnOffThisLoopingDamageAction(myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop);
                    myAIPawn.MyCoreDamageActionData[iter].ActionParticleLoop = none;
                }
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}
