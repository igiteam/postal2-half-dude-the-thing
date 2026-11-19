class LPProj_VSWinch extends LPProj_Grenade
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsAttached[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInterpolateToWinchPoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDying;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasWinchpointActiveOnFire;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIgnoreWinchpointInactiveCheck;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttachedPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AttachedPawnWinchPointIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel @NULL AttachedWinchPoint[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WinchPointLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SavedRotation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SkelCtrl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class WinchDamageType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WinchIncidentACosAngRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSWinch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPPawn vsPawn[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AkridPawnContactList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ForcedWinchAssistPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinVelocityToApplyDamage;

// Export ULPProj_VSWinch::execInit(FFrame&, void* const)
native simulated function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Direction[8388609];


}

// Export ULPProj_VSWinch::execGetTerminalVelocity(FFrame&, void* const)
native function GetTerminalVelocity()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPProj_VSWinch::execDebugDraw(FFrame&, void* const)
native function DebugDraw();

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x1F2
    if(VarName == 'vsPawn')
    {
        VSWinch = LPWeaponVSWinch(vsPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
        // End:0x1EF
        if(!bInitialized)
        {
            bInitialized = true;
            // End:0x1EF
            if(VSWinch != none)
            {
                VSWinch.SpawnedProjectile = self;
                // End:0x11E
                if(VSWinch.GrabbedPawn != none)
                {
                    Class'SPEngine.SPUtil'.static.SetRBCollision(GetSkeletalMesh(), VSWinch.GrabbedPawn.Mesh, false);
                }
                Init(Vector(Instigator.Rotation));
                // End:0x1CC
                if((VSWinch.GrabbedPawn != none) && VSWinch.GrabbedPawn.TuneDataAIPawn.bCanBeThrownByVS)
                {
                    SetCollision(false, false);
                    bBlockActors = false;
                }
                VSWinch.GotoState('Firing');
            }
        }        
    }
    else
    {
        // End:0x22E
        if(VarName == 'AttachedWinchPoint')
        {
            // End:0x22B
            if(AttachedWinchPoint != none)
            {
                HandleWinchPointInteraction(AttachedWinchPoint);
            }            
        }
        else
        {
            super.ReplicatedEvent(VarName);
        }
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL BoneLoc, BoneRot, Winch;

    // End:0x21B
    if(AttachedPawn != none)
    {
        // End:0x21B
        if(bInterpolateToWinchPoint)
        {
            AttachedPawn.Mesh.GetSocketWorldLocationAndRotation(AttachedPawn.WinchPoints[AttachedPawnWinchPointIndex].SocketName, BoneLoc, BoneRot);
            SetLocation(VInterpTo(Location, BoneLoc, DeltaTime, 300.0000000));
            SetRotation(RInterpTo(Rotation, BoneRot, DeltaTime, 65536.0000000 * float(2)));
            // End:0x21B
            if(VSizeSq(Location - BoneLoc) < 25.0000000)
            {
                bInterpolateToWinchPoint = false;
                AttachedPawn.Mesh.AttachComponentToSocket(Mesh, AttachedPawn.WinchPoints[AttachedPawnWinchPointIndex].SocketName);
                SetHardAttach(true);
                SetBase(AttachedPawn,, AttachedPawn.Mesh, AttachedPawn.WinchPoints[AttachedPawnWinchPointIndex].SocketName);
            }
        }
    }
    // End:0x22A
    if(bIsAttached)
    {
        return;
    }
    super.Tick(DeltaTime);
    // End:0x466
    if(AttachedWinchPoint != none)
    {
        // End:0x3E9
        if(AttachedWinchPoint.SkelActorToAttachTo != none)
        {
            BoneLoc = AttachedWinchPoint.SkelActorToAttachTo.SkeletalMeshComponent.GetBoneLocation(AttachedWinchPoint.AttachmentBoneName);
            // End:0x381
            if(bInterpolateToWinchPoint && VSizeSq(WinchPointLocation - BoneLoc) < 25.0000000)
            {
                bInterpolateToWinchPoint = false;
                Winch = LPWeaponVSWinch(Instigator.FindInventoryType(Class'LPWeaponVSWinch', true));
                AttachedWinchPoint.NotifyWinchAttached(Winch);
            }
            // End:0x3A6
            if(!bInterpolateToWinchPoint)
            {
                WinchPointLocation = BoneLoc;                
            }
            else
            {
                WinchPointLocation = VInterpTo(WinchPointLocation, BoneLoc, DeltaTime, 16.0000000);
            }
            SetLocation(WinchPointLocation);            
        }
        else
        {
            // End:0x466
            if(bInterpolateToWinchPoint)
            {
                bInterpolateToWinchPoint = false;
                Winch = LPWeaponVSWinch(Instigator.FindInventoryType(Class'LPWeaponVSWinch', true));
                AttachedWinchPoint.NotifyWinchAttached(Winch);
            }
        }
    }
    //return;    
}

simulated function ShowDebugInitalAssistData()
{
    local /*0x97E50000-0x00000000*/ private bool bUsingGrenFinalTargetSocket[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GrenadesMeshLocation[25296897];

    //return;    
}

simulated function ShowDebugBreakOffAssistData()
{
    local /*0x97E50000-0x00000000*/ private bool bUsingGrenFinalTargetSocket[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GrenadesMeshLocation[25296897];

    //return;    
}

simulated function DrawGrenadeAssistZone()
{
    //return;    
}

simulated function DrawWinchAssistZone()
{
    //return;    
}

simulated function TestToSeeIfProjectileHasEnteredPawnAssistZone()
{
    local /*0x97E50000-0x00000000*/ private float distanceToCurTarget, rangeSqToPawnTesting;
    local /*0x97E50000-0x00000000*/ private bool bpossibleInZone;
    local /*0x97E50000-0x00000000*/ private @NULL currentTestPawn;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL currentMeshTranslationPos, Trans;

    // End:0x29
    if(!VSWinch.IsInState('Firing'))
    {
        return;
    }
    // End:0x301
    if(TuneDataGrenade.bUseGyroAssist && AllAIPawnsInRangeAtInit.Length > 0)
    {
        Trans = GetSkeletalMesh().GetTransformMatrix();
        currentMeshTranslationPos.X = Trans.WPlane.X;
        currentMeshTranslationPos.Y = Trans.WPlane.Y;
        currentMeshTranslationPos.Z = Trans.WPlane.Z;
        distanceToCurTarget = float(2147483647);
        iter = 0;
        J0x187:

        // End:0x301 [Loop If]
        if(iter < AllAIPawnsInRangeAtInit.Length)
        {
            currentTestPawn = AllAIPawnsInRangeAtInit[iter];
            // End:0x2F3
            if((currentTestPawn == ForcedWinchAssistPawn) || currentTestPawn.IsValidTargetForWinchAssist())
            {
                bpossibleInZone = false;
                // End:0x237
                if(IsWinchInAssistZoneForThisPawn(currentTestPawn, currentMeshTranslationPos, rangeSqToPawnTesting))
                {
                    bpossibleInZone = true;
                }
                // End:0x2F3
                if(bpossibleInZone)
                {
                    // End:0x2F3
                    if(rangeSqToPawnTesting < distanceToCurTarget)
                    {
                        // End:0x2F3
                        if(currentTestPawn.Health > 0)
                        {
                            distanceToCurTarget = rangeSqToPawnTesting;
                            bGrenadeAssistActive = true;
                            bDoneGuidingIntoGrenadeAssistSocket = false;
                            PawnGuidingTo = currentTestPawn;
                            // End:0x2F3
                            if(TuneDataGrenade.bShowAssistArc)
                            {
                                ShowDebugInitalAssistData(false, currentMeshTranslationPos);
                            }
                        }
                    }
                }
            }
            iter++;
            // [Loop Continue]
            goto J0x187;
        }
    }
    //return;    
}

simulated function IsWinchInAssistZoneForThisPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTestAgainst[8388609], ProjectilesMeshLocation;
    local /*0x97E50000-0x00000000*/ private float RangeSqToPawn[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TargetLoc, TargetRot, vecFromTargetToLauncher, displacementFromWinchTargetOnPawn, displacementToWinchTargetOnPawn;

    local /*0x97E50000-0x00000000*/ private float dotOfTargetToWinchsLocaiton, dotOfWinchsFlightPathToTargetLoc;
    local /*0x97E50000-0x00000000*/ private @NULL normalizedVelocityVec;

    PawnToTestAgainst.GetWinchAssistTargetLocationAndRotation(TargetLoc, TargetRot, VSWinch.MyLpPawnOwner.Location);
    displacementFromWinchTargetOnPawn = ProjectilesMeshLocation - TargetLoc;
    RangeSqToPawn = VSizeSq(displacementFromWinchTargetOnPawn);
    // End:0x288
    if(RangeSqToPawn <= PawnToTestAgainst.RangeSqFromPawnToStartWinchAssist)
    {
        displacementFromWinchTargetOnPawn = Normal(displacementFromWinchTargetOnPawn);
        // End:0x165
        if(PawnToTestAgainst.bUsePawnToWinchLauncherDirInsteadOfSocketRotation)
        {
            vecFromTargetToLauncher = Normal(InstigatorController.Pawn.Location - TargetLoc);
            dotOfTargetToWinchsLocaiton = vecFromTargetToLauncher Dot displacementFromWinchTargetOnPawn;            
        }
        else
        {
            dotOfTargetToWinchsLocaiton = Vector(TargetRot) Dot displacementFromWinchTargetOnPawn;
        }
        // End:0x288
        if((dotOfTargetToWinchsLocaiton > PawnToTestAgainst.CosAngRangeInFrontOfPawnToAllowWinchAssist) || (PawnToTestAgainst == ForcedWinchAssistPawn) && dotOfTargetToWinchsLocaiton > float(0))
        {
            displacementToWinchTargetOnPawn = TargetLoc - ProjectilesMeshLocation;
            displacementToWinchTargetOnPawn = Normal(displacementToWinchTargetOnPawn);
            normalizedVelocityVec = Normal(Velocity);
            dotOfWinchsFlightPathToTargetLoc = displacementToWinchTargetOnPawn Dot normalizedVelocityVec;
            // End:0x288
            if((dotOfWinchsFlightPathToTargetLoc >= GrenadeIncidentACosAngRange) || (PawnToTestAgainst == ForcedWinchAssistPawn) && dotOfWinchsFlightPathToTargetLoc > float(0))
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function HandleProjectilePawnAssist()
{
    local /*0x97E50000-0x00000000*/ private @NULL grenadesNewVelocity, currentMeshTranslationPos, Trans;
    local /*0x97E50000-0x00000000*/ private float curVelFactor, RangeSqToPawn;
    local /*0x97E50000-0x00000000*/ private @NULL TargetLoc, TargetRot;

    // End:0x311
    if(PawnGuidingTo != none)
    {
        Trans = GetSkeletalMesh().GetTransformMatrix();
        currentMeshTranslationPos.X = Trans.WPlane.X;
        currentMeshTranslationPos.Y = Trans.WPlane.Y;
        currentMeshTranslationPos.Z = Trans.WPlane.Z;
        // End:0x152
        if(TuneDataGrenade.bShowAssistArc)
        {
            PositionLastAssistUpdate = currentMeshTranslationPos;
        }
        // End:0x2C3
        if(IsWinchInAssistZoneForThisPawn(PawnGuidingTo, currentMeshTranslationPos, RangeSqToPawn))
        {
            PawnGuidingTo.GetWinchAssistTargetLocationAndRotation(TargetLoc, TargetRot, VSWinch.MyLpPawnOwner.Location);
            grenadesNewVelocity = CalculateVelocityToHitPoint(Location, TargetLoc, VSize2D(Velocity), GetGravityZ());
            curVelFactor = TuneDataGrenade.CurrentVelocityEmphasesOverAssistVelocity;
            // End:0x26B
            if(curVelFactor < 0.0100000)
            {
                curVelFactor = 0.0100000;
            }
            grenadesNewVelocity = grenadesNewVelocity + (Velocity * curVelFactor);
            grenadesNewVelocity /= (curVelFactor + float(1));
            SetVelocity(grenadesNewVelocity);            
        }
        else
        {
            bGrenadeAssistActive = false;
            bDoneGuidingIntoGrenadeAssistSocket = true;
            // End:0x311
            if(TuneDataGrenade.bShowAssistArc)
            {
                ShowDebugBreakOffAssistData(false, currentMeshTranslationPos);
            }
        }
    }
    //return;    
}

simulated function GetCenterOfPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], ReturnValue, Loc;

    // End:0x8E
    if(inPawn.Mesh.GetSocketByName('Center') != none)
    {
        inPawn.Mesh.GetSocketWorldLocationAndRotation('Center', Loc);        
    }
    else
    {
        Loc = inPawn.Location;
    }
    return Loc;
    //return ReturnValue;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(GrenadeTuneData.AngleOfBreakOffForGrenadesFlightPathToStopAssist.GetValue(), WinchIncidentACosAngRange);
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    bInitialized = false;
    ClearTimer('DoExplosion');
    //return;    
}

simulated function DoExplosion()
{
    //return;    
}

simulated function SetCollisionWithSpecificPawnBodies()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, CurLPPawn;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL RBBody;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0x287 [Loop If]
    if(CurPawn != none)
    {
        CurLPPawn = LPPawn(CurPawn);
        // End:0x25C
        if(((CurLPPawn != none) && CurLPPawn.Mesh != none) && CurLPPawn.Mesh.PhysicsAssetInstance != none)
        {
            Idx = 0;
            J0xCE:

            // End:0x25C [Loop If]
            if(Idx < CurLPPawn.TuneDataPawn.WinchExclusionBodies.Length)
            {
                RBBody = CurLPPawn.Mesh.PhysicsAssetInstance.FindBodyInstance(CurLPPawn.TuneDataPawn.WinchExclusionBodies[Idx], CurLPPawn.Mesh.PhysicsAsset);
                // End:0x24E
                if(RBBody != none)
                {
                    // End:0x224
                    if(!bOn)
                    {
                        Class'SPEngine.SPUtil'.static.SetRBCollisionForMeshAndBody(GetSkeletalMesh(), RBBody, false);
                    }
                    RBBody.bBlockNonZeroExtent = bOn;
                }
                Idx++;
                // [Loop Continue]
                goto J0xCE;
            }
        }
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

simulated function SetRBVel()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewVel[8388609];

    Mesh.SetRBLinearVelocity(NewVel);
    //return;    
}

simulated event ShouldBounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FSM;

    FSM = FracturedStaticMeshActor(Other);
    // End:0x5A
    if((FSM != none) && FSM.IsFracturedByDamageType(WinchDamageType))
    {
        return false;
    }
    return super.ShouldBounce(Other, HitNormal);
    //return ReturnValue;    
}

simulated function BlockedMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawnVS;

    // End:0x114
    if(((vsPawn != none) && ClassIsChildOf(vsPawn.Class, Class'LPVSPlayerPawn')) && bWasWinchpointActiveOnFire)
    {
        vsPawnVS = LPVSPlayerPawn(vsPawn);
        vsPawnVS.GetLPHUD().DisplayVSEnvironmentalMessage(1, "<Strings:LostPlanetGame.EnvironmentMessages.VS_OBST1>", "<Strings:LostPlanetGame.EnvironmentMessages.VS_OBST2>", false, 1.0000000);
    }
    //return;    
}

simulated event @NULL HandleCollision()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, AIPawn;

    local /*0x97E50000-0x00000000*/ private float damageToHitPawn;
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo;

    // End:0x0F
    if(bIsAttached)
    {
        return;
    }
    // End:0x20
    if(AttachedWinchPoint != none)
    {
        return;
    }
    // End:0xDA
    if((bWasWinchpointActiveOnFire && ClassIsChildOf(Other.Class, Class'LPVSWinchPoint')) && !ClassIsChildOf(vsPawn.Class, Class'LPVSPlayerPawn') || !LPVSPlayerPawn(vsPawn).bPreventAllZipline)
    {
        HandleWinchPointInteraction(LPVSWinchPoint(Other));
        return;
    }
    // End:0x10D
    if(ShouldIgnoreCollision(Other, OtherComp, HitLocation, HitNormal))
    {
        return;
    }
    // End:0x12E
    if(HitDestructible(Other, OtherComp))
    {
        return;
    }
    // End:0x1C3
    if((SPInventoryProjectile(Other) != none) || LPHiveSpawnPoint(Other) != none)
    {
        Other.TakeDamage(1000000, InstigatorController, Location, -VSize2D(Velocity) * HitNormal, Class'LPDamageTypeVSWinch',, self);
        return;
    }
    AIPawn = LPAIPawn(Other);
    // End:0x495
    if(AIPawn != none)
    {
        // End:0x3DB
        if(AkridPawnContactList.Find(AIPawn) == )
        {            
            AkridPawnContactList.AddItem(AIPawn);            
            // End:0x29D
            if(((AkridPawnContactList.Length == 1) && AIPawn.WinchPoints.Length > 0) && IsContactPointInRange(AIPawn, HitLocation))
            {
                // End:0x29D
                if(HandleAkridCollision(Other, HitLocation))
                {
                    return;
                }
            }
            // End:0x3DB
            if(((Other != Owner) && VSizeSq(Velocity) > (MinVelocityToApplyDamage * MinVelocityToApplyDamage)) && CanThisPawnBeDamagedByPhysicalContactWithTheWinch(AIPawn, damageToHitPawn))
            {
                HitInfo = ComputeHitInfo(Other, OtherComp, HitLocation, HitNormal);
                AIPawn.TakeDamage(int(damageToHitPawn), InstigatorController, Location, -VSize2D(Velocity) * HitNormal, Class'LPDamageTypeVSWinch', HitInfo, self);
                bDoneGuidingIntoGrenadeAssistSocket = true;
                // End:0x3DB
                if(HitInfo.BoneName != 'None')
                {                    
                }
            }
        }
        // End:0x495
        if(((LPAIPawnAkridExtraLarge(AIPawn) == none) && LPAIPawnAkridLarge(AIPawn) == none) && LPAIPawnAkridMedium(AIPawn) == none)
        {
            // End:0x495
            if(AIPawn.Health <= 0)
            {
                Class'SPEngine.SPUtil'.static.SetRBCollision(GetSkeletalMesh(), AIPawn.Mesh, false);
                return;
            }
        }
    }
    super.HandleCollision(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

simulated function @NULL Bounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, HitInfo;

    BlockedMessage();
    super.Bounce(Other, OtherComp, HitLocation, HitNormal, HitInfo);
    //return;    
}

function NotifyHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    BlockedMessage();
    super(SPInventoryProjectile).NotifyHit(Other);
    //return;    
}

simulated function CanThisPawnBeDamagedByPhysicalContactWithTheWinch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn2Test[8388609];
    local /*0x97E50000-0x00000000*/ private float ammountOfDamage[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int ipawnType, numOfPawnTypes;

    // End:0x10E
    if(Pawn2Test != none)
    {
        numOfPawnTypes = TuneDataGrenade.ListOfPawnTypesDamagedOnContact.Length;
        ipawnType = 0;
        J0x43:

        // End:0x10E [Loop If]
        if(ipawnType < numOfPawnTypes)
        {
            // End:0x100
            if(ClassIsChildOf(Pawn2Test.Class, TuneDataGrenade.ListOfPawnTypesDamagedOnContact[ipawnType].PawnTypeAllowedToDamage))
            {
                ammountOfDamage = TuneDataGrenade.ListOfPawnTypesDamagedOnContact[ipawnType].AmmountOfDamageHitPawn;
                return true;
            }
            ipawnType++;
            // [Loop Continue]
            goto J0x43;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function @NULL HitDestructible()
{
    local /*0x97E50000-0x00000000*/ private @NULL Wall[8388609], WallComp;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FracAct, hitPush, newHitInfo;

    FracAct = SPFracturedStaticMeshActor(Wall);
    // End:0x1CA
    if(FracAct != none)
    {
        // End:0x129
        if(FracAct.IsDamagedByDamageType(WinchDamageType))
        {
            hitPush = Normal(Wall.Location - WallComp.GetPosition());
            newHitInfo.HitComponent = WallComp;
            Wall.TakeDamage(2000, none, Wall.Location, hitPush, WinchDamageType, newHitInfo, self);            
        }
        else
        {
            // End:0x1C8
            if(FracAct.IsFracturedByDamageType(WinchDamageType))
            {
                FracAct.BreakOffPartsInRadius(Wall.Location, 300.0000000, VSize(Velocity) * 0.1000000, true);
                FracAct.Explode();
            }
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function IsContactPointInRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609], Contact;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Loc;
    local /*0x97E50000-0x00000000*/ private float Dist;

    // End:0x28
    if(HitPawn.WinchContactRadius == float(0))
    {
        return true;
    }
    Loc = GetCenterOfPawn(HitPawn);
    Dist = VSize(Loc - Contact);
    return Dist < (HitPawn.WinchContactRadius + CylinderComponent.CollisionRadius);
    //return ReturnValue;    
}

function InterpolateToPawnWinchPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private int WinchPointIndex[8388609];

    bIsAttached = true;
    bInterpolateToWinchPoint = true;
    AttachedPawn = inPawn;
    AttachedPawnWinchPointIndex = WinchPointIndex;
    AttachedPawn.NotifyJustGotGrabbed(VSWinch.MyLpPawnOwner);
    //return;    
}

function ReleaseFromPawnWinchPoint()
{
    // End:0x5F
    if(AttachedPawn != none)
    {
        AttachedPawn.Mesh.DetachComponent(Mesh);
        AttachComponent(Mesh);
    }
    bIsAttached = false;
    bInterpolateToWinchPoint = false;
    SetBase(none);
    AttachedPawn = none;
    //return;    
}

simulated function HandleAkridCollision()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], HitLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn;

    // End:0x92
    if(!bIsAttached)
    {
        HitPawn = LPAIPawn(Other);
        // End:0x92
        if((HitPawn != none) && HitPawn.Health > 0)
        {
            return VSWinch.NotifyHitPawn(HitPawn, HitLocation);
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function SetFixed()
{
    GetSkeletalMesh().PhysicsWeight = 0.0000000;
    GetSkeletalMesh().PhysicsAssetInstance.SetAllBodiesFixed(true);
    //return;    
}

simulated function StartRetract()
{
    SetCollisionWithSpecificPawnBodies(true);
    SetFixed();
    //return;    
}

simulated function PlowThroughAndAttachPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    bIsAttached = true;
    AttachedPawn = inPawn;
    Class'SPEngine.SPUtil'.static.SetRBCollision(GetSkeletalMesh(), inPawn.Mesh, false);
    inPawn.SetPhysics(7);
    AttachedPawn.NotifyJustGotGrabbed(VSWinch.MyLpPawnOwner);
    //return;    
}

simulated function HandleWinchPointInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL WinchPoint[8388609], Loc1, Loc2, Offset, SocketRot;

    // End:0x11
    if(WinchPoint == none)
    {
        return;
    }
    // End:0x48
    if(!WinchPoint.TryToInteractWith() && !bIgnoreWinchpointInactiveCheck)
    {
        return;
    }
    LifeSpan = 0.0000000;
    AttachedWinchPoint = WinchPoint;
    bInterpolateToWinchPoint = true;
    bIgnoreWinchpointInactiveCheck = false;
    VSWinch.GetCableEndpoints(Loc1, Loc2);
    SocketRot = Rotator(Loc2 - Loc1);
    SetRotation(SocketRot);
    Offset = Normal(Loc2 - Loc1);
    Offset.Z = 0.0000000;
    WinchPointLocation = WinchPoint.Location + (Offset * float(10));
    SavedRotation = SocketRot;
    Mesh.PutRigidBodyToSleep();
    Mesh.SetRBLinearVelocity(vect(0.0000000, 0.0000000, 0.0000000));
    Mesh.SetRBAngularVelocity(vect(0.0000000, 0.0000000, 0.0000000));
    SetCollisionType(1);
    bCollideWorld = false;
    bCollideWhenPlacing = false;
    bNoEncroachCheck = true;
    StopSimulating();
    GetSkeletalMesh().PhysicsAssetInstance.SetAllBodiesFixed(true);
    GetSkeletalMesh().SetHasPhysicsAssetInstance(false);
    SetLocation(WinchPointLocation);
    SetRotation(SocketRot);
    CloseWinch();
    VSWinch.TuneDataPartsFXEventBindings.PlayEventFXAtLoc('WinchHit', Location, rot(0, 0, 1), self, none, none);
    VSWinch.TuneDataPartsSoundEventBindings.PlayEventSoundLocally('WinchHit', 'None', self, none, none);
    //return;    
}

simulated function Destroyed()
{
    // End:0xC4
    if((AttachedWinchPoint != none) && AttachedWinchPoint.bUseAsZipline)
    {
        AttachedWinchPoint.SetCollision(true, true);
        // End:0xC4
        if(AttachedWinchPoint.ConnectedPawn != none)
        {
            LPPlayerController(AttachedWinchPoint.ConnectedPawn.Controller).PerformedUseAction();
        }
    }
    Mesh.DetachFromAny();
    super.Destroyed();
    //return;    
}

simulated event OpenWinch()
{
    GetSkeletalMesh().PlayAnim('PRP_VS_stndrdClaw_Winch_Claw_Opening_Core');
    //return;    
}

simulated function CloseWinch()
{
    GetSkeletalMesh().PlayAnim('PRP_VS_stndrdClaw_Winch_Claw_Closing_Core');
    //return;    
}

simulated function EnableMeshInPhysX()
{
    super(SPInventoryProjectile).EnableMeshInPhysX();
    SetCollisionWithSpecificPawnBodies(false);
    //return;    
}

defaultproperties
{
    MinVelocityToApplyDamage=200.0000000
    bInstigatorCollisionAfterBounce=false
    bIsGrenade=false
    MeshInPhysX_bUseBoneSpring=false
    MeshInPhysX_bTeleportOnOverextension=false
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_VSWinch.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    StopSimulatingVelocityThreshhold=200.0000000
    Speed=8000.0000000
    MaxSpeed=10000.0000000
    MyDamageType=Class'LPDamageTypeVSWinch'
    // Reference: CylinderComponent'Default__LPProj_VSWinch.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    bUpdateSimulatedPosition=true
    bBlockActors=false
    LifeSpan=0.0000000
    CollisionComponent=CollisionCylinder
}