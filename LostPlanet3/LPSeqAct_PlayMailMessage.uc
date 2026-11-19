class LPSeqAct_PlayMailMessage extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83000000-0x00000400*/ private editfixedsize @NULL QuestObject[589825];

defaultproperties
{
    // Reference: LPQuestObjectSelector'Default__LPSeqAct_PlayMailMessage.QuestEntryA'
    begin object name=QuestEntryA class=Class'LPQuestObjectSelector'
    end object
    QuestObject=QuestEntryA
    bAutoActivateOutputLinks=false
    OutputLinks[0]=(Links=none,LinkDesc="Successful",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Failed",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    ObjName="Play Mail Message"
}