class LPSeqAct_PickUpAudioLog extends LPSeqAct_PickUpBase
    hidecategories(Object);

var(0.25_Pct) /*0x82F50000-0x00000000*/ private bool bAutoPlayMessage[65537];

function PickedUpItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], MailMessage, MailMessageDynamicData, ManualTriggerPrereq;

    super.PickedUpItem(P);
    // End:0x24A
    if(QuestEntry != none)
    {
        MailMessage = LPQO_ObjectiveMailMessage(QuestEntry.GetQuestObject());
        // End:0x112
        if((MailMessage != none) && MailMessage.Prerequisite != none)
        {
            ManualTriggerPrereq = SPQP_ManualTrigger(MailMessage.Prerequisite);
            // End:0x112
            if(ManualTriggerPrereq != none)
            {
                // End:0x112
                if(int(MailMessage.GetQuestStatus()) == int(1))
                {
                    ManualTriggerPrereq.Unlock();
                }
            }
        }
        // End:0x24A
        if(MailMessage != none)
        {
            MailMessageDynamicData = LPQDD_MailMessage(MailMessage.DynamicData_ObjectiveBase);
            // End:0x182
            if(MailMessageDynamicData != none)
            {
                MailMessageDynamicData.bFoundFromPickUp = true;
            }
            // End:0x204
            if(bAutoPlayMessage && LPMailMessageDataAudio(MailMessage.Message) != none)
            {
                LPPlayerController(P.Controller).PlayMailMessage(MailMessage);
            }
            LPPlayerController(P.Controller).PickedUpMessage(MailMessage);
        }
    }
    //return;    
}

defaultproperties
{
    bAutoPlayMessage=true
    // Reference: LPQuestObjectSelector'Default__LPSeqAct_PickUpAudioLog.QuestEntryA'
    begin object name=QuestEntryA
    end object
    QuestEntry=QuestEntryA
    SoundEventName="PickedUpAudioLog"
    ObjName="Pick Up Audio Log"
}