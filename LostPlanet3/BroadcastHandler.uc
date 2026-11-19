class BroadcastHandler extends Info
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(*) /*0x35EA0000-0x00000000*/ private int SentText;
var(*) /*0x35EA0000-0x00000000*/ private bool bMuteSpectators[1073741825];

function UpdateSentText()
{
    SentText = 0;
    //return;    
}

function AllowsBroadcast()
{
    local /*0x35EA0000-0x00000000*/ private @NULL broadcaster[8388609];
    local /*0x35EA0000-0x00000000*/ private int InLen[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x6B
    if((bMuteSpectators && PlayerController(broadcaster) != none) && PlayerController(broadcaster).PlayerReplicationInfo.bOnlySpectator)
    {
        return false;
    }
    SentText += InLen;
    return (WorldInfo.Pauser != none) || SentText < 260;
    //return ReturnValue;    
}

function BroadcastText()
{
    local /*0x35EA0000-0x00000000*/ private @NULL SenderPRI[8388609], Receiver;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[142606337];
    local /*0x35EA0000-0x00000000*/ private name Type[9437185];

    Receiver.TeamMessage(SenderPRI, msg, Type);
    //return;    
}

function BroadcastLocalized()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[8388609], Receiver;
    local /*0x35EA0000-0x00000000*/ private class Message[8388609];
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;

    Receiver.ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    //return;    
}

function Broadcast()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[142606337];
    local /*0x35EA0000-0x00000000*/ private name Type[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL P, PRI;

    // End:0x26
    if(!AllowsBroadcast(Sender, Len(msg)))
    {
        return;
    }
    // End:0x72
    if(Pawn(Sender) != none)
    {
        PRI = Pawn(Sender).PlayerReplicationInfo;        
    }
    else
    {
        // End:0xBB
        if(Controller(Sender) != none)
        {
            PRI = Controller(Sender).PlayerReplicationInfo;
        }
    }
    // End:0x11E
    foreach WorldInfo.AllControllers(Class'PlayerController', P)
    {
        BroadcastText(PRI, P, msg, Type);        
    }    
    //return;    
}

function BroadcastTeam()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string msg[142606337];
    local /*0x35EA0000-0x00000000*/ private name Type[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL P;

    // End:0x26
    if(!AllowsBroadcast(Sender, Len(msg)))
    {
        return;
    }
    // End:0x109
    foreach WorldInfo.AllControllers(Class'PlayerController', P)
    {
        // End:0x108
        if(P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team)
        {
            BroadcastText(Sender.PlayerReplicationInfo, P, msg, Type);
        }        
    }    
    //return;    
}

event AllowBroadcastLocalized()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x35EA0000-0x00000000*/ private class Message[8388609];
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject, P;

    // End:0x82
    foreach WorldInfo.AllControllers(Class'PlayerController', P)
    {
        BroadcastLocalized(Sender, P, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);        
    }    
    //return;    
}

event AllowBroadcastLocalizedTeam()
{
    local /*0x35EA0000-0x00000000*/ private int TeamIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x35EA0000-0x00000000*/ private class Message[8388609];
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject, P;

    // End:0x139
    foreach WorldInfo.AllControllers(Class'PlayerController', P)
    {
        // End:0x138
        if(((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none) && P.PlayerReplicationInfo.Team.TeamIndex == TeamIndex)
        {
            BroadcastLocalized(Sender, P, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }        
    }    
    //return;    
}

defaultproperties
{
    TickGroup=ETickingGroup.TG_DuringAsyncWork
}