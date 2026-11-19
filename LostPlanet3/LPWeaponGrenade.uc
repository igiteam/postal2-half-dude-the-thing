class LPWeaponGrenade extends LPWeapon
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BeltMesh;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BeltMeshTranslation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BeltMeshRotation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name PawnAttachmentSocket;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name PawnAttachmentSocket_Mirrored;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataGrenade;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GrenadeProjectileClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPriming;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUnderhandToss;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenadeVelRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GrenadeVelRangePow[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GrenadeAimingTrajectoryPitchAdjustment;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int UnderhandTossViewPitchThreshold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float UnderhandTossFloorDistanceSquared;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float UnderhandTossWallDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int UnderhandTossPitchAdjustment;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpawnOffset_StandingCoverRight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpawnOffset_MidCoverRight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpawnOffset_CoverPopUp;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DeployAnimName;

// Export ULPWeaponGrenade::execPredictSpawnPointFromAnimName(FFrame&, void* const)
native function @NULL PredictSpawnPointFromAnimName()
{
    local /*0x97E50000-0x00000400*/ private @NULL InMesh[8388609];
    local /*0x97E50000-0x00000000*/ private name InAnimName[8388609], SocketName;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    TuneDataGrenade = LPTuneDataWeaponGrenade(TuneData);
    // End:0x19E
    if(TuneDataGrenade != none)
    {
        GrenadeVelRange.X = TuneDataGrenade.MinVelocity;
        GrenadeVelRange.Y = TuneDataGrenade.MaxVelocity;
        GrenadeAimingTrajectoryPitchAdjustment = int(TuneDataGrenade.GrenadeAimingTrajectoryPitchAdjustment);
        UnderhandTossPitchAdjustment = TuneDataGrenade.UnderhandTossPitchAdjustment;
        UnderhandTossFloorDistanceSquared = TuneDataGrenade.UnderhandTossFloorDistance * TuneDataGrenade.UnderhandTossFloorDistance;
        UnderhandTossWallDistance = TuneDataGrenade.UnderhandTossWallDistance;
        UnderhandTossViewPitchThreshold = TuneDataGrenade.UnderhandTossViewPitchThreshold;
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    //return;    
}

simulated function ShouldDrawProjectilePreviewComponent()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x26
    if(!TuneDataGrenade.bEnableArcPreview)
    {
        return false;
    }
    return super(SPGFWeapon).ShouldDrawProjectilePreviewComponent();
    //return ReturnValue;    
}

protected simulated function GetMaxAmmoForWeaponOverride()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GP, MyLPPRI;

    // End:0x153
    if(Instigator != none)
    {
        MyLPPRI = LPPRI(Instigator.PlayerReplicationInfo);
        // End:0x153
        if((MyLPPRI != none) && MyLPPRI.PerksManager != none)
        {
            GP = LPPerkGrenadierPack(MyLPPRI.PerksManager.QueryPerkClass(15));
            // End:0x153
            if(GP != none)
            {
                return int(float(TuneDataGrenade.SupportedAmmoTypes[0].GetMaxAmmoForWeapon()) + GP.GrenadierPackTuneData.NumAdditionalGrenades.GetValue());
            }
        }
    }
    return -1;
    //return ReturnValue;    
}

simulated function GetAmmoPerMagazineOverride()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return GetMaxAmmoForWeaponOverride();
    //return ReturnValue;    
}

simulated function IsPrimed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bPriming;
    //return ReturnValue;    
}

simulated function IsIdle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeSM;

    // End:0xA0
    if((IsInState('Idle') || IsInState('Inactive')) || IsInState('PendingClientWeaponSet'))
    {
        GrenadeSM = LPSM_GrenadeThrow(SPPawn(Instigator).GetCurrentSpecialMoveInstance());
        return (GrenadeSM == none) && Mesh.HiddenGame;
    }
    return Mesh.HiddenGame;
    //return ReturnValue;    
}

simulated function ThrowGrenade()
{
    DetachGrenadeMesh();
    //return;    
}

simulated function DropGrenade()
{
    DetachGrenadeMesh(true);
    //return;    
}

simulated function AbortGrenade()
{
    DetachGrenadeMesh(,, true);
    //return;    
}

simulated function GetPawnAttachmentSocket()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x3D
    if((MyPawn != none) && MyPawn.bIsMirrored)
    {
        return PawnAttachmentSocket_Mirrored;
    }
    return PawnAttachmentSocket;
    //return ReturnValue;    
}

simulated function AttachGrenadeMesh()
{
    // End:0x13D
    if(Instigator.Mesh != none)
    {
        // End:0x13D
        if(Mesh != none)
        {
            GotoState('Priming');
            Mesh.SetHidden(false);
            Mesh.SetShadowParent(Instigator.Mesh);
            Mesh.SetLightEnvironment(SPPawn(Instigator).LightEnvironment);
            Instigator.Mesh.AttachComponentToSocket(Mesh, GetPawnAttachmentSocket(LPPawn(Instigator)));
        }
    }
    //return;    
}

simulated function ReattachGrenadeMesh()
{
    local /*0x97E50000-0x00000000*/ private bool bMirrored[8388609];

    // End:0x37
    if((Instigator == none) || Instigator.Mesh == none)
    {
        return;
    }
    Instigator.Mesh.DetachComponent(Mesh);
    // End:0xCA
    if(bMirrored)
    {
        Instigator.Mesh.AttachComponentToSocket(Mesh, PawnAttachmentSocket_Mirrored);        
    }
    else
    {
        Instigator.Mesh.AttachComponentToSocket(Mesh, PawnAttachmentSocket);
    }
    //return;    
}

simulated function DetachGrenadeMesh()
{
    local /*0x97E50000-0x00000000*/ private bool bDropped[9437185], bAborted;

    // End:0x1EA
    if(Mesh != none)
    {
        // End:0xF2
        if(Instigator.IsHumanControlled() && PlayerController(Instigator.Controller).bCinematicMode)
        {
            AmmoLeftForWeapon == Max(AmmoLeftForWeapon + 1, GetMaxAmmoForWeapon());
            // End:0xE1
            if(int(Role) == int(ROLE_Authority))
            {
                LPPawn(Instigator).ShowGrenades(AmmoLeftForWeapon);
            }
            GotoState('Idle');            
        }
        else
        {
            // End:0x110
            if(bAborted)
            {
                GotoState('Aborting');                
            }
            else
            {
                // End:0x130
                if(!bDropped)
                {
                    GotoState('Throwing');                    
                }
                else
                {
                    GotoState('Dropping');
                }
            }
        }
        StopCustomWeaponAnimation(0.0000000);
        Mesh.SetShadowParent(none);
        Mesh.SetLightEnvironment(none);
        Instigator.Mesh.DetachComponent(Mesh);
        Mesh.SetHidden(true);
    }
    //return;    
}

simulated function GetProjectileClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return GrenadeProjectileClass;
    //return ReturnValue;    
}

simulated function ReleaseGrenade()
{
    local /*0x97E50000-0x00000000*/ private bool bDropped[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL projLoc, projDir, projRot, SpawnedProjectile;

    // End:0x220
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        GetProjectileFirePositionAndRotation(projLoc, projDir, projRot);
        SpawnedProjectile = LPProj_Grenade(Spawn(GetProjectileClass(), self,, projLoc, projRot));
        // End:0x220
        if((SpawnedProjectile != none) && !SpawnedProjectile.bDeleteMe)
        {
            SpawnedProjectile.Init(Vector(projRot));
            // End:0x139
            if(!bDropped)
            {
                SpawnedProjectile.Velocity = GetInitialProjectileVelocity(projLoc, projDir);                
            }
            else
            {
                SpawnedProjectile.Velocity = Instigator.Velocity + vect(0.0000000, 0.0000000, -10.0000000);
            }
            SpawnedProjectile.AddSpin(((bUnderhandToss) ? Vector(projRot) * (float(40) + (FRand() * float(5))) : -Vector(projRot) * (float(12) + (FRand() * float(4)))));
            Instigator.TriggerEventClass(Class'LPSeqEvent_WeaponFired', Instigator);
        }
    }
    //return;    
}

simulated function GetExtraCoverOffset()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Offset, CoverPawn;

    CoverPawn = SPGFCoverPawn(Instigator);
    // End:0x208
    if(CoverPawn != none)
    {
        // End:0x208
        if(int(CoverPawn.CoverType) != int(0))
        {
            switch(CoverPawn.CoverType)
            {
                // End:0x97
                case 1:
                    Offset = SpawnOffset_StandingCoverRight;
                    // End:0x1AB
                    break;
                // End:0x1A0
                case 2:
                    Offset = SpawnOffset_CoverPopUp;
                    // End:0x19D
                    if(CoverPawn.IsAtCoverEdge(CoverPawn.bIsMirrored, true, 0.5000000) && !CoverPawn.CurrentLink.Slots[CoverPawn.CurrentSlotIdx].bCanPopUp || CoverPawn.bPreferLeanOverPopup)
                    {
                        Offset = SpawnOffset_MidCoverRight;
                    }
                    // End:0x1AB
                    break;
                // End:0x1A8
                case 3:
                    // End:0x1AB
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            // End:0x208
            if(CoverPawn.bIsMirrored)
            {
                Offset.Y = -Offset.Y;
            }
        }
    }
    Offset = Offset >> CoverPawn.Rotation;
    return Offset;
    //return ReturnValue;    
}

simulated function GetPhysicalFireStartLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL AimDir[9437185], ReturnValue, FireLoc, HitLocation, HitNormal, HitActor,
	    SM, PawnOwner;

    local /*0x97E50000-0x00000000*/ private name ThrowAnim;
    local /*0x97E50000-0x00000000*/ private @NULL Temp, Rot;

    PawnOwner = LPPawn(Instigator);
    SM = LPSM_GrenadePrimeThrowBase(SPPawn(Owner).GetCurrentSpecialMoveInstance());
    // End:0x92
    if(SM == none)
    {
        FireLoc = Instigator.Location;        
    }
    else
    {
        ThrowAnim = SM.GetGrenadeThrowAnimName();
        FireLoc = PredictSpawnPointFromAnimName(PawnOwner.Mesh, ThrowAnim, PawnAttachmentSocket);
    }
    FireLoc += (GetExtraCoverOffset());
    // End:0x232
    if(PawnOwner.bDoing360Aiming)
    {
        Temp = FireLoc - PawnOwner.Location;
        Rot.Pitch = 0;
        Rot.Roll = 0;
        Rot.Yaw = PawnOwner.Grenade360DegreeYawOffset;
        Temp = Temp >> Rot;
        FireLoc = PawnOwner.Location + Temp;
    }
    HitActor = Instigator.Trace(HitLocation, HitNormal, FireLoc, Instigator.Location, true,,, 8);
    // End:0x2B4
    if(HitActor != none)
    {
        FireLoc = HitLocation;
    }
    return FireLoc;
    //return ReturnValue;    
}

simulated function GetPhysicalFireStartLocAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ProjLoc[25165825], out_ProjRot;
    local /*0x97E50000-0x00000000*/ private name AttachmentSocket;

    AttachmentSocket = GetPawnAttachmentSocket(LPPawn(Instigator));
    Instigator.Mesh.GetSocketWorldLocationAndRotation(AttachmentSocket, out_ProjLoc, out_ProjRot);
    out_ProjLoc = GetPhysicalFireStartLoc();
    //return;    
}

simulated function GetAdjustedAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartFireLoc[8388609], ReturnValue, AimRot;

    AimRot = super(SPInventoryWeapon).GetAdjustedAim(StartFireLoc);
    AimRot.Pitch = (NormalizeRotAxis(AimRot.Pitch) + GrenadeAimingTrajectoryPitchAdjustment) + ((bUnderhandToss) ? UnderhandTossPitchAdjustment : 0);
    return AimRot;
    //return ReturnValue;    
}

simulated function GetProjectileFirePositionAndRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ProjLoc[25165825], out_ProjDir, out_ProjRot;

    GetPhysicalFireStartLocAndRotation(out_ProjLoc, out_ProjRot);
    out_ProjDir = Vector(GetAdjustedAim(out_ProjLoc));
    //return;    
}

simulated function GetInitialProjectileVelocity()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLoc[25296897], AimDir, ReturnValue;
    local /*0x97E50000-0x00000000*/ private float Pct;
    local /*0x97E50000-0x00000000*/ private @NULL vel, PitchLimits;

    PitchLimits.X = Instigator.ViewPitchMin;
    PitchLimits.Y = Instigator.ViewPitchMax;
    Pct = FClamp(GetRangePctByValue(PitchLimits, float(Rotator(AimDir).Pitch)), 0.0000000, 1.0000000);
    Pct = Pct ** GrenadeVelRangePow;
    vel = Normal(AimDir) * GetRangeValueByPct(GrenadeVelRange, Pct);
    return vel;
    //return ReturnValue;    
}

simulated function TryPutDown()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    GotoState('Idle');
    InvManager.ChangedWeapon();
    return true;
    //return ReturnValue;    
}

function CheckIfOutOfGrenades()
{
    //return;    
}

simulated function HasGrenades()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x25
    if(((GetMaxAmmoForWeapon()) < 0) || AmmoLeftForWeapon > 0)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AddAmmo()
{
    local /*0x97E50000-0x00000000*/ private int AmmoToAdd[8388609], ReturnValue;

    super(SPInventoryWeapon).AddAmmo(AmmoToAdd);
    // End:0x73
    if((int(Role) == int(ROLE_Authority)) && LPPawn(Instigator) != none)
    {
        LPPawn(Instigator).ShowGrenades(AmmoLeftForWeapon);
    }
    return AmmoToAdd;
    //return ReturnValue;    
}

function SetAmmoFromWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL W[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    AmmoLeftForWeapon = 0;
    AddAmmo(W.AmmoLeftForWeapon);
    return true;
    //return ReturnValue;    
}

simulated state WeaponEquipping
{
    simulated function WeaponEquipped()
    {
        super.WeaponEquipped();
        GotoState('Idle');
        //return;        
    }
    stop;    
}

simulated state Idle
{
    ignores BeginState, EndState;
Begin:

    bPriming = false;
    stop;                
}

simulated state Priming
{
    ignores BeginState;

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x2E
        if(PreviewComponent != none)
        {
            PreviewComponent.StopPreview();
        }
        //return;        
    }

    simulated function Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super(SPInventoryWeapon).Tick(DeltaTime);
        // End:0x79
        if(PreviewComponent != none)
        {
            // End:0x5A
            if(ShouldDrawProjectilePreviewComponent())
            {
                PreviewComponent.UpdatePreview(DeltaTime);                
            }
            else
            {
                PreviewComponent.StopPreview();
            }
        }
        //return;        
    }
Begin:

    bPriming = true;
    // End:0x81
    if(int(Role) == int(ROLE_Authority))
    {
        AmmoLeftForWeapon--;
        bForceNetUpdate = true;
        // End:0x81
        if(LPPawn(Instigator) != none)
        {
            LPPawn(Instigator).ShowGrenades(AmmoLeftForWeapon);
        }
    }
    stop;            
}

simulated state Throwing
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        ReleaseGrenade();
        CheckIfOutOfGrenades();
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        bUnderhandToss = false;
        //return;        
    }
Begin:

    bPriming = false;
    Sleep(0.1000000);
    GotoState('Idle');
    stop;        
}

simulated state Dropping
{
    ignores EndState;

    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        ReleaseGrenade(true);
        CheckIfOutOfGrenades();
        //return;        
    }
Begin:

    bPriming = false;
    Sleep(0.1000000);
    GotoState('Idle');
    stop;        
}

simulated state Aborting
{
    ignores BeginState, EndState;
Begin:

    bPriming = false;
    // End:0x81
    if(int(Role) == int(ROLE_Authority))
    {
        AmmoLeftForWeapon++;
        bForceNetUpdate = true;
        // End:0x81
        if(LPPawn(Instigator) != none)
        {
            LPPawn(Instigator).ShowGrenades(AmmoLeftForWeapon);
        }
    }
    Sleep(0.1000000);
    GotoState('Idle');
    stop;                    
}

defaultproperties
{
    GrenadeVelRange=(X=800.0000000,Y=2100.0000000)
    GrenadeVelRangePow=1.0000000
    GrenadeAimingTrajectoryPitchAdjustment=3000
    SpawnOffset_StandingCoverRight=(X=0.0000000,Y=50.0000000,Z=0.0000000)
    SpawnOffset_MidCoverRight=(X=0.0000000,Y=50.0000000,Z=0.0000000)
    SpawnOffset_CoverPopUp=(X=0.0000000,Y=0.0000000,Z=30.0000000)
    // Reference: SPGFWeaponArcPreviewComponent'Default__LPWeaponGrenade.PreviewComponentA'
    begin object name=PreviewComponentA class=Class'SPGameFramework.SPGFWeaponArcPreviewComponent'
    end object
    PreviewComponent=PreviewComponentA
    bRequiresInputForNewPickup=true
    // Reference: StaticMeshComponent'Default__LPWeaponGrenade.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponGrenade.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="grenade"
    FriendlyName="Frag Grenades"
    Description="Basic shrapnel grenade that damages any target within the blast radius.  Explodes in 2 seconds after being thrown."
    bCanEquip=false
    bSecondaryWeapon=true
    UniqueSetClass=Class'LPWeaponGrenade'
    // Reference: SkeletalMeshComponent'Default__LPWeaponGrenade.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Frag Grenade(s)"
    // Reference: StaticMeshComponent'Default__LPWeaponGrenade.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
    Components[1]=PreviewComponentA
}