class LevelStreamingVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display,Advanced,Attachment,Collision,Volume);

enum EStreamingVolumeUsage
{
    SVB_Loading,                    // 0
    SVB_LoadingAndVisibility,       // 1
    SVB_VisibilityBlockingOnLoad,   // 2
    SVB_BlockingOnLoad,             // 3
    SVB_LoadingNotVisible,          // 4
    SVB_MAX                         // 5
};

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bDisabled;

    structdefaultproperties
    {
        bDisabled=false
    }
};

var(*) /*0x2E800000-0x00000100*/ private const editfixedsize array StreamingLevels[196609];
var(*) /*0x2E800000-0x00000000*/ private bool bEditorPreVisOnly[65537];
var(*) /*0x2E800000-0x00000000*/ private bool bDisabled[65537];
var(*) /*0x2E800000-0x00000000*/ private bool bTestDistanceToVolume[65537];
var(*) /*0x2E800000-0x00000000*/ private byte StreamingUsage[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient byte Usage;
var(*) /*0x2E800000-0x00000000*/ private float TestVolumeDistance[65537];

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bDisabled = false;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bDisabled = true;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bDisabled = !bDisabled;
            }
        }
    }
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25165825];

    Record.bDisabled = bDisabled;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897];

    bDisabled = Record.bDisabled;
    //return;    
}

defaultproperties
{
    StreamingUsage=EStreamingVolumeUsage.SVB_LoadingAndVisibility
    BrushColor=(R=255,G=165,B=0,A=255)
    bColored=true
    // Reference: BrushComponent'Default__LevelStreamingVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bCollideActors=false
    bForceAllowKismetModification=true
    CollisionComponent=BrushComponent0
    SupportedEvents=/* Array type was not detected. */
}