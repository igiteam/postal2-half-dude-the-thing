class LPObjectiveMarker extends LPBreadcrumb
    abstract
    hidecategories(AnimDependency,Navigation)
    implements(EditorLinkSelectionInterface);

var(0.25_Pct) /*0x97E50000-0x00000080*/ private @NULL VfTable_IEditorLinkSelectionInterface[268566529];
var(0.25_Pct) /*0x81480000-0x00000000*/ private bool bForceSuppressObjective[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDisplayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize transient @NULL ObjectiveEntry[524289];
var(0.25_Pct) /*0x81480000-0x00000400*/ private editfixedsize array ObjectiveEntries[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OnFootParticleSystem;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InVitalSuitParticleSystem;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ParticleSystemComponent[524289];

// Export ULPObjectiveMarker::execSetTemplate(FFrame&, void* const)
native final function SetTemplate()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewTemplate[8388609];


}

// Export ULPObjectiveMarker::execHasQuestObject(FFrame&, void* const)
native final function HasQuestObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL InQuestObject[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPObjectiveMarker::execIsAnyObjectiveActive(FFrame&, void* const)
native final function IsAnyObjectiveActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPObjectiveMarker::execTryToDisplay(FFrame&, void* const)
native final function TryToDisplay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];


}

// Export ULPObjectiveMarker::execSetDisplayType(FFrame&, void* const)
native final function SetDisplayType()
{
    local /*0x97E50000-0x00000000*/ private byte DisplayType[8388609];


}

// Export ULPObjectiveMarker::execSetDisplayState(FFrame&, void* const)
native final function SetDisplayState()
{
    local /*0x97E50000-0x00000000*/ private bool bShouldDisplay[8388609];


}

// Export ULPObjectiveMarker::execSetParticleState(FFrame&, void* const)
native final function SetParticleState()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];


}

event SetDisplayOnPath()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private float InDistance[9437185], InAlpha;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    1.0000000
    return false;
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    Record.bDisableDestination = bForceSuppressObjective;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    bForceSuppressObjective = Record.bDisableDestination;
    TryToDisplay(LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor));
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    SetParticleState(false);
    // End:0x25
    if(ObjectiveEntries.Length == 0)
    {
    }
    //return;    
}

function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bForceSuppressObjective = false;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bForceSuppressObjective = true;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bForceSuppressObjective = !bForceSuppressObjective;
            }
        }
    }
    TryToDisplay(LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor));
    //return;    
}

function IsAnyObjectiveTracked()
{
    local /*0x97E50000-0x00000000*/ private bool bHardTrackOnly[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL TrackedObjective;

    TrackedObjective = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager().GetObjectiveToTrack();
    // End:0x88
    if((TrackedObjective == none) || int(TrackedObjective.GetQuestStatus()) != int(3))
    {
        return !bHardTrackOnly;
    }
    return HasQuestObject(TrackedObjective);
    //return ReturnValue;    
}
