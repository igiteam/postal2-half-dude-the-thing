class LPZiplinePoint_Base extends LPGrapplePointActorBase
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private Pawn ConnectedPawn[2097153];
var(0.25_Pct) /*0x8B370000-0x00000000*/ private float MinGrappleDistance[65537];
var(0.25_Pct) /*0x8B370000-0x00000000*/ private bool bPlayerCanDropOff[2162689];
var(0.25_Pct) /*0x8B370000-0x00000000*/ private float DropoffDistance[2162689];

// Export ULPZiplinePoint_Base::execIsValidForPlayerGrapple(FFrame&, void* const)
native simulated function IsValidForPlayerGrapple()
{
    local /*0x97E50000-0x00000000*/ private float CurrentDot[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyBasePlayerPawn[8388609], LPPC;
    local /*0x97E50000-0x00000000*/ private float MaxPlayerAngleToHookDot[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPZiplinePoint_Base::execCheckGrappleEarlyOuts(FFrame&, void* const)
native simulated function CheckGrappleEarlyOuts()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function Reset()
{
    super(Actor).Reset();
    bEnabled = default.bEnabled;
    SetCollision(default.bCollideActors, default.bBlockActors);
    //return;    
}

simulated function TryToInteractWith()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bEnabled)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function ConnectToZipline()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConnectingPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    ConnectedPawn = ConnectingPawn;
    return true;
    //return ReturnValue;    
}

function DisconnectFromZipline()
{
    local /*0x97E50000-0x00000000*/ private @NULL DisconnectingPawn[8388609];

    // End:0x22
    if(ConnectedPawn == DisconnectingPawn)
    {
        ConnectedPawn = none;
    }
    //return;    
}

simulated event IsZiplineAvailable()
{
    local /*0x97E50000-0x00000000*/ private @NULL ActorWantingTheZipline[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function GetLineDirection()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

defaultproperties
{
    MinGrappleDistance=200.0000000
    bPlayerCanDropOff=true
    DropoffDistance=300.0000000
    bShouldSaveForCheckpoint=true
    // Reference: CylinderComponent'Default__LPZiplinePoint_Base.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[0]=CollisionCylinder
    bAlwaysRelevant=true
}