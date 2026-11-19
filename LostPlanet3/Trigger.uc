class Trigger extends Actor
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Common);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bCollideActors;
    var(*) /*0x35EA0000-0x00000000*/ private bool bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private int NumInteractions;
    var(*) /*0x35EA0000-0x00000000*/ private int NumSuccessfulInteractions;

    structdefaultproperties
    {
        bCollideActors=false
        bEnabled=false
        NumInteractions=0
        NumSuccessfulInteractions=0
    }
};

var(*) /*0x4DC10000-0x00000400*/ private const export @NULL CylinderComponent[720897];
var(*) /*0x35EA0000-0x00000000*/ private bool bRecentlyTriggered;
var(*) /*0x4DC10000-0x00000000*/ private float AITriggerDelay[65537];

simulated event @NULL PostBeginPlay()
{
    local /*0x35EA0000-0x00000400*/ private @NULL ASpriteComp;

    // End:0x33
    foreach ComponentList(Class'SpriteComponent', ASpriteComp)
    {
        DetachComponent(ASpriteComp);        
    }    
    super.PostBeginPlay();
    //return;    
}

event @NULL Touch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x22
    if(FindEventsOfClass(Class'SeqEvent_Touch'))
    {
        NotifyTriggered();
    }
    //return;    
}

function NotifyTriggered()
{
    bRecentlyTriggered = true;
    SetTimer(AITriggerDelay, false, 'UnTrigger');
    //return;    
}

function UnTrigger()
{
    bRecentlyTriggered = false;
    //return;    
}

simulated function StopsProjectile()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bBlockActors;
    //return ReturnValue;    
}

function ShouldSaveForCheckpoint()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bStatic || bNoDelete;
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25165825];

    Record.bCollideActors = bCollideActors;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897];

    SetCollision(Record.bCollideActors, bBlockActors, bIgnoreEncroachers);
    ForceNetRelevant();
    //return;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__Trigger.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'CylinderComponent'
    end object
    CylinderComponent=CollisionCylinder
    AITriggerDelay=2.0000000
    // Reference: SpriteComponent'Default__Trigger.Sprite'
    begin object name=Sprite class=Class'SpriteComponent'
    end object
    Components[0]=Sprite
    Components[1]=CollisionCylinder
    bHidden=true
    bNoDelete=true
    bCollideActors=true
    bProjTarget=true
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}