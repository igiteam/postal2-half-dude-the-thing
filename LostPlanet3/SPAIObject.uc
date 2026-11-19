class SPAIObject extends Object
    abstract
    hidecategories(Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL OuterActor;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float OuterActorRadius;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float OuterActorHeight;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bDestroyed;

// Export USPAIObject::execGetOuterActor(FFrame&, void* const)
native final function GetOuterActor()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIObject::execMarkForKill(FFrame&, void* const)
private native final function MarkForKill();

// Export USPAIObject::execGetMyActor(FFrame&, void* const)
protected native final function GetMyActor()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPAIObject::execIsDestroyed(FFrame&, void* const)
native function IsDestroyed()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIObject::execDestroy(FFrame&, void* const)
native function Destroy();

function Init()
{
    OuterActor = GetMyActor();
    SetSize();
    //return;    
}

function SetFromTuneData()
{
    //return;    
}

function BeginPlay()
{
    //return;    
}

function GetOuterActorRadius()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return OuterActorRadius;
    //return ReturnValue;    
}

function GetOuterActorHeight()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return OuterActorHeight;
    //return ReturnValue;    
}

private final function SetSize()
{
    OuterActorRadius = 0.0000000;
    OuterActorHeight = 0.0000000;
    // End:0xC5
    if(Pawn(OuterActor) != none)
    {
        OuterActorRadius = Pawn(OuterActor).CylinderComponent.CollisionRadius;
        OuterActorHeight = Pawn(OuterActor).CylinderComponent.CollisionHeight;        
    }
    else
    {
        // End:0x105
        if(OuterActor != none)
        {
            OuterActor.GetBoundingCylinder(OuterActorRadius, OuterActorHeight);
        }
    }
    //return;    
}

function NotifyPlayersOnly()
{
    //return;    
}
