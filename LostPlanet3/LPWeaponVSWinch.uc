class LPWeaponVSWinch extends LPVSInventoryParts
    hidecategories(AnimDependency,Navigation);

struct native WinchTargetInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetActor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WinchPointIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WinchPointLocation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Distance;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngleCos;

    structdefaultproperties
    {
        TargetActor=none
        WinchPointIndex=0
        WinchPointLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Distance=0.0000000
        AngleCos=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPPawn MyLpPawnOwner[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel @NULL SpawnedProjectile[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ProjectileVelocity;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrabbedPawn[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GrabbedPawnWinchPointIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrabbedObject;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WinchPos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WinchRot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WinchSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WinchDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAttachNotified;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUpgraded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrabbedFromClaw;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsKismetLocked;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponentLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL WinchCable[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class WinchProjectileClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WinchPointOffset;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersWinchRangeExtension[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersWinchRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersWinchPointSearchRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersWinchLaunchVelocity[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersWinchVelocity[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersWinchRetractVelocity[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OwnersWinchPointAutoTargetAngleCos[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name OwnersWinchBoneName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name OwnersWinchProjBoneName[536870913];

function StartInteractingWithLargePawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function StartInteractingWithSmallPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function PlowThroughAndAttachPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function FinishInteractingWithLargePawn()
{
    local /*0x97E50000-0x00000000*/ private bool bSuccess[8388609];

    //return;    
}

function CleanupSound()
{
    //return;    
}

function StartDraggingLargePawn()
{
    //return;    
}

function StartGrabbingLargePawn()
{
    //return;    
}

simulated event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(Actor).Tick(DeltaTime);
    Update(DeltaTime);
    //return;    
}

function InitFromPlayerControlledVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;

    vsPlayerPawn = LPVSPlayerPawn(MyLPPawn);
    // End:0x20B
    if(vsPlayerPawn != none)
    {
        super.InitFromPlayerControlledVs();
        OwnersWinchRangeExtension = 0.0000000;
        OwnersWinchRange = vsPlayerPawn.TuneDataVSPlayerPawn.WinchRange;
        OwnersWinchPointSearchRange = vsPlayerPawn.TuneDataVSPlayerPawn.WinchPointSearchRange;
        OwnersWinchLaunchVelocity = vsPlayerPawn.TuneDataVSPlayerPawn.WinchLaunchVelocity;
        OwnersWinchVelocity = vsPlayerPawn.TuneDataVSPlayerPawn.WinchVelocity;
        OwnersWinchRetractVelocity = vsPlayerPawn.TuneDataVSPlayerPawn.WinchVelocity;
        OwnersWinchPointAutoTargetAngleCos = Cos(vsPlayerPawn.TuneDataVSPlayerPawn.WinchPointAutoTargetAngle * 0.0174533);
        OwnersWinchBoneName = vsPlayerPawn.WinchBoneName;
        OwnersWinchProjBoneName = vsPlayerPawn.WinchProjBoneName;
    }
    //return;    
}

function OnToggleAllowVSWinchInput()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bIsKismetLocked = true;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bIsKismetLocked = false;            
        }
        else
        {
            // End:0xDB
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bIsKismetLocked = !bIsKismetLocked;
            }
        }
    }
    //return;    
}

simulated function GetWinchRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], extension;
    local /*0x97E50000-0x00000000*/ private @NULL lpvpp, LPPC, ExtendedWinchUpgrade;

    // End:0x179
    if(MyLpPawnOwner != none)
    {
        lpvpp = LPVSPlayerPawn(MyLpPawnOwner);
        // End:0x166
        if(lpvpp != none)
        {
            LPPC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);
            // End:0x163
            if((LPPC != none) && LPPC.HasUpgrade(Class'LPVSUpgrade_ExtendedWinch', ExtendedWinchUpgrade))
            {
                extension = LPVSUpgrade_ExtendedWinch(ExtendedWinchUpgrade).GetModifier();
                // End:0x163
                if(!bUpgraded)
                {
                    bUpgraded = true;
                    WinchCable.Init(self, 12, (OwnersWinchRange + extension) * 1.2000000, GetCableEndpoints);
                }
            }            
        }
        else
        {
            extension = OwnersWinchRangeExtension;
        }
    }
    return OwnersWinchRange + extension;
    //return ReturnValue;    
}

simulated function GetWinchSearchRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], extension;
    local /*0x97E50000-0x00000000*/ private @NULL lpvpp, LPPC, ExtendedWinchUpgrade;

    // End:0x16F
    if(MyLpPawnOwner != none)
    {
        lpvpp = LPVSPlayerPawn(MyLpPawnOwner);
        // End:0x15C
        if(lpvpp != none)
        {
            LPPC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);
            // End:0x159
            if((LPPC != none) && LPPC.HasUpgrade(Class'LPVSUpgrade_ExtendedWinch', ExtendedWinchUpgrade))
            {
                // End:0x127
                if(!bUpgraded)
                {
                    bUpgraded = true;
                    WinchCable.Init(self, 12, (GetWinchRange()) * 1.2000000, GetCableEndpoints);
                }
                extension = LPVSUpgrade_ExtendedWinch(ExtendedWinchUpgrade).GetModifier();
            }            
        }
        else
        {
            extension = OwnersWinchRangeExtension;
        }
    }
    return OwnersWinchPointSearchRange + extension;
    //return ReturnValue;    
}

reliable client simulated function ClientGivenTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewOwner[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate[8388609];

    super.ClientGivenTo(NewOwner, bDoNotActivate);
    MyLpPawnOwner = LPPawn(NewOwner);
    WinchCable.Init(self, 12, (GetWinchRange()) * 1.2000000, GetCableEndpoints);
    AttachComponent(WinchCable);
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x7A
    if(VarName == 'MyLpPawnOwner')
    {
        // End:0x77
        if(!bInitialized)
        {
            bInitialized = true;
            WinchCable.Init(self, 12, (GetWinchRange()) * 1.2000000, GetCableEndpoints);
        }        
    }
    else
    {
        // End:0x94
        if(VarName == 'SpawnedProjectile')
        {            
        }
        else
        {
            super(Actor).ReplicatedEvent(VarName);
        }
    }
    //return;    
}

simulated function GetCableEndpoints()
{
    local /*0x97E50000-0x00000000*/ private @NULL sourcepos[25165825], TargetPos;
    local /*0x97E50000-0x00000000*/ private bool Found;
    local /*0x97E50000-0x00000000*/ private name WinchSocket;

    WinchSocket = 'WinchCable';
    Found = MyLpPawnOwner.Mesh.GetSocketWorldLocationAndRotation(WinchSocket, sourcepos);
    // End:0x75
    if(!Found)
    {
    }
    Found = false;
    // End:0xE4
    if(SpawnedProjectile != none)
    {
        Found = SpawnedProjectile.GetSkeletalMesh().GetSocketWorldLocationAndRotation('CableEnd', TargetPos);
    }
    // End:0x106
    if(!Found)
    {
        TargetPos = sourcepos;
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function NotifyHitPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609], HitLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function IsValidTargetPointAlongAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetPoint[25296897], AimStart, AimDirection;
    local /*0x97E50000-0x00000000*/ private float MaxDistance[8388609], MinAngleCos, OutAngleCos, OutDistToPoint;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Delta;

    Delta = TargetPoint - AimStart;
    OutAngleCos = Normal(Delta) Dot AimDirection;
    // End:0x85
    if(OutAngleCos > MinAngleCos)
    {
        OutDistToPoint = VSize(Delta);
        // End:0x85
        if(OutDistToPoint < MaxDistance)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function IsValidWinchPointAlongAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL WP[8388609];
    local /*0x97E50000-0x00000000*/ private float MaxDistance[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentViewLoc, AimDirection, CurrentViewRot, CameraMgr;

    CurrentViewRot = MyLpPawnOwner.Rotation;
    CameraMgr = SPPlayerCameraManager(LPPlayerController(MyLpPawnOwner.Controller).PlayerCamera);
    CameraMgr.GetCameraViewPoint(CurrentViewLoc, CurrentViewRot);
    AimDirection = MyLpPawnOwner.AimController.GetWorldAimDir();
    // End:0x10C
    if(MaxDistance <= float(0))
    {
        MaxDistance = GetWinchRange();
    }
    return IsValidTargetPointAlongAim(WP.Location, CurrentViewLoc, AimDirection, MaxDistance, OwnersWinchPointAutoTargetAngleCos);
    //return ReturnValue;    
}

event IsValidPawnWinchPointAlongAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private int WinchPointIdx[8388609];
    local /*0x97E50000-0x00000000*/ private float MaxDistance[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentViewLoc, AimDirection, TempLocation, CurrentViewRot, CameraMgr;

    // End:0x30
    if(!P.IsWinchPointEnabled(WinchPointIdx))
    {
        return false;
    }
    CurrentViewRot = MyLpPawnOwner.Rotation;
    CameraMgr = SPPlayerCameraManager(LPPlayerController(MyLpPawnOwner.Controller).PlayerCamera);
    CameraMgr.GetCameraViewPoint(CurrentViewLoc, CurrentViewRot);
    AimDirection = MyLpPawnOwner.AimController.GetWorldAimDir();
    // End:0x13B
    if(MaxDistance <= float(0))
    {
        MaxDistance = GetWinchRange();
    }
    TempLocation = P.GetWinchPointCollisionLocation(WinchPointIdx);
    return IsValidTargetPointAlongAim(TempLocation, CurrentViewLoc, AimDirection, MaxDistance, Cos(P.TuneDataPawn.WinchAutoTargetAngle.GetValue() * 0.0174533));
    //return ReturnValue;    
}

function FindWinchTargetsAlongAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL InProjectile[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array OutWinchTargetArray[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL LPWP, CameraMgr, TempLocation, CurrentViewLoc, AimDirection;

    local /*0x97E50000-0x00000000*/ private float SearchDistance;
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, CurLPPawn, WTI, CurrentViewRot;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private float MinAngleCos, Dummy, ActualAngleCos, ActualDistance;
    local /*0x97E50000-0x00000000*/ private bool bFoundPawnWinchPoint;

    CurrentViewRot = MyLpPawnOwner.Rotation;
    CameraMgr = SPPlayerCameraManager(LPPlayerController(MyLpPawnOwner.Controller).PlayerCamera);
    CameraMgr.GetCameraViewPoint(CurrentViewLoc, CurrentViewRot);
    AimDirection = MyLpPawnOwner.AimController.GetWorldAimDir();
    SearchDistance = GetWinchRange();
    CurPawn = WorldInfo.PawnList;
    J0x122:

    // End:0x58E [Loop If]
    if(CurPawn != none)
    {
        CurLPPawn = LPPawn(CurPawn);
        // End:0x563
        if(((CurLPPawn != none) && CurLPPawn != MyLpPawnOwner) && CurLPPawn.Base != MyLpPawnOwner)
        {
            bFoundPawnWinchPoint = false;
            MinAngleCos = Cos(CurLPPawn.TuneDataPawn.WinchAutoTargetAngle.GetValue() * 0.0174533);
            Idx = 0;
            J0x216:

            // End:0x3DA [Loop If]
            if(Idx < CurLPPawn.WinchPoints.Length)
            {
                // End:0x3CC
                if(CurLPPawn.IsWinchPointEnabled(Idx))
                {
                    TempLocation = CurLPPawn.GetWinchPointCollisionLocation(Idx);
                    // End:0x3CC
                    if(IsValidTargetPointAlongAim(TempLocation, CurrentViewLoc, AimDirection, SearchDistance, MinAngleCos, ActualAngleCos, ActualDistance))
                    {
                        WTI.WinchPointLocation = TempLocation;
                        WTI.TargetActor = CurLPPawn;
                        WTI.WinchPointIndex = Idx;
                        WTI.Distance = ActualDistance;
                        WTI.AngleCos = ActualAngleCos;
                        OutWinchTargetArray.AddItem(WTI);                        
                        bFoundPawnWinchPoint = true;
                    }
                }
                Idx++;
                // [Loop Continue]
                goto J0x216;
            }
            // End:0x563
            if(!bFoundPawnWinchPoint)
            {
                // End:0x563
                if(InProjectile.CanThisPawnBeDamagedByPhysicalContactWithTheWinch(CurLPPawn, Dummy))
                {
                    // End:0x563
                    if(IsValidTargetPointAlongAim(CurLPPawn.Location, CurrentViewLoc, AimDirection, SearchDistance, MinAngleCos, ActualAngleCos, ActualDistance))
                    {
                        WTI.WinchPointLocation = CurLPPawn.Location;
                        WTI.TargetActor = CurLPPawn;
                        WTI.WinchPointIndex = -1;
                        WTI.Distance = ActualDistance;
                        WTI.AngleCos = ActualAngleCos;
                        OutWinchTargetArray.AddItem(WTI);                        
                    }
                }
            }
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x122;
    }
    // End:0x70C
    foreach DynamicActors(Class'LPVSWinchPoint', LPWP)
    {
        // End:0x70B
        if(LPWP.bEnabled)
        {
            // End:0x70B
            if(IsValidTargetPointAlongAim(LPWP.Location, CurrentViewLoc, AimDirection, SearchDistance, OwnersWinchPointAutoTargetAngleCos, ActualAngleCos, ActualDistance))
            {
                WTI.WinchPointLocation = LPWP.Location;
                WTI.TargetActor = LPWP;
                WTI.WinchPointIndex = 0;
                WTI.Distance = ActualDistance;
                WTI.AngleCos = ActualAngleCos;
                OutWinchTargetArray.AddItem(WTI);                
            }
        }        
    }    
    //return;    
}

function FindBestWinchPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL InProjectile[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array WinchTargetArray[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL OutTargetInfo[25165825];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private float MaxWinchRange;

    FindWinchTargetsAlongAim(InProjectile, WinchTargetArray);
    OutTargetInfo.AngleCos = -1.0000000;
    // End:0x10D
    if(WinchTargetArray.Length > 0)
    {
        Idx = 0;
        J0x59:

        // End:0x10D [Loop If]
        if(Idx < WinchTargetArray.Length)
        {
            // End:0xFF
            if((OutTargetInfo.AngleCos == float(-1)) || WinchTargetArray[Idx].AngleCos > OutTargetInfo.AngleCos)
            {
                OutTargetInfo = WinchTargetArray[Idx];
            }
            Idx++;
            // [Loop Continue]
            goto J0x59;
        }
    }
    // End:0x301
    if(OutTargetInfo.AngleCos == float(-1))
    {
        MaxWinchRange = GetWinchRange();
        OutTargetInfo.TargetActor = none;
        OutTargetInfo.WinchPointLocation = MyLpPawnOwner.AimController.GetAimCollisionPoint();
        OutTargetInfo.Distance = VSize(OutTargetInfo.WinchPointLocation - MyLPPawn.Location);
        OutTargetInfo.AngleCos = 1.0000000;
        // End:0x301
        if(OutTargetInfo.Distance > MaxWinchRange)
        {
            OutTargetInfo.WinchPointLocation = MyLpPawnOwner.Location + (MyLpPawnOwner.AimController.GetWorldAimDir() * MaxWinchRange);
            OutTargetInfo.Distance = MaxWinchRange;
        }
    }
    //return;    
}

simulated function CreateWinchProjectile()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPosition[8388609], InRotation, ReturnValue, WinchProjectile;

    WinchProjectile = Spawn(WinchProjectileClass, MyLPPawn,, InPosition, InRotation);
    return WinchProjectile;
    //return ReturnValue;    
}

simulated function SetupWinchProjectile()
{
    local /*0x97E50000-0x00000000*/ private @NULL InProjectile[8388609], InVelocity, TargetInfo, vsPawn;

    SpawnedProjectile = InProjectile;
    InProjectile.Init(Normal(InVelocity));
    InProjectile.vsPawn = MyLPPawn;
    InProjectile.VSWinch = self;
    InProjectile.Instigator = MyLPPawn;
    InProjectile.LifeSpan = 0.0000000;
    InProjectile.SetVelocity(InVelocity);
    InProjectile.ForcedWinchAssistPawn = LPAIPawn(TargetInfo.TargetActor);
    // End:0x1C4
    if((GrabbedPawn != none) && GrabbedPawn.TuneDataAIPawn.bCanBeThrownByVS)
    {
        InProjectile.SetCollision(false, false);
        InProjectile.bBlockActors = false;        
    }
    else
    {
        // End:0x251
        if(GrabbedObject != none)
        {
            InProjectile.SetCollision(false, false);
            InProjectile.bBlockActors = false;
            GrabbedObject.SetCollisionType(2);
            GrabbedObject.bCollideWorld = true;
        }
    }
    vsPawn = LPVSPlayerPawn(MyLPPawn);
    // End:0x2A4
    if(vsPawn != none)
    {
        vsPawn.NotifyWinchProjectileFired(InProjectile);
    }
    // End:0x3E0
    if(vsPawn != none)
    {
        // End:0x3E0
        if(!IsZero(vsPawn.RequestedWinchLocation))
        {
            InProjectile.bBlockActors = false;
            InProjectile.bCollideWorld = false;
            InProjectile.bNoEncroachCheck = true;
            InProjectile.bWasWinchpointActiveOnFire = true;
            InProjectile.bIgnoreWinchpointInactiveCheck = true;
            InProjectile.SetLocation(vsPawn.RequestedWinchLocation);
            vsPawn.RequestedWinchLocation = vect(0.0000000, 0.0000000, 0.0000000);
        }
    }
    //return;    
}

simulated function GetPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], pos;

    // End:0x62
    if(SpawnedProjectile != none)
    {
        SpawnedProjectile.GetSkeletalMesh().GetSocketWorldLocationAndRotation('Center', pos);
        return pos;
    }
    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

simulated function IsRetracted()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return SpawnedProjectile == none;
    //return ReturnValue;    
}

function ExecutePawnWinchPointAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int WinchPointIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPVP, WPInfo, LatentAction;

    LPVP = LPBaseVSPlayerPawn(Instigator);
    // End:0x1FC
    if(LPVP != none)
    {
        GrabbedPawn = HitPawn;
        GrabbedPawnWinchPointIndex = WinchPointIndex;
        WPInfo = HitPawn.WinchPoints[WinchPointIndex];
        // End:0xFF
        if(WPInfo.RetractWinchSM != none)
        {
            LPVP.DoSpecialMove(WPInfo.RetractWinchSM, true, true, None, HitPawn);            
        }
        else
        {
            LPVP.DoSpecialMove(Class'LPSM_PlayerVSWinchFireRetractWithSmallPawn', true, true, None, HitPawn);
        }
        LPVP.TriggerEventClass(Class'LPSeqEvent_VitalSuitWinch', HitPawn, 0);
        // End:0x1F9
        foreach GrabbedPawn.LatentActions(LatentAction)
        {
            // End:0x1F8
            if(ClassIsChildOf(LatentAction.Class, Class'Engine.SeqAct_Interp'))
            {
                LatentAction.AbortFor(GrabbedPawn);
            }            
        }        
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CleanupProjectile()
{
    // End:0x32
    if(SpawnedProjectile != none)
    {
        SpawnedProjectile.Destroy();
        SpawnedProjectile = none;
    }
    MyLpPawnOwner.Mesh.UnHideBoneByName(OwnersWinchProjBoneName);
    //return;    
}

function Init()
{
    InitFromPlayerControlledVs();
    InitFromAiControlledVs();
    PartState = 0;
    //return;    
}

simulated event Destroyed()
{
    // End:0x55
    if(WinchCable != none)
    {
        DetachComponent(WinchCable);
        Class'Engine.SPObject'.static.MarkObjectAsPendingKill(WinchCable);
        WinchCable = none;
    }
    // End:0x87
    if(SpawnedProjectile != none)
    {
        SpawnedProjectile.Destroy();
        SpawnedProjectile = none;
    }
    super.Destroyed();
    // End:0xE9
    if(SoundComponentLoop != none)
    {
        SoundComponentLoop.Stop();
        SoundComponentLoop.DetachFromAny();
        SoundComponentLoop = none;
    }
    //return;    
}

auto simulated state Idle
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        GrabbedPawn = none;
        SetHidden(true);
        // End:0x62
        if(SoundComponentLoop != none)
        {
            SoundComponentLoop.Stop();
            SoundComponentLoop = none;
        }
        //return;        
    }
    stop;    
}

simulated state Firing
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private editfixedsize array WinchTargetArray;
        local /*0x97E50000-0x00000000*/ private @NULL BestTargetInfo, WinchProjectile, WinchVelocity;

        super(SPStateObject).BeginState(PreviousStateName);
        bAttachNotified = false;
        WinchCable.SetTighten(false);
        // End:0x77C
        if(MyLpPawnOwner != none)
        {
            WinchPos = MyLpPawnOwner.Mesh.GetBoneLocation(OwnersWinchBoneName, 0);
            WinchRot = MyLpPawnOwner.Rotation;
            WinchProjectile = Spawn(WinchProjectileClass, MyLPPawn,, WinchPos, WinchRot);
            // End:0x233
            if(WinchProjectile == none)
            {
                // End:0x1EA
                if(ClassIsChildOf(MyLpPawnOwner.Class, Class'LPVSPlayerPawn'))
                {
                    LPVSPlayerPawn(MyLpPawnOwner).GetLPHUD().DisplayVSEnvironmentalMessage(1, "<Strings:LostPlanetGame.EnvironmentMessages.VS_OBST1>", "<Strings:LostPlanetGame.EnvironmentMessages.VS_OBST2>", true, 1.0000000);
                }
                // End:0x203
                if(GrabbedPawn != none)
                {
                    ReleasePawnFailedFiring();
                }
                MyLPPawn.EndCurrentSpecialMove();
                GotoState('Idle');
                return;
            }
            WinchSpeed = (((GrabbedPawn != none) && GrabbedPawn.TuneDataAIPawn.bCanBeThrownByVS) ? OwnersWinchLaunchVelocity : OwnersWinchVelocity);
            MyLpPawnOwner.Mesh.HideBoneByName(OwnersWinchProjBoneName, 2);
            // End:0x552
            if((GrabbedPawn != none) && GrabbedPawn.TuneDataAIPawn.bCanBeThrownByVS)
            {
                Class'SPEngine.SPUtil'.static.SetRBCollision(WinchProjectile.GetSkeletalMesh(), GrabbedPawn.Mesh, false);
                GrabbedPawn.Mesh.SetTraceBlocking(false, false);
                SPGFAimControlPlayerControlled(MyLpPawnOwner.AimController).UpdateCollisionCache();
                SetTimer(0.1500000, false, 'ReleasePawnAndForceRetract');
                MyLpPawnOwner.Mesh.DetachComponent(GrabbedPawn.Mesh);
                WinchProjectile.GetSkeletalMesh().AttachComponentToSocket(GrabbedPawn.Mesh, GrabbedPawn.TuneDataAIPawn.SocketNameToAttachToWhenGrabbedByVs);
                GrabbedPawn.SetBase(WinchProjectile,, WinchProjectile.GetSkeletalMesh(), GrabbedPawn.TuneDataAIPawn.SocketNameToAttachToWhenGrabbedByVs);                
            }
            else
            {
                SetTimer(4.0000000, false, 'ForceRetract');
            }
            FindBestWinchPoint(WinchProjectile, WinchTargetArray, BestTargetInfo);
            WinchProjectile.bWasWinchpointActiveOnFire = !ClassIsChildOf(MyLpPawnOwner.Class, Class'LPVSPlayerPawn') || (BestTargetInfo.TargetActor != none) && LPVSPlayerPawn(MyLpPawnOwner).GetLPHUD().AnyWinchPointActive(BestTargetInfo.TargetActor);
            WinchVelocity = WinchProjectile.CalculateVelocityToHitPoint(WinchPos, BestTargetInfo.WinchPointLocation, WinchSpeed, WinchProjectile.GetGravityZ());
            SetupWinchProjectile(WinchProjectile, WinchVelocity, BestTargetInfo);
            TuneDataPartsFXEventBindings.PlayEventFXAtLoc('WinchFire', GetPosition(), MyLpPawnOwner.Rotation, self, none, none);
            TuneDataPartsSoundEventBindings.PlayEventSoundLocally('WinchFire', 'None', self, none, none);
        }
        //return;        
    }

    simulated function ForceRetract()
    {
        GotoState('Retracting');
        //return;        
    }

    simulated function ReleasePawnFailedFiring()
    {
        local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

        vsPawn = LPVSPlayerPawn(MyLpPawnOwner);
        vsPawn.Mesh.DetachComponent(GrabbedPawn.Mesh);
        GrabbedPawn.SetBase(none);
        vsPawn.EndHoldingPawn();
        GrabbedPawn.DoVSCrushTossAction(Instigator);
        GrabbedPawn = none;
        vsPawn.GrabbedPawn = none;
        //return;        
    }

    simulated function ReleasePawnAndForceRetract()
    {
        LPVSPlayerPawn(MyLpPawnOwner).EndHoldingPawn();
        GrabbedPawn.DoVSCrushTossAction(Instigator, SpawnedProjectile.Velocity);
        GrabbedPawn = none;
        // End:0xCF
        if(ClassIsChildOf(Instigator.Class, Class'LPVSPlayerPawn'))
        {
            LPVSPlayerPawn(Instigator).GrabbedPawn = none;
        }
        GotoState('Retracting');
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('ForceRetract');
        ClearTimer('ReleasePawnAndForceRetract');
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function NotifyHitPawn()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609], HitLocation;
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private int WinchPointIndex;

        // End:0x76
        if(SpawnedProjectile != none)
        {
            WinchPointIndex = HitPawn.FindValidWinchPoint(SpawnedProjectile, HitLocation);
            // End:0x76
            if(WinchPointIndex >= 0)
            {
                return ExecutePawnWinchPointAction(HitPawn, WinchPointIndex);
            }
        }
        return false;
        //return ReturnValue;        
    }

    function StartInteractingWithLargePawn()
    {
        local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x27
        if(GrabbedPawn == inPawn)
        {
            GotoState('InteractingWithLargePawn');
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function PlowThroughAndAttachPawn()
    {
        local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x41
        if(GrabbedPawn == inPawn)
        {
            SpawnedProjectile.PlowThroughAndAttachPawn(GrabbedPawn);
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function StartInteractingWithSmallPawn()
    {
        local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x27
        if(GrabbedPawn == inPawn)
        {
            GotoState('Retracting');
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    simulated function Update()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL socketLoc, SocketRot;

        // End:0x7F
        if((((SpawnedProjectile == none) || SpawnedProjectile.IsPendingKill()) || SpawnedProjectile.bDeleteMe) || SpawnedProjectile.AttachedWinchPoint != none)
        {
            return;
        }
        // End:0xB5
        if(VSize((GetPosition()) - WinchPos) > (GetWinchRange()))
        {
            GotoState('Retracting');
            return;
        }
        // End:0x114
        if((int(SpawnedProjectile.Physics) != int(6)) && SpawnedProjectile.AttachedWinchPoint == none)
        {
            GotoState('Retracting');
            return;
        }
        // End:0x21E
        if((GrabbedPawn != none) && GrabbedPawn.TuneDataAIPawn.bCanBeThrownByVS)
        {
            SpawnedProjectile.GetSkeletalMesh().GetSocketWorldLocationAndRotation('AkridGrabPoint', socketLoc, SocketRot);
            GrabbedPawn.SetLocation(socketLoc);
            GrabbedPawn.SetRotation(SocketRot);
            ProjectileVelocity = SpawnedProjectile.Velocity;
        }
        // End:0x2C7
        if(GrabbedObject != none)
        {
            SpawnedProjectile.GetSkeletalMesh().GetSocketWorldLocationAndRotation('ClawGrabPoint', socketLoc, SocketRot);
            GrabbedObject.SetLocation(socketLoc);
            GrabbedObject.SetRotation(SocketRot);
        }
        // End:0x391
        if(SpawnedProjectile.bIsAttached)
        {
            // End:0x391
            if(!bAttachNotified)
            {
                bAttachNotified = true;
                TuneDataPartsSoundEventBindings.PlayEventSoundLocally('WinchAttach', 'None', Instigator, none, none);
                SoundComponentLoop = TuneDataPartsSoundEventBindings.PlayEventSoundLocallyEx('WinchRetract', 'None', MyLpPawnOwner, none, none, SoundComponentLoop);
            }
        }
        //return;        
    }
    stop;    
}

simulated state Holding
{    stop;    
}

simulated state Retracting
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        LPVSPlayerPawn(MyLpPawnOwner).NotifyWinchProjectileRetracting();
        // End:0xC4
        if((SpawnedProjectile != none) && SpawnedProjectile.AttachedWinchPoint != none)
        {
            SpawnedProjectile.AttachedWinchPoint.NotifyWinchDetached();
            SpawnedProjectile.AttachedWinchPoint = none;
        }
        // End:0x155
        if(GrabbedObject != none)
        {
            // End:0x155
            if(int(WorldInfo.NetMode) != int(NM_Client))
            {
                LPDStaticMesh_VSGrabbable(GrabbedObject).DoVSCrushTossAction(Instigator, (float(2) * WinchSpeed) * Vector(WinchRot));
                GrabbedObject = none;
            }
        }
        // End:0x174
        if(SpawnedProjectile == none)
        {
            GotoState('Idle');
            return;
        }
        SpawnedProjectile.CloseWinch();
        SpawnedProjectile.StopSimulating();
        // End:0x224
        if(OwnersWinchRetractVelocity > 0.0000000)
        {
            SpawnedProjectile.LifeSpan = 2.0000000 + (VSize(MyLpPawnOwner.Location - WinchPos) / OwnersWinchRetractVelocity);            
        }
        else
        {
            SpawnedProjectile.LifeSpan = 4.0000000;
        }
        SpawnedProjectile.StartRetract();
        // End:0x2D7
        if((SpawnedProjectile != none) && SoundComponentLoop == none)
        {
            SoundComponentLoop = TuneDataPartsSoundEventBindings.PlayEventSoundLocallyEx('WinchRetract', 'None', MyLpPawnOwner, none, none, SoundComponentLoop);
        }
        // End:0x306
        if(WinchCable != none)
        {
            WinchCable.SetTighten(true);
        }
        // End:0x385
        if((GrabbedPawn == none) || (PreviousStateName == 'WinchPointInteracting') && !MyLpPawnOwner.IsDoingSpecialMove(Class'LPSM_PlayerVSDeath'))
        {
            LPBaseVSPlayerPawn(MyLpPawnOwner).ForceRetractWinch();
        }
        // End:0x40B
        if(GrabbedPawn != none)
        {
            Class'SPEngine.SPUtil'.static.SetRBCollision(GrabbedPawn.Mesh, MyLpPawnOwner.Mesh, false);
            GrabbedPawn.SetCollision(false, false, false);
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x65
        if(SpawnedProjectile != none)
        {
            SpawnedProjectile.VSWinch = none;
            SpawnedProjectile.Destroy();
            SpawnedProjectile = none;
        }
        // End:0x87
        if(NextStateName != 'HoldingPawn')
        {
            GrabbedPawn = none;
        }
        // End:0xC0
        if(SoundComponentLoop != none)
        {
            SoundComponentLoop.Stop();
            SoundComponentLoop = none;
        }
        // End:0x10B
        if(MyLpPawnOwner.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchFireBase'))
        {
            MyLpPawnOwner.EndCurrentSpecialMove();
        }
        LPVSPlayerPawn(MyLpPawnOwner).NotifyWinchProjectileRetracted();
        MyLpPawnOwner.Mesh.UnHideBoneByName(OwnersWinchProjBoneName);
        //return;        
    }

    simulated function Update()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL socketLoc, returnDir, newAccel, SocketRot;
        local /*0x97E50000-0x00000000*/ private float facing;

        MyLpPawnOwner.Mesh.GetSocketWorldLocationAndRotation('WinchCable', socketLoc, SocketRot);
        returnDir = Normal(socketLoc - SpawnedProjectile.Location);
        newAccel = returnDir * float(10000);
        SpawnedProjectile.SetRBVel(newAccel * DeltaTime);
        SpawnedProjectile.SetLocation(SpawnedProjectile.Location + (newAccel * DeltaTime));
        facing = Vector(MyLpPawnOwner.Rotation) Dot returnDir;
        // End:0x283
        if((((SpawnedProjectile == none) || SpawnedProjectile.IsPendingKill()) || VSize(socketLoc - SpawnedProjectile.Location) < 50.0000000) || facing > -0.0100000)
        {
            TuneDataPartsSoundEventBindings.PlayEventSoundLocally('WinchStop', 'None', MyLpPawnOwner, none, none);
            // End:0x26A
            if((GrabbedPawn != none) && GrabbedPawn.TuneDataAIPawn.bCanBeThrownByVS)
            {
                GotoState('HoldingPawn');                
            }
            else
            {
                GrabbedPawn = none;
                GotoState('Idle');
            }
        }
        //return;        
    }
    stop;    
}

simulated state InteractingWithLargePawn
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SpawnedProjectile.CloseWinch();
        SpawnedProjectile.StopSimulating();
        SpawnedProjectile.SetFixed();
        SpawnedProjectile.InterpolateToPawnWinchPoint(GrabbedPawn, GrabbedPawnWinchPointIndex);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x5A
        if(NextStateName != 'Retracting')
        {
            CleanupProjectile();
            // End:0x5A
            if(SoundComponentLoop != none)
            {
                SoundComponentLoop.Stop();
                SoundComponentLoop = none;
            }
        }
        //return;        
    }

    function CleanupSound()
    {
        // End:0x39
        if(SoundComponentLoop != none)
        {
            SoundComponentLoop.Stop();
            SoundComponentLoop = none;
        }
        //return;        
    }

    function StartDraggingLargePawn()
    {
        // End:0x70
        if((SpawnedProjectile != none) && SoundComponentLoop == none)
        {
            SoundComponentLoop = TuneDataPartsSoundEventBindings.PlayEventSoundLocallyEx('WinchHold', 'None', MyLpPawnOwner, none, none, SoundComponentLoop);
        }
        // End:0x9F
        if(WinchCable != none)
        {
            WinchCable.SetTighten(true);
        }
        //return;        
    }

    function StartGrabbingLargePawn()
    {
        CleanupProjectile();
        CleanupSound();
        TuneDataPartsSoundEventBindings.PlayEventSoundLocally('WinchStop', 'None', MyLpPawnOwner, none, none);
        //return;        
    }

    function FinishInteractingWithLargePawn()
    {
        local /*0x97E50000-0x00000000*/ private bool bSuccess[8388609];

        // End:0x1E
        if(bSuccess)
        {
            GotoState('Idle');            
        }
        else
        {
            GrabbedPawn = none;
            SpawnedProjectile.ReleaseFromPawnWinchPoint();
            GotoState('Retracting');
        }
        //return;        
    }
    stop;    
}

simulated state HoldingPawn
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        LPVSPlayerPawn(MyLpPawnOwner).StartHoldingPawn(GrabbedPawn, !bGrabbedFromClaw);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        bGrabbedFromClaw = false;
        // End:0x4E
        if(NextStateName != 'Firing')
        {
            LPVSPlayerPawn(MyLpPawnOwner).EndHoldingPawn();            
        }
        else
        {
            LPVSPlayerPawn(MyLpPawnOwner).StartThrowingPawn();
        }
        //return;        
    }
    stop;    
}

simulated state WinchPointInteracting
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        WinchCable.SetTighten(true);
        // End:0x8B
        if(MyLpPawnOwner.Controller != none)
        {
            LPPlayerController(MyLpPawnOwner.Controller).MPStartState('Interacting');
        }
        // End:0xD6
        if(MyLpPawnOwner != none)
        {
            MyLpPawnOwner.DoSpecialMove(Class'LPSM_PlayerVSWinchWinchPoint', true, false, None);
        }
        MyLpPawnOwner.SetPitchControllerLock(true);
        TuneDataPartsSoundEventBindings.PlayEventSoundLocally('WinchAttach', 'None', Instigator, none, none);
        //return;        
    }

    simulated function Update()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        // End:0x35
        if((SpawnedProjectile == none) || SpawnedProjectile.IsPendingKill())
        {
            return;
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x8B
        if(MyLpPawnOwner != none)
        {
            MyLpPawnOwner.SetPitchControllerLock(false);
            // End:0x8B
            if(MyLpPawnOwner.Controller != none)
            {
                MyLpPawnOwner.Controller.GotoState('PlayerWalking');
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: LPWinchCable'Default__LPWeaponVSWinch.WinchCableObject'
    begin object name=WinchCableObject class=Class'LPWinchCable'
    end object
    WinchCable=WinchCableObject
    PartLocation=EVSInventoryPartSlot.EIPS_LeftArm
    // Reference: SkeletalMeshComponent'Default__LPWeaponVSWinch.WeaponMesh'
    begin object name=WeaponMesh
    end object
    WeaponMeshComp=WeaponMesh
    // Reference: SPTuneDataEventDefSoundBase'Default__LPWeaponVSWinch.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    TuneDataPartsSoundEventBindings=SPTuneDataEventBindingsSoundParts'TuneData_SndEvtBindings.Parts.TuneData_PartsSounds_Winch'
    TickGroup=ETickingGroup.TG_PostUpdateWork
    bAlwaysRelevant=true
}