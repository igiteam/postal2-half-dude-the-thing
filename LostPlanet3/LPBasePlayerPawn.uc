class LPBasePlayerPawn extends LPPawn
    abstract
    nativereplication
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

struct native StruggleModeSettings
{
    var(0.25_Pct) /*0xC6D60000-0x00000000*/ private float TimeFactorPhaseButtonCanNotLose[65537];
    var(0.25_Pct) /*0xC6D60000-0x00000000*/ private float TimeFactorPhaseAimTimeOut[65537];
    var(0.25_Pct) /*0xC6D60000-0x00000000*/ private float TimeFactorPhaseAimMinTimeStabSuccess[65537];
    var(0.25_Pct) /*0xC6D60000-0x00000000*/ private float DamageFactorPlayer[65537];
    var(0.25_Pct) /*0xC6D60000-0x00000000*/ private float MinTimeBetweenAimingStartAndAimingSuccessKismetEvent[65537];

    structdefaultproperties
    {
        TimeFactorPhaseButtonCanNotLose=1.0000000
        TimeFactorPhaseAimTimeOut=1.0000000
        TimeFactorPhaseAimMinTimeStabSuccess=1.0000000
        DamageFactorPlayer=1.0000000
        MinTimeBetweenAimingStartAndAimingSuccessKismetEvent=2.0000000
    }
};

var(0.25_Pct) /*0xCECA0000-0x00000000*/ private @NULL TuneDataBasePlayerPawn[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel InventoryAttachmentData AttachSlot_Hidden[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel InventoryAttachmentData AttachSlot_Back[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel InventoryAttachmentData AttachSlot_Pistol[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastThermalPocketSoundCue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyLevel[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActiveDefenseAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerStruggleAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentWeatherVolume;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int StrugglePhaseIdx[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StruggleSettings;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool DisableCameraCollisionInStruggleMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIncapacitated[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LastHitFireID[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ScriptedAttacker[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedAttackerTimeOfNextImpact;

// Export ULPBasePlayerPawn::execInitWeatherComponents(FFrame&, void* const)
native function InitWeatherComponents();

// Export ULPBasePlayerPawn::execClearWeatherComponents(FFrame&, void* const)
native function ClearWeatherComponents();

// Export ULPBasePlayerPawn::execGetGrappleParams(FFrame&, void* const)
native function GetGrappleParams()
{
    local /*0x97E50000-0x00000000*/ private bool bIsMagnetic[9437185], bForceIsMagnetic;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689];

    false
    false                
}

// Export ULPBasePlayerPawn::execSetDepthPriorityGroup(FFrame&, void* const)
native simulated function SetDepthPriorityGroup()
{
    local /*0x97E50000-0x00000000*/ private byte NewDepthPriorityGroup[8388609];


}

// Export ULPBasePlayerPawn::execFaceRotationNative(FFrame&, void* const)
native simulated function FaceRotationNative()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewRotation[8388609];
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPBasePlayerPawn::execGetAimDirection(FFrame&, void* const)
native final simulated function GetAimDirection()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPBasePlayerPawn::execGetTEnergyPercentage(FFrame&, void* const)
native function GetTEnergyPercentage()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x3D
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        PostNametag();
    }
    //return;    
}

simulated function PostNametag()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocalPCIter, LocalPlayerHUD;

    // End:0x95
    foreach LocalPlayerControllers(Class'Engine.PlayerController', LocalPCIter)
    {
        LocalPlayerHUD = LPHUD(LocalPCIter.myHUD);
        // End:0x94
        if(LocalPlayerHUD != none)
        {
            LocalPlayerHUD.MyLPGFxMovie.AddNametag(self);
        }        
    }    
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataBasePlayerPawn = LPTuneDataBasePlayerPawn(TuneData);
    super.InitTuneData(TuneData);
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    // End:0x55
    if(IsLocallyControlled())
    {
        UpdatePlayerHealth(false);
        CurrentWeatherVolume = Class'LPWeatherVolume'.static.UpdatePlayerLocation(self);
    }
    //return;    
}

simulated function GetAnimTemplateTreeForStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x19
    if(PlayerStruggleAnimTree != none)
    {
        return PlayerStruggleAnimTree;
    }
    return none;
    //return ReturnValue;    
}

function SetLastKillerInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillerPRI[8388609], KillerController;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL VictimPRI, NemesisPRI;

    VictimPRI = LPPRI(PlayerReplicationInfo);
    // End:0x190
    if(VictimPRI != none)
    {
        VictimPRI.LastKillerPRI = KillerPRI;
        VictimPRI.LastKillerPawn = ((KillerController != none) ? KillerController.Pawn : none);
        VictimPRI.LastKillerDamageType = DamageType;
        VictimPRI.bPaidBackLastKiller = false;
        // End:0x190
        if(!bIncapacitated)
        {
            NemesisPRI = LPPRI(KillerPRI);
            // End:0x190
            if((NemesisPRI != none) && VictimPRI != NemesisPRI)
            {
                VictimPRI.UpdateNemesis(NemesisPRI, true);
                NemesisPRI.UpdateNemesis(VictimPRI, false);
            }
        }
    }
    //return;    
}

simulated event Destroyed()
{
    ClearWeatherSystem();
    super.Destroyed();
    //return;    
}

simulated function ClearWeatherSystem()
{
    CurrentWeatherVolume = none;
    ClearWeatherComponents();
    //return;    
}

function UpdatePlayerHealth()
{
    local /*0x97E50000-0x00000000*/ private bool bApplyImpulse[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HealthPP;

    // End:0x151
    if(FXActionManagerInstance != none)
    {
        HealthPP = LPFXAction_HealthPostProcess(FXActionManagerInstance.GetFXAction(Class'LPFXAction_HealthPostProcess'));
        // End:0x151
        if((HealthPP != none) && Controller != none)
        {
            // End:0xE9
            if(!HealthPP.IsActive() && HealthPP.ShouldActivate() || bApplyImpulse)
            {
                FXActionManagerInstance.StartFXAction(Class'LPFXAction_HealthPostProcess');
            }
            // End:0x151
            if(bApplyImpulse)
            {
                HealthPP.ApplyImpulse(TuneDataBasePlayerPawn.HealthEffectPulseDuration, TuneDataBasePlayerPawn.HealthEffectPulseFadeTime);
            }
        }
    }
    //return;    
}

simulated event NotifyKismetRegisterDestination()
{
    super(SPPawn).NotifyKismetRegisterDestination();
    EndCurrentSpecialMove();
    StopFullBodyAnim(0.2000000);
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function NotifyPlayersOnly()
{
    // End:0x2E
    if(AIResourceManager != none)
    {
        AIResourceManager.NotifyPlayersOnly();
    }
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x97E50000-0x00000000*/ private float out_YL[25165825], out_YPos;

    super(SPPawn).DisplayDebug(HUD, out_YL, out_YPos);
    // End:0x6C
    if(HUD.ShouldDisplayDebug('Player'))
    {
        DebugDrawHealthBar(HUD, out_YL);
    }
    // End:0x100
    if(HUD.ShouldDisplayDebug('Sound') && Controller != none)
    {
        LPPlayerController(Controller).SoundModeManager.DisplayDebug(HUD, out_YL, out_YPos);
    }
    //return;    
}

function DebugDrawHealthBar()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private float Height[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Canvas;
    local /*0x97E50000-0x00000000*/ private float Percent;
    local /*0x97E50000-0x00000000*/ private @NULL OldPos, OldDrawColor, DisplayBarStartPos;

    Canvas = H.Canvas;
    OldPos.X = Canvas.CurX;
    OldPos.Y = Canvas.CurY;
    OldDrawColor = Canvas.DrawColor;
    DisplayBarStartPos.X = 100.0000000;
    DisplayBarStartPos.Y = (float(Canvas.SizeY - 150) + (Height * float(2))) + float(7);
    Canvas.SetDrawColor(0, 0, 0, 128);
    Canvas.SetPos(DisplayBarStartPos.X, DisplayBarStartPos.Y);
    Canvas.DrawRect(128.0000000, Height);
    Percent = float(Health) / float(HealthMax);
    Canvas.SetDrawColor(255, 0, 0, 128);
    Canvas.SetPos(DisplayBarStartPos.X, DisplayBarStartPos.Y);
    Canvas.DrawRect(128.0000000 * Percent, Height);
    Canvas.SetDrawColor(255, 255, 0, 255);
    Canvas.SetPos(DisplayBarStartPos.X, DisplayBarStartPos.Y);
    Canvas.DrawText("Health");
    Canvas.SetPos(OldPos.X, OldPos.Y);
    Canvas.SetDrawColor(OldDrawColor.R, OldDrawColor.G, OldDrawColor.B, OldDrawColor.A);
    //return;    
}

simulated function PlayImpactEffects()
{
    super.PlayImpactEffects();
    // End:0x22
    if(IsLocallyControlled())
    {
        UpdatePlayerHealth(true);
    }
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private class TheDamageType;
    local /*0x97E50000-0x00000000*/ private int PreviousHealth;

    PreviousHealth = Health;
    // End:0xF7
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        TheDamageType = class<LPDamageType>(DamageType);
        // End:0x8F
        if(InStruggleMode && !TheDamageType.default.bStruggleModeDamageType)
        {
            return;
        }
        // End:0xF7
        if(((DamageCauser != none) && IsDoingSpecialMove_OF_Class(Class'LPSM_ActiveDefenseLeaderVS')) && SpecialMoveState.CurSMInfo.InteractionPawn == DamageCauser)
        {
            return;
        }
    }
    super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    // End:0x1FE
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x1FE
        if((EventInstigator != none) && Controller != none)
        {
            LPPRI(PlayerReplicationInfo).ScoreHit(LPPRI(EventInstigator.PlayerReplicationInfo), PreviousHealth, PreviousHealth - Health, DamageType);
        }
    }
    //return;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser, AIPawn, AIC;

    super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    // End:0x1A1
    if((InDamage >= Health) && InstigatedBy != none)
    {
        AIPawn = LPAIPawn(InstigatedBy.Pawn);
        // End:0x1A1
        if(AIPawn != none)
        {
            // End:0x1A1
            if(!InStruggleMode && AIPawn.TuneDataAIPawn.bOnlyKillPlayerInStruggleMode)
            {
                AIC = LPAIController(AIPawn.Controller);
                // End:0x1A1
                if(((AIC != none) && AIC.CanDoStruggleModeAgainst(self)) && AIResourceManager.HasTimerExpired('StruggleTimer'))
                {
                    InDamage = Health - 1;
                }
            }
        }
    }
    //return;    
}

simulated function PlayTakeDamageEffects()
{
    super.PlayTakeDamageEffects();
    PlayHUDDamageEffects();
    //return;    
}

simulated function PlayHUDDamageEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL Loc, Rot, AxisX, AxisY, AxisZ, ShotDirection,
	    HitDir;

    local /*0x97E50000-0x00000000*/ private float AngleInDegrees;
    local /*0x97E50000-0x00000000*/ private bool bShouldShowDirectionalDamage, bShouldUseInstigatorLocation;
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    // End:0x11
    if(!IsLocallyControlled())
    {
        return;
    }
    myLPHUD = LPPlayerController(Controller).myLPHUD;
    // End:0x77
    if((myLPHUD == none) || myLPHUD.bDisableHUDDamageEffects)
    {
        return;
    }
    bShouldShowDirectionalDamage = ((TakeDamageParams.Damage > 0) && !ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeNoHitReact')) && !ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeIncapacitatedBleedOut');
    bShouldUseInstigatorLocation = ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageType') && class<LPDamageType>(TakeDamageParams.DamageType).default.bUseInstigatorLocation;
    // End:0x3A2
    if(bShouldShowDirectionalDamage)
    {
        // End:0x1EE
        if((TakeDamageParams.InstigatedByPawn != none) && bShouldUseInstigatorLocation)
        {
            HitDir = TakeDamageParams.InstigatedByPawn.Location;            
        }
        else
        {
            HitDir = TakeDamageParams.HitLocation;
        }
        Controller.GetPlayerViewPoint(Loc, Rot);
        GetAxes(Rot, AxisX, AxisY, AxisZ);
        // End:0x294
        if(HitDir == Location)
        {
            AngleInDegrees = 0.0000000;            
        }
        else
        {
            HitDir.Z = Location.Z;
            AxisX.Z = 0.0000000;
            AxisX = Normal(AxisX);
            ShotDirection = Normal(HitDir - Location);
            AngleInDegrees = Acos(ShotDirection Dot AxisX) * 57.2957800;
            // End:0x38F
            if((AxisY Dot ShotDirection) < float(0))
            {
                AngleInDegrees = 180.0000000 + (float(180) - AngleInDegrees);
            }
        }
        SetHUDDirectionalDamage(AngleInDegrees);
    }
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
        myLPHUD.SetDirectionalDamage(AngleInDegrees);
    }
    //return;    
}

simulated function GetAdjustedAimFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL W[8388609], StartFireLoc, ReturnValue;

    // End:0x19
    if(!IsLocallyControlled())
    {
        return WorldAimDir;
    }
    // End:0x5A
    if(AimController != none)
    {
        return AimController.GetAdjustedAimFor(W, StartFireLoc);
    }
    return super(Pawn).GetAdjustedAimFor(W, StartFireLoc);
    //return ReturnValue;    
}

exec function TestPhatPawnSize()
{
    local /*0x97E50000-0x00000000*/ private float InScale[8388609];
    local /*0x97E50000-0x00000000*/ private int SizeType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL V;

    // End:0x44
    if(SizeType >= 3)
    {
        SPActorInteractionMetaData(InteractionMetaData).ChangePhatPawnBlockageType(Class'LPPhatPawnBlockageType_GiantSized');        
    }
    else
    {
        // End:0x88
        if(SizeType == 2)
        {
            SPActorInteractionMetaData(InteractionMetaData).ChangePhatPawnBlockageType(Class'LPPhatPawnBlockageType_VSSized');            
        }
        else
        {
            // End:0xCB
            if(SizeType == 1)
            {
                SPActorInteractionMetaData(InteractionMetaData).ChangePhatPawnBlockageType(Class'LPPhatPawnBlockageType_PlayerSized');                
            }
            else
            {
                SPActorInteractionMetaData(InteractionMetaData).ChangePhatPawnBlockageType(Class'LPPhatPawnBlockageType_NoBlockage');
            }
        }
    }
    SetDrawScale(InScale);
    SetCollisionSize(default.CylinderComponent.CollisionRadius * InScale, default.CylinderComponent.CollisionHeight * InScale);
    V.X = 0.0000000;
    V.Y = 0.0000000;
    V.Z = -CylinderComponent.CollisionHeight / InScale;
    Mesh.SetTranslation(V);
    DEBUG_SetUsesPhatPawnCollision(true);
    //return;    
}

function EnableAIResourceStrike()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x41
    if(AIResourceManager != none)
    {
        LPAIResManPlayer(AIResourceManager).EnableStrikeAccess(bEnable);
    }
    //return;    
}

function EnableAIResourceLeechStrike()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x41
    if(AIResourceManager != none)
    {
        LPAIResManPlayer(AIResourceManager).EnableLeechStrikeAccess(bEnable);
    }
    //return;    
}

function EnableAIResourceStruggle()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x41
    if(AIResourceManager != none)
    {
        LPAIResManPlayer(AIResourceManager).EnableStruggleAccess(bEnable);
    }
    //return;    
}

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    RanIntoActor(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

simulated event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    super.Bump(Other, OtherComp, HitNormal);
    RanIntoActor(Other, OtherComp, vect(0.0000000, 0.0000000, 0.0000000), HitNormal);
    //return;    
}

event @NULL RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherActor[8388609], OtherComp, HitLocation, HitNormal;

    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI;
    local /*0x97E50000-0x00000000*/ private bool bShouldUpdateReplicatedPerks;
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    // End:0xA7
    if(VarName == 'AttachSlot_Back')
    {
        SetSlotAttachment(int(AttachSlot_Back.InventorySlot), AttachSlot_Back.InventoryClass, ((int(AttachSlot_Back.equipType) == int(0)) ? false : true), bool(AttachSlot_Back.bUnEquipNextWeapon));        
    }
    else
    {
        // End:0x14E
        if(VarName == 'AttachSlot_Hidden')
        {
            SetSlotAttachment(int(AttachSlot_Hidden.InventorySlot), AttachSlot_Hidden.InventoryClass, ((int(AttachSlot_Hidden.equipType) == int(0)) ? false : true), bool(AttachSlot_Hidden.bUnEquipNextWeapon));            
        }
        else
        {
            // End:0x1F5
            if(VarName == 'AttachSlot_Pistol')
            {
                SetSlotAttachment(int(AttachSlot_Pistol.InventorySlot), AttachSlot_Pistol.InventoryClass, ((int(AttachSlot_Pistol.equipType) == int(0)) ? false : true), bool(AttachSlot_Pistol.bUnEquipNextWeapon));                
            }
            else
            {
                // End:0x239
                if(VarName == 'StrugglePhaseIdx')
                {
                    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StrugglePhaseChanged, self);                    
                }
                else
                {
                    super.ReplicatedEvent(VarName);
                    // End:0x33A
                    if(VarName == 'PlayerReplicationInfo')
                    {
                        PRI = LPPRI(PlayerReplicationInfo);
                        // End:0x33A
                        if(PRI != none)
                        {
                            bShouldUpdateReplicatedPerks = int(Role) != int(ROLE_SimulatedProxy);
                            // End:0x2E2
                            foreach WorldInfo.LocalPlayerControllers(Class'LPPlayerController', LPC)
                            {
                                // End:0x2E2
                                break;                                
                            }                            
                            PRI.InitPerksManager(bShouldUpdateReplicatedPerks);
                            // End:0x33A
                            if(!bShouldUpdateReplicatedPerks)
                            {
                                PRI.AssignReplicatedPerks();
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function UpdateRemoteInventoryAttachment()
{
    local /*0x97E50000-0x00000000*/ private int Slot[8388609];
    local /*0x97E50000-0x00000000*/ private class InvClass[8388609];
    local /*0x97E50000-0x00000000*/ private byte equipType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnEquipNextWeapon[8388609];

    // End:0x2DC
    if((int(equipType) == int(1)) || int(equipType) == int(2))
    {
        // End:0x110
        if(InventoryAttachSlotArray[Slot].SlotName == 'BackCenter')
        {
            AttachSlot_Back.InventoryClass = class<SPInventoryWeapon>(InvClass);
            AttachSlot_Back.InventorySlot = byte(Slot);
            AttachSlot_Back.equipType = equipType;
            AttachSlot_Back.bUnEquipNextWeapon = byte(bUnEquipNextWeapon);
            bForceNetUpdate = true;
        }
        // End:0x1F6
        if(InventoryAttachSlotArray[Slot].SlotName == 'Hidden')
        {
            AttachSlot_Hidden.InventoryClass = class<SPInventoryWeapon>(InvClass);
            AttachSlot_Hidden.InventorySlot = byte(Slot);
            AttachSlot_Hidden.equipType = equipType;
            AttachSlot_Hidden.bUnEquipNextWeapon = byte(bUnEquipNextWeapon);
            bForceNetUpdate = true;
        }
        // End:0x2DC
        if(InventoryAttachSlotArray[Slot].SlotName == 'PistolHolster')
        {
            AttachSlot_Pistol.InventoryClass = class<SPInventoryWeapon>(InvClass);
            AttachSlot_Pistol.InventorySlot = byte(Slot);
            AttachSlot_Pistol.equipType = equipType;
            AttachSlot_Pistol.bUnEquipNextWeapon = byte(bUnEquipNextWeapon);
            bForceNetUpdate = true;
        }
    }
    //return;    
}

exec function ToggleVSTraceDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, vsPawn;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0xCE [Loop If]
    if(CurPawn != none)
    {
        vsPawn = LPBaseVSPlayerPawn(CurPawn);
        // End:0xA3
        if(vsPawn != none)
        {
            vsPawn.bDebugTraceDamageActor = !vsPawn.bDebugTraceDamageActor;
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

simulated function GetNearestThermalEnergyPocket()
{
    local /*0x97E50000-0x00000000*/ private @NULL outPocket[25165825];
    local /*0x97E50000-0x00000000*/ private float outDistance[25165825];
    local /*0x97E50000-0x00000000*/ private bool bVSOnly[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LPMI, TEPPawn, ClosestTEPPawn;
    local /*0x97E50000-0x00000000*/ private float ClosestDistance, Dist;

    false
    // End:0x47
    if(WorldInfo != none)
    {
        LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    }
    // End:0x58
    if(LPMI == none)
    {
        return false;
    }
    ClosestDistance = 2147484000.0000000;
    // End:0x1A5
    foreach LPMI.ThermalEnergyPocketActors(TEPPawn)
    {
        // End:0x1A4
        if(TEPPawn.bEnabled)
        {
            // End:0x104
            if(int(WorldInfo.NetMode) == int(NM_Standalone))
            {
                // End:0x104
                if(TEPPawn.IsBeingExtractedFrom())
                {
                    continue;
                    // [Explicit Continue]
                    goto J0x1A5;
                }
            }
            // End:0x1A4
            if(bVSOnly == TEPPawn.bVSExtractionOnly)
            {
                Dist = VSize(Location - TEPPawn.Location);
                // End:0x1A4
                if(Dist < ClosestDistance)
                {
                    ClosestDistance = Dist;
                    ClosestTEPPawn = TEPPawn;
                }
            }
        }        
    }
    J0x1A5:
    
    // End:0x1B7
    if(ClosestTEPPawn == none)
    {
        return false;
    }
    outPocket = ClosestTEPPawn;
    outDistance = ClosestDistance;
    return true;
    //return ReturnValue;    
}

simulated function GetEnergyCount()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TE;

    TE = LPThermalEnergy(InvManager.FindInventoryType(Class'LPThermalEnergy', true));
    // End:0x6B
    if(TE != none)
    {
        return TE.GetEnergyCount();
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function IsDBNO()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bIncapacitated)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function NotifyProjectileHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL Proj[8388609], Other;
    local /*0x97E50000-0x00000000*/ private int MyTeam, HitTeam;

    // End:0x129
    if(Proj.FireID > LastHitFireID)
    {
        MyTeam = int(GetTeamNum());
        HitTeam = ((Other != none) ? int(Other.GetTeamNum()) : -1);
        // End:0x129
        if(((Pawn(Other) != none) && HitTeam != MyTeam) || HitTeam == (1 - MyTeam))
        {
            LPPlayerController(Controller).IncrementStat('Stat_NumShotsHit');
            LastHitFireID = Proj.FireID;
        }
    }
    //return;    
}

function NotifyInstantHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL Impact[8388609];
    local /*0x97E50000-0x00000000*/ private int MyTeam, HitTeam;

    // End:0x138
    if(LastFireID > LastHitFireID)
    {
        MyTeam = int(GetTeamNum());
        HitTeam = ((Impact.HitActor != none) ? int(Impact.HitActor.GetTeamNum()) : -1);
        // End:0x138
        if(((Pawn(Impact.HitActor) != none) && HitTeam != MyTeam) || HitTeam == (1 - MyTeam))
        {
            LPPlayerController(Controller).IncrementStat('Stat_NumShotsHit');
            LastHitFireID = LastFireID;
        }
    }
    //return;    
}

simulated function IsValidMeleeTargetNonCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.IsValidMeleeTargetNonCombatWindow() || bIncapacitated;
    //return ReturnValue;    
}

simulated exec function ShowKnife()
{
    local /*0x97E50000-0x00000000*/ private name InSocket[9437185];

    'None'
    //return;    
}

simulated exec function HideKnife()
{
    //return;    
}

reliable server function ServerSetStrugglePhaseIdx()
{
    local /*0x97E50000-0x00000000*/ private int inStrugglePhaseIdx[8388609];

    // End:0x68
    if(StrugglePhaseIdx != inStrugglePhaseIdx)
    {
        StrugglePhaseIdx = inStrugglePhaseIdx;
        // End:0x68
        if(int(RemoteRole) == int(ROLE_AutonomousProxy))
        {
            BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StrugglePhaseChanged, self);
        }
    }
    //return;    
}

function OnStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x62
    if(inAction.InputLinks[0].bHasImpulse)
    {
        StruggleSettings = inAction.StruggleSettings;        
    }
    else
    {
        // End:0xA8
        if(inAction.InputLinks[1].bHasImpulse)
        {
            DisableCameraCollisionInStruggleMode = true;            
        }
        else
        {
            // End:0xEC
            if(inAction.InputLinks[2].bHasImpulse)
            {
                DisableCameraCollisionInStruggleMode = false;
            }
        }
    }
    //return;    
}

defaultproperties
{
    StrugglePhaseIdx=-1
    StruggleSettings=(TimeFactorPhaseButtonCanNotLose=1.0000000,TimeFactorPhaseAimTimeOut=1.0000000,TimeFactorPhaseAimMinTimeStabSuccess=1.0000000,DamageFactorPlayer=1.0000000,MinTimeBetweenAimingStartAndAimingSuccessKismetEvent=2.0000000)
    HealthRegenInfo=(bHealthRegenEnabled=true)
    // Reference: LPAIResManPlayer'Default__LPBasePlayerPawn.LPAIResManPlayer'
    begin object name=LPAIResManPlayer class=Class'LPAIResManPlayer'
    end object
    AIResourceManager=LPAIResManPlayer
    // Reference: LPAimControlPlayerControlled'Default__LPBasePlayerPawn.AimControl'
    begin object name=AimControl class=Class'LPAimControlPlayerControlled'
    end object
    AimController=AimControl
    InventoryAttachSlotArray=/* Array type was not detected. */
    InventorySlotTransitionArray=/* Array type was not detected. */
    AnimationTemplateNodeNames=/* Array type was not detected. */
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPBasePlayerPawn.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPBasePlayerPawn.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPBasePlayerPawn.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0 class=Class'LPFXActionManager'
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPDamageOverTimeComponent'Default__LPBasePlayerPawn.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPBasePlayerPawn.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPBasePlayerPawn.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPBasePlayerPawn.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPBasePlayerPawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPBasePlayerPawn.FaceAudioComponent'
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
    // Reference: LPActorInteractionMetaData'Default__LPBasePlayerPawn.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}