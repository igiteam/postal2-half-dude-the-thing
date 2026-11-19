class LPSoldierGrapplingHook extends Inventory
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL GrappleCable[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL GrappleAttachmentMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyOwner;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrapplePoint;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Speed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrappleStart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GrappleDist;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponentLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataPartsSoundEventBindings;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataPartsFXEventBindings;

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(Actor).Tick(DeltaTime);
    Update(DeltaTime);
    //return;    
}

simulated function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

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
    GrappleCable.Init(self, 7, 2000.0000000 * 2.0000000, GetCableEndpoints);
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

simulated function DisableWinchCable()
{
    GrappleCable.DisableSpline();
    //return;    
}

simulated function SetGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Point[8388609];

    GrapplePoint = Point;
    //return;    
}

auto simulated state Idle
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x6B
        if(Owner != none)
        {
            SetLocation(Owner.Location);
            SetRotation(Owner.Rotation);
        }
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        SetPhysics(6);
        // End:0xBF
        if(SoundComponentLoop != none)
        {
            SoundComponentLoop.FadeOut(0.1000000, 0.0000000);
        }
        GrappleCable.SetActive(false);
        SetHidden(true);
        SetTimer(0.1000000, false, 'DisableWinchCable');
        SetCollision(false, false);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        GrappleCable.SetActive(true);
        ClearTimer('DisableWinchCable');
        //return;        
    }

    simulated function Update()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        // End:0x58
        if((MyOwner == none) && Owner != none)
        {
            SetupCable(LPPawn(Owner));
            AttachMeshToPlayerArm(LPPawn(Owner));
        }
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
Begin:

    // End:0xA4
    if(MyOwner != none)
    {
        // End:0x84
        if(!MyOwner.Mesh.GetSocketWorldLocationAndRotation('Grapple', GrappleStart))
        {
            GrappleStart = MyOwner.Location;
        }
        GrappleDist = VSize(GrapplePoint - GrappleStart);
    }
    SetLocation(GrappleStart);
    SetRotation(Owner.Rotation);
    Velocity = Normal(GrapplePoint - GrappleStart) * Speed;
    SetPhysics(6);
    SetHidden(false);
    SoundComponentLoop = TuneDataPartsSoundEventBindings.PlayEventSoundLocallyEx('HookTravel', 'None', MyOwner, none, none, SoundComponentLoop);
    stop;                    
}

simulated state Retracting
{
    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x41
        if(SoundComponentLoop != none)
        {
            SoundComponentLoop.Stop();
        }
        TuneDataPartsSoundEventBindings.PlayEventSoundLocally('HookRelease', 'None', MyOwner, none, none);
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
        Velocity = Normal(MyOwner.Location - Location) * Speed;
        // End:0xEB
        if(VSizeSq(Location - MyOwner.Location) < Square(150.0000000))
        {
            GotoState('Idle');
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
        TuneDataPartsFXEventBindings.PlayEventFXAtLoc('HookHit', Location, rot(0, 0, 1), self, none, none);
        TuneDataPartsSoundEventBindings.PlayEventSoundLocally('HookGrab', 'None', self, none, none);
        //return;        
    }

    simulated function Update()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        // End:0x72
        if(((MyOwner == none) || MyOwner.Health < 1) || !MyOwner.IsDoingSpecialMove_OF_Class(Class'SPAIKynapse.SPKySM_AnimatedPath'))
        {
            GotoState('Retracting');
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: LPWinchCable'Default__LPSoldierGrapplingHook.GrappleCableObject'
    begin object name=GrappleCableObject class=Class'LPWinchCable'
    end object
    GrappleCable=GrappleCableObject
    // Reference: SkeletalMeshComponent'Default__LPSoldierGrapplingHook.GrappleAttachmentMesh0'
    begin object name=GrappleAttachmentMesh0 class=Class'Engine.SkeletalMeshComponent'
    end object
    GrappleAttachmentMesh=GrappleAttachmentMesh0
    Speed=2000.0000000
    Components[0]=none
    // Reference: StaticMeshComponent'Default__LPSoldierGrapplingHook.HookMeshComp'
    begin object name=HookMeshComp class=Class'Engine.StaticMeshComponent'
    end object
    Components[1]=HookMeshComp
    TickGroup=ETickingGroup.TG_PostAsyncWork
    bHidden=false
}