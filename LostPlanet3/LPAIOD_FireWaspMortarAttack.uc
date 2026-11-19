class LPAIOD_FireWaspMortarAttack extends LPAIOD_MortarAttackBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x7A440000-0x00000000*/ private float MinHeightDelta[65537];
var(0.25_Pct) /*0x7A440000-0x00000000*/ private float MaxHeightDelta[65537];
var(0.25_Pct) /*0x7A440000-0x00000000*/ private float HeightErrorBuffer[65537];
var(0.25_Pct) /*0x7A440000-0x00000000*/ private bool bUseHeightInsteadOfPitchForEvaluations[65537];
var(0.25_Pct) /*0x7A440000-0x00000000*/ private float MaxPitchAllowedInDegrees[65537];
var(0.25_Pct) /*0x7A440000-0x00000000*/ private float MinPitchAllowedInDegrees[65537];
var(0.25_Pct) /*0x7A440000-0x00000000*/ private float PitchErrorBufferInDegrees[65537];

defaultproperties
{
    MinHeightDelta=100.0000000
    MaxHeightDelta=600.0000000
    HeightErrorBuffer=50.0000000
    bUseHeightInsteadOfPitchForEvaluations=true
    MaxPitchAllowedInDegrees=30.0000000
    MinPitchAllowedInDegrees=10.0000000
    PitchErrorBufferInDegrees=5.0000000
    MinLobStrikesBetweenDamageAssessments=4
    MaxLobStrikesBetweenDamageAssessments=7
    MinDurationOfDamageAssessmentInSecs=1.0000000
    MaxDurationOfDamageAssessmentInSecs=1.0000000
    GeneratedObjectiveClass=Class'LPAIObjectiveKismetAttackMortarFireWasp'
    AllowedControllerClasses=/* Array type was not detected. */
}