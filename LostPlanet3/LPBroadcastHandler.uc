class LPBroadcastHandler extends SPBroadcastHandler
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

function BroadcastHUDMessage()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageBodyPrefix[142606337], MessageBodyPostfix, ObjectiveName;
    local /*0x97E50000-0x00000000*/ private @NULL PRI1[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPC;
    local /*0x97E50000-0x00000000*/ private int AttackingTeamIndex;
    local /*0x97E50000-0x00000000*/ private @NULL GRI, TI;

    GRI = LPGRI_Base_MP(WorldInfo.GRI);
    // End:0xCE
    if(GRI.Teams.Length > 0)
    {
        TI = LPTeamInfo_MP(GRI.Teams[0]);
        AttackingTeamIndex = ((TI == none) ? 0 : ((TI.bAttackingTeam) ? 0 : 1));        
    }
    else
    {
        AttackingTeamIndex = 0;
    }
    // End:0x1A3
    foreach WorldInfo.AllControllers(Class'LPPlayerController', LPC)
    {
        // End:0x1A2
        if((TeamIndex < 0) || TeamIndex == int(LPC.GetTeamNum()))
        {
            LPC.ClientReceiveBroadcastHUDMessage(AttackingTeamIndex, MessageBodyPrefix, MessageBodyPostfix, ObjectiveName, PRI1, fDisplayTime);
        }        
    }    
    //return;    
}

function BroadcastObjectiveMessage()
{
    local /*0x97E50000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventName[142606337], ObjectiveName;
    local /*0x97E50000-0x00000000*/ private int ObjectiveType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPrimary[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI1[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPC, GRI;

    GRI = LPGRI_Base_MP(Class'Engine.WorldInfo'.static.GetWorldInfo().GRI);
    // End:0x1E8
    if(GRI != none)
    {
        // End:0x1E8
        if(bPrimary)
        {
            GRI.bObjectiveActive = true;
            GRI.ActiveMPObjective.EventName = EventName;
            GRI.ActiveMPObjective.ObjectiveName = ObjectiveName;
            GRI.ActiveMPObjective.ObjectiveType = ObjectiveType;
            GRI.ActiveMPObjective.InstigatorName = PRI1.PlayerName;
            GRI.ActiveMPObjective.InstigatorTeamNum = int(PRI1.GetTeamNum());
            fDisplayTime = -1.0000000;
        }
    }
    // End:0x2B3
    foreach WorldInfo.AllControllers(Class'LPPlayerController', LPC)
    {
        // End:0x2B2
        if((TeamIndex < 0) || TeamIndex == int(LPC.GetTeamNum()))
        {
            LPC.ClientReceiveBroadcastObjectiveMessage(EventName, ObjectiveName, ObjectiveType, bPrimary, PRI1, fDisplayTime);
        }        
    }    
    //return;    
}
