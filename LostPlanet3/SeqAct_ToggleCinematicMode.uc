class SeqAct_ToggleCinematicMode extends SequenceAction
    hidecategories(Object);

var(*) /*0x44460000-0x00000000*/ private bool bDisableMovement[65537];
var(*) /*0x44460000-0x00000000*/ private bool bDisableTurning[65537];
var(*) /*0x44460000-0x00000000*/ private bool bHidePlayer[65537];
var(*) /*0x44460000-0x00000000*/ private bool bDisableInput[65537];
var(*) /*0x44460000-0x00000000*/ private bool bHideHUD[65537];
var(*) /*0x44460000-0x00000000*/ private bool bDeadBodies[65537];
var(*) /*0x44460000-0x00000000*/ private bool bDroppedPickups[65537];

event Activated()
{
    local /*0x35EA0000-0x00000000*/ private @NULL A;

    // End:0x115
    if(!InputLinks[1].bHasImpulse && bDeadBodies || bDroppedPickups)
    {
        // End:0x114
        foreach GetWorldInfo().DynamicActors(Class'Actor', A)
        {
            // End:0x113
            if(((bDeadBodies && A.IsA('GamePawn')) && A.bTearOff) || bDroppedPickups && A.IsA('DroppedPickup'))
            {
                A.Destroy();
            }            
        }        
    }
    //return;    
}

defaultproperties
{
    bDisableMovement=true
    bDisableTurning=true
    bHidePlayer=true
    bDisableInput=true
    bHideHUD=true
    bDeadBodies=true
    bDroppedPickups=true
    InputLinks[0]=(LinkDesc="Enable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Disable",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[2]=(LinkDesc="Toggle",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Toggle Cinematic Mode"
}