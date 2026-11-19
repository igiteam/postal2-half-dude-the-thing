class LPTuneDataStrugglePhaseDefault extends LPTuneDataStrugglePhaseAnim
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0xA2530000-0x00000000*/ private name NextPhaseName[65537];
var(0.25_Pct) /*0x49590000-0x00000000*/ private name DodgeLeftPhaseName[65537];
var(0.25_Pct) /*0x49590000-0x00000000*/ private name DodgeRightPhaseName[65537];
var(0.25_Pct) /*0x49590000-0x00000000*/ private bool UseEvadeButtonToDodge[65537];
var(0.25_Pct) /*0x49590000-0x00000000*/ private bool DodgeOnStickPressedEvent[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private bool StartDodgePhaseFromCurrentTime[65537];
var(0.25_Pct) /*0x49590000-0x00000000*/ private float SlomoDodgeAmount[65537];
var(0.25_Pct) /*0x49590000-0x00000000*/ private float SlomoDodgeTime[65537];
var(0.25_Pct) /*0x035B0000-0x00000000*/ private float DodgeRawJoyRight[65537];

defaultproperties
{
    StartDodgePhaseFromCurrentTime=true
    SlomoDodgeTime=1.0000000
    DodgeRawJoyRight=0.2500000
    GameClass=Class'LPSP_StruggleDefault'
}