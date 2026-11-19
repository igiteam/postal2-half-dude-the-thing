class LPSeqEvent_VitalSuitLaRocheCriticalDialog extends SequenceEvent
    forcescriptorder(true)
    hidecategories(Object);

enum eLaRocheCriticalDialogType
{
    LaRocheCriticalDialogType_GenericDialogStart,// 0
    LaRocheCriticalDialogType_GenericDialogEnd,// 1
    LaRocheCriticalDialogType_BackOffSawGenDestroyedAndTaserStartUp,// 2
    LaRocheCriticalDialogType_BackOffSawGenDestroyedAndEnergyShield,// 3
    LaRocheCriticalDialogType_BackOffTaserGenDestroyedAndEnergyShield,// 4
    LaRocheCriticalDialogType_BackOffJustTaserGenDestroyed,// 5
    LaRocheCriticalDialogType_BackOffHipDestroyedAndStartBackUpSawGen,// 6
    LaRocheCriticalDialogType_BackOffAfterSuccessfullyTaseringJimStarted,// 7
    LaRocheCriticalDialogType_BackOffAfterSuccessfullyTaseringJimEnded,// 8
    LaRocheCriticalDialogType_MAX   // 9
};

defaultproperties
{
    OutputLinks[0]=(Links=none,LinkDesc="Generic Dialog Start",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Generic Dialog End",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="BackOff Saw Gen Destroyed And Taser Start Up",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[3]=(Links=none,LinkDesc="BackOff Saw Gen Destroyed And Energy Shield",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[4]=(Links=none,LinkDesc="BackOff Taser Gen Destroyed And Energy Shield",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[5]=(Links=none,LinkDesc="BackOff Just Taser Gen Destroyed",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[6]=(Links=none,LinkDesc="BackOff Hip Destroyed And Start BackUp Saw Gen",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Vital Suit LaRoche Critical Dialog (LP)"
}