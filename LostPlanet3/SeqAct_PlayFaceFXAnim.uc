class SeqAct_PlayFaceFXAnim extends SequenceAction
    hidecategories(Object);

var(*) /*0x441A0000-0x00000000*/ private @NULL FaceFXAnimSetRef[65537];
var(*) /*0x441A0000-0x00000000*/ private editfixedsize string FaceFXGroupName[65537];
var(*) /*0x441A0000-0x00000000*/ private editfixedsize string FaceFXAnimName[65537];
var(*) /*0x441A0000-0x00000000*/ private @NULL SoundCueToPlay[65537];
var(*) /*0x441A0000-0x00000000*/ private @NULL AkEventToPlay[65537];

defaultproperties
{
    InputLinks[0]=(LinkDesc="Play",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Play FaceFX Anim"
}