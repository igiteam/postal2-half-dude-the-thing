class Sequence extends SequenceOp
    hidecategories(Object);

struct native ActivateOp
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ActivatorOp;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Op;
    var(*) /*0x35EA0000-0x00000000*/ private int InputIdx;
    var(*) /*0x35EA0000-0x00000000*/ private float RemainingDelay;

    structdefaultproperties
    {
        ActivatorOp=none
        Op=none
        InputIdx=0
        RemainingDelay=0.0000000
    }
};

struct native QueuedActivationInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ActivatedEvent;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL InOriginator;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL InInstigator;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ActivateIndices;
    var(*) /*0x35EA0000-0x00000000*/ private bool bPushTop;

    structdefaultproperties
    {
        ActivatedEvent=none
        InOriginator=none
        InInstigator=none
        ActivateIndices=none
        bPushTop=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL LogFile[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SequenceObjects[655361];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ActiveSequenceOps[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array NestedSequences[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array UnregisteredEvents[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DelayedActivatedOps[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DelayedLatentOps[131073];
var(*) /*0x44880000-0x00000000*/ private bool bEnabled[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array QueuedActivations;
var(*) /*0x35EA0000-0x00000000*/ private int DefaultViewX;
var(*) /*0x35EA0000-0x00000000*/ private int DefaultViewY;
var(*) /*0x35EA0000-0x00000000*/ private float DefaultViewZoom;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DeferredCleanUpEvents;

// Export USequence::execFindSeqObjectsByClass(FFrame&, void* const)
native final function FindSeqObjectsByClass()
{
    local /*0x35EA0000-0x00000000*/ private class DesiredClass[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bRecursive[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array OutputObjects[25165825];


}

// Export USequence::execFindSeqObjectsByName(FFrame&, void* const)
native final function FindSeqObjectsByName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string SeqObjName[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bCheckComment[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array OutputObjects[25165825];
    local /*0x35EA0000-0x00000000*/ private bool bRecursive[9437185], bUseFullLevelName;

    true
    false                            
}

function Reset()
{
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL Op;

    I = 0;
    J0x0B:

    // End:0x85 [Loop If]
    if(I < SequenceObjects.Length)
    {
        Op = SequenceOp(SequenceObjects[I]);
        // End:0x77
        if(Op != none)
        {
            Op.Reset();
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function HardReset()
{
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL Op;

    I = 0;
    J0x0B:

    // End:0x85 [Loop If]
    if(I < SequenceObjects.Length)
    {
        Op = SequenceOp(SequenceObjects[I]);
        // End:0x77
        if(Op != none)
        {
            Op.HardReset();
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

// Export USequence::execSetEnabled(FFrame&, void* const)
native final function SetEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bInEnabled[8388609];


}

defaultproperties
{
    bEnabled=true
    DefaultViewZoom=1.0000000
    InputLinks=none
    OutputLinks=none
    ObjName="Sequence"
}