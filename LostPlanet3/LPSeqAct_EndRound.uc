class LPSeqAct_EndRound extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

enum eForceTeamWinnerRole
{
    eForceTeamWinnerRole_DoNotForce,// 0
    eForceTeamWinnerRole_Attackers, // 1
    eForceTeamWinnerRole_Defenders, // 2
    eForceTeamWinnerRole_MAX        // 3
};

enum eForceTeamWinner
{
    eForceTeamWinner_DoNotForce,    // 0
    eForceTeamWinner_Nevec,         // 1
    eForceTeamWinner_SnowPirates,   // 2
    eForceTeamWinner_Akrid,         // 3
    eForceTeamWinner_Neutral,       // 4
    eForceTeamWinner_MAX            // 5
};

var(0.25_Pct) /*0x516C0000-0x00000000*/ private byte Reason[65537];
var(0.25_Pct) /*0x516C0000-0x00000000*/ private byte WinCondition[65537];
var(0.25_Pct) /*0x516C0000-0x00000000*/ private byte ForceTeamWinnerByRole[65537];
var(0.25_Pct) /*0x516C0000-0x00000000*/ private byte ForceTeamWinner[65537];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private bool bNetworkGame;
    local /*0x97E50000-0x00000000*/ private @NULL LPGRI, TI, WI;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Winner, LPC;

    WI = GetWorldInfo();
    bNetworkGame = int(WI.NetMode) != int(NM_Standalone);
    // End:0x56
    if(!bNetworkGame)
    {
        return;
    }
    // End:0x81
    if(int(WI.Role) != int(ROLE_Authority))
    {
        return;
    }
    LPGRI = LPGRI_Base_MP(WI.GRI);
    // End:0xC3
    if(LPGRI == none)
    {
        return;
    }
    // End:0x120
    if(WI.Game != none)
    {
        // End:0x120
        if(WI.Game.bGameEnded)
        {
            return;
        }
    }
    // End:0x5B4
    if(InputLinks[0].bHasImpulse)
    {
        // End:0x2C8
        if(int(ForceTeamWinnerByRole) != int(0))
        {
            I = 0;
            J0x161:

            // End:0x2C5 [Loop If]
            if((I < WI.GRI.Teams.Length) && Winner == none)
            {
                TI = LPTeamInfo_MP(WI.GRI.Teams[I]);
                // End:0x216
                if(TI == none)
                {                    
                }
                else
                {
                    // End:0x2B7
                    if(TI.bAttackingTeam == (int(ForceTeamWinnerByRole) == int(1)))
                    {
                        Winner = Class'LPGameMP_Base'.static.FindPRIFromTeam(int(TI.GetTeamNum()));
                        // End:0x2B7
                        if(Winner == none)
                        {
                            Winner = TI;
                        }
                    }
                }
                ++I;
                // [Loop Continue]
                goto J0x161;
            }            
        }
        else
        {
            // End:0x4A0
            if(int(ForceTeamWinner) != int(0))
            {
                switch(ForceTeamWinner)
                {
                    // End:0x33F
                    case 1:
                        TI = LPTeamInfo_MP(WI.GRI.Teams[0]);
                        // End:0x434
                        break;
                    // End:0x38F
                    case 2:
                        TI = LPTeamInfo_MP(WI.GRI.Teams[1]);
                        // End:0x434
                        break;
                    // End:0x3E0
                    case 3:
                        TI = LPTeamInfo_MP(WI.GRI.Teams[2]);
                        // End:0x434
                        break;
                    // End:0x431
                    case 4:
                        TI = LPTeamInfo_MP(WI.GRI.Teams[3]);
                        // End:0x434
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
                Winner = Class'LPGameMP_Base'.static.FindPRIFromTeam(int(TI.GetTeamNum()));
                // End:0x4A0
                if(Winner == none)
                {
                    Winner = TI;
                }
            }
        }
        LPGRI.Winner = Winner;
        LPGameMP_Base(WI.Game).UpdateRoundsWon(Winner);
        // End:0x582
        foreach Class'Engine.WorldInfo'.static.GetWorldInfo().AllControllers(Class'LPPlayerController', LPC)
        {
            LPC.ClientSetWinner(Winner);            
        }        
        LPGRI.EndRound(Reason, WinCondition);
    }
    OutputLinks[0].bHasImpulse = true;
    //return;    
}

defaultproperties
{
    VariableLinks=none
    ObjName="MP End Round (LP)"
}