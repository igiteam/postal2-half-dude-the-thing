class LPWaypointMarker extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

struct CheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisible;

    structdefaultproperties
    {
        bVisible=false
    }
};

var(0.25_Pct) /*0x8AF30000-0x00000000*/ private int MarkerIndex[65537];
var(0.25_Pct) /*0x8AF30000-0x00000000*/ private float FadeOutDistance[65537];
var(0.25_Pct) /*0x8AF30000-0x00000000*/ private bool bUseTouchCollision[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAutoConnect;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bIsDisplayed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsQuestActive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisible;
var(0.25_Pct) /*0x8AF30000-0x00000400*/ private const export @NULL CylinderComponent[720897];
var(0.25_Pct) /*0x8AF30000-0x00000400*/ private editfixedsize @NULL ObjectiveEntry[589825];

function GetFadeOutDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return FadeOutDistance;
    //return ReturnValue;    
}

function SetFadeOutDistance()
{
    local /*0x97E50000-0x00000000*/ private float NewFadeOutDistance[8388609];

    FadeOutDistance = NewFadeOutDistance;
    //return;    
}

function KismetShowWaypoint()
{
    //return;    
}

function KismetHideWaypoint()
{
    //return;    
}

function KismetToggleWaypoint()
{
    //return;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x44
    if(Action.InputLinks[0].bHasImpulse)
    {
        KismetShowWaypoint();        
    }
    else
    {
        // End:0x88
        if(Action.InputLinks[1].bHasImpulse)
        {
            KismetHideWaypoint();            
        }
        else
        {
            // End:0xCD
            if(Action.InputLinks[2].bHasImpulse)
            {
                KismetToggleWaypoint();                
            }
        }
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    //return;    
}

function SetQuestActive()
{
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive[8388609];

    // End:0x2E
    if(bIsQuestActive != bShouldBeActive)
    {
        bIsQuestActive = bShouldBeActive;
    }
    //return;    
}

function ShouldSaveForCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bVisible;
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25165825];

    Record.bVisible = bVisible;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private @NULL Record[25296897];

    bVisible = Record.bVisible;
    // End:0x4B
    if(bVisible)
    {
        SetTimer(0.5000000, true, 'TimerKismetShowWaypoint');        
    }
    else
    {
        SetTimer(0.5000000, true, 'TimerKismetHideWaypoint');
    }
    //return;    
}

function TimerKismetShowWaypoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x61
    foreach LocalPlayerControllers(Class'LPPlayerController', LPPC)
    {
        // End:0x60
        if(LPPC.Pawn != none)
        {
            KismetShowWaypoint();
            SetTimer(0.0000000, false, 'TimerKismetShowWaypoint');
        }        
    }    
    //return;    
}

function TimerKismetHideWaypoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x61
    foreach LocalPlayerControllers(Class'LPPlayerController', LPPC)
    {
        // End:0x60
        if(LPPC.Pawn != none)
        {
            KismetHideWaypoint();
            SetTimer(0.0000000, false, 'TimerKismetHideWaypoint');
        }        
    }    
    //return;    
}

defaultproperties
{
    MarkerIndex=-1
    FadeOutDistance=1000.0000000
    bUseTouchCollision=true
    // Reference: LPQuestObjectSelector'Default__LPWaypointMarker.ObjectiveEntryA'
    begin object name=ObjectiveEntryA class=Class'LPQuestObjectSelector'
    end object
    ObjectiveEntry=ObjectiveEntryA
    Components[0]=none
    Components[1]=none
    bHidden=true
    bPushedByEncroachers=false
    bCanStepUpOn=false
    bAllowFluidSurfaceInteraction=false
    bCollideActors=true
}