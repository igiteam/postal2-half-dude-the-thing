class LPSeqAct_AdjustTutorialMessage extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x825E0000-0x00000000*/ private byte TutorialType[65537];
var(0.25_Pct) /*0x825E0000-0x00000000*/ private @NULL StopDisplayingTextAfterXSuccessfulTimes[65537];
var(0.25_Pct) /*0x825E0000-0x00000000*/ private @NULL StopUsingTimeDilationAfterXSuccessfulTimes[65537];
var(0.25_Pct) /*0x825E0000-0x00000000*/ private @NULL TimeDilation[65537];
var(0.25_Pct) /*0x825E0000-0x00000000*/ private editfixedsize string TutorialString[65537];

defaultproperties
{
    ObjName="Adjust Tutorial Message (LP)"
}