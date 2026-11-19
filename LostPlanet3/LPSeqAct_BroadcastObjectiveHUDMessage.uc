class LPSeqAct_BroadcastObjectiveHUDMessage extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

enum EBroadcastTarget
{
    EBroadcastTarget_NEVEC,         // 0
    EBroadcastTarget_SnowPirates,   // 1
    EBroadcastTarget_Attackers,     // 2
    EBroadcastTarget_Defenders,     // 3
    EBroadcastTarget_ALL,           // 4
    EBroadcastTarget_MAX            // 5
};

var(0.25_Pct) /*0x16D50000-0x00000000*/ private byte WhoTo[65537];
var(0.25_Pct) /*0x16D50000-0x00000000*/ private float DisplayTime[65537];
var(0.25_Pct) /*0x16D50000-0x00000400*/ private editfixedsize @NULL MessageTitle[589825];
var(0.25_Pct) /*0x16D50000-0x00000400*/ private editfixedsize @NULL MessageText[589825];

event Activated()
{
    local /*0x97E50000-0x00000000*/ private @NULL WI, GI, MPGI;
    local /*0x97E50000-0x00000000*/ private int TeamIndex, AttackingIndex;
    local /*0x97E50000-0x00000000*/ private @NULL PC, PRI;

    // End:0x29
    if(Len(MessageText.LocalizedTextMarkUp) <= 0)
    {        
    }
    else
    {
        // End:0x3D
        if(DisplayTime <= float(0))
        {            
        }
        else
        {
            WI = GetWorldInfo();
            // End:0x63
            if(WI == none)
            {                
            }
            else
            {
                GI = SPGameInfo(WI.Game);
                // End:0xA6
                if(GI == none)
                {                    
                }
                else
                {
                    MPGI = LPGameMP_Base(WI.Game);
                    TeamIndex = -1;
                    AttackingIndex = (((MPGI == none) || MPGI.AttackingTeamIndex == 0) ? 0 : 1);
                    switch(WhoTo)
                    {
                        // End:0x14F
                        case 0:
                            TeamIndex = 0;
                            // End:0x1A5
                            break;
                        // End:0x162
                        case 1:
                            TeamIndex = 1;
                            // End:0x1A5
                            break;
                        // End:0x17D
                        case 2:
                            TeamIndex = AttackingIndex;
                            // End:0x1A5
                            break;
                        // End:0x1A2
                        case 3:
                            TeamIndex = ((AttackingIndex == 0) ? 1 : 0);
                            // End:0x1A5
                            break;
                        // End:0xFFFF
                        default:
                            break;
                    }
                    // End:0x214
                    if(Targets.Length > 0)
                    {
                        PC = GetController(Actor(Targets[0]));
                        // End:0x214
                        if(PC != none)
                        {
                            PRI = PC.PlayerReplicationInfo;
                        }
                    }
                    GI.BroadcastHUDMessage(TeamIndex, MessageText.LocalizedTextMarkUp, MessageTitle.LocalizedTextMarkUp, "", PRI, DisplayTime);
                }
            }
        }
    }
    super(SequenceOp).Activated();
    //return;    
}

defaultproperties
{
    WhoTo=EBroadcastTarget.EBroadcastTarget_ALL
    DisplayTime=5.0000000
    // Reference: LPLocTextSelector'Default__LPSeqAct_BroadcastObjectiveHUDMessage.TxtSelector1'
    begin object name=TxtSelector1 class=Class'LPLocTextSelector'
    end object
    MessageTitle=TxtSelector1
    // Reference: LPLocTextSelector'Default__LPSeqAct_BroadcastObjectiveHUDMessage.TxtSelector0'
    begin object name=TxtSelector0 class=Class'LPLocTextSelector'
    end object
    MessageText=TxtSelector0
    ObjName="Broadcast Objective HUD Message (LP)"
}