class Volume extends Brush
    nativereplication
    notplaceable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(*) /*0x35EA0000-0x00000000*/ private @NULL AssociatedActor;
var(*) /*0x501C0000-0x00000000*/ private bool bForcePawnWalk[65537];
var(*) /*0x501C0000-0x00000000*/ private bool bProcessAllActors[65537];
var(*) /*0x136C0000-0x00000000*/ private bool bPawnsOnly[65537];

// Export UVolume::execEncompasses(FFrame&, void* const)
native function Encompasses()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UVolume::execEncompassesPoint(FFrame&, void* const)
native function EncompassesPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Loc[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x34
    if(AssociatedActor != none)
    {
        GotoState('AssociatedTouch');
        InitialState = GetStateName();
    }
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_YL[25165825], out_YPos;

    super(Actor).DisplayDebug(HUD, out_YL, out_YPos);
    HUD.Canvas.DrawText("AssociatedActor " $ string(AssociatedActor), false);
    out_YPos += out_YL;
    HUD.Canvas.SetPos(4.0000000, out_YPos);
    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x58
    if(Action.InputLinks[0].bHasImpulse)
    {
        // End:0x55
        if(!bCollideActors)
        {
            SetCollision(true, bBlockActors);
        }        
    }
    else
    {
        // End:0xAE
        if(Action.InputLinks[1].bHasImpulse)
        {
            // End:0xAB
            if(bCollideActors)
            {
                SetCollision(false, bBlockActors);
            }            
        }
        else
        {
            // End:0x100
            if(Action.InputLinks[2].bHasImpulse)
            {
                SetCollision(!bCollideActors, bBlockActors);
            }
        }
    }
    CollisionComponent.SetActorCollision(bCollideActors, CollisionComponent.BlockActors);
    ForceNetRelevant();
    SetForcedInitialReplicatedProperty(BoolProperty'Actor.bCollideActors', bCollideActors == default.bCollideActors);
    //return;    
}

simulated event CollisionChanged()
{
    CollisionComponent.SetBlockRigidBody(bCollideActors && bBlockActors);
    //return;    
}

event ProcessActorSetVolume()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

state AssociatedTouch
{
    event @NULL Touch()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

        AssociatedActor.Touch(Other, OtherComp, HitLocation, HitNormal);
        //return;        
    }

    event UnTouch()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

        AssociatedActor.UnTouch(Other);
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x35EA0000-0x00000000*/ private @NULL A;

        // End:0x58
        foreach TouchingActors(Class'Actor', A)
        {
            Touch(A, none, A.Location, vect(0.0000000, 0.0000000, 1.0000000));            
        }        
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: BrushComponent'Default__Volume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bSkipActorPropertyReplication=true
    bCollideActors=true
    CollisionComponent=BrushComponent0
}