class LPAIPawnHumanSoldier extends LPAIPawnHuman
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataHumanSoldier[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel InventoryAttachmentData AttachSlot_Hidden[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel InventoryAttachmentData AttachSlot_Back[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel InventoryAttachmentData AttachSlot_Pistol[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HumanSoldierSMAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HumanSoldierCoverAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HumanSoldierWeaponAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HumanSoldierMeleeAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_FiringCycle_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_ADSFiringCycle_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_StationaryAdditiveAiming_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_MovingAdditiveAiming_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_FiringCycle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_ADSFiringCycle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_StationaryAdditiveAiming[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_MovingAdditiveAiming[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GrenadesClose;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyWeapon;

// Export ULPAIPawnHumanSoldier::execGetHoldAimAfterFiringTime(FFrame&, void* const)
native simulated function GetHoldAimAfterFiringTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnHumanSoldier::execWantsToAim(FFrame&, void* const)
native simulated function WantsToAim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnHumanSoldier::execSetCoverAction(FFrame&, void* const)
native simulated function SetCoverAction()
{
    local /*0x97E50000-0x00000000*/ private byte NewCoverAction[8388609];


}

// Export ULPAIPawnHumanSoldier::execDoingAnimationTransition(FFrame&, void* const)
native simulated function DoingAnimationTransition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnHumanSoldier::execGetBestAdditivateAimingAnimation(FFrame&, void* const)
native simulated function GetBestAdditivateAimingAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPAIPawnHumanSoldier::execSetAimState(FFrame&, void* const)
native function SetAimState()
{
    local /*0x97E50000-0x00000000*/ private byte NewAimState[8388609];


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

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
                super(LPPawn).ReplicatedEvent(VarName);
            }
        }
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataHumanSoldier = LPTuneDataAIPawnHumanSoldier(TuneData);
    super.InitTuneData(TuneData);
    //return;    
}

simulated function ReceivedInventoryItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewItem[8388609], NewWeapon;

    super(LPPawn).ReceivedInventoryItem(NewItem);
    NewWeapon = LPWeapon(NewItem);
    // End:0x51
    if(NewWeapon != none)
    {
        OnReceivedInventoryItem(NewWeapon);
    }
    //return;    
}

private final function OnReceivedInventoryItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewWeapon[8388609];
    local /*0x97E50000-0x00000000*/ private float NewHealthMax;

    NewWeapon.SetMaxAmmoForWeapon(2147483647 / 2);
    NewWeapon.AmmoLeftForWeapon = 2147483647 / 2;
    NewWeapon.MaxAmmoInMagazine = int(((float(NewWeapon.MyGFTuneDataWeapon.MinNumBurstsBetweenReloads) * NewWeapon.MyGFTuneDataWeapon.BurstFireCount.Y) * TuneDataHumanSoldier.MaxBurstsToFireFromCover.GetValue()) + float(1));
    NewWeapon.AmmoLeftInMagazine = NewWeapon.GetMagazineCapacity();
    // End:0x1BF
    if(NewWeapon.FiringStatesArray[0] == 'WeaponFiringBurst')
    {
        NewWeapon.FiringStatesArray[0] = 'WeaponFiring';
    }
    // End:0x260
    if(NewWeapon.MyGFTuneDataWeapon.bCloseRangeWeapon)
    {
        NewHealthMax = TuneDataHumanSoldier.ShotgunHealthMultiplier * TuneDataHumanSoldier.GetHealth(self);
        SetHealthMax(int(NewHealthMax), int(NewHealthMax));
    }
    // End:0x28B
    if(LPWeaponGrenade(NewWeapon) == none)
    {
        MyWeapon = NewWeapon;
    }
    //return;    
}

simulated function StartFire()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TheLPWeapon;

    TheLPWeapon = LPWeapon(Weapon);
    // End:0x5D
    if(TheLPWeapon.FiringStatesArray[0] == 'WeaponFiringBurst')
    {
        OnReceivedInventoryItem(TheLPWeapon);
    }
    super(Pawn).StartFire(FireModeNum);
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

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CoverSlotDirection, CoverSlotTangent;
    local /*0x97E50000-0x00000000*/ private float DegreesTangentAimDir;

    super(LPPawn).Tick(DeltaTime);
    UpdateWorldAimDir(DeltaTime);
    // End:0x235
    if(((((IsInCover()) && int(CoverAction) == int(0)) && Weapon != none) && !Weapon.IsFiring()) && SpecialMoveState.CurSMInstance == none)
    {
        // End:0x16B
        if(bIsMirrored && bWantsToBeMirrored)
        {
            CoverSlotDirection = Vector(CurrentLink.GetSlotRotation(CurrentSlotIdx));
            CoverSlotTangent = CoverSlotDirection Cross vect(0.0000000, 0.0000000, 1.0000000);
            DegreesTangentAimDir = Acos(Vector(WorldAimDir) Dot CoverSlotTangent) * 57.2957800;
            // End:0x168
            if(Abs(DegreesTangentAimDir) > 110.0000000)
            {
                SetMirroredSide(false);
            }            
        }
        else
        {
            // End:0x235
            if(!bIsMirrored && !bWantsToBeMirrored)
            {
                CoverSlotDirection = Vector(CurrentLink.GetSlotRotation(CurrentSlotIdx));
                CoverSlotTangent = CoverSlotDirection Cross vect(0.0000000, 0.0000000, 1.0000000);
                DegreesTangentAimDir = Acos(Vector(WorldAimDir) Dot -CoverSlotTangent) * 57.2957800;
                // End:0x235
                if(Abs(DegreesTangentAimDir) > 110.0000000)
                {
                    SetMirroredSide(true);
                }
            }
        }
    }
    //return;    
}

function UpdateWorldAimDir()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    AimController.UpdateAim(DeltaTime);
    WorldAimDir = AimController.GetWorldAimRotator();
    //return;    
}

simulated function FireGrappleUp()
{
    local /*0x97E50000-0x00000000*/ private @NULL Hook, Helper;

    Hook = LPSoldierGrapplingHook(FindInventoryType(Class'LPSoldierGrapplingHook', true));
    // End:0xE7
    if(Hook != none)
    {
        Helper = SPKyAnimatedPathHelper(SpecialMoveState.CurSMInfo.InteractionActor);
        // End:0xE7
        if(Helper != none)
        {
            Hook.SetGrapplePoint(Helper.GrappleHookLocation);
            Hook.GotoState('Firing');
        }
    }
    //return;    
}

simulated function FireGrappleDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL Hook, Helper;

    Hook = LPSoldierGrapplingHook(FindInventoryType(Class'LPSoldierGrapplingHook', true));
    // End:0xE7
    if(Hook != none)
    {
        Helper = SPKyAnimatedPathHelper(SpecialMoveState.CurSMInfo.InteractionActor);
        // End:0xE7
        if(Helper != none)
        {
            Hook.SetGrapplePoint(Helper.GrappleHookLocation);
            Hook.GotoState('Firing');
        }
    }
    //return;    
}

simulated function ReleaseGrapple()
{
    local /*0x97E50000-0x00000000*/ private @NULL Hook;

    Hook = LPSoldierGrapplingHook(FindInventoryType(Class'LPSoldierGrapplingHook', true));
    // End:0x59
    if(Hook != none)
    {
        Hook.GotoState('Retracting');
    }
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
    return HumanSoldierSMAnimTree;
    //return ReturnValue;    
}

simulated function GetAnimTemplateTreeForCoverSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super(SPGFCoverPawn).GetAnimTemplateTreeForCoverSpecialMove(SpecialMove);
    // End:0x36
    if(MyAnimTree != none)
    {
        return MyAnimTree;
    }
    return HumanSoldierCoverAnimTree;
    //return ReturnValue;    
}

simulated function GetAnimTemplateTreeForWeaponSwitching()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x19
    if(HumanSoldierWeaponAnimTree != none)
    {
        return HumanSoldierWeaponAnimTree;
    }
    return HumanSoldierSMAnimTree;
    //return ReturnValue;    
}

simulated function InitAnimTemplates()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SMNames, SMNodes;

    super(LPPawn).InitAnimTemplates();
    // End:0x125
    if(HumanSoldierWeaponAnimTree != none)
    {
        SMNames.AddItem(AnimTemplateLogic_FiringCycle_Name);        
        SMNames.AddItem(AnimTemplateLogic_ADSFiringCycle_Name);        
        SMNames.AddItem(AnimTemplateLogic_StationaryAdditiveAiming_Name);        
        SMNames.AddItem(AnimTemplateLogic_MovingAdditiveAiming_Name);        
        HumanSoldierWeaponAnimTree.FindAnimNodes(SMNames, SMNodes, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
        AnimTemplateLogic_FiringCycle = SPAnimNodeTemplateLogicNamedRoot(SMNodes[0]);
        AnimTemplateLogic_ADSFiringCycle = SPAnimNodeTemplateLogicNamedRoot(SMNodes[1]);
        AnimTemplateLogic_StationaryAdditiveAiming = SPAnimNodeTemplateLogicNamedRoot(SMNodes[2]);
        AnimTemplateLogic_MovingAdditiveAiming = SPAnimNodeTemplateLogicNamedRoot(SMNodes[3]);
    }
    //return;    
}

// Export ULPAIPawnHumanSoldier::execIsAimingDownSight(FFrame&, void* const)
native simulated event IsAimingDownSight()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function StartAdditiveFireAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate, LPPC;
    local /*0x97E50000-0x00000000*/ private bool playerIsAimingDownSight;

    playerIsAimingDownSight = false;
    LPPC = LPPlayerController(Controller);
    // End:0x61
    if(LPPC != none)
    {
        playerIsAimingDownSight = LPPC.IsAimingDownSight();
    }
    // End:0x9B
    if(playerIsAimingDownSight)
    {
        AnimSeqTemplate = AnimTemplateLogic_ADSFiringCycle.GetBestSequenceTemplate(self);        
    }
    else
    {
        AnimSeqTemplate = AnimTemplateLogic_FiringCycle.GetBestSequenceTemplate(self);
    }
    AdditiveAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.1000000, false, true, 0, 0, false, 3);
    //return;    
}

simulated function StopAdditiveFireAnimation()
{
    AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.2500000);
    //return;    
}

simulated function NotifyShellMeshDetach()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShotGun;

    ShotGun = LPWeaponShotgun(Weapon);
    // End:0x4A
    if(ShotGun != none)
    {
        ShotGun.DetachShellMesh();
    }
    //return;    
}

simulated function GetEdgeCoverDirection()
{
    local /*0x97E50000-0x00000000*/ private @NULL CovInfo[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x64
    if(CovInfo.Link.IsLeftEdgeSlot(CovInfo.SlotIdx, true))
    {
        ReplicatedCoverDirection = 1;
        return 1;        
    }
    else
    {
        // End:0xC5
        if(CovInfo.Link.IsRightEdgeSlot(CovInfo.SlotIdx, true))
        {
            ReplicatedCoverDirection = 2;
            return 2;
        }
    }
    return super(SPGFCoverPawn).GetEdgeCoverDirection(CovInfo);
    //return ReturnValue;    
}

simulated function NotifyGrenadeOnRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrenade[8388609];

    GrenadesClose.AddItem(InGrenade);    
    //return;    
}

function IsGrenadeClose()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private float TimeLeftToExplode;

    I = GrenadesClose.Length - 1;
    J0x17:

    // End:0x198 [Loop If]
    if(I >= 0)
    {
        // End:0x85
        if((GrenadesClose[I] == none) || GrenadesClose[I].bExploded)
        {
            GrenadesClose.Remove(I, 1);                        
        }
        else
        {
            TimeLeftToExplode = GrenadesClose[I].ExplodeTimer - (WorldInfo.TimeSeconds - GrenadesClose[I].TimeStampBeginPlay);
            // End:0x130
            if(TimeLeftToExplode > TuneDataHumanSoldier.TimeToExplodeRunAway)
            {                
            }
            else
            {
                // End:0x18A
                if(VSize(GrenadesClose[I].Location - TestLocation) < TuneDataHumanSoldier.DistanceToGrenadeDangerous)
                {
                    return true;
                }
            }
        }
        --I;
        // [Loop Continue]
        goto J0x17;
    }
    return false;
    //return ReturnValue;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function Died()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Hook, myCtrl;

    Hook = LPSoldierGrapplingHook(FindInventoryType(Class'LPSoldierGrapplingHook', true));
    // End:0xDD
    if(((Hook != none) && Hook.GrappleCable != none) && !Hook.IsInState('Idle'))
    {
        Hook.GrappleCable.SetActive(false);
        Hook.GotoState('Retracting');
    }
    myCtrl = LPAIControllerHumanSoldier(Controller);
    // End:0x1B0
    if(myCtrl != none)
    {
        // End:0x173
        if(class<SPDamageType>(DamageType).default.bIsConcussive)
        {
            myCtrl.MyLPSquad.PlayGrenadeDeathSound(myCtrl);            
        }
        else
        {
            myCtrl.MyLPSquad.PlayDeathSound(myCtrl);
        }
    }
    return super(LPAIPawn).Died(Killer, DamageType, HitLocation);
    //return ReturnValue;    
}

simulated function NotifyYouKilledPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL myCtrl;

    myCtrl = LPAIControllerHumanSoldier(Controller);
    // End:0x4A
    if(myCtrl != none)
    {
        myCtrl.NotifyYouKilledPlayer();
    }
    super(LPAIPawn).NotifyYouKilledPlayer();
    //return;    
}

simulated function PlayTakeDamageEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL myCtrl;

    // End:0x93
    if(class<LPDamageTypeBallistic>(TakeDamageParams.DamageType) != none)
    {
        myCtrl = LPAIControllerHumanSoldier(Controller);
        // End:0x93
        if(myCtrl != none)
        {
            myCtrl.MyLPSquad.PlayHitByBulletSound(myCtrl);
        }
    }
    super(LPPawn).PlayTakeDamageEffects();
    //return;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser, myCtrl;

    super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    myCtrl = LPAIControllerHumanSoldier(Controller);
    // End:0x15E
    if((myCtrl != none) && InstigatedBy != none)
    {
        // End:0x15E
        if(!myCtrl.IsTarget(InstigatedBy.Pawn) && InDamage > 0)
        {
            // End:0x109
            if(ClassIsChildOf(DamageType, Class'LPDamageTypeMelee'))
            {
                InDamage = Health + 1;                
            }
            else
            {
                // End:0x15E
                if(HitInfo.PhysMaterial.Name == 'LPPhysMat_Gore_Head')
                {
                    InDamage = Health + 1;
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    bApplyRagdollImpulse=true
    // Reference: LPAIResManHuman'Default__LPAIPawnHumanSoldier.LPAIResManHuman'
    begin object name=LPAIResManHuman
    end object
    AIResourceManager=LPAIResManHuman
    // Reference: LPDamageReactionManagerAIHuman'Default__LPAIPawnHumanSoldier.DamageReactionManagerHuman'
    begin object name=DamageReactionManagerHuman
    end object
    DamageReactionManager=DamageReactionManagerHuman
    bCanBlindFire=false
    LeaveCoverPlayRate=0.5000000
    // Reference: LPAimControlHumanSoldier'Default__LPAIPawnHumanSoldier.AimControl'
    begin object name=AimControl class=Class'LPAimControlHumanSoldier'
    end object
    AimController=AimControl
    InventoryAttachSlotArray=/* Array type was not detected. */
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnHumanSoldier.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnHumanSoldier.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnHumanSoldier.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPHeadTrackComponent'Default__LPAIPawnHumanSoldier.HeadTrackComponent0'
    begin object name=HeadTrackComponent0 class=Class'LPHeadTrackComponent'
    end object
    HeadTrackComponent=HeadTrackComponent0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnHumanSoldier.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnHumanSoldier.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnHumanSoldier.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    MinFallingSpeedToPlayAnim=-150.0000000
    // Reference: KynapseBodyHandle'Default__LPAIPawnHumanSoldier.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnHumanSoldier.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnHumanSoldier.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnHumanSoldier.FaceAudioComponent'
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
    Components[10]=LPAIResManHuman
    Components[11]=HeadTrackComponent0
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnHumanSoldier.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}