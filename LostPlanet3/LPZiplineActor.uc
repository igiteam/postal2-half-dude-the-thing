class LPZiplineActor extends LPZiplinePoint_Base
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0xD83A0000-0x00000000*/ private travel LPZiplineActor ZiplineConnection[2162689];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CachedConnection[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bValidForUse;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bPrimary[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanSee;
var(0.25_Pct) /*0xD83A0000-0x00000000*/ private bool bOnlyShowCableWhenEnabled[65537];
var(0.25_Pct) /*0xD83A0000-0x00000000*/ private float MaxCableLength[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL WinchCable[524289];

// Export ULPZiplineActor::execUpdate(FFrame&, void* const)
native simulated function Update()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnLocation[8388609], CameraPos, CameraDir;


}

// Export ULPZiplineActor::execCheckGrappleEarlyOuts(FFrame&, void* const)
native simulated function CheckGrappleEarlyOuts()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPZiplineActor::execIsValidForPlayerGrapple(FFrame&, void* const)
native simulated function IsValidForPlayerGrapple()
{
    local /*0x97E50000-0x00000000*/ private float CurrentDot[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyBasePlayerPawn[8388609], LPPC;
    local /*0x97E50000-0x00000000*/ private float MaxPlayerAngleToHookDot[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPZiplineActor::execGetGrapplePoint(FFrame&, void* const)
native simulated function GetGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAdjustForCollision[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPZiplineActor::execIsInViewableRange(FFrame&, void* const)
native simulated function IsInViewableRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL CameraLocation[8388609], CameraDir;
    local /*0x97E50000-0x00000000*/ private float RequiredDot[8388609], MaxDist, ReturnValue;


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x21
    if(VarName == 'bPrimary')
    {
        SetupCable();
    }
    // End:0x5C
    if(VarName == 'ZiplineConnection')
    {
        WinchCable.Update(0.0000000);
    }
    super(Actor).ReplicatedEvent(VarName);
    //return;    
}

simulated function PostBeginPlay()
{
    super(LPGrapplePointActorBase).PostBeginPlay();
    SetupCable();
    //return;    
}

function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasEnabled;

    bWasEnabled = bEnabled;
    super(LPGrapplePointActorBase).OnToggle(Action);
    // End:0x20A
    if(bWasEnabled != bEnabled)
    {
        // End:0x195
        if(bEnabled)
        {
            // End:0x11A
            if(WinchCable == none)
            {
                WinchCable = new (self) Class'LPWinchCable';
                // End:0x86
                if(WinchCable == none)
                {
                    return;
                }
                WinchCable.AmpScale = self.default.WinchCable.AmpScale;
                WinchCable.MeshThickness = self.default.WinchCable.MeshThickness;
            }
            // End:0x188
            if(WinchCable.CableMesh == none)
            {
                WinchCable.CableMesh = self.default.WinchCable.CableMesh;
            }
            SetupCable();            
        }
        else
        {
            // End:0x20A
            if((!bEnabled && WinchCable != none) && bOnlyShowCableWhenEnabled)
            {
                DetachComponent(WinchCable);
                Class'Engine.SPObject'.static.MarkObjectAsPendingKill(WinchCable);
                WinchCable = none;
            }
        }
    }
    //return;    
}

simulated function SetupCable()
{
    // End:0xC7
    if(bPrimary && !bOnlyShowCableWhenEnabled || (bEnabled == true) && ZiplineConnection.bEnabled == true)
    {
        WinchCable.Init(self, 2, MaxCableLength, GetCableEndpoints, false);
        WinchCable.SetTighten(true);
        AttachComponent(WinchCable);
    }
    //return;    
}

simulated function GetCableEndpoints()
{
    local /*0x97E50000-0x00000000*/ private @NULL sourcepos[25165825], TargetPos;

    // End:0x5A
    if(ZiplineConnection != none)
    {
        sourcepos = self.Location;
        TargetPos = ZiplineConnection.Location;        
    }
    else
    {
        sourcepos = self.Location;
        TargetPos = sourcepos;
    }
    //return;    
}

simulated function GetHUDReticleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Location;
    //return ReturnValue;    
}

simulated function GetLineDirection()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x3E
    if(ZiplineConnection != none)
    {
        return Normal(ZiplineConnection.Location - Location);        
    }
    else
    {
        return super.GetLineDirection();
    }
    //return ReturnValue;    
}

function ConnectToZipline()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConnectingPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function DisconnectFromZipline()
{
    local /*0x97E50000-0x00000000*/ private @NULL DisconnectingPawn[8388609];

    //return;    
}

simulated event IsZiplineAvailable()
{
    local /*0x97E50000-0x00000000*/ private @NULL ActorWantingTheZipline[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    MaxCableLength=40000.0000000
    // Reference: LPWinchCable'Default__LPZiplineActor.WinchCableObject'
    begin object name=WinchCableObject class=Class'LPWinchCable'
    end object
    WinchCable=WinchCableObject
    GrappleType=Class'LPSM_GrappleToZipline'
    bEnabled=true
    // Reference: CylinderComponent'Default__LPZiplineActor.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[0]=CollisionCylinder
    Components[1]=none
    TickGroup=ETickingGroup.TG_PostUpdateWork
    bNoDelete=false
    bBlockActors=true
}