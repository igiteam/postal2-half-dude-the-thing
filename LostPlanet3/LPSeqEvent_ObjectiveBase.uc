class LPSeqEvent_ObjectiveBase extends SequenceEvent
    abstract
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x68160000-0x00000000*/ private bool bSuppressHUDBroadcastMessage[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string EventString;
var(0.25_Pct) /*0x68160000-0x00000000*/ private float SpamBlockTime[65537];
var(0.25_Pct) /*0x68160000-0x00000000*/ private float DisplayTime[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastActivationTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte AnnouncementName;

function Reset()
{
    LastActivationTime = 0.0000000;
    super.Reset();
    //return;    
}

event @NULL Activated()
{
    local /*0x97E50000-0x00000400*/ private editfixedsize array Comps;
    local /*0x97E50000-0x00000400*/ private @NULL Comp, WI, SPGI, PRI1, LPC;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    SPGI = SPGameInfo(WI.Game);
    // End:0xA7
    if((((Originator == none) || bSuppressHUDBroadcastMessage) || WI == none) || SPGI == none)
    {
        super(SequenceOp).Activated();
        return;
    }
    // End:0xFD
    if(SpamBlockTime > 0.0000000)
    {
        // End:0xFD
        if((LastActivationTime + SpamBlockTime) >= WI.TimeSeconds)
        {
            super(SequenceOp).Activated();
            return;
        }
    }
    Originator.GetComponentsOfClass(Class'LPObjectiveComponentBase', Comps);
    // End:0x2A5
    if(Comps.Length > 0)
    {
        Comp = LPObjectiveComponentBase(Comps[0]);
        HandleAnnouncement(Comp);
        Comp.UpdateCurrentPrimaryEventString(EventString);
        LPC = GetController(Instigator);
        // End:0x1EB
        if(LPC != none)
        {
            PRI1 = LPC.PlayerReplicationInfo;
        }
        SPGI.BroadcastObjectiveMessage(-1, EventString, Comp.ObjectiveDescription.LocalizedTextMarkUp, int(Comp.ObjectiveType), Comp.IsPrimaryEvent(EventString), PRI1, DisplayTime);
    }
    LastActivationTime = WI.TimeSeconds;
    super(SequenceOp).Activated();
    //return;    
}

function @NULL HandleAnnouncement()
{
    local /*0x97E50000-0x00000400*/ private @NULL Comp[8388609];
    local /*0x97E50000-0x00000000*/ private int InstigatorTeam;

    // End:0xD0
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Client))
    {
        // End:0xD0
        if(int(AnnouncementName) != int(0))
        {
            InstigatorTeam = ((Instigator != none) ? int(Instigator.GetTeamNum()) : -1);
            Class'LPTuneDataMapInfoMP'.static.BroadcastAnnouncement(AnnouncementName,, InstigatorTeam, Comp);
        }
    }
    //return;    
}

defaultproperties
{
    DisplayTime=5.0000000
    MaxTriggerCount=0
    bPlayerOnly=false
}