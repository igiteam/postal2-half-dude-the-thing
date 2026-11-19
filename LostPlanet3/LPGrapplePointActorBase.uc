class LPGrapplePointActorBase extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

struct CheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabled;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHidden;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CollisionType;

    structdefaultproperties
    {
        bEnabled=false
        bHidden=false
        CollisionType=ECollisionType.COLLIDE_CustomDefault
    }
};

var(0.25_Pct) /*0x67840000-0x00000000*/ private class GrappleType[65537];
var(0.25_Pct) /*0x67840000-0x00000000*/ private bool bDisableGrappleUp[65537];
var(0.25_Pct) /*0x67840000-0x00000000*/ private bool bDisableGrappleDown[65537];
var(0.25_Pct) /*0x7FDC0000-0x00000000*/ private bool bEnabled[2162689];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bValid;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrappleDownMode;
var(0.25_Pct) /*0x67840000-0x00000000*/ private bool bDisableCollisionCheck[65537];
var(0.25_Pct) /*0x67840000-0x00000000*/ private bool bMagnetic[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldSaveForCheckpoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrappleLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int bAmICloseEnough;

// Export ULPGrapplePointActorBase::execUpdate(FFrame&, void* const)
native simulated function Update()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnLocation[8388609], CameraPos, CameraDir;


}

// Export ULPGrapplePointActorBase::execIsValidForPlayerGrapple(FFrame&, void* const)
native simulated function IsValidForPlayerGrapple()
{
    local /*0x97E50000-0x00000000*/ private float CurrentDot[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyBasePlayerPawn[8388609], LPPC;
    local /*0x97E50000-0x00000000*/ private float MaxPlayerAngleToHookDot[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGrapplePointActorBase::execCheckGrappleEarlyOuts(FFrame&, void* const)
native simulated function CheckGrappleEarlyOuts()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGrapplePointActorBase::execCheckForValidGrappleAngle(FFrame&, void* const)
native final simulated function CheckForValidGrappleAngle()
{
    local /*0x97E50000-0x00000000*/ private float CurrentDot[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyBasePlayerPawn[8388609], LPPC;
    local /*0x97E50000-0x00000000*/ private float MaxPlayerAngleToHookDot[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGrapplePointActorBase::execCheckGrappleTooLow(FFrame&, void* const)
native final simulated function CheckGrappleTooLow()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrapplePoint[8388609], MyBasePlayerPawn;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGrapplePointActorBase::execIsValidHookForPawn(FFrame&, void* const)
native final simulated function IsValidHookForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGrapplePointActorBase::execHasHookConnections(FFrame&, void* const)
native simulated function HasHookConnections()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPGrapplePointActorBase::execSetValid(FFrame&, void* const)
native final simulated function SetValid()
{
    local /*0x97E50000-0x00000000*/ private bool bIsValid[8388609];


}

// Export ULPGrapplePointActorBase::execGetGrapplePoint(FFrame&, void* const)
native simulated function GetGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAdjustForCollision[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPGrapplePointActorBase::execGetGrappleDownPoint(FFrame&, void* const)
native simulated function GetGrappleDownPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bRestrict[9437185];
    local /*0x97E50000-0x00000000*/ private int bIsValid[26214401];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPGrapplePointActorBase::execIsInViewableRange(FFrame&, void* const)
native simulated function IsInViewableRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL CameraLocation[8388609], CameraDir;
    local /*0x97E50000-0x00000000*/ private float RequiredDot[8388609], MaxDist, ReturnValue;


}

// Export ULPGrapplePointActorBase::execGetGrappleLocation(FFrame&, void* const)
native simulated function GetGrappleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPGrapplePointActorBase::execSetGrappleLocation(FFrame&, void* const)
native simulated function SetGrappleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrappleLocation[25296897];


}

function PostBeginPlay()
{
    super.PostBeginPlay();
    GrappleLocation = Location;
    //return;    
}

function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    //return;    
}

function ShouldSaveForCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bShouldSaveForCheckpoint;
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    Record.bEnabled = bEnabled;
    Record.bHidden = bHidden;
    Record.CollisionType = ReplicatedCollisionType;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    bEnabled = Record.bEnabled;
    // End:0x86
    if(int(Record.CollisionType) != int(ReplicatedCollisionType))
    {
        SetCollisionType(Record.CollisionType);
        ForceNetRelevant();
    }
    // End:0x10C
    if(Record.bHidden != bHidden)
    {
        SetHidden(Record.bHidden);
        SetForcedInitialReplicatedProperty(BoolProperty'Engine.Actor.bHidden', bHidden == default.bHidden);
        ForceNetRelevant();
    }
    //return;    
}

simulated function GetPawnGrappleDest()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609], HandOffset, ReturnValue, GrappleSM;

    GrappleSM = LPSM_GrapplingFinishBase(LPP.GetSpecialMoveInstance(GrappleType));
    return GrappleSM.SetUpPawnGrappleDest(self, LPP, HandOffset);
    //return ReturnValue;    
}

simulated event NotifyTargeted()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];

    TriggerEventClass(Class'LPSeqEvent_GrapplePointTargeted', PlayerPawn);
    //return;    
}

simulated event NotifyUntargeted()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];

    TriggerEventClass(Class'LPSeqEvent_GrapplePointUntargeted', PlayerPawn);
    //return;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__LPGrapplePointActorBase.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'Engine.CylinderComponent'
    end object
    Components[0]=CollisionCylinder
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bGameRelevant=true
    bNotifyPrimitiveComponentUpdates=true
    bCollideActors=true
    SupportedEvents=/* Array type was not detected. */
}