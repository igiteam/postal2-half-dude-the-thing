class LPSeqAct_GetMatchParameters extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

enum EMatchParameterTypes
{
    MatchParameterType_Multiplayer, // 0
    MatchParameterType_MatchLength, // 1
    MatchParameterType_MatchTimePassed,// 2
    MatchParameterType_MatchTimeRemaining,// 3
    MatchParameterType_WinningTeam, // 4
    MatchParameterType_MAX          // 5
};

var(0.25_Pct) /*0x82B50000-0x00000000*/ private byte QueryType[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetAnswer;

event Activated()
{
    local /*0x97E50000-0x00000000*/ private bool bMultiplayer;
    local /*0x97E50000-0x00000000*/ private int TeamIndex, HighestScore, DrawCount, WinningTeamNumber;
    local /*0x97E50000-0x00000000*/ private @NULL MyGRI;

    // End:0x57
    if(VariableLinks[0].LinkedVariables.Length < 1)
    {
        TargetAnswer = 0.0000000;
        OutputLinks[0].bHasImpulse = true;
        return;
    }
    // End:0xC2
    if((GetWorldInfo().GRI != none) && GetWorldInfo().GRI.IsMultiplayerGame())
    {
        bMultiplayer = true;
    }
    MyGRI = GetWorldInfo().GRI;
    TargetAnswer = 0.0000000;
    switch(QueryType)
    {
        // End:0x132
        case 0:
            TargetAnswer = float(((bMultiplayer) ? 1 : 0));
            // End:0x405
            break;
        // End:0x175
        case 1:
            // End:0x172
            if(bMultiplayer)
            {
                TargetAnswer = float(MyGRI.TimeLimit * 60);
            }
            // End:0x405
            break;
        // End:0x1D8
        case 2:
            // End:0x1D5
            if(bMultiplayer)
            {
                TargetAnswer = float((MyGRI.TimeLimit * 60) - MyGRI.RemainingTime);
            }
            // End:0x405
            break;
        // End:0x217
        case 3:
            // End:0x214
            if(bMultiplayer)
            {
                TargetAnswer = float(MyGRI.RemainingTime);
            }
            // End:0x405
            break;
        // End:0x402
        case 4:
            // End:0x3FF
            if(bMultiplayer)
            {
                WinningTeamNumber = -1;
                HighestScore = -2147483648;
                DrawCount = 0;
                TeamIndex = 0;
                J0x25D:

                // End:0x39C [Loop If]
                if(TeamIndex < MyGRI.Teams.Length)
                {
                    // End:0x336
                    if(MyGRI.Teams[TeamIndex].Score > float(HighestScore))
                    {
                        HighestScore = int(MyGRI.Teams[TeamIndex].Score);
                        WinningTeamNumber = TeamIndex;                        
                    }
                    else
                    {
                        // End:0x38E
                        if(MyGRI.Teams[TeamIndex].Score == float(HighestScore))
                        {
                            ++DrawCount;
                        }
                    }
                    ++TeamIndex;
                    // [Loop Continue]
                    goto J0x25D;
                }
                // End:0x3EA
                if(WinningTeamNumber >= 0)
                {
                    // End:0x3EA
                    if(DrawCount == (MyGRI.Teams.Length - 1))
                    {
                        WinningTeamNumber = -1;
                    }
                }
                TargetAnswer = float(WinningTeamNumber);
            }
            // End:0x405
            break;
        // End:0xFFFF
        default:
            break;
    }
    OutputLinks[0].bHasImpulse = true;
    //return;    
}

defaultproperties
{
    QueryType=EMatchParameterTypes.MatchParameterType_MatchLength
    VariableLinks[0]=(ExpectedType=Class'Engine.SeqVar_Float',LinkedVariables=none,LinkDesc="Answer",LinkVar="None",PropertyName="TargetAnswer",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Match Parameters (LP)"
}