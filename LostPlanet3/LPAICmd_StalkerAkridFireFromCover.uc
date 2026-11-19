class LPAICmd_StalkerAkridFireFromCover extends LPAICommand within LPAIControllerStalker;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentLaserAimLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RandomAimLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStartAimingLocked[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    GotoState('None');
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

state StateCmdActive
{Begin:

    GotoState('Firing');
    stop;        
}

state Firing
{
    ignores DrawLaserBeam;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.BurstStop();
        Outer.BurstUnlockAim();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    simulated function GetRandomAim()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InCover[25296897], ReturnValue, BaseRotation;
        local /*0x97E50000-0x00000000*/ private float horizontalSpread, verticalSpread, maxHorizontalDegrees, maxVerticalDegrees;
        local /*0x97E50000-0x00000000*/ private int RandomFireLinkIdx, RandomFireLinkInteractionIdx;
        local /*0x97E50000-0x00000000*/ private editfixedsize @NULL RandomFireLink, DestViewPt;
        local /*0x97E50000-0x00000000*/ private byte SrcType, SrcAction, DestType, DestAction;
        local /*0x97E50000-0x00000000*/ private @NULL DestInfo;

        // End:0x2BC
        if(Outer.FireTarget == none)
        {
            RandomFireLinkIdx = Rand(InCover.Link.Slots[InCover.SlotIdx].FireLinks.Length);
            RandomFireLink = InCover.Link.Slots[InCover.SlotIdx].FireLinks[RandomFireLinkIdx];
            RandomFireLinkInteractionIdx = Rand(RandomFireLink.Interactions.Length);
            InCover.Link.GetFireLinkTargetCoverInfo(InCover.SlotIdx, RandomFireLinkIdx, DestInfo);
            InCover.Link.UnPackFireLinkInteractionInfo(RandomFireLink.Interactions[RandomFireLinkInteractionIdx], SrcType, SrcAction, DestType, DestAction);
            DestViewPt = DestInfo.Link.GetSlotViewPoint(DestInfo.SlotIdx, DestType, DestAction);
            return Rotator(Normal(DestViewPt - Outer.Pawn.GetWeaponStartTraceLocation()));
        }
        // End:0x370
        if(Outer.FireTarget != none)
        {
            BaseRotation = Rotator(Normal(Outer.GetEnemyLocation(SPPawn(Outer.FireTarget), 0) - Outer.Pawn.GetWeaponStartTraceLocation()));            
        }
        else
        {
            BaseRotation = Outer.CoverGoal.Link.GetSlotRotation(Outer.CoverGoal.SlotIdx);
        }
        maxHorizontalDegrees = 30.0000000;
        maxVerticalDegrees = 10.0000000;
        horizontalSpread = ((FRand() < 0.5000000) ? maxHorizontalDegrees * 182.0444000 : -maxHorizontalDegrees * 182.0444000);
        verticalSpread = ((FRand() < 0.5000000) ? maxVerticalDegrees * 182.0444000 : -maxVerticalDegrees * 182.0444000);
        BaseRotation.Yaw += int(horizontalSpread * FRand());
        BaseRotation.Pitch += int(verticalSpread * FRand());
        return BaseRotation;
        //return ReturnValue;        
    }

    simulated function GetRandomAimLocation()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InCover[25296897], ReturnValue, StartTraceLocation, DirToAimLocation, SlotRotation, PotentialAimLocation;

        local /*0x97E50000-0x00000000*/ private bool bFoundGoodCandidate;
        local /*0x97E50000-0x00000000*/ private int Idx;
        local /*0x97E50000-0x00000000*/ private @NULL HitLocation, HitNormal, HitActor;

        bFoundGoodCandidate = false;
        Idx = 0;
        J0x17:

        // End:0x18F [Loop If]
        if(!bFoundGoodCandidate && Idx < 4)
        {
            StartTraceLocation = Outer.Pawn.GetWeaponStartTraceLocation();
            SlotRotation = GetRandomAim(InCover);
            DirToAimLocation = Vector(SlotRotation);
            PotentialAimLocation = StartTraceLocation + (DirToAimLocation * 2000.0000000);
            // BadToken (0x5D)
            HitActor = Outer.Pawn.Trace(HitLocation, HitNormal, PotentialAimLocation, StartTraceLocation, true,,, Outer.@NULL, ReturnValue, , @NULL, none, HitLocation, StartTraceLocation);            
            float(400)                        
            bFoundGoodCandidate = true;
            Idx++;
            // [Loop Continue]
            goto J0x17;
            return PotentialAimLocation;
            //return ReturnValue;
        }        
        @NULL
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        /*@Error*/;
    }

    function StartRandomAimingLaserBeam()
    {
        RandomAimLocation = GetRandomAimLocation(Outer.CoverGoal);
        //return;        
    }

    function UpdateRandomAimingLaserBeam()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL EnemyVisibleSelected;

        CurrentLaserAimLocation = VInterpTo(CurrentLaserAimLocation, RandomAimLocation, Outer.WorldInfo.DeltaSeconds, 3.0000000);
        DrawLaserBeam(MakeColor(255, 127, 39, 255));
        // End:0xCC
        if(VSize(CurrentLaserAimLocation - RandomAimLocation) < 10.0000000)
        {
            RandomAimLocation = GetRandomAimLocation(Outer.CoverGoal);
        }
        // End:0x150
        if(Outer.FireTarget == none)
        {
            EnemyVisibleSelected = Outer.SelectVisibleEnemy();
            // End:0x150
            if(EnemyVisibleSelected != none)
            {
                Outer.AISetFireTarget(EnemyVisibleSelected);
            }
        }
        // End:0x1C4
        if((Outer.FireTarget != none) && Outer.IsEnemyVisible(Pawn(Outer.FireTarget)))
        {
            return false;            
        }
        else
        {
            return true;
        }
        //return ReturnValue;        
    }

    function StartAimingLaserBeam()
    {
        local /*0x97E50000-0x00000000*/ private @NULL StartTraceLocation, DirToAimLocation;

        StartTraceLocation = Outer.Pawn.GetWeaponStartTraceLocation();
        DirToAimLocation = Outer.GetAimLocation(true) - StartTraceLocation;
        CurrentLaserAimLocation = (StartTraceLocation + (DirToAimLocation * 0.1000000)) - (vect(0.0000000, 0.0000000, 1.0000000) * Outer.Pawn.GetCollisionHeight());
        //return;        
    }

    function UpdateAimingLaserBeam()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL EndAimLocation;

        EndAimLocation = Outer.GetAimLocation(true);
        CurrentLaserAimLocation = VInterpTo(CurrentLaserAimLocation, EndAimLocation, Outer.WorldInfo.DeltaSeconds, 3.0000000);
        DrawLaserBeam(MakeColor(255, 127, 39, 255));
        // End:0xCA
        if(VSize(CurrentLaserAimLocation - EndAimLocation) > 10.0000000)
        {
            return true;            
        }
        else
        {
            return false;
        }
        //return ReturnValue;        
    }

    function StartAimingLocked()
    {
        TimeStampStartAimingLocked = Outer.WorldInfo.TimeSeconds;
        //return;        
    }

    function UpdateAimingLocked()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        DrawLaserBeam(MakeColor(255, 255, 0, 255));
        // End:0x69
        if((Outer.WorldInfo.TimeSeconds - TimeStampStartAimingLocked) < 1.0000000)
        {
            return true;            
        }
        else
        {
            return false;
        }
        //return ReturnValue;        
    }
    J0x00:
    // End:0x44 [Loop If]
    if(!Outer.CoverIsIn())
    {
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x00;
    }
PrepareFire:


    Outer.LastAnimTransitionTime = Outer.WorldInfo.TimeSeconds;
    J0x96:

    Outer.Sleep(0.2500000);
    // End:0x96
    if(!(!Outer.IsTransitioning()))
        goto J0x96;
    // End:0x1BD
    if(Outer.ShouldWaitForTransition(Outer.FireTargetCoverAction.SrcAction))
    {
        Outer.LastAnimTransitionTime = Outer.WorldInfo.TimeSeconds;
        J0x17C:

        Outer.Sleep(0.2500000);
        // End:0x17C
        if(!(!Outer.IsTransitioning()))
            goto J0x17C;
    }
    // End:0x26F
    if(int(Outer.FireTargetCoverAction.SrcAction) == int(0))
    {
        // End:0x26C
        if(int(Outer.MyCoverPawn.CoverType) == int(2))
        {
            Outer.MyCoverPawn.ShouldCrouch(true);
        }        
    }
    else
    {
        Outer.CoverSetAction(Outer.FireTargetCoverAction.SrcAction);
    }
    Outer.LastAnimTransitionTime = Outer.WorldInfo.TimeSeconds;
    J0x311:

    Outer.Sleep(0.2500000);
    // End:0x311
    if(!(!Outer.IsTransitioning()))
        goto J0x311;
FireWeapon:


    // End:0x3FA
    if((Outer.FireTarget == none) || !Outer.IsEnemyVisible(Pawn(Outer.FireTarget)))
    {
        StartRandomAimingLaserBeam();
        J0x3CD:

        // End:0x3FA [Loop If]
        if(UpdateRandomAimingLaserBeam())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x3CD;
        }
    }
    Outer.PawnLookAtActor(Outer.FireTarget);
    StartAimingLaserBeam();
    J0x441:

    // End:0x46E [Loop If]
    if(UpdateAimingLaserBeam())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x441;
    }
    Outer.BurstLockAim(CurrentLaserAimLocation);
    StartAimingLocked();
    J0x4A0:

    // End:0x4CD [Loop If]
    if(UpdateAimingLocked())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x4A0;
    }
    Outer.BurstStart();
    J0x4EC:

    Outer.Sleep(0.2500000);
    // End:0x4EC
    if(!(!Outer.BurstIsFiring()))
        goto J0x4EC;
    Outer.BurstStop();
    Outer.BurstUnlockAim();
    Outer.Sleep(0.2500000);
ReturnToCover:


    Outer.CoverResetAction();
    J0x5A7:

    // End:0x5E9 [Loop If]
    if(Outer.IsTransitioning())
    {
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x5A7;
    }
Finish:


    Outer.PopCommand(self);
    stop;            
}
