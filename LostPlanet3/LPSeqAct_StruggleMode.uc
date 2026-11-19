class LPSeqAct_StruggleMode extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

enum EKismetStruggleMode
{
    KSM_ChangeSettings,             // 0
    KSM_DisableCameraCollision,     // 1
    KSM_EnableCameraCollision,      // 2
    KSM_MAX                         // 3
};

var(0.25_Pct) /*0x834D0000-0x00000000*/ private @NULL StruggleSettings[65537];

defaultproperties
{
    StruggleSettings=(TimeFactorPhaseButtonCanNotLose=1.0000000,TimeFactorPhaseAimTimeOut=1.0000000,TimeFactorPhaseAimMinTimeStabSuccess=1.0000000,DamageFactorPlayer=1.0000000,MinTimeBetweenAimingStartAndAimingSuccessKismetEvent=2.0000000)
    InputLinks[0]=(LinkDesc="Change Settings",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Disable Camera Collision",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[2]=(LinkDesc="Enable Camera Collision",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Struggle Mode"
}