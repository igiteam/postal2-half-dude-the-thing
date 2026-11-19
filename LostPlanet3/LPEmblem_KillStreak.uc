class LPEmblem_KillStreak extends LPEmblem_Aggression;

function OnStatModified()
{
    local /*0x97E50000-0x00000000*/ private @NULL Stat[8388609];
    local /*0x97E50000-0x00000000*/ private int ChangedVal[8388609];
    local /*0x97E50000-0x00000000*/ private byte ModType[8388609];
    local /*0x97E50000-0x00000000*/ private int PrevVal, CurVal, TestVal, RequiredCount;

    // End:0xDF
    if(int(ModType) == int(0))
    {
        CurVal = Stat.Evaluate(0);
        PrevVal = CurVal - ChangedVal;
        // End:0xDF
        if(ChangedVal > 0)
        {
            RequiredCount = Max(GetRequiredCount(), 1);
            TestVal = PrevVal + 1;
            J0x99:

            // End:0xDF [Loop If]
            if(TestVal <= CurVal)
            {
                // End:0xD1
                if(TestVal == RequiredCount)
                {
                    GiveAward();
                }
                TestVal++;
                // [Loop Continue]
                goto J0x99;
            }
        }
    }
    //return;    
}
