class LPTuneDataStrugglePhaseAim extends LPTuneDataStrugglePhaseAnim
    editinlinenew
    hidecategories(Object,Object);

struct AimArea
{
    var(0.25_Pct) /*0x03E70000-0x00000000*/ private name BoneName[65537];
    var(0.25_Pct) /*0x03E70000-0x00000000*/ private bool bNameIsActuallySocket[65537];
    var(0.25_Pct) /*0x03E70000-0x00000000*/ private float BoneDistance[65537];
    var(0.25_Pct) /*0x03E70000-0x00000000*/ private bool LoseAnimOnStab[65537];
    var(0.25_Pct) /*0x03E70000-0x00000000*/ private name LoseAnimBoneName[65537];
    var(0.25_Pct) /*0x03E70000-0x00000000*/ private name StabPhaseName[65537];
    var(0.25_Pct) /*0x03E70000-0x00000000*/ private bool bDontCheckAgainstTheVisualMesh[65537];

    structdefaultproperties
    {
        BoneName="None"
        bNameIsActuallySocket=false
        BoneDistance=0.0000000
        LoseAnimOnStab=false
        LoseAnimBoneName="None"
        StabPhaseName="None"
        bDontCheckAgainstTheVisualMesh=false
    }
};

var(0.25_Pct) /*0x03D90000-0x00000000*/ private float AimStruggleStrength[65537];
var(0.25_Pct) /*0x03D90000-0x00000000*/ private float DirChangeFrequency[65537];
var(0.25_Pct) /*0x03D90000-0x00000000*/ private float SubDirChangeFrequency[65537];
var(0.25_Pct) /*0x03D90000-0x00000000*/ private float MinAimReset[65537];
var(0.25_Pct) /*0x03D90000-0x00000000*/ private float MaxAimReset[65537];
var(0.25_Pct) /*0x03D90000-0x00000000*/ private float MinTimeStabIsGood[65537];
var(0.25_Pct) /*0x03D90000-0x00000000*/ private bool UseBothSticks[65537];
var(0.25_Pct) /*0x03D90000-0x00000000*/ private bool Shooting9PointAims[65537];
var(0.25_Pct) /*0x03D90000-0x00000000*/ private bool RandomizeAtStart[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private bool ResetNumHitsOnFail[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private bool PlayLastSingleHit[65537];
var(0.25_Pct) /*0x03E70000-0x00000000*/ private bool ShowRandomArea[65537];
var(0.25_Pct) /*0x03E70000-0x00000000*/ private bool ShowStabbedAreas[65537];
var(0.25_Pct) /*0x03D90000-0x00000000*/ private float DifficultyMultiplier[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private name SuccessPhaseName[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private name PerfectSuccessPhaseName[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private int NumHitsForFailing[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private name SingleHitFailedPhaseName[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private name failPhaseName[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private name TimeOutPhaseName[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private int NumHitsForSuccess[65537];
var(0.25_Pct) /*0xA2530000-0x00000000*/ private name SingleHitPhaseName[65537];
var(0.25_Pct) /*0x03E70000-0x00000000*/ private editfixedsize array AimAreas[65537];

defaultproperties
{
    AimStruggleStrength=0.5000000
    DirChangeFrequency=0.0150000
    SubDirChangeFrequency=0.5000000
    MinAimReset=0.4000000
    MaxAimReset=0.7000000
    MinTimeStabIsGood=0.2500000
    UseBothSticks=true
    RandomizeAtStart=true
    ResetNumHitsOnFail=true
    DifficultyMultiplier=1.0000000
    GameClass=Class'LPSP_StruggleAim'
}