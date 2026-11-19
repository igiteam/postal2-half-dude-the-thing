class LPSeqEvent_ObjectiveReachedDest extends LPSeqEvent_ObjectiveBase
    hidecategories(Object);

defaultproperties
{
    EventString="ReachedDest"
    AnnouncementName=eAnnouncementEventName.AEN_ObjectiveReachedDest
    OutputLinks[0]=(Links=none,LinkDesc="NEVEC",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Pirates",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Objective Reached Destination (LP)"
}