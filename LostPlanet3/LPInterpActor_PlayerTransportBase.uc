class LPInterpActor_PlayerTransportBase extends InterpActor
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AttachedNavList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AttachedPawnList;
var(0.25_Pct) /*0x80110000-0x00000000*/ private bool bClampedBaseEnabled[65537];
var(0.25_Pct) /*0x80110000-0x00000000*/ private bool bAlwaysConfineToClampedBase[65537];
var(0.25_Pct) /*0x80110000-0x00000000*/ private bool bDoComplexCameraCollision[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisallowPawnMovement;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUnderInterpMovementControl;
var(0.25_Pct) /*0x80110000-0x00000000*/ private int DamageToNonClampedPawnOnCollision[65537];
var(0.25_Pct) /*0x80110000-0x00000000*/ private class DamageTypeOnCollision[65537];

// Export ULPInterpActor_PlayerTransportBase::execFixBasedPawn(FFrame&, void* const)
native function FixBasedPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL GP[8388609];


}

// Export ULPInterpActor_PlayerTransportBase::execIsStillOnClampedBase(FFrame&, void* const)
native function IsStillOnClampedBase()
{
    local /*0x97E50000-0x00000000*/ private @NULL GP[8388609], PawnExtent;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL Nav;
    local /*0x97E50000-0x00000000*/ private int Idx;

    super.PostBeginPlay();
    // End:0xA6
    foreach BasedActors(Class'Engine.NavigationPoint', Nav)
    {
        // End:0x58
        if((LPCoverSlotMarker(Nav) != none) || LPPickupFactory(Nav) != none)
        {
            continue;            
        }
        Idx = AttachedNavList.Find(Nav);        
        // End:0xA5
        if(Idx < 0)
        {
            AttachedNavList[AttachedNavList.Length] = Nav;
        }        
    }    
    //return;    
}

simulated function OnToggleHidden()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    super(Actor).OnToggleHidden(Action);
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    super.ApplyCheckpointRecord(Record);
    //return;    
}

simulated event InterpolationStarted()
{
    local /*0x97E50000-0x00000000*/ private @NULL InterpAction[8388609], GroupInst;

    super.InterpolationStarted(InterpAction, GroupInst);
    // End:0x56
    if(int(Role) == int(ROLE_Authority))
    {
        SetTimer(1.0000000, true, 'ForceUpdateReplication');
        SetTimer(1.0000000, true, 'CheckBasedPawns');
    }
    bUnderInterpMovementControl = true;
    //return;    
}

simulated event InterpolationFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL InterpAction[8388609];

    super.InterpolationFinished(InterpAction);
    // End:0x4F
    if(int(Role) == int(ROLE_Authority))
    {
        ClearTimer('ForceUpdateReplication');
        ClearTimer('CheckBasedPawns');
    }
    bUnderInterpMovementControl = false;
    //return;    
}

function ForceUpdateReplication()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL InterpAction;

    I = 0;
    J0x0B:

    // End:0xC0 [Loop If]
    if(I < LatentActions.Length)
    {
        InterpAction = SeqAct_Interp(LatentActions[I]);
        // End:0xB2
        if((InterpAction != none) && InterpAction.ReplicatedActor != none)
        {
            InterpAction.ReplicatedActor.Update();
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

event Attach()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], P;
    local /*0x97E50000-0x00000000*/ private int Idx;

    P = LPPawn(Other);
    // End:0x139
    if(P != none)
    {
        // End:0x136
        if(bClampedBaseEnabled)
        {
            // End:0x134
            if((bDisallowPawnMovement || P.bJustTeleported) || int(P.Physics) == int(10))
            {
                Idx = AttachedPawnList.Find(LPPawn(Other));                
                // End:0xF3
                if(Idx < 0)
                {
                    AttachedPawnList[AttachedPawnList.Length] = LPPawn(Other);
                }
                // End:0x131
                if((AttachedPawnList.Length > 0) && !IsTimerActive('CheckBasedPawns'))
                {
                    SetTimer(1.0000000, true, 'CheckBasedPawns');
                }                
            }
            else
            {
                return;
            }
        }        
    }
    else
    {
        // End:0x1DB
        if(((NavigationPoint(Other) != none) && LPCoverSlotMarker(Other) == none) && LPPickupFactory(Other) == none)
        {
            Idx = AttachedNavList.Find(Other);            
            // End:0x1DB
            if(Idx < 0)
            {
                AttachedNavList[AttachedNavList.Length] = NavigationPoint(Other);
            }
        }
    }
    super.Attach(Other);
    //return;    
}

function CheckBasedPawns()
{
    local /*0x97E50000-0x00000000*/ private int PawnIdx;
    local /*0x97E50000-0x00000000*/ private @NULL GP;

    // End:0x1B5
    if(bClampedBaseEnabled)
    {
        PawnIdx = 0;
        J0x18:

        // End:0x1B5 [Loop If]
        if(PawnIdx < AttachedPawnList.Length)
        {
            GP = AttachedPawnList[PawnIdx];
            // End:0x76
            if(GP == none)
            {
                AttachedPawnList.Remove(PawnIdx--, 1);                                
            }
            else
            {
                // End:0x1A7
                if(!GP.IsDoingASpecialMove() && GP.IsAliveAndWell())
                {
                    // End:0x1A7
                    if(!IsStillOnClampedBase(GP, GP.GetCollisionExtent()))
                    {
                        FixBasedPawn(GP);
                        // End:0x1A7
                        if(bDisallowPawnMovement)
                        {
                            GP.SetPhysics(0);
                            GP.bCollideWorld = false;
                            GP.SetCollision(GP.bCollideActors, GP.bBlockActors, true);
                        }
                    }
                }
            }
            PawnIdx++;
            // [Loop Continue]
            goto J0x18;
        }
    }
    // End:0x1D9
    if(AttachedPawnList.Length == 0)
    {
        ClearTimer('CheckBasedPawns');
    }
    //return;    
}

function DoKismetAttachment()
{
    local /*0x97E50000-0x00000000*/ private @NULL Attachment[8388609], Action;

    // End:0xB9
    if(bDisallowPawnMovement && LPPawn(Attachment) != none)
    {
        Attachment.SetPhysics(0);
        Attachment.bCollideWorld = false;
        Attachment.SetCollision(Attachment.bCollideActors, Attachment.bBlockActors, true);
    }
    super(Actor).DoKismetAttachment(Attachment, Action);
    //return;    
}

function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x45
    if(inAction.InputLinks[0].bHasImpulse)
    {
        SetEnabled(true);        
    }
    else
    {
        // End:0x8A
        if(inAction.InputLinks[1].bHasImpulse)
        {
            SetEnabled(false);            
        }
        else
        {
            SetEnabled(!bClampedBaseEnabled);
        }
    }
    //return;    
}

function SetEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool inbEnabled[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GP;

    bClampedBaseEnabled = inbEnabled;
    // End:0x93
    foreach WorldInfo.AllPawns(Class'LPPawn', GP)
    {
        // End:0x92
        if(bClampedBaseEnabled)
        {
            // End:0x8F
            if(GP.Base == self)
            {
                Attach(GP);
            }
            // End:0x92
            continue;
        }        
    }    
    //return;    
}

event RanInto()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], GP;

    // End:0x95
    if(DamageToNonClampedPawnOnCollision > 0)
    {
        GP = LPPawn(Other);
        // End:0x95
        if(GP != none)
        {
            GP.TakeDamage(DamageToNonClampedPawnOnCollision, none, GP.Location, Velocity, DamageTypeOnCollision,, self);
        }
    }
    //return;    
}

defaultproperties
{
    bClampedBaseEnabled=true
    bDoComplexCameraCollision=true
    // Reference: StaticMeshComponent'Default__LPInterpActor_PlayerTransportBase.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPInterpActor_PlayerTransportBase.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPInterpActor_PlayerTransportBase.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    CollisionComponent=StaticMeshComponent0
}