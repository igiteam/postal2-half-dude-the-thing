class LPGrapplingHook extends LPInventoryParts
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Speed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ValidRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InvalidRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrapplePoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrappleStart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GrappleDist;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurRot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyOwner;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponentLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReleaseTimer;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL GrappleCable[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL GrappleAttachmentMesh[524289];

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(Actor).Tick(DeltaTime);
    Update(DeltaTime);
    //return;    
}

simulated function DestroyCable()
{
    // End:0x39
    if(GrappleCable != none)
    {
        GrappleCable.DestroySplines();
        GrappleCable = none;
    }
    //return;    
}

simulated function CheckForInstigator()
{
    // End:0x36
    if(Instigator != none)
    {
        AttachMeshToPlayerArm(Instigator);
        ClearTimer('CheckForInstigator');
    }
    //return;    
}

function GivenTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewOwner[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    super(Inventory).GivenTo(NewOwner, bDoNotActivate);
    LPP = LPPlayerPawn(NewOwner);
    // End:0xE0
    if(LPP != none)
    {
        LPP.GrappleHookClass = self.Class;
        // End:0xE0
        if((int(LPP.Role) == int(ROLE_Authority)) && !LPP.IsLocallyControlled())
        {
            AttachMeshToPlayerArm(LPP);
        }
    }
    //return;    
}

reliable client simulated function ClientGivenTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewOwner[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate[8388609];

    super(Inventory).ClientGivenTo(NewOwner, bDoNotActivate);
    // End:0x41
    if(NewOwner == none)
    {
        SetTimer(0.0500000, true, 'CheckForInstigator');
        return;
    }
    // End:0x9A
    if(((NewOwner != none) && GrappleAttachmentMesh != none) && !GrappleAttachmentMesh.bAttached)
    {
        AttachMeshToPlayerArm(NewOwner);
    }
    //return;    
}

function ItemRemovedFromInvManager()
{
    super(Inventory).ItemRemovedFromInvManager();
    DetachGrappleHook();
    //return;    
}

simulated function DetachGrappleHook()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    LPP = LPPlayerPawn(Instigator);
    DestroyCable();
    // End:0x55
    if(LPP != none)
    {
        LPP.GrappleHookClass = none;
    }
    RemoveMeshFromPlayerArm(Instigator);
    //return;    
}

simulated function SetupCable()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewOwner[8388609];

    MyOwner = NewOwner;
    // End:0x7D
    if(GrappleCable.Owner == none)
    {
        NewOwner.Mesh.AttachComponentToSocket(GrappleCable, 'Grapple');
    }
    GrappleCable.Init(self, 7, NewOwner.GetGrappleParams().HookValidRange.GetValue() * 2.0000000, GetCableEndpoints);
    //return;    
}

simulated function GetCableEndpoints()
{
    local /*0x97E50000-0x00000000*/ private @NULL sourcepos[25165825], TargetPos;

    // End:0x3A
    if(bHidden)
    {
        sourcepos = vect(0.0000000, 0.0000000, 0.0000000);
        TargetPos = sourcepos;        
    }
    else
    {
        // End:0xAF
        if(!MyOwner.Mesh.GetSocketWorldLocationAndRotation('Grapple', sourcepos))
        {
            sourcepos = MyOwner.Location;
        }
        TargetPos = Location;
    }
    //return;    
}

simulated function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

simulated function PlayerLanded()
{
    // End:0x38
    if(SoundComponentLoop != none)
    {
        SoundComponentLoop.FadeOut(0.1000000, 0.0000000);
    }
    SetHidden(true);
    // End:0x90
    if(IsGrappleActorMagnetic())
    {
        TuneDataPartsSoundEventBindings.PlayEventSoundLocally('HookStopMagnetic', 'None', MyOwner, none, none);        
    }
    else
    {
        TuneDataPartsSoundEventBindings.PlayEventSoundLocally('HookStop', 'None', MyOwner, none, none);
    }
    ReleaseTimer = 0.5000000;
    //return;    
}

simulated function AbortIfNecessary()
{
    GotoState('Idle');
    //return;    
}

simulated event Destroyed()
{
    super(Inventory).Destroyed();
    // End:0x62
    if(SoundComponentLoop != none)
    {
        SoundComponentLoop.Stop();
        SoundComponentLoop.DetachFromAny();
        SoundComponentLoop = none;
    }
    DetachGrappleHook();
    //return;    
}

simulated function AttachMeshToPlayerArm()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerToAttachTo[8388609];

    // End:0xCD
    if((GrappleAttachmentMesh != none) && !GrappleAttachmentMesh.bAttached)
    {
        GrappleAttachmentMesh.SetLightEnvironment(PlayerToAttachTo.Mesh.LightEnvironment);
        PlayerToAttachTo.Mesh.AttachComponentToSocket(GrappleAttachmentMesh, 'GrappleHook');
    }
    //return;    
}

simulated function RemoveMeshFromPlayerArm()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerToDetachFrom[8388609];

    // End:0x70
    if((GrappleAttachmentMesh != none) && GrappleAttachmentMesh.bAttached)
    {
        PlayerToDetachFrom.Mesh.DetachComponent(GrappleAttachmentMesh);
    }
    //return;    
}

simulated function IsGrappleActorMagnetic()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;
    local /*0x97E50000-0x00000000*/ private @NULL GrapplePointActor;

    GrapplePointActor = LPGrapplePointActorBase(MyOwner.GrappleActor);
    bResult = (GrapplePointActor != none) && GrapplePointActor.bMagnetic;
    return bResult;
    //return ReturnValue;    
}

simulated function DisableWinchCable()
{
    GrappleCable.DisableSpline();
    //return;    
}

auto simulated state Idle
{
    ignores AbortIfNecessary;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        // End:0x6B
        if(Owner != none)
        {
            SetLocation(Owner.Location);
            SetRotation(Owner.Rotation);
        }
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        SetPhysics(6);
        CurRot = 0.0000000;
        // End:0xCE
        if(SoundComponentLoop != none)
        {
            SoundComponentLoop.FadeOut(0.1000000, 0.0000000);
        }
        GrappleCable.SetActive(false);
        SetTimer(0.1000000, false, 'DisableWinchCable');
        SetHidden(true);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        GrappleCable.SetActive(true);
        ClearTimer('DisableWinchCable');
        //return;        
    }

    simulated function Update()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        // End:0x3C
        if((MyOwner == none) && Owner != none)
        {
            SetupCable(LPPlayerPawn(Owner));
        }
        //return;        
    }
    stop;    
}

simulated state GrappleAttached
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        MyOwner.OnGrappleHookConnected();
        // End:0xB8
        if(IsGrappleActorMagnetic())
        {
            TuneDataPartsFXEventBindings.PlayEventFXAtLoc('HookHitMagnetic', Location, rot(0, 0, 1), self, none, none);
            TuneDataPartsSoundEventBindings.PlayEventSoundLocally('HookGrabMagnetic', 'None', self, none, none);            
        }
        else
        {
            TuneDataPartsFXEventBindings.PlayEventFXAtLoc('HookHit', Location, rot(0, 0, 1), self, none, none);
            TuneDataPartsSoundEventBindings.PlayEventSoundLocally('HookGrab', 'None', self, none, none);
        }
        //return;        
    }
    stop;    
}

simulated state GrappleDownAttach
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Speed = MyOwner.GetGrappleParams().HookSpeed;
        ValidRange = MyOwner.GetGrappleParams().HookValidRange.GetValue();
        InvalidRange = MyOwner.GetGrappleParams().HookInvalidRange;
        // End:0x145
        if(!MyOwner.Mesh.GetSocketWorldLocationAndRotation('Grapple', GrappleStart))
        {
            GrappleStart = MyOwner.Location;
        }
        GrappleDist = VSize(GrapplePoint - GrappleStart);
        SetLocation(GrappleStart);
        SetRotation(Owner.Rotation);
        Velocity = Normal(GrapplePoint - GrappleStart);
        Velocity = Velocity * Speed;
        SetPhysics(6);
        SetHidden(false);
        // End:0x247
        if(IsGrappleActorMagnetic())
        {
            SoundComponentLoop = TuneDataPartsSoundEventBindings.PlayEventSoundLocallyEx('HookTravelMagnetic', 'None', MyOwner, none, none, SoundComponentLoop);            
        }
        else
        {
            SoundComponentLoop = TuneDataPartsSoundEventBindings.PlayEventSoundLocallyEx('HookTravel', 'None', MyOwner, none, none, SoundComponentLoop);
        }
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    simulated function Update()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Rot;

        Rot = Rotation;
        Rot.Yaw = Rot.Yaw + 2000;
        SetRotation(Rot);
        // End:0xC2
        if(VSizeSq(Location - GrappleStart) >= Square(GrappleDist))
        {
            Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            SetPhysics(6);
            SetLocation(GrapplePoint);
            GotoState('GrappleAttached');
        }
        //return;        
    }
    stop;    
}

simulated state FallRecoveryAttach extends GrappleDownAttach
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }
    stop;    
}

simulated state Firing
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SetLocation(Owner.Location);
        SetRotation(Owner.Rotation);
        Speed = MyOwner.GetGrappleParams().HookSpeed;
        ValidRange = MyOwner.GetGrappleParams().HookValidRange.GetValue();
        InvalidRange = MyOwner.GetGrappleParams().HookInvalidRange;
        GrappleStart = MyOwner.Location;
        GrappleDist = VSize(GrapplePoint - GrappleStart);
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    simulated function Update()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Rot;

        Rot = Rotation;
        Rot.Yaw = Rot.Yaw + 2000;
        SetRotation(Rot);
        // End:0xF7
        if(VSizeSq(Location - GrappleStart) >= Square(GrappleDist))
        {
            Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            SetPhysics(6);
            SetLocation(GrapplePoint);
            // End:0xE9
            if(MyOwner.GrappleActor != none)
            {
                GotoState('Grappling');                
            }
            else
            {
                GotoState('Retracting');
            }
        }
        //return;        
    }
Begin:

    Sleep(0.2500000);
    // End:0xAC
    if(MyOwner != none)
    {
        // End:0x8C
        if(!MyOwner.Mesh.GetSocketWorldLocationAndRotation('Grapple', GrappleStart))
        {
            GrappleStart = MyOwner.Location;
        }
        GrappleDist = VSize(GrapplePoint - GrappleStart);
    }
    SetLocation(GrappleStart);
    SetRotation(Owner.Rotation);
    Velocity = Normal(GrapplePoint - GrappleStart);
    Velocity = Velocity * Speed;
    // End:0x19C
    if(MyOwner.GrappleActor != none)
    {
        SetPhysics(2);
        Velocity.Z -= (((GetGravityZ()) * 1.8000000) * (VSize(GrapplePoint - GrappleStart) / Speed));        
    }
    else
    {
        SetPhysics(6);
    }
    SetHidden(false);
    // End:0x20C
    if(IsGrappleActorMagnetic())
    {
        SoundComponentLoop = TuneDataPartsSoundEventBindings.PlayEventSoundLocallyEx('HookTravelMagnetic', 'None', MyOwner, none, none, SoundComponentLoop);        
    }
    else
    {
        SoundComponentLoop = TuneDataPartsSoundEventBindings.PlayEventSoundLocallyEx('HookTravel', 'None', MyOwner, none, none, SoundComponentLoop);
    }
    stop;                
}

simulated state Retracting
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        MyOwner.StopGrappling();
        // End:0x60
        if(SoundComponentLoop != none)
        {
            SoundComponentLoop.Stop();
        }
        // End:0xAD
        if(IsGrappleActorMagnetic())
        {
            TuneDataPartsSoundEventBindings.PlayEventSoundLocally('HookReleaseMagnetic', 'None', MyOwner, none, none);            
        }
        else
        {
            TuneDataPartsSoundEventBindings.PlayEventSoundLocally('HookRelease', 'None', MyOwner, none, none);
        }
        MyOwner.GrappleActor = none;
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    simulated function Update()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Rot;

        Rot = Rotation;
        Rot.Yaw = Rot.Yaw + 1000;
        SetRotation(Rot);
        Velocity = Normal(GrappleStart - Location);
        Velocity = Velocity * Speed;
        // End:0xE9
        if(VSizeSq(Location - MyOwner.Location) < Square(150.0000000))
        {
            GotoState('Idle');
        }
        //return;        
    }
    stop;    
}

simulated state Grappling
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        SetPhysics(6);
        SetLocation(GrapplePoint);
        // End:0xC1
        if(IsGrappleActorMagnetic())
        {
            TuneDataPartsFXEventBindings.PlayEventFXAtLoc('HookHitMagnetic', Location, rot(0, 0, 1), self, none, none);
            TuneDataPartsSoundEventBindings.PlayEventSoundLocally('HookGrabMagnetic', 'None', self, none, none);            
        }
        else
        {
            TuneDataPartsFXEventBindings.PlayEventFXAtLoc('HookHit', Location, rot(0, 0, 1), self, none, none);
            TuneDataPartsSoundEventBindings.PlayEventSoundLocally('HookGrab', 'None', self, none, none);
        }
        MyOwner.OnGrappleHookConnected();
        ReleaseTimer = 3.0000000;
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    simulated function Update()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        ReleaseTimer -= DeltaTime;
        // End:0x33
        if(ReleaseTimer <= float(0))
        {
            GotoState('Idle');
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: LPWinchCable'Default__LPGrapplingHook.GrappleCableObject'
    begin object name=GrappleCableObject class=Class'LPWinchCable'
    end object
    GrappleCable=GrappleCableObject
    // Reference: SkeletalMeshComponent'Default__LPGrapplingHook.GrappleAttachmentMesh0'
    begin object name=GrappleAttachmentMesh0 class=Class'Engine.SkeletalMeshComponent'
    end object
    GrappleAttachmentMesh=GrappleAttachmentMesh0
    // Reference: StaticMeshComponent'Default__LPGrapplingHook.HookMeshComp'
    begin object name=HookMeshComp class=Class'Engine.StaticMeshComponent'
    end object
    Components[0]=HookMeshComp
    TickGroup=ETickingGroup.TG_PostAsyncWork
    bHidden=false
}