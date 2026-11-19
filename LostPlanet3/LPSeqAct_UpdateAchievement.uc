class LPSeqAct_UpdateAchievement extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x83760000-0x00000000*/ private name AchievementName[65537];
var(0.25_Pct) /*0x83760000-0x00000000*/ private int IncrementAmount[65537];
var(0.25_Pct) /*0x26450000-0x00000000*/ private bool bCheckMinDifficulty[65537];
var(0.25_Pct) /*0x26450000-0x00000000*/ private byte LowestMinDifficultyToAllow[65537];

event GetAchievementNames()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array AchievementNames[25165825];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Info;

    Info = Class'LPAchievementManager'.default.AchievementInfos;
    I = 0;
    J0x33:

    // End:0x8C [Loop If]
    if(I < Info.Length)
    {
        AchievementNames.AddItem(Info[I].AchievementName);        
        I++;
        // [Loop Continue]
        goto J0x33;
    }
    //return;    
}

defaultproperties
{
    IncrementAmount=1
    ObjName="Update Achievement (LP)"
}