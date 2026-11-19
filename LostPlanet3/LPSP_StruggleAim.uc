class LPSP_StruggleAim extends LPStrugglePhaseAnim;

struct CrosshairPush
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Dir;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Timer;

    structdefaultproperties
    {
        Dir=(X=0.0000000,Y=0.0000000)
        Timer=0.0000000
    }
};

struct ScreenAimArea
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ScreenLocation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScreenMaxDistance;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStabbed;

    structdefaultproperties
    {
        ScreenLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ScreenMaxDistance=0.0000000
        bStabbed=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStabAttemp;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSucceed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAimingInRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBodiesHaveBeenUnfixed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAimingInRangeEventSent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHadInfiniteAmmo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AimPush[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ScreenAreas;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AimingAreaIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ShowAreaIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedAimingTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartEventSent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumHits;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumHitsFailed;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bOk;

    bOk = super.InitObject(inSMStruggleMode);
    MyTuneData = LPTuneDataStrugglePhaseAim(TuneData);
    // End:0xDD
    if(inSMStruggleMode.bLocalPlayer)
    {
        AimPush[0].Timer = -1.0000000;
        AimPush[1].Timer = -1.0000000;
        UpdateCursorPushDirection(0.0000000);
        ScreenAreas.Add(MyTuneData.AimAreas.Length);        
    }
    return bOk;
    //return ReturnValue;    
}

function StartSm()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    super(LPStrugglePhase).StartSm(inSMStruggleMode);
    bBodiesHaveBeenUnfixed = false;
    I = 0;
    J0x2A:

    // End:0x79 [Loop If]
    if(I < ScreenAreas.Length)
    {
        ScreenAreas[I].bStabbed = false;
        ++I;
        // [Loop Continue]
        goto J0x2A;
    }
    NumHits = 0;
    NumHitsFailed = 0;
    //return;    
}

function StopSM()
{
    // End:0x7C
    if(bBodiesHaveBeenUnfixed && !smStruggleMode.CheckWinning())
    {
        smStruggleMode.FollowerPawn.Mesh.SPRestoreBodiesFixed();
    }
    smStruggleMode.GetLeadersController().TurnOffStruggleDisplayState();
    super(LPStrugglePhase).StopSM();
    //return;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AimController, LeaderController, MyWeapon;

    super.Start(PrevPhaseName);
    // End:0x234
    if(smStruggleMode.bLocalPlayer)
    {
        RandomizeOnStartPhase();
        bStabAttemp = false;
        AimingAreaIndex = -1;
        LeaderController = smStruggleMode.GetLeadersController();
        LeaderController.TurnOnStruggleDisplayState();
        ChooseRandomArea();
        AimController = SPGFAimControlPlayerControlled(LeaderController.GetAimController());
        AimController.bUseBothSticks = MyTuneData.UseBothSticks;
        // End:0x234
        if(MyTuneData.Shooting9PointAims)
        {
            smStruggleMode.PlayerPawn.InStruggleMode9PointAim = true;
            MyWeapon = SPGFWeapon(smStruggleMode.PlayerPawn.Weapon);
            // End:0x234
            if(MyWeapon != none)
            {
                LeaderController.UnPauseFire();
                bHadInfiniteAmmo = MyWeapon.bInfiniteAmmo;
                MyWeapon.bInfiniteAmmo = true;
            }
        }
    }
    smStruggleMode.PlayerPawn.TriggerEventClass(Class'LPSeqEvent_StruggleMode', smStruggleMode.FollowerPawn, 5);
    TimeStartEventSent = GetTime();
    bAimingInRangeEventSent = false;
    SetTimeLooping(TimeLooping * smStruggleMode.PlayerPawn.StruggleSettings.TimeFactorPhaseAimTimeOut);
    // End:0x37B
    if(smStruggleMode.PlayerPawn.DisableCameraCollisionInStruggleMode)
    {
        smStruggleMode.StruggleCamParams.bCollideCamera = true;
    }
    //return;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name NextPhaseName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AimController, LeaderController, MyWeapon;

    // End:0x1B4
    if(smStruggleMode.bLocalPlayer)
    {
        LeaderController = smStruggleMode.GetLeadersController();
        LeaderController.TurnOffStruggleDisplayState();
        AimController = SPGFAimControlPlayerControlled(LeaderController.GetAimController());
        AimController.bUseBothSticks = false;
        // End:0x1B4
        if(MyTuneData.Shooting9PointAims)
        {
            smStruggleMode.PlayerPawn.InStruggleMode9PointAim = false;
            MyWeapon = SPGFWeapon(smStruggleMode.PlayerPawn.Weapon);
            // End:0x1B4
            if(MyWeapon != none)
            {
                LeaderController.PauseFire();
                MyWeapon.bInfiniteAmmo = bHadInfiniteAmmo;
            }
        }
    }
    // End:0x29E
    if(bAnimFinished)
    {
        LPPawn(smStruggleMode.MySPPawn).NotifyFailedStruggleAimMode(MyTuneData.PhaseName);
        // End:0x29B
        if(smStruggleMode.FollowerPawn != none)
        {
            LPPawn(smStruggleMode.FollowerPawn).NotifySucceedStruggleAimMode(MyTuneData.PhaseName);
        }        
    }
    else
    {
        // End:0x388
        if(bSucceed)
        {
            LPPawn(smStruggleMode.MySPPawn).NotifySucceedStruggleAimMode(MyTuneData.PhaseName);
            // End:0x385
            if(smStruggleMode.FollowerPawn != none)
            {
                LPPawn(smStruggleMode.FollowerPawn).NotifyFailedStruggleAimMode(MyTuneData.PhaseName);
            }            
        }
        else
        {
            LPPawn(smStruggleMode.MySPPawn).NotifyFailedStruggleAimMode(MyTuneData.PhaseName);
            // End:0x462
            if(smStruggleMode.FollowerPawn != none)
            {
                LPPawn(smStruggleMode.FollowerPawn).NotifySucceedStruggleAimMode(MyTuneData.PhaseName);
            }
        }
    }
    super.Stop(NextPhaseName);
    //return;    
}

function GetDifficultyMultiplier()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], DifficultyRatio;

    DifficultyRatio = 0.0000000;
    // End:0x70
    if(MyTuneData.NumHitsForSuccess > 1)
    {
        DifficultyRatio = float(NumHits) / float(MyTuneData.NumHitsForSuccess - 1);        
    }
    else
    {
        // End:0x11E
        if((smStruggleMode != none) && smStruggleMode.TuneData.NumPointsToWin > 1)
        {
            DifficultyRatio = float(smStruggleMode.CurrentWinPoints) / float(smStruggleMode.TuneData.NumPointsToWin - 1);
        }
    }
    return 1.0000000 + (DifficultyRatio * (MyTuneData.DifficultyMultiplier - 1.0000000));
    //return ReturnValue;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AimController;
    local /*0x97E50000-0x00000000*/ private bool bFinished;
    local /*0x97E50000-0x00000000*/ private float AimStruggleStrength;

    bFinished = super.Update(DeltaTime);
    // End:0xDC
    if(((MyTuneData.PlayLastSingleHit && MyTuneData.SingleHitPhaseName != 'None') && MyTuneData.NumHitsForSuccess > 0) && NumHits > MyTuneData.NumHitsForSuccess)
    {
        bSucceed = true;
        bAnimFinished = false;
        return true;
    }
    UpdateCursorPushDirection(DeltaTime);
    AimStruggleStrength = MyTuneData.AimStruggleStrength * (GetDifficultyMultiplier());
    AimController = SPGFAimControlPlayerControlled(smStruggleMode.GetLeadersController().GetAimController());
    AimController.AdjustAim(Multiply_Vector2DFloat(Multiply_Vector2DFloat(AimPush[0].Dir, AimStruggleStrength), DeltaTime));
    AimController.AdjustAim(Multiply_Vector2DFloat(Multiply_Vector2DFloat(AimPush[1].Dir, AimStruggleStrength), DeltaTime));
    bFinished = bFinished || bStabAttemp;
    // End:0x350
    if(!bAimingInRangeEventSent && bAimingInRange)
    {
        // End:0x350
        if((GetTimeSince(TimeStartEventSent)) > smStruggleMode.PlayerPawn.StruggleSettings.MinTimeBetweenAimingStartAndAimingSuccessKismetEvent)
        {
            bAimingInRangeEventSent = true;
            smStruggleMode.PlayerPawn.TriggerEventClass(Class'LPSeqEvent_StruggleMode', smStruggleMode.FollowerPawn, 6);
            TimeStartedAimingTarget = GetTime();
        }
    }
    return bFinished;
    //return ReturnValue;    
}

function UpdateCursorPushDirection()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Offset;
    local /*0x97E50000-0x00000000*/ private float Freq;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private float DirChangeFreq, SubDirChangeFreq;

    DirChangeFreq = MyTuneData.DirChangeFrequency;
    SubDirChangeFreq = MyTuneData.SubDirChangeFrequency;
    I = 0;
    J0x5B:

    // End:0x2BA [Loop If]
    if(I < 2)
    {
        AimPush[I].Timer -= DeltaTime;
        // End:0x2AC
        if(AimPush[I].Timer <= 0.0000000)
        {
            // End:0xF1
            if(I == 0)
            {
                Freq = DirChangeFreq;                
            }
            else
            {
                Freq = SubDirChangeFreq;
            }
            AimPush[I].Timer = RandRange(Freq, Freq + (Freq * 0.5000000));
            Offset.X = RandRange(-0.5000000, 0.5000000);
            Offset.Y = RandRange(-0.5000000, 0.5000000);
            Offset.Z = 0.0000000;
            Offset = Normal(Offset);
            AimPush[I].Dir.X = Offset.X * 0.3300000;
            AimPush[I].Dir.Y = Offset.Y * 0.3300000;
        }
        I++;
        // [Loop Continue]
        goto J0x5B;
    }
    //return;    
}

function RandomizeOnStartPhase()
{
    // End:0x37
    if((MyTuneData.NumHitsForSuccess > 0) && NumHits > 0)
    {
        return;
    }
    // End:0x63
    if(MyTuneData.RandomizeAtStart)
    {
        RandomizeAim();
    }
    //return;    
}

function RandomizeAim()
{
    local /*0x97E50000-0x00000000*/ private float Strength;

    Strength = RandRange(MyTuneData.MinAimReset, MyTuneData.MaxAimReset);
    SPGFAimControlPlayerControlled(smStruggleMode.GetLeadersController().GetAimController()).AdjustAim(Multiply_Vector2DFloat(AimPush[0].Dir, Strength));
    //return;    
}

function ChooseRandomArea()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array NonStabbedAreas;
    local /*0x97E50000-0x00000000*/ private int I;

    ShowAreaIndex = -1;
    // End:0x35
    if(!MyTuneData.ShowRandomArea)
    {
        return;
    }
    I = 0;
    J0x40:

    // End:0xA8 [Loop If]
    if(I < ScreenAreas.Length)
    {
        // End:0x9A
        if(!ScreenAreas[I].bStabbed)
        {
            NonStabbedAreas.AddItem(I);            
        }
        ++I;
        // [Loop Continue]
        goto J0x40;
    }
    // End:0xD8
    if(NonStabbedAreas.Length > 0)
    {
        ShowAreaIndex = NonStabbedAreas[Rand(NonStabbedAreas.Length)];
    }
    //return;    
}

function @NULL StruggleStabAttempt()
{
    local /*0x97E50000-0x00000400*/ private @NULL FollowerMesh;
    local /*0x97E50000-0x00000000*/ private name BoneName;

    // End:0x27
    if(MyTuneData.AimAreas.Length == 0)
    {
        return;
    }
    bStabAttemp = true;
    // End:0x408
    if(bAimingInRange || (GetTimeSince(TimeStartedAimingTarget)) < (MyTuneData.MinTimeStabIsGood * smStruggleMode.PlayerPawn.StruggleSettings.TimeFactorPhaseAimMinTimeStabSuccess))
    {
        // End:0x3EE
        if(AimingAreaIndex != -1)
        {
            // End:0x120
            if(!MyTuneData.ShowStabbedAreas)
            {
                ScreenAreas[AimingAreaIndex].bStabbed = true;
            }
            // End:0x3EE
            if(MyTuneData.AimAreas[AimingAreaIndex].LoseAnimOnStab)
            {
                FollowerMesh = smStruggleMode.FollowerPawn.Mesh;
                // End:0x22D
                if(MyTuneData.AimAreas[AimingAreaIndex].LoseAnimBoneName != 'None')
                {
                    BoneName = MyTuneData.AimAreas[AimingAreaIndex].LoseAnimBoneName;                    
                }
                else
                {
                    // End:0x2D3
                    if(MyTuneData.AimAreas[AimingAreaIndex].bNameIsActuallySocket)
                    {
                        BoneName = FollowerMesh.GetSocketBoneName(MyTuneData.AimAreas[AimingAreaIndex].BoneName);                        
                    }
                    else
                    {
                        BoneName = MyTuneData.AimAreas[AimingAreaIndex].BoneName;
                    }
                }
                FollowerMesh.PhysicsAssetInstance.ForceAllBodiesBelowUnfixed(BoneName, FollowerMesh.PhysicsAsset, FollowerMesh, true);
                FollowerMesh.PhysicsAssetInstance.ForceBodyUnfixed(BoneName, FollowerMesh.PhysicsAsset, FollowerMesh, true);
                bBodiesHaveBeenUnfixed = true;
            }
        }
        NumHits++;
        bSucceed = true;        
    }
    else
    {
        NumHitsFailed++;
        bSucceed = false;
    }
    //return;    
}

function StruggleVsBlockAttempt()
{
    // End:0x37
    if(LPBaseVSPlayerPawn(smStruggleMode.PlayerPawn) != none)
    {
        StruggleStabAttempt();
    }
    //return;    
}

function GetNextPhase()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x67
    if(bAnimFinished)
    {
        // End:0x3A
        if(MyTuneData.ResetNumHitsOnFail)
        {
            NumHits = 0;
        }
        NumHitsFailed++;
        return MyTuneData.TimeOutPhaseName;        
    }
    else
    {
        // End:0x327
        if(bSucceed)
        {
            // End:0x1FA
            if(MyTuneData.NumHitsForSuccess > 0)
            {
                // End:0x1FA
                if(MyTuneData.SingleHitPhaseName != 'None')
                {
                    // End:0x10F
                    if(NumHits < MyTuneData.NumHitsForSuccess)
                    {
                        return MyTuneData.SingleHitPhaseName;
                    }
                    // End:0x180
                    if((MyTuneData.PerfectSuccessPhaseName != 'None') && !smStruggleMode.bDamaged)
                    {
                        return MyTuneData.PerfectSuccessPhaseName;
                    }
                    // End:0x1FA
                    if(MyTuneData.PlayLastSingleHit && NumHits == MyTuneData.NumHitsForSuccess)
                    {
                        NumHits++;
                        return MyTuneData.SingleHitPhaseName;
                    }
                }
            }
            // End:0x26B
            if((MyTuneData.PerfectSuccessPhaseName != 'None') && !smStruggleMode.bDamaged)
            {
                return MyTuneData.PerfectSuccessPhaseName;
            }
            // End:0x305
            if((AimingAreaIndex != -1) && MyTuneData.AimAreas[AimingAreaIndex].StabPhaseName != 'None')
            {
                return MyTuneData.AimAreas[AimingAreaIndex].StabPhaseName;
            }
            return MyTuneData.SuccessPhaseName;            
        }
        else
        {
            // End:0x354
            if(MyTuneData.ResetNumHitsOnFail)
            {
                NumHits = 0;
            }
            // End:0x3EF
            if(MyTuneData.NumHitsForFailing > 0)
            {
                // End:0x3EF
                if(MyTuneData.SingleHitFailedPhaseName != 'None')
                {
                    // End:0x3EF
                    if(NumHitsFailed < MyTuneData.NumHitsForFailing)
                    {
                        return MyTuneData.SingleHitFailedPhaseName;
                    }
                }
            }
            return MyTuneData.failPhaseName;
        }
    }
    //return ReturnValue;    
}

private final function CheckAimingInRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCtrl, TraceStart, TraceEnd, HitLocation, HitNormal, campos,
	    CamRot, ScreenAimLocation, ScreenBoneLocation, BoneLocation, ScreenMaxBoneDistanceLocation,
	    ScreenCenter, NormalizedScreenOffset;

    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private float DistanceTrace;
    local /*0x97E50000-0x00000000*/ private bool bWasAimingInRange;

    PlayerCtrl = smStruggleMode.GetLeadersController();
    NormalizedScreenOffset = smStruggleMode.GetLeadersController().GetAimController().GetNormalizedScreenOffset();
    ScreenAimLocation.X = PlayerCtrl.myLPHUD.SizeX * (NormalizedScreenOffset.X + 0.5000000);
    ScreenAimLocation.Y = PlayerCtrl.myLPHUD.SizeY * (NormalizedScreenOffset.Y + 0.5000000);
    ScreenAimLocation.Z = 0.0000000;
    PlayerCtrl.GetPlayerViewPoint(campos, CamRot);
    I = 0;
    J0x1C6:

    // End:0x505 [Loop If]
    if(I < ScreenAreas.Length)
    {
        // End:0x20D
        if((ShowAreaIndex != -1) && I != ShowAreaIndex)
        {            
        }
        else
        {
            // End:0x23A
            if(ScreenAreas[I].bStabbed)
            {                
            }
            else
            {
                // End:0x30B
                if(MyTuneData.AimAreas[I].bNameIsActuallySocket)
                {
                    smStruggleMode.FollowerPawn.Mesh.GetSocketWorldLocationAndRotation(MyTuneData.AimAreas[I].BoneName, BoneLocation);                    
                }
                else
                {
                    BoneLocation = smStruggleMode.FollowerPawn.Mesh.GetBoneLocation(MyTuneData.AimAreas[I].BoneName);
                }
                ScreenAreas[I].ScreenLocation = H.Canvas.Project(BoneLocation);
                ScreenMaxBoneDistanceLocation = H.Canvas.Project(BoneLocation + ((vect(0.0000000, 0.0000000, 0.5000000) * MyTuneData.AimAreas[I].BoneDistance) >> CamRot));
                ScreenAreas[I].ScreenMaxDistance = VSize(ScreenAreas[I].ScreenLocation - ScreenMaxBoneDistanceLocation);
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x1C6;
    }
    // End:0x568
    if(ScreenAreas.Length > 0)
    {
        PlayerCtrl.UpdateStruggleModeDirection(GetAngle(ScreenAimLocation, ScreenAreas[0].ScreenLocation));        
    }
    else
    {
        ScreenCenter.X = PlayerCtrl.myLPHUD.SizeX * 0.5000000;
        ScreenCenter.Y = PlayerCtrl.myLPHUD.SizeY * 0.5000000;
        ScreenCenter.Z = 0.0000000;
        PlayerCtrl.UpdateStruggleModeDirection(GetAngle(ScreenAimLocation, ScreenCenter));
    }
    bWasAimingInRange = false;
    bAimingInRange = true;
    I = 0;
    J0x696:

    // End:0x843 [Loop If]
    if(I < ScreenAreas.Length)
    {
        // End:0x6DD
        if((ShowAreaIndex != -1) && I != ShowAreaIndex)
        {            
        }
        else
        {
            // End:0x70A
            if(ScreenAreas[I].bStabbed)
            {                
            }
            else
            {
                ScreenBoneLocation = ScreenAreas[I].ScreenLocation;
                bAimingInRange = (Abs(ScreenAimLocation.X - ScreenBoneLocation.X) < ScreenAreas[I].ScreenMaxDistance) && Abs(ScreenAimLocation.Y - ScreenBoneLocation.Y) < ScreenAreas[I].ScreenMaxDistance;
                // End:0x835
                if(bAimingInRange)
                {
                    AimingAreaIndex = I;
                    // [Explicit Break]
                    goto J0x843;
                }
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x696;
    }
    J0x843:

    // End:0x9DA
    if(bAimingInRange && WantsToCheckAgainstVisualMesh(AimingAreaIndex))
    {
        DistanceTrace = VSize(campos - smStruggleMode.FollowerPawn.Location) * 2.0000000;
        TraceStart = campos;
        TraceEnd = TraceStart + (smStruggleMode.GetLeadersController().GetAimController().GetWorldAimDir() * DistanceTrace);
        // End:0x9CE
        if(PlayerCtrl.TraceComponent(HitLocation, HitNormal, smStruggleMode.FollowerPawn.Mesh, TraceEnd, TraceStart, vect(0.0000000, 0.0000000, 0.0000000),, true))
        {
            bAimingInRange = true;            
        }
        else
        {
            bAimingInRange = false;
        }
    }
    PlayerCtrl.SetAimingInRange(bAimingInRange);
    // End:0xA35
    if(!bWasAimingInRange && bAimingInRange)
    {
        TimeStartedAimingTarget = GetTime();
    }
    return bAimingInRange;
    //return ReturnValue;    
}

function WantsToCheckAgainstVisualMesh()
{
    local /*0x97E50000-0x00000000*/ private int InAimingAreaIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x15
    if(InAimingAreaIndex == -1)
    {
        return true;
    }
    return !MyTuneData.AimAreas[InAimingAreaIndex].bDontCheckAgainstTheVisualMesh;
    //return ReturnValue;    
}

function GetAngle()
{
    local /*0x97E50000-0x00000000*/ private @NULL PointB[8388609], PointC;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Dir, AngularDist, AxisX, AxisY, AxisZ, PlayerCtrl,
	    PlayerViewpoint, Rot;

    local /*0x97E50000-0x00000000*/ private bool bIsInFront;
    local /*0x97E50000-0x00000000*/ private float DirOfHit, AngleDegrees;

    PlayerCtrl = smStruggleMode.GetLeadersController();
    PlayerCtrl.GetPlayerViewPoint(PlayerViewpoint, Rot);
    GetAxes(Rot, AxisX, AxisY, AxisZ);
    Dir = Normal(PointC - PointB);
    bIsInFront = GetAngularDistance(AngularDist, Dir, AxisX, AxisY, AxisZ);
    GetAngularDegreesFromRadians(AngularDist);
    DirOfHit = AngularDist.X;
    // End:0x1A4
    if(bIsInFront)
    {
        DirOfHit = AngularDist.X;
        // End:0x174
        if(DirOfHit < float(0))
        {
            DirOfHit += float(360);            
        }
        else
        {
            DirOfHit = 180.0000000 + AngularDist.X;
        }        
    }
    else
    {
        DirOfHit = 180.0000000;
    }
    // End:0x243
    if(PointB.X == PointC.X)
    {
        AngleDegrees = ((PointB.Y < PointC.Y) ? 3.1415930 : 0.0000000);
    }
    // End:0x2E1
    if(PointB.Y == PointC.Y)
    {
        AngleDegrees = ((PointB.X < PointC.X) ? 3.1415930 * 1.5000000 : 3.1415930 * 0.5000000);
    }
    AngleDegrees = ((2.0000000 * 3.1415930) - Atan2(PointB.X - PointC.X, PointB.Y - PointC.Y)) * 57.2957800;
    // End:0x3A5
    if(AngleDegrees > float(360))
    {
        AngleDegrees -= float(360);
    }
    return AngleDegrees;
    //return ReturnValue;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

    CheckAimingInRange(H);
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], ScreenAimLocation, NormalizedScreenOffset, BoneLocation;
    local /*0x97E50000-0x00000000*/ private float MaxDistance, boxSize;
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x2FB [Loop If]
    if(I < ScreenAreas.Length)
    {
        // End:0x52
        if((ShowAreaIndex != -1) && I != ShowAreaIndex)
        {            
        }
        else
        {
            // End:0x7F
            if(ScreenAreas[I].bStabbed)
            {                
            }
            else
            {
                BoneLocation = ScreenAreas[I].ScreenLocation;
                MaxDistance = ScreenAreas[I].ScreenMaxDistance;
                H.Canvas.SetDrawColor(255, 255, 255);
                boxSize = 5.0000000;
                H.Canvas.SetPos(BoneLocation.X - (boxSize / float(2)), BoneLocation.Y - (boxSize / float(2)));
                H.Canvas.DrawBox(boxSize, boxSize);
                boxSize = MaxDistance * 2.0000000;
                H.Canvas.SetPos(BoneLocation.X - (boxSize / float(2)), BoneLocation.Y - (boxSize / float(2)));
                H.Canvas.DrawBox(boxSize, boxSize);
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    NormalizedScreenOffset = smStruggleMode.GetLeadersController().GetAimController().GetNormalizedScreenOffset();
    ScreenAimLocation.X = H.SizeX * (NormalizedScreenOffset.X + 0.5000000);
    ScreenAimLocation.Y = H.SizeY * (NormalizedScreenOffset.Y + 0.5000000);
    ScreenAimLocation.Z = 0.0000000;
    // End:0x47D
    if(bAimingInRange)
    {
        H.Canvas.SetDrawColor(0, 255, 0);        
    }
    else
    {
        H.Canvas.SetDrawColor(255, 0, 0);
    }
    boxSize = 5.0000000;
    H.Canvas.SetPos(ScreenAimLocation.X - (boxSize / float(2)), ScreenAimLocation.Y - (boxSize / float(2)));
    H.Canvas.DrawBox(boxSize, boxSize);
    //return;    
}
