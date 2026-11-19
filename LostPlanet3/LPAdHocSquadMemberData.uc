class LPAdHocSquadMemberData extends Object;

enum eAdHocSquadStatus
{
    eAdHocSquadStatus_None,         // 0
    eAdHocSquadStatus_Leader,       // 1
    eAdHocSquadStatus_Follower,     // 2
    eAdHocSquadStatus_FollowerJoining,// 3
    eAdHocSquadStatus_FollowerLeaving,// 4
    eAdHocSquadStatus_MAX           // 5
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AiCtrlOwner[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentSquadIn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte MySquadStatus[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInGroupArea[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInFormation[536870913];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAiCtrlOwner[8388609];

    AiCtrlOwner = InAiCtrlOwner;
    CurrentSquadIn = none;
    MySquadStatus = 0;
    bInGroupArea = false;
    bInFormation = false;
    //return;    
}

function CleanForSquadRemoval()
{
    CurrentSquadIn = none;
    MySquadStatus = 0;
    bInGroupArea = false;
    bInFormation = false;
    //return;    
}
