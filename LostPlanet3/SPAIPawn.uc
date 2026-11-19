class SPAIPawn extends SPPawn
    abstract
    nativereplication
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private export @NULL LineSweepHitTester[524289];
var(__NotifyAccessLostDelegate__Delegate) /*0x05E10000-0x00000000*/ private @NULL mySPAITuneDataPawn[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bDiedDuringMatinee;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bAllowHitReactionsInMatinee;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bAllowOwnerMeleeStrikeNotifies;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float PeripheralVisionVertical;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL DeathQuestEvent;

// Export USPAIPawn::execCanBeInterpolatedInMatinee(FFrame&, void* const)
native function CanBeInterpolatedInMatinee()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIPawn::execSetDesiredRotation(FFrame&, void* const)
native function SetDesiredRotation()
{
    local /*0x03A30000-0x00000000*/ private @NULL TargetDesiredRotation[8388609];
    local /*0x03A30000-0x00000000*/ private bool InLockDesiredRotation[9437185], InUnlockWhenReached;
    local /*0x03A30000-0x00000000*/ private float InterpolationTime[9437185];
    local /*0x03A30000-0x00000000*/ private bool bResetRotationRate[9437185], ReturnValue;

    false
    false
    -1.0000000
    true                            
}

simulated event InitTuneData()
{
    local /*0x03A30000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    mySPAITuneDataPawn = SPAITuneDataPawn(TuneData);
    // End:0x102
    if(mySPAITuneDataPawn != none)
    {
        SightRadius = mySPAITuneDataPawn.SightRadius;
        PeripheralVision = Cos((mySPAITuneDataPawn.VisionAngleHorizontal.GetValue() * 0.0174533) * 0.5000000);
        PeripheralVisionVertical = Cos((mySPAITuneDataPawn.VisionAngleVertical.GetValue() * 0.0174533) * 0.5000000);
    }
    //return;    
}

function ScreenMsg()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize string msg[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL curCtrl;

    // End:0x63
    foreach WorldInfo.AllControllers(Class'Engine.PlayerController', curCtrl)
    {
        curCtrl.ClientMessage(msg,, 1000.0000000);        
    }    
    //return;    
}

simulated function EnableLineSweepHitTester()
{
    local /*0x03A30000-0x00000000*/ private bool bEnable[8388609];
    local /*0x03A30000-0x00000000*/ private byte CollisionCheckType[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL HitTarget[9437185];

    0    
    // End:0x86
    if(bEnable)
    {
        LineSweepHitTester.CollisionCheckType = CollisionCheckType;
        LineSweepHitTester.TargetPawn = HitTarget;
        LineSweepHitTester.EnableTests();        
    }
    else
    {
        LineSweepHitTester.DisableAllSplines();
        LineSweepHitTester.TargetPawn = none;
    }
    //return;    
}

simulated function LineSweepHitTesterCompleteHitTestAndDisable()
{
    LineSweepHitTester.CompleteHitTestAndDisable();
    //return;    
}

simulated function LineSweepHitTesterResetHitTest()
{
    LineSweepHitTester.ResetHitTestForAllSplines();
    //return;    
}

reliable server function ServerLineSweepHitTesterHitSomethingNew()
{
    local /*0x03A30000-0x00000000*/ private @NULL Info[8388609];

    LineSweepHitTesterHitSomethingNew(Info);
    //return;    
}

function LineSweepHitTesterHitSomethingNew()
{
    local /*0x03A30000-0x00000000*/ private @NULL Info[25296897], DmgInfo;

    // End:0x4B
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        // End:0x49
        if(IsLocallyControlled())
        {
            ServerLineSweepHitTesterHitSomethingNew(Info);
        }
        return;
    }
    GetDamageAmountAndTypeFromSpline(Info.SplineName, DmgInfo.DamageAmount, DmgInfo.TheDamageType);
    // End:0x12A
    if((DmgInfo.DamageAmount > float(0)) && DmgInfo.TheDamageType != none)
    {
        DmgInfo.ImpactInfo = Info;
        LineSweepHitTesterDoDamageAndEffects(DmgInfo);
    }
    // End:0x31D
    if(LineSweepHitTester.bDebugDrawLines || LineSweepHitTester.bDebugDrawCollision)
    {
        // End:0x289
        if((DmgInfo.DamageAmount > float(0)) && DmgInfo.TheDamageType != none)
        {
            ScreenMsg((((((((string(self) $ " did melee hit damage (") $ string(Info.SplineName)) $ "|") $ string(DmgInfo.TheDamageType)) $ "|") $ string(DmgInfo.DamageAmount)) $ ") to ") $ string(Info.Impact.HitActor));            
        }
        else
        {
            ScreenMsg(((((string(self) $ " did melee hit (") $ string(Info.SplineName)) $ ") to ") $ string(Info.Impact.HitActor)) $ " NO DAMAGE APPLIED ");
        }
    }
    //return;    
}

function LineSweepHitTesterDoDamageAndEffects()
{
    local /*0x03A30000-0x00000000*/ private @NULL DmgInfo[25296897];

    LineSweepHitTesterDoDamage(DmgInfo);
    LineSweepHitTesterDoEffects(DmgInfo);
    //return;    
}

function LineSweepHitTesterDoDamage()
{
    local /*0x03A30000-0x00000000*/ private @NULL DmgInfo[25296897];

    DmgInfo.ImpactInfo.Impact.HitActor.TakeDamage(int(DmgInfo.DamageAmount), Controller, DmgInfo.ImpactInfo.Impact.HitLocation, DmgInfo.ImpactInfo.Impact.RayDir, DmgInfo.TheDamageType, DmgInfo.ImpactInfo.Impact.HitInfo, self);
    //return;    
}

function LineSweepHitTesterDoEffects()
{
    local /*0x03A30000-0x00000000*/ private @NULL DmgInfo[25296897], PhysMat;

    // End:0x20F
    if(SPPawn(DmgInfo.ImpactInfo.Impact.HitActor) == none)
    {
        PhysMat = SPPhysicalMaterial(DmgInfo.ImpactInfo.Impact.HitInfo.PhysMaterial);
        // End:0x20F
        if(PhysMat != none)
        {
            PhysMat.PlayImpactEffects(DmgInfo.ImpactInfo.Impact.HitActor, DmgInfo.ImpactInfo.Impact.HitInfo, DmgInfo.ImpactInfo.Impact.HitLocation, DmgInfo.ImpactInfo.Impact.HitNormal, DmgInfo.TheDamageType);
        }
    }
    //return;    
}

function GetDamageAmountAndTypeFromSpline()
{
    local /*0x03A30000-0x00000000*/ private name SplineName[8388609];
    local /*0x03A30000-0x00000000*/ private float DamageAmount[25165825];
    local /*0x03A30000-0x00000000*/ private class TheDamageType[25165825];
    local /*0x03A30000-0x00000000*/ private int I, G;

    DamageAmount = 0.0000000;
    TheDamageType = none;
    // End:0x20C
    if(mySPAITuneDataPawn != none)
    {
        I = 0;
        J0x34:

        // End:0x20C [Loop If]
        if(I < mySPAITuneDataPawn.MeleeDamage.Length)
        {
            G = 0;
            J0x6C:

            // End:0x1FE [Loop If]
            if(G < mySPAITuneDataPawn.MeleeDamage[I].Limb.default.Group.Length)
            {
                // End:0x1F0
                if(mySPAITuneDataPawn.MeleeDamage[I].Limb.default.Group[G].GroupName == SplineName)
                {
                    DamageAmount = mySPAITuneDataPawn.MeleeDamage[I].DamageAmount.GetValue();
                    TheDamageType = mySPAITuneDataPawn.MeleeDamage[I].TheDamageType;
                    return;
                }
                ++G;
                // [Loop Continue]
                goto J0x6C;
            }
            ++I;
            // [Loop Continue]
            goto J0x34;
        }
    }
    //return;    
}

exec function DebugMelee()
{
    local /*0x03A30000-0x00000000*/ private @NULL CurPawn;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0xDF [Loop If]
    if(CurPawn != none)
    {
        SPAIPawn(CurPawn).LineSweepHitTester.bDebugDrawLines = !SPAIPawn(CurPawn).LineSweepHitTester.bDebugDrawLines;
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

exec function DebugMeleeHits()
{
    local /*0x03A30000-0x00000000*/ private @NULL CurPawn;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0xDF [Loop If]
    if(CurPawn != none)
    {
        SPAIPawn(CurPawn).LineSweepHitTester.bDebugDrawCollision = !SPAIPawn(CurPawn).LineSweepHitTester.bDebugDrawCollision;
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

event HandleAnimNotifyMeleeStrikeBegin()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array GroupClass[8388609];
    local /*0x03A30000-0x00000000*/ private byte MomentumHint[8388609];
    local /*0x03A30000-0x00000000*/ private int G, P, I;

    // End:0x2AD
    if(LineSweepHitTester.IsEnabled())
    {
        G = 0;
        J0x2D:

        // End:0x2AD [Loop If]
        if(G < GroupClass.Length)
        {
            I = 0;
            J0x50:

            // End:0x29F [Loop If]
            if(I < GroupClass[G].default.Group.Length)
            {
                P = 0;
                J0x92:

                // End:0x223 [Loop If]
                if(P < GroupClass[G].default.Group[I].SocketInfo.Length)
                {
                    LineSweepHitTester.AddSocket(GroupClass[G].default.Group[I].GroupName, GroupClass[G].default.Group[I].SocketInfo[P].SocketName, 2.0000000 * GroupClass[G].default.Group[I].SocketInfo[P].HalfWidth);
                    ++P;
                    // [Loop Continue]
                    goto J0x92;
                }
                LineSweepHitTester.EnableHitTestForSpline(GroupClass[G].default.Group[I].GroupName, true, MomentumHint);
                ++I;
                // [Loop Continue]
                goto J0x50;
            }
            ++G;
            // [Loop Continue]
            goto J0x2D;
        }
    }
    // End:0x310
    if((Controller != none) && SPAIController(Controller) != none)
    {
        SPAIController(Controller).HandleAnimNotifyMeleeStrikeBegin(GroupClass, MomentumHint);
    }
    //return;    
}

event HandleAnimNotifyMeleeStrikeEnd()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array GroupClass[8388609];
    local /*0x03A30000-0x00000000*/ private int I, G;

    // End:0x15A
    if(LineSweepHitTester.IsEnabled())
    {
        LineSweepHitTester.DoCollisionTest();
        // End:0x73
        if(GroupClass.Length == 0)
        {
            LineSweepHitTester.DisableAllSplines();            
        }
        else
        {
            I = 0;
            J0x7E:

            // End:0x15A [Loop If]
            if(I < GroupClass.Length)
            {
                G = 0;
                J0xA1:

                // End:0x14C [Loop If]
                if(G < GroupClass[I].default.Group.Length)
                {
                    LineSweepHitTester.EnableHitTestForSpline(GroupClass[I].default.Group[G].GroupName, false);
                    ++G;
                    // [Loop Continue]
                    goto J0xA1;
                }
                ++I;
                // [Loop Continue]
                goto J0x7E;
            }
        }
    }
    // End:0x1B4
    if((Controller != none) && SPAIController(Controller) != none)
    {
        SPAIController(Controller).HandleAnimNotifyMeleeStrikeEnd(GroupClass);
    }
    //return;    
}

event HandleAnimNotifyMeleeStrikeReset()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array GroupClass[8388609];
    local /*0x03A30000-0x00000000*/ private int I, G;

    // End:0x139
    if(LineSweepHitTester.IsEnabled())
    {
        // End:0x54
        if(GroupClass.Length == 0)
        {
            LineSweepHitTester.ResetHitTestForAllSplines();            
        }
        else
        {
            I = 0;
            J0x5F:

            // End:0x139 [Loop If]
            if(I < GroupClass.Length)
            {
                G = 0;
                J0x82:

                // End:0x12B [Loop If]
                if(G < GroupClass[I].default.Group.Length)
                {
                    LineSweepHitTester.ResetHitTestForSpline(GroupClass[I].default.Group[G].GroupName);
                    ++G;
                    // [Loop Continue]
                    goto J0x82;
                }
                ++I;
                // [Loop Continue]
                goto J0x5F;
            }
        }
    }
    //return;    
}

function Died()
{
    local /*0x03A30000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x03A30000-0x00000000*/ private class DamageType[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x57
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0x57
        if(DeathQuestEvent != none)
        {
            DeathQuestEvent.SendEvent();
        }
    }
    // End:0x70
    if(IsInMatinee())
    {
        bDiedDuringMatinee = true;
    }
    return super(Pawn).Died(Killer, DamageType, HitLocation);
    //return ReturnValue;    
}

simulated event InterpolationStarted()
{
    local /*0x03A30000-0x00000000*/ private @NULL InInterpAction[8388609], InGroupInst;

    super(Pawn).InterpolationStarted(InInterpAction, InGroupInst);
    //return;    
}

simulated event InterpolationFinished()
{
    local /*0x03A30000-0x00000000*/ private @NULL InInterpAction[8388609];

    super(Pawn).InterpolationFinished(InInterpAction);
    //return;    
}

function IsInMatinee()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if((Controller != none) && Controller.IsInState('MatineeAnimControl'))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function MatineeNeedsHitReactions()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return (IsInMatinee()) && bAllowHitReactionsInMatinee;
    //return ReturnValue;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(MatineeNeedsHitReactions())
    {
        return true;        
    }
    else
    {
        return super.AllowedToProcessTakeDamage();
    }
    //return ReturnValue;    
}

function AdjustDamage()
{
    local /*0x03A30000-0x00000000*/ private int InDamage[25165825];
    local /*0x03A30000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x03A30000-0x00000000*/ private class DamageType[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser, SPAI;

    // End:0x136
    if(MatineeNeedsHitReactions())
    {
        SPAI = SPAIController(Controller);
        // End:0xEA
        if((SPAI != none) && SPAI.bDisableAI)
        {
            SPAI.bDisableAI = false;
            super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
            SPAI.bDisableAI = true;            
        }
        else
        {
            super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
        }        
    }
    else
    {
        super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    }
    //return;    
}

defaultproperties
{
    // Reference: SPSocketLineSweepHitTestComponent'Default__SPAIPawn.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0 class=Class'SPEngine.SPSocketLineSweepHitTestComponent'
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__SPAIPawn.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: SPDamageOverTimeComponent'Default__SPAIPawn.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__SPAIPawn.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__SPAIPawn.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__SPAIPawn.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__SPAIPawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__SPAIPawn.FaceAudioComponent'
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
    CollisionComponent=CollisionCylinder
}