class LPBaseVSPlayerPawn extends LPBasePlayerPawn
    nativereplication
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

struct CheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL VSRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SnowMinimum;

    structdefaultproperties
    {
        VSRecord=(MyGuid=(A=0,B=0,C=0,D=0),LPPawnRecord=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName=""),bReplicated=false,bHidden=false,bIsPossessedByPlayer=false,bMusicTrackPlaying=false,bMusicTrackPaused=false,bPlayerInVitalSuit=false,MusicTrackPlayed=0,WinchLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000),bIsPlatformMode=false,bDesignerForcedVacantVSAttachmentsOff=false,bDesignerForcedLightAttachments=false)
        SnowMinimum=0.0000000
    }
};

struct native VSExtractInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOnPocket;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Location;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Rotation;

    structdefaultproperties
    {
        bOnPocket=false
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool InEMPShutdown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPossessedByPlayer[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldHoldAnticipation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBlockAnticiption;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceAnticipation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowAiAttachmentDebugInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRenderInForegroundWhenInCockpit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPlatformMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPlatformModeFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDesignerForcedVacantVSAttachmentsOff;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDesignerForcedLightAttachments;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bKillingPlayerInsideVS[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EMPShutdownInstigator;
var(0.25_Pct) /*0xCECA0000-0x00000000*/ private @NULL TuneDataVSPlayerPawn[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerVSLogicAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSRightArmPartAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int VSGrenadesLeft;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AnticipationCheckInterval;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FXAction_VS;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UpperBodyBlendPerBone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastDriver;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSExtractInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResBurrowerVS[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResDefenderVS[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL AIResNushiSporeVS[524289];
var(0.25_Pct) /*0xABD20000-0x00000000*/ private @NULL RepairInfographic[65537];
var(0.25_Pct) /*0xABD20000-0x00000400*/ private const export @NULL RepairableComponent[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovie;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GFxFlashMovieInstanceClass;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EMPEffectComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EMPSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string EnterPromptString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ExitPromptString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string RotateVSPromptString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TEngAbsorberParticleDestination;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxExitGroundHeightDifferenceUp[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxExitGroundHeightDifferenceDown[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array ExtraLensFlareAttachmentsForVacantVS[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array ExtraStaticMeshComponentsForVacantVS[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array ExtraLightComponents[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SnowPercent[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SnowBlendTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editconst float SnowMeltRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editconst float SnowMinimum;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int HUDMaterialIndex;

// Export ULPBaseVSPlayerPawn::execUseContextSensitiveAnimObject(FFrame&, void* const)
native simulated function UseContextSensitiveAnimObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL CSA[8388609];
    local /*0x97E50000-0x00000000*/ private float BlendTime[8388609];


}

// Export ULPBaseVSPlayerPawn::execCanBreakFracturedStaticMeshActor(FFrame&, void* const)
native function CanBreakFracturedStaticMeshActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InFracturedStaticMeshActor[8519681];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPBaseVSPlayerPawn::execGetPawnViewLocation(FFrame&, void* const)
native simulated function GetPawnViewLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPBaseVSPlayerPawn::execCanAim(FFrame&, void* const)
native simulated function CanAim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPBaseVSPlayerPawn::execIsAiming(FFrame&, void* const)
native simulated function IsAiming()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPBaseVSPlayerPawn::execTakeDamage_SetParams(FFrame&, void* const)
native simulated function TakeDamage_SetParams()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], InHitLocation, InMomentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], InstigatedByPawn, DamageCauser;
    local /*0x97E50000-0x00000000*/ private bool bShouldPlayHitReactAnim[9437185], bShouldPlayHitEffects;

    true
    true                                                
}

// Export ULPBaseVSPlayerPawn::execGetVSDamageFactor(FFrame&, void* const)
native final function GetVSDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPBaseVSPlayerPawn::execInitSpecialAttachments(FFrame&, void* const)
native final simulated function InitSpecialAttachments();

// Export ULPBaseVSPlayerPawn::execUpdateVacantVSAttachmentsState(FFrame&, void* const)
native final simulated function UpdateVacantVSAttachmentsState();

// Export ULPBaseVSPlayerPawn::execGetSnowFactor(FFrame&, void* const)
native final simulated function GetSnowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

function OnKillPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], LPPC;

    // End:0xA3
    if(inAction.ForceKillPlayerIfInVS)
    {
        LPPC = LPPlayerController(Controller);
        // End:0xA3
        if(LPPC != none)
        {
            LPPC.GotoState('Dead');
            Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            SetPhysics(0);
        }
    }
    //return;    
}

function OnToggleVacantVSAttachments()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bDesignerForcedVacantVSAttachmentsOff = false;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bDesignerForcedVacantVSAttachmentsOff = true;            
        }
        else
        {
            // End:0xDB
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bDesignerForcedVacantVSAttachmentsOff = !bDesignerForcedVacantVSAttachmentsOff;
            }
        }
    }
    UpdateVacantVSAttachmentsState();
    //return;    
}

function OnToggleVSLights()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bDesignerForcedLightAttachments = true;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bDesignerForcedLightAttachments = false;            
        }
        else
        {
            // End:0xDB
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bDesignerForcedLightAttachments = !bDesignerForcedLightAttachments;
            }
        }
    }
    UpdateVSLightAttachmentState();
    //return;    
}

function UpdateVSLightAttachmentState()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x7D [Loop If]
    if(Idx < ExtraLightComponents.Length)
    {
        // End:0x6F
        if(ExtraLightComponents[Idx] != none)
        {
            ExtraLightComponents[Idx].SetEnabled(bDesignerForcedLightAttachments);
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function OnToggleVSAnticipationMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x52
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bBlockAnticiption = false;
        bForceAnticipation = true;        
    }
    else
    {
        // End:0xA4
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bBlockAnticiption = true;
            bForceAnticipation = false;            
        }
        else
        {
            // End:0xF4
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bBlockAnticiption = false;
                bForceAnticipation = false;
            }
        }
    }
    //return;    
}

function OnSetVSMinSnowiness()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    SnowMinimum = inAction.MinSnowiness;
    SnowBlendTime = inAction.BlendTime;
    //return;    
}

simulated function PlayerCanEnter()
{
    local /*0x97E50000-0x00000000*/ private @NULL EntryPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function IsVitalSuit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    // End:0xEC
    if(((int(Role) == int(ROLE_Authority)) && Controller == none) && !IsDoingASpecialMove() || LPSM_VSWaitEntryBegin(GetCurrentSpecialMoveInstance()) != none)
    {
        Velocity.X = 0.0000000;
        Velocity.Y = 0.0000000;
        Acceleration.X = 0.0000000;
        Acceleration.Y = 0.0000000;
    }
    ShowVsAiAttachmentDebugInfo(DeltaTime);
    UpdateAnticipation(DeltaTime);
    // End:0x183
    if(IsLocallyControlled())
    {
        // End:0x180
        if(!IsTimerActive('SearchForThermalPickups'))
        {
            // End:0x180
            if(LPPlayerController(Controller).HasUpgrade(Class'LPVSUpgrade_ThermalEnergyAbsorber'))
            {
                SetTimer(0.2500000, true, 'SearchForThermalPickups');
            }
        }        
    }
    else
    {
        // End:0x1AE
        if(IsTimerActive('SearchForThermalPickups'))
        {
            ClearTimer('SearchForThermalPickups');
        }
    }
    // End:0x2C6
    if(DamageStateComponent != none)
    {
        // End:0x1F5
        if(SnowBlendTime == 0.0000000)
        {
            SnowPercent = SnowMinimum;
            SnowBlendTime = -1.0000000;            
        }
        else
        {
            // End:0x24F
            if(SnowBlendTime > float(0))
            {
                SnowBlendTime -= DeltaTime;
                SnowPercent = Lerp(SnowPercent, SnowMinimum, DeltaTime / SnowBlendTime);                
            }
            else
            {
                // End:0x292
                if(SnowPercent < SnowMinimum)
                {
                    SnowPercent = SnowPercent + (SnowMeltRate * DeltaTime);                    
                }
                else
                {
                    SnowPercent = FMax(SnowMinimum, SnowPercent - (SnowMeltRate * DeltaTime));
                }
            }
        }
    }
    //return;    
}

simulated function SearchForThermalPickups()
{
    local /*0x97E50000-0x00000000*/ private @NULL MapInfo, TEP;
    local /*0x97E50000-0x00000000*/ private float fRange;
    local /*0x97E50000-0x00000000*/ private @NULL Upgrade, TD, LPP;

    MapInfo = LPMapInfo(WorldInfo.GetMapInfo(true));
    // End:0x44
    if(MapInfo == none)
    {
        return;
    }
    // End:0x99
    if(!LPPlayerController(Controller).HasUpgrade(Class'LPVSUpgrade_ThermalEnergyAbsorber', Upgrade))
    {
        ClearTimer('SearchForThermalPickups');
        return;
    }
    TD = LPTuneDataVSUpgrade_ThermalEnergyAbsorber(Upgrade.GetTuneData());
    // End:0xF0
    if(TD == none)
    {
        ClearTimer('SearchForThermalPickups');
        return;
    }
    // End:0x185
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        LPP = LPPlayerController(Controller).GetMyPlayerPawn();
        // End:0x185
        if((LPP != none) && LPP.GetTEnergyPercentage() >= float(1))
        {
            return;
        }
    }
    fRange = TD.EffectiveRange.GetValue();
    fRange = fRange * fRange;
    // End:0x2F1
    foreach MapInfo.ThermalPickupList(TEP)
    {
        // End:0x2F0
        if(VSizeSq2D(TEP.Location - Location) <= fRange)
        {
            // End:0x2A3
            if(TuneDataVSPlayerPawn.AbsorbtionParticle != none)
            {
                SpawnAbsorberParticles(TEP, TuneDataVSPlayerPawn.AbsorbtionParticle);
            }
            // End:0x2DA
            if(int(Role) == int(ROLE_Authority))
            {
                TEP.GiveTo(self);                
            }
            else
            {
                ServerGiveThermalPickupToPawn(TEP);
            }            
        }
        else
        {            
        }
    }    
    //return;    
}

simulated function @NULL SpawnAbsorberParticles()
{
    local /*0x97E50000-0x00000000*/ private @NULL Inv[8388609], PS, ThePool;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Source, Dest, Comp;

    ThePool = SPEmitterPool(WorldInfo.MyEmitterPool);
    Source = Inv.Location;
    // End:0xB1
    if(!Mesh.GetSocketWorldLocationAndRotation(TEngAbsorberParticleDestination, Dest))
    {
        Dest = self.Location;
    }
    Comp = ThePool.SPSpawnEmitter(PS, Source);
    // End:0x1F2
    if(Comp != none)
    {
        Comp.ActivateSystem();
        I = 0;
        J0x12B:

        // End:0x1F2 [Loop If]
        if(I < Comp.EmitterInstances.Length)
        {
            Comp.SetBeamSourcePoint(I, Source, 0);
            Comp.SetBeamEndPoint(I, Dest);
            Comp.SetKillOnDeactivate(I, true);
            ++I;
            // [Loop Continue]
            goto J0x12B;
        }
    }
    //return;    
}

reliable server function ServerGiveThermalPickupToPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pickup[8388609];

    // End:0x2F
    if(Pickup != none)
    {
        Pickup.GiveTo(self);
    }
    //return;    
}

function NotifyDefenderCountChanged()
{
    //return;    
}

simulated event ShowVsAiAttachmentDebugInfo()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function CheckMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];

    //return;    
}

function ShouldStartRegenCycle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function StartRegenCycle()
{
    //return;    
}

simulated function CanAccessMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (((LPPC != none) && !bIsPossessedByPlayer) && !LPPC.bIsVitalSuitEntryLockedByKismet) && !IsDoingASpecialMove() || BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_AllowMunitionsLockerAccess, self);
    //return ReturnValue;    
}

simulated function UpdateAnticipation()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], MinRange, Range;
    local /*0x97E50000-0x00000000*/ private @NULL A, LPPC;

    // End:0x25
    if((int(Role) != int(ROLE_Authority)) || InEMPShutdown)
    {
        return;
    }
    // End:0x3E
    if(ShouldStartRegenCycle())
    {
        StartRegenCycle();
        return;
    }
    // End:0x7A
    if(bBlockAnticiption)
    {
        // End:0x78
        if(IsDoingSpecialMove(Class'LPSM_VSWaitEntryBegin'))
        {
            DoSpecialMove(Class'LPSM_VSWaitEntryEnd', true, true);
        }
        return;
    }
    // End:0xB8
    if(bForceAnticipation)
    {
        // End:0xB6
        if(!IsDoingSpecialMove(Class'LPSM_VSWaitEntryBegin'))
        {
            DoSpecialMove(Class'LPSM_VSWaitEntryBegin', true, true);
        }
        return;
    }
    AnticipationCheckInterval -= DeltaTime;
    // End:0x361
    if(AnticipationCheckInterval < 0.0000000)
    {
        AnticipationCheckInterval = Class'LPBaseVSPlayerPawn'.default.AnticipationCheckInterval;
        MinRange = TuneDataVSPlayerPawn.RangeAnticipateEnd + float(1);
        // End:0x23F
        foreach WorldInfo.AllPawns(Class'LPPlayerPawn', A)
        {
            LPPC = LPPlayerController(A.Controller);
            // End:0x23E
            if(LPPC != none)
            {
                // End:0x22B
                if(LPPC.CanEnterAnyVitalSuit())
                {
                    Range = VSize(A.Location - Location);
                    // End:0x22B
                    if(Range < MinRange)
                    {
                        MinRange = Range;
                    }
                }
                CheckMunitionsLocker(LPPC);
            }            
        }        
        // End:0x2F1
        if(CanAnticipatePlayerEntry())
        {
            // End:0x2AB
            if(!IsDoingSpecialMove(Class'LPSM_VSWaitEntryBegin'))
            {
                // End:0x2A8
                if(MinRange < TuneDataVSPlayerPawn.RangeAnticipateBegin)
                {
                    DoSpecialMove(Class'LPSM_VSWaitEntryBegin', true, true);
                }                
            }
            else
            {
                // End:0x2EE
                if(MinRange > TuneDataVSPlayerPawn.RangeAnticipateEnd)
                {
                    DoSpecialMove(Class'LPSM_VSWaitEntryEnd', true, true);
                }
            }            
        }
        else
        {
            // End:0x361
            if(IsDoingSpecialMove(Class'LPSM_VSWaitEntryBegin'))
            {
                // End:0x34A
                if(int(WorldInfo.NetMode) == int(NM_Standalone))
                {
                    DoSpecialMove(Class'LPSM_VSWaitEntryEnd', true, true);                    
                }
                else
                {
                    ServerDoSpecialMove(Class'LPSM_VSWaitEntryEnd', true, true);
                }
            }
        }
    }
    //return;    
}

simulated function CanAnticipatePlayerEntry()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x51
    if(!bIsPossessedByPlayer)
    {
        // End:0x4F
        if(IsDoingASpecialMove())
        {
            // End:0x4C
            if(IsDoingSpecialMove(Class'LPSM_VSWaitEntryBegin') || IsDoingSpecialMove(Class'LPSM_VSWaitEntryEnd'))
            {
                return true;
            }            
        }
        else
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated event HeadBoneName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'JO_PlayerCamera';
    //return ReturnValue;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    bKillingPlayerInsideVS = false;
    InitSpecialAttachments();
    SetMeshLodForOutsideCockpit();
    // End:0x74
    if(FXActionManagerInstance != none)
    {
        FXAction_VS = LPFXAction_VS(FXActionManagerInstance.StartFXAction(Class'LPFXAction_VS'));
    }
    // End:0xA2
    if(AIResBurrowerVS != none)
    {
        AIResBurrowerVS.Init();
    }
    AIResDefenderVS.Init();
    AIResNushiSporeVS.Init();
    UsePlayerStepHeight();
    // End:0x127
    if(HUDMaterialIndex != -1)
    {
        Mesh.ShowMaterialSection(HUDMaterialIndex, false, 0);
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataVSPlayerPawn = LPTuneDataVSPlayerPawn(TuneData);
    super.InitTuneData(TuneData);
    RBPushStrength = TuneDataVSPlayerPawn.PhysicsPushStrength;
    //return;    
}

simulated function InitAnimTemplates()
{
    super(LPPawn).InitAnimTemplates();
    //return;    
}

simulated function @NULL PerformPostInitAnimTreeActions()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super(LPPawn).PerformPostInitAnimTreeActions(SkelComp);
    UpperBodyBlendPerBone = LPAnimNodeBlendPerBone(SkelComp.FindAnimNode('UpperBodyBlendPerBone'));
    UpperBodyBlendPerBone.SetBlendTarget(1.0000000, 0.0000000);
    //return;    
}

simulated function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DesiredTree;

    DesiredTree = super(SPPawn).GetAnimTemplateTreeForSpecialMove(SpecialMove);
    // End:0x36
    if(DesiredTree == none)
    {
        return PlayerVSLogicAnimTree;
    }
    return DesiredTree;
    //return ReturnValue;    
}

simulated function GetAnimTemplateTreeForFXAction()
{
    local /*0x97E50000-0x00000000*/ private class FXAction[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return PlayerVSLogicAnimTree;
    //return ReturnValue;    
}

reliable server function ServerDoTraceDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185];

    HitActor.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, self);
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super(Pawn).PossessedBy(C, bVehicleTransition);
    // End:0xBC
    if(C.IsA('PlayerController'))
    {
        bIsPossessedByPlayer = true;
        // End:0x78
        if(C.IsLocalPlayerController())
        {
            LocalPlayerEnteringVS();
        }
        LastDriver = LPPlayerController(C);
        MaxStepHeight = TuneDataBasePawn.MaxStepHeight;
    }
    //return;    
}

function UnPossessed()
{
    super(Pawn).UnPossessed();
    // End:0x39
    if(!bKillingPlayerInsideVS)
    {
        UsePlayerStepHeight();
        bIsPossessedByPlayer = false;
        LocalPlayerExitingVS();
    }
    //return;    
}

function UsePlayerStepHeight()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0xCE [Loop If]
    if(CurPawn != none)
    {
        // End:0xA3
        if(LPPlayerPawn(CurPawn) != none)
        {
            // End:0xA3
            if(CurPawn.MaxStepHeight < MaxStepHeight)
            {
                MaxStepHeight = CurPawn.MaxStepHeight;
            }
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

exec function ExitVSSpec()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Param[8388609];

    LPPlayerPawn(LPPlayerController(Controller).HumanPlayerPawn).ExitVSSpec(Param);
    //return;    
}

simulated function @NULL LocalPlayerEnteringVS()
{
    local /*0x97E50000-0x00000400*/ private @NULL VSReadySound;

    VSReadySound = AudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSInitialized', 'None', self, none, none));
    // End:0xD8
    if((VSReadySound != none) && self.IsA('LPVSFuturePlayerPawn'))
    {
        VSReadySound.bAutoDestroy = false;
        VSReadySound.bStopWhenOwnerDestroyed = true;
        VSReadySound.bUseOwnerLocation = true;
    }
    SetMeshLodForInsideCockpit();
    //return;    
}

simulated function LocalPlayerExitingVS()
{
    SetMeshLodForOutsideCockpit();
    //return;    
}

function LineSweepHitTesterHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897], LPC;

    // End:0x4C
    if(Info.Impact.HitActor.Base == self)
    {
        return;
    }
    super(SPAIPawn).LineSweepHitTesterHitSomethingNew(Info);
    // End:0xEC
    if(TuneDataVSPlayerPawn.MeleeForceFeedbackOnImpact != none)
    {
        LPC = LPPlayerController(Controller);
        // End:0xEC
        if(LPC != none)
        {
            LPC.ClientPlayForceFeedbackWaveform(TuneDataVSPlayerPawn.MeleeForceFeedbackOnImpact);
        }
    }
    //return;    
}

exec function HitRxn()
{
    PlayHitReactionAnimation();
    //return;    
}

simulated function StartSpitterAcidEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpitterPawn[8388609], AcidVS;

    // End:0xCF
    if(FXActionManagerInstance != none)
    {
        AcidVS = LPFXAction_SpitterAcidVS(FXActionManagerInstance.GetFXAction(Class'LPFXAction_SpitterAcidVS'));
        // End:0xCF
        if((AcidVS != none) && !AcidVS.IsActive())
        {
            AcidVS.SetSpitterPawn(SpitterPawn);
            FXActionManagerInstance.StartFXAction(Class'LPFXAction_SpitterAcidVS');
        }
    }
    //return;    
}

simulated function PlayTakeDamageEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL PhysMat;

    super.PlayTakeDamageEffects();
    // End:0x141
    if(((TakeDamageParams.Damage > 0) && ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeSpitterAcid')) && LPAIPawnSpitter(TakeDamageParams.InstigatedByPawn) != none)
    {
        // End:0x141
        if(bIsPossessedByPlayer)
        {
            PhysMat = LPPhysicalMaterial(TakeDamageParams.HitInfo.PhysMaterial);
            // End:0x141
            if(PhysMat != none)
            {
                // End:0x141
                if(PhysMat.GetTag(Class'LPPhysMatPropTag_SpitterResinTarget') != none)
                {
                    StartSpitterAcidEffects(LPAIPawnSpitter(TakeDamageParams.InstigatedByPawn));
                }
            }
        }
    }
    //return;    
}

function AddVelocity()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewVelocity[8388609], HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185];
    local /*0x97E50000-0x00000000*/ private class LPDT;

    LPDT = class<LPDamageType>(DamageType);
    // End:0x54
    if((LPDT == none) || !LPDT.default.bAllowMomentumTransferForVS)
    {
        return;
    }
    super(LPPawn).AddVelocity(NewVelocity, HitLocation, DamageType, HitInfo);
    //return;    
}

simulated function DoHandleEMP()
{
    local /*0x97E50000-0x00000000*/ private name TargetControllerState[8388609];

    // End:0x1C4
    if(!InEMPShutdown)
    {
        InEMPShutdown = true;
        bIncapacitated = true;
        EMPShutdownInstigator = LPPawn(EMPInfo.EMPInstigator);
        // End:0x88
        if(Controller != none)
        {
            Controller.GotoState(TargetControllerState);
        }
        // End:0x134
        if(EMPEffectComponent == none)
        {
            EMPEffectComponent = TuneDataPawnFXEventBindings.PlayEventFX('EMPHit', self, Mesh, none);
            // End:0x134
            if(EMPEffectComponent != none)
            {
                EMPEffectComponent.__OnSystemFinished__Delegate = None;
                EMPEffectComponent.SetActive(true);
            }
        }
        // End:0x1C4
        if(EMPSoundComponent == none)
        {
            EMPSoundComponent = AudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('EMPHit', 'EMPHit', self, Mesh, none));
            // End:0x1C4
            if(EMPSoundComponent != none)
            {
                EMPSoundComponent.bStopWhenOwnerDestroyed = true;
            }
        }
    }
    //return;    
}

simulated function EndEMPEffect()
{
    super(LPPawn).EndEMPEffect();
    bIncapacitated = false;
    InEMPShutdown = false;
    // End:0x5B
    if(EMPEffectComponent != none)
    {
        EMPEffectComponent.DeactivateSystem();
        EMPEffectComponent = none;
    }
    // End:0x9E
    if(EMPSoundComponent != none)
    {
        EMPSoundComponent.FadeOut(0.5000000, 0.0000000);
        EMPSoundComponent = none;
    }
    // End:0xD0
    if(Controller != none)
    {
        Controller.GotoState('PlayerWalking');
    }
    //return;    
}

simulated function StartEMP()
{
    // End:0xCB
    if((EMPInfo.EMPInstigator != none) && ClassIsChildOf(EMPInfo.EMPInstigator.Class, Class'LPAIPawnVsLaroche'))
    {
        LPAIControllerVsLaroche(EMPInfo.EMPInstigator.Controller).ChangeCurrentLarocheMacroCombatState(7);
        DoHandleEMP('VSLaRocheEMPAnimInto');
        return;
    }
    // End:0x20E
    if((((bIsPossessedByPlayer && EMPInfo.EMPInstigator != none) && ClassIsChildOf(EMPInfo.EMPInstigator.Controller.Class, Class'LPPlayerController')) && int(EMPInfo.EMPInstigator.GetTeamNum()) != int(GetTeamNum())) && !IsTimerActive('EndEMPEffect'))
    {
        LPPlayerController(EMPInfo.EMPInstigator.Controller).IncrementStat('Stat_EMPShutdowns');
    }
    DoHandleEMP(GetEMPShutdownControllerState());
    super(LPPawn).StartEMP();
    //return;    
}

simulated function GetEMPShutdownControllerState()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x33
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return 'VSEMPShutdown';
    }
    return 'VSEMPShutdown_MP';
    //return ReturnValue;    
}

simulated function HandleLaRocheEMP()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedByPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name TargetControllerState[8388609];

    EMPInfo.EMPDamageType = DamageType;
    EMPInfo.EMPInstigator = InstigatedByPawn;
    DoHandleEMP(TargetControllerState);
    //return;    
}

simulated function SetHUDDirectionalDamage()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    myLPHUD = LPPlayerController(Controller).myLPHUD;
    // End:0x68
    if(myLPHUD != none)
    {
        myLPHUD.SetVSDirectionalDamage(AngleInDegrees);
    }
    //return;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    // End:0x7B
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeSpitterAcid'))
    {
        // End:0x7B
        if(!bIsPossessedByPlayer)
        {
            InDamage = 0;
        }
    }
    //return;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPPawn).AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

function ForceShutdownAndPlayerEjection()
{
    local /*0x97E50000-0x00000000*/ private @NULL playCtrl;

    Health = 0;
    playCtrl = LPPlayerController(Controller);
    // End:0x59
    if(playCtrl != none)
    {
        playCtrl.ExitVS(true);
    }
    //return;    
}

function DeployPlatformFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    //return;    
}

function ZiplineExitFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    GotoState('Zipline');
    //return;    
}

function ZiplineEnterFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    //return;    
}

simulated function ForceRetractWinch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winch;

    Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0xA5
    if((Winch != none) && !Winch.IsRetracted())
    {
        // End:0xA5
        if(!IsDoingSpecialMove(Class'LPSM_PlayerVSWinchFireRetract') && !IsDoingSpecialMove(Class'LPSM_VSPlatformOut'))
        {
            DoSpecialMove(Class'LPSM_PlayerVSWinchFireRetract', true);
        }
    }
    GotoState('None');
    //return;    
}

simulated event SetMeshLodForInsideCockpit()
{
    Mesh.MinLodModel = 0;
    Mesh.ForcedLodModel = 1;
    // End:0x6F
    if(bRenderInForegroundWhenInCockpit)
    {
        Mesh.SetViewOwnerDepthPriorityGroup(true, 2);
    }
    UpdateVacantVSAttachmentsState();
    //return;    
}

simulated event SetMeshLodForOutsideCockpit()
{
    Mesh.MinLodModel = 1;
    Mesh.ForcedLodModel = 0;
    // End:0x6F
    if(bRenderInForegroundWhenInCockpit)
    {
        Mesh.SetViewOwnerDepthPriorityGroup(false, 1);
    }
    UpdateVacantVSAttachmentsState();
    //return;    
}

simulated function SetLodForCinematic()
{
    SetMeshLodForInsideCockpit();
    //return;    
}

simulated function SetLodForInGame()
{
    // End:0x1A
    if(bIsPossessedByPlayer)
    {
        SetMeshLodForInsideCockpit();        
    }
    else
    {
        SetMeshLodForOutsideCockpit();
    }
    //return;    
}

function DoIExplodeFracturedMeshOfThisType()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPShieldFracture(FracAct) != none)
    {
        return false;
    }
    return CanBreakFracturedStaticMeshActor(FracAct);
    //return ReturnValue;    
}

function DoIBreakFracturedMeshOfThisType()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPShieldFracture(FracAct) != none)
    {
        return false;
    }
    return false;
    //return ReturnValue;    
}

event @NULL RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherActor[8388609], OtherComp, HitLocation, HitNormal;

    super.RanIntoActor(OtherActor, OtherComp, HitLocation, HitNormal);
    BreakFractureMeshIfPossible(OtherActor);
    //return;    
}

function BreakFractureMeshIfPossible()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherActor[8388609], FracAct;

    FracAct = SPFracturedStaticMeshActor(OtherActor);
    // End:0xA1
    if((FracAct != none) && DoIExplodeFracturedMeshOfThisType(FracAct))
    {
        FracAct.ExplodeInSeconds(0.1000000, VSize(Velocity), vect(0.0000000, 0.0000000, 0.0000000), true, FracAct.Location);        
    }
    else
    {
        // End:0x121
        if((FracAct != none) && DoIBreakFracturedMeshOfThisType(FracAct))
        {
            FracAct.BreakOffPartsInRadius(Location, CylinderComponent.CollisionRadius * 3.0000000, VSize(Velocity), true);
        }
    }
    //return;    
}

event ShouldPhysicsPush()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bValid;

    bValid = super(SPPawn).ShouldPhysicsPush(inActor);
    bValid = bValid && inActor != none;
    bValid = bValid && LPProj_Grenade(inActor) == none;
    bValid = bValid && int(inActor.Physics) != int(6);
    return bValid;
    //return ReturnValue;    
}

function ServerNotifyOnVSThermalPocket()
{
    local /*0x97E50000-0x00000000*/ private bool bOnPocket[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Loc[8388609], Rot;

    VSExtractInfo.bOnPocket = bOnPocket;
    VSExtractInfo.Location = Loc;
    VSExtractInfo.Rotation = Rot;
    //return;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private float YL, Y;
    local /*0x97E50000-0x00000000*/ private @NULL OldFont, Canvas;

    // End:0x2D7
    if(bDebugTraceDamageActor)
    {
        Canvas = H.Canvas;
        Y = 10.0000000;
        OldFont = H.Canvas.Font;
        H.Canvas.Font = Class'Engine.Engine'.static.GetTinyFont();
        YL = H.Canvas.Font.GetMaxCharHeight();
        YL *= 1.0500000;
        H.Canvas.SetDrawColor(255, 0, 255);
        H.Canvas.SetPos(4.0000000, Y);
        // End:0x209
        if(DebugTraceDamageActor != none)
        {
            Canvas.DrawText("LAST TRACE HIT: " $ string(DebugTraceDamageActor));            
        }
        else
        {
            Canvas.DrawText("LAST TRACE HIT: NOTHING");
        }
        Y += YL;
        Canvas.DrawText("----------------------------");
        H.Canvas.Font = OldFont;
    }
    super(LPPawn).DrawHUD(H);
    //return;    
}

function OnToggleAttackLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    AIResNushiSporeVS.OnToggleAttackLoc(inAction);
    //return;    
}

simulated event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    super.Bump(Other, OtherComp, HitNormal);
    HandleBump(Other, OtherComp, HitNormal);
    //return;    
}

function @NULL HandleBump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal, Destructible, LPD, Properties;

    Destructible = SPGFDestructibleObject(Other);
    // End:0xCC
    if(Destructible != none)
    {
        // End:0xC9
        if(Destructible.IsInInstaKillList(GetDamageTypeDoneToRanIntoActor(Other)))
        {
            Destructible.TakeDamage(1, Controller, Destructible.Location, vect(0.0000000, 0.0000000, 0.0000000), GetDamageTypeDoneToRanIntoActor(Destructible));
        }        
    }
    else
    {
        LPD = LPDStaticMesh(Other);
        // End:0x215
        if(LPD != none)
        {
            // End:0x215
            if(LPD.DestructComponent != none)
            {
                Properties = SPDestructibleProperties(LPD.DestructComponent.GetProperties());
                // End:0x215
                if((Properties != none) && Properties.CanHandleDamageType(GetDamageTypeDoneToRanIntoActor(Other)))
                {
                    Other.TakeDamage(1000000, Controller, Destructible.Location, vect(0.0000000, 0.0000000, 0.0000000), GetDamageTypeDoneToRanIntoActor(Other));
                }
            }
        }
    }
    //return;    
}

function HandleMomentum()
{
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[8388609], HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185];

    Momentum.Z = 0.0000000;
    // End:0x3A
    if(VSizeSq(Momentum) <= 1.1000000)
    {
        return;
    }
    AddVelocity(Momentum, HitLocation, DamageType, HitInfo);
    // End:0xAC
    if(VSizeSq(Velocity) > (GroundSpeed * GroundSpeed))
    {
        Velocity = Normal(Velocity) * GroundSpeed;
    }
    //return;    
}

function GetDamageTypeDoneToRanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Controller);
    // End:0x59
    if((LPPC != none) && LPPC.IsDoingVSDash())
    {
        return Class'LPDamageTypeVSDash';
    }
    return Class'LPDamageTypeVSBump';
    //return ReturnValue;    
}

simulated function OnSetContextSensitiveAnimObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x6F
    if(bIsPossessedByPlayer && Controller != none)
    {
        LPPlayerPawn(LPPlayerController(Controller).HumanPlayerPawn).OnSetContextSensitiveAnimObject(Action);
        return;
    }
    super(SPPawn).OnSetContextSensitiveAnimObject(Action);
    //return;    
}

simulated function CanBeBaseForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL aPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], ret;

    ret = bCanBeBaseForPawns && !ClassIsChildOf(aPawn.Class, Class'LPAIPawnAkridLarge') || ClassIsChildOf(aPawn.Class, Class'LPAIPawnDongo');
    return ret;
    //return ReturnValue;    
}

function CrushedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPawn[8388609];

    //return;    
}

defaultproperties
{
    VSGrenadesLeft=-1
    AnticipationCheckInterval=0.3000000
    // Reference: LPAIResDefenderVS'Default__LPBaseVSPlayerPawn.LPAIResDefenderVS'
    begin object name=LPAIResDefenderVS class=Class'LPAIResDefenderVS'
    end object
    AIResDefenderVS=LPAIResDefenderVS
    // Reference: LPAIResNushiSporeVS'Default__LPBaseVSPlayerPawn.LPAIResNushiSporeVS'
    begin object name=LPAIResNushiSporeVS class=Class'LPAIResNushiSporeVS'
    end object
    AIResNushiSporeVS=LPAIResNushiSporeVS
    // Reference: LPRepairableVSComponent'Default__LPBaseVSPlayerPawn.RepairObj'
    begin object name=RepairObj class=Class'LPRepairableVSComponent'
    end object
    RepairableComponent=RepairObj
    MaxExitGroundHeightDifferenceUp=91.0000000
    MaxExitGroundHeightDifferenceDown=230.0000000
    SnowBlendTime=-1.0000000
    SnowMeltRate=0.0400000
    HUDMaterialIndex=-1
    // Reference: LPAIResManPlayer'Default__LPBaseVSPlayerPawn.LPAIResManPlayer'
    begin object name=LPAIResManPlayer
    end object
    AIResourceManager=LPAIResManPlayer
    // Reference: LPAimControlPlayerControlled'Default__LPBaseVSPlayerPawn.AimControl'
    begin object name=AimControl
    end object
    AimController=AimControl
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPBaseVSPlayerPawn.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    bAllowOwnerMeleeStrikeNotifies=true
    bCanCauseFractureOnTouch=true
    bIsPlayer=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPBaseVSPlayerPawn.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPBaseVSPlayerPawn.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPDamageOverTimeComponent'Default__LPBaseVSPlayerPawn.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPBaseVSPlayerPawn.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    SlideOffWallInfo=(WallSlideOffCylinder=// Reference: CylinderComponent'Default__LPBaseVSPlayerPawn.WallSlideCylinder'
    begin object name=WallSlideCylinder class=Class'Engine.CylinderComponent'
    end object
    WallSlideOffCylinder=WallSlideCylinder)
    // Reference: KynapseBodyHandle'Default__LPBaseVSPlayerPawn.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    bPushesRigidBodies=true
    bDontPossess=true
    bRunPhysicsWithNoController=true
    ControllerClass=none
    // Reference: SkeletalMeshComponent'Default__LPBaseVSPlayerPawn.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPBaseVSPlayerPawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    RBPushStrength=5000.0000000
    // Reference: AudioComponent'Default__LPBaseVSPlayerPawn.FaceAudioComponent'
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
    Components[8]=FXActionManagerDefObj0
    Components[9]=LPAIResManPlayer
    // Reference: SPDamageStateComponent'Default__LPBaseVSPlayerPawn.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    Components[10]=DamageStateComponentDefObj
    Components[11]=RepairObj
    // Reference: LPActorInteractionMetaData'Default__LPBaseVSPlayerPawn.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}