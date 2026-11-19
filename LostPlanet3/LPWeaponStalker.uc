class LPWeaponStalker extends LPWeapon
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShootingFromHands;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShootingFromFlaps;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShootingLinePattern;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShootingDrivenByAnim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFireFromLeftHand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAnimFireLeftHand[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TipSocketNames;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TipSocketNamesMirrored;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FirePositions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FireEndPositions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name NonFiringSocketName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ClientBulletNum[536870913];

simulated event PostBeginPlay()
{
    super(SPInventoryWeapon).PostBeginPlay();
    Mesh = Pawn(Owner).Mesh;
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    bShootingLinePattern = LPTuneDataWeaponStalker(TuneData).bEnableLinePatternShooting;
    super.InitTuneData(TuneData);
    //return;    
}

function SetupWeaponFire()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

    super.SetupWeaponFire(FireModeNum);
    // End:0x23
    if(bShootingFromHands)
    {        
    }
    else
    {
        // End:0x82
        if(bShootingLinePattern)
        {
            LinePatternStartPctg = FRand();
            // End:0x65
            if(LinePatternStartPctg > 0.5000000)
            {
                LinePatternEndPctg = FRand() / 2.0000000;                
            }
            else
            {
                LinePatternEndPctg = (FRand() / 2.0000000) + 0.5000000;
            }            
        }
        else
        {
            // End:0xBC
            if(bShootingFromFlaps)
            {
                LinePatternStartPctg = 0.5000000 + (FRand() * 0.5000000);
                LinePatternEndPctg = FRand() * 0.5000000;
            }
        }
    }
    //return;    
}

simulated function TimeWeaponFiring()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

    super(Weapon).TimeWeaponFiring(FireModeNum);
    //return;    
}

simulated function ShouldRefire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x20
    if(bShootingFromHands && RemainingBurstFireCount > 0)
    {
        return true;
    }
    return super.ShouldRefire();
    //return ReturnValue;    
}

function IsShootingRightHand()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3E
    if(LPAIPawnStalker(Owner).bIsMirrored && !bAnimFireLeftHand)
    {
        return true;
    }
    // End:0x7C
    if(!LPAIPawnStalker(Owner).bIsMirrored && bAnimFireLeftHand)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetLinePatternPctg()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LinePatternPctg;
    local /*0x97E50000-0x00000000*/ private float PitchPctg, YawPctg, PctgBurst;
    local /*0x97E50000-0x00000000*/ private int RemainingShortBurst, ShortBurstCount;

    // End:0xAA
    if(bShootingFromHands)
    {
        PctgBurst = 1.0000000 - (float(RemainingBurstFireCount) / float(StartBurstFireCount));
        // End:0x59
        if(IsShootingRightHand())
        {
            YawPctg = PctgBurst;            
        }
        else
        {
            YawPctg = 1.0000000 - PctgBurst;
        }
        PitchPctg = LinePatternStartPctg + ((LinePatternEndPctg - LinePatternStartPctg) * PctgBurst);        
    }
    else
    {
        // End:0x117
        if(bShootingLinePattern)
        {
            YawPctg = 1.0000000 - (float(RemainingBurstFireCount) / float(StartBurstFireCount));
            PitchPctg = LinePatternStartPctg + ((LinePatternEndPctg - LinePatternStartPctg) * YawPctg);            
        }
        else
        {
            // End:0x239
            if(bShootingFromFlaps)
            {
                ShortBurstCount = StartBurstFireCount / 2;
                RemainingShortBurst = (RemainingBurstFireCount - 1) % ShortBurstCount;
                PctgBurst = 1.0000000 - (float(RemainingShortBurst) / float(ShortBurstCount - 1));
                PitchPctg = 1.0000000 - PctgBurst;
                // End:0x1F0
                if(RemainingBurstFireCount > ShortBurstCount)
                {
                    YawPctg = LinePatternStartPctg + ((LinePatternEndPctg - LinePatternStartPctg) * PitchPctg);                    
                }
                else
                {
                    YawPctg = (LinePatternStartPctg - 0.5000000) + (((LinePatternEndPctg + 0.5000000) - (LinePatternStartPctg - 0.5000000)) * PitchPctg);
                }
            }
        }
    }
    LinePatternPctg.X = PitchPctg;
    LinePatternPctg.Y = YawPctg;
    return LinePatternPctg;
    //return ReturnValue;    
}

function GetBulletsShotThisBurst()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return StartBurstFireCount - RemainingBurstFireCount;
    //return ReturnValue;    
}

simulated function CalcWeaponFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartTrace[8388609], EndTrace;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ImpactList[26214401];
    local /*0x97E50000-0x00000000*/ private @NULL Extent[9437185], ReturnValue;

    FireEndPositions[StartBurstFireCount - RemainingBurstFireCount] = EndTrace;
    return super(SPWeapon).CalcWeaponFire(StartTrace, EndTrace, ImpactList, Extent);
    //return ReturnValue;    
}

function NotifyWeaponFired()
{
    local /*0x97E50000-0x00000000*/ private byte FireMode[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private name SocketName;

    super(SPGFWeapon).NotifyWeaponFired(FireMode);
    // End:0x6D
    if(bShootingFromHands)
    {
        // End:0x6A
        if(RemainingBurstFireCount > 0)
        {
            Idx = StartBurstFireCount - RemainingBurstFireCount;
            OverwriteTipPosition(FirePositions[Idx]);
        }        
    }
    else
    {
        // End:0xEA
        if((TipSocketNames.Length > 1) && !bShootingDrivenByAnim)
        {
            Idx = (GetBulletsShotThisBurst()) % TipSocketNames.Length;
            SocketName = TipSocketNames[Idx];
            MuzzleFlashSocketName = SocketName;
            bMuzzleFlashSocketChanged = true;
        }
    }
    //return;    
}

simulated event GetMuzzleLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x64
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        OverwriteTipPosition(LPAIPawnStalker(Owner).ClientFirePositions[ClientBulletNum]);
    }
    return TipPosition;
    //return ReturnValue;    
}

function HandFire()
{
    local /*0x97E50000-0x00000000*/ private float Duration[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLeftHandShooting[8388609];

    //return;    
}

simulated event IsFiring()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x52
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        return LPAIPawnStalker(Owner).bPlayFiringAnim;
    }
    return false;
    //return ReturnValue;    
}

function SetMuzzleFlashSocketName()
{
    local /*0x97E50000-0x00000000*/ private name SocketName[8388609];

    // End:0x67
    if(MuzzleFlashSocketName != SocketName)
    {
        MuzzleFlashSocketName = SocketName;
        LPAIPawnStalker(Owner).WeaponStartTraceLocationCache.bUpToDate = false;
    }
    //return;    
}

function NotifyWeaponRefireDelayExpired()
{
    // End:0x46
    if(bShootingDrivenByAnim)
    {
        // End:0x44
        if(!bShootingFromHands)
        {
            LPAIPawnStalker(Owner).StartStalkerFiringAnimation();
        }
        return;
    }
    super(SPGFWeapon).NotifyWeaponRefireDelayExpired();
    //return;    
}

simulated function DrawFiring()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    //return;    
}

simulated function PlayFireEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[9437185];

    PlayFireSound();
    PlayOwnedFireEffects(FireModeNum, HitLocation);
    //return;    
}

function WeaponFireTimeout()
{
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x3C
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        super(SPInventoryWeapon).Tick(DeltaTime);
    }
    //return;    
}

simulated state WeaponFiring
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x4A
        if(bShootingDrivenByAnim)
        {
            SetTimer(2.0000000, false, 'WeaponFireTimeout');
            LPAIPawnStalker(Owner).StartStalkerFiringAnimation();
            return;
        }
        super.BeginState(PreviousStateName);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('NotifyWeaponRefireDelayExpired');
        // End:0x49
        if(bShootingDrivenByAnim)
        {
            LPAIPawnStalker(Owner).StopStalkerFiringAnimation();
        }
        ResetOverwriteTipPosition();
        SetMuzzleFlashSocketName(NonFiringSocketName);
        super.EndState(NextStateName);
        //return;        
    }

    simulated function EndFire()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        super(SPInventoryWeapon).EndFire(FireModeNum);
        FirePositions.Remove(0, FirePositions.Length);        
        FireEndPositions.Remove(0, FireEndPositions.Length);        
        GotoState('Active');
        //return;        
    }

    function @NULL HandFire()
    {
        local /*0x97E50000-0x00000000*/ private float Duration[8388609];
        local /*0x97E50000-0x00000000*/ private bool bLeftHandShooting[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL SocketStartLocation, SocketEndLocation, FirePos;
        local /*0x97E50000-0x00000000*/ private bool bNoSockets;
        local /*0x97E50000-0x00000000*/ private int I;
        local /*0x97E50000-0x00000000*/ private name SocketStart, SocketEnd;
        local /*0x97E50000-0x00000400*/ private @NULL MySkeletalMesh;

        bAnimFireLeftHand = bLeftHandShooting;
        ClearTimer('WeaponFireTimeout');
        // End:0x3A
        if(RemainingBurstFireCount <= 0)
        {
            return;
        }
        // End:0x74
        if(IsShootingRightHand())
        {
            SocketStart = TipSocketNamesMirrored[0];
            SocketEnd = TipSocketNamesMirrored[1];            
        }
        else
        {
            SocketStart = TipSocketNames[0];
            SocketEnd = TipSocketNames[1];
        }
        // End:0xDE
        if(Mesh == none)
        {
            Mesh = Pawn(Owner).Mesh;
        }
        MySkeletalMesh = SkeletalMeshComponent(Mesh);
        bNoSockets = !MySkeletalMesh.GetSocketWorldLocationAndRotation(SocketStart, SocketStartLocation);
        bNoSockets = bNoSockets || !MySkeletalMesh.GetSocketWorldLocationAndRotation(SocketEnd, SocketEndLocation);
        // End:0x198
        if(bNoSockets)
        {
            return;
        }
        FirePositions.Remove(0, FirePositions.Length);        
        I = 0;
        J0x1B9:

        // End:0x237 [Loop If]
        if(I < RemainingBurstFireCount)
        {
            FirePos = SocketStartLocation + ((SocketEndLocation - SocketStartLocation) * (float(I) / float(RemainingBurstFireCount)));
            FirePositions.AddItem(FirePos);            
            ++I;
            // [Loop Continue]
            goto J0x1B9;
        }
        FireEndPositions.Remove(0, FireEndPositions.Length);        
        FireEndPositions.Insert(0, FirePositions.Length);        
        OverwriteTipPosition(FirePositions[0]);
        // End:0x32A
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            I = 0;
            J0x2AC:

            // End:0x32A [Loop If]
            if(I < FirePositions.Length)
            {
                LPAIPawnStalker(Owner).ClientFirePositions[I] = FirePositions[I];
                // End:0x31C
                if(I >= 4)
                {
                    // [Explicit Break]
                    goto J0x32A;
                }
                ++I;
                // [Loop Continue]
                goto J0x2AC;
            }
        }
        J0x32A:

        LinePatternStartPctg = 0.5000000 + (FRand() * 0.5000000);
        LinePatternEndPctg = FRand() * 0.5000000;
        // End:0x39E
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            FireInterval[int(CurrentFireMode)] = 0.0700000;            
        }
        else
        {
            FireInterval[int(CurrentFireMode)] = Duration / float(RemainingBurstFireCount);
        }
        RefireCheckTimer();
        // End:0x3F7
        if(IsInState('WeaponFiring'))
        {
            TimeWeaponFiring(CurrentFireMode);
        }
        //return;        
    }

    simulated function RefireCheckTimer()
    {
        super.RefireCheckTimer();
        bFireFromLeftHand = !bFireFromLeftHand;
        //return;        
    }

    simulated function StopFireEffects()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        // End:0x44
        if(bShootingDrivenByAnim)
        {
            // End:0x44
            if(!bShootingFromHands)
            {
                LPAIPawnStalker(Owner).StopStalkerFiringAnimation();
            }
        }
        //return;        
    }

    function WeaponFireTimeout()
    {
        EndFire(0);
        //return;        
    }
    stop;    
}

defaultproperties
{
    bShootingFromHands=true
    bShootingDrivenByAnim=true
    bInfiniteAmmo=true
    bSkipCheckToKeepFiringOnStartFire=true
    bAllowTracers=true
    // Reference: StaticMeshComponent'Default__LPWeaponStalker.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponStalker.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    EquipTime=0.0000000
    bCanThrow=false
    // Reference: SkeletalMeshComponent'Default__LPWeaponStalker.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    // Reference: StaticMeshComponent'Default__LPWeaponStalker.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}