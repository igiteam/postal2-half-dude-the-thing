class LPGFxJobLogMessagesView extends GFxObject within GFxMoviePlayer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ListMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MessageBodyTextArea;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Messages;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogMP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MyTabIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MessageFilterIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InitialItemIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bViewed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNewContent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentMessageIndex[536870913];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];
    local /*0x97E50000-0x00000000*/ private int TabIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    MyTabIndex = TabIndex;
    JobLogMP = JLMP;
    bNewContent = false;
    InitialItemIndex = LPPC.JobLogInfo.MessagesRecord.ListSelectedIndex;
    // End:0xCC
    if(InitialItemIndex < 0)
    {
        InitialItemIndex = 0;
    }
    MessageFilterIndex = 0;
    JLMP.SetMessageSortDelegate(MessagesSorted);
    JLMP.SetSetMessagesButtonLegendDelegate(SetMessageButtonLegend);
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private @NULL JLMP[8388609];

    JLMP.SetMessageSortDelegate(None);
    JLMP.SetSetMessagesButtonLegendDelegate(None);
    //return;    
}

function SaveState()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Outer.GetPC());
    // End:0xB6
    if(ListMC != none)
    {
        LPPC.JobLogInfo.MessagesRecord.ListSelectedIndex = int(ListMC.GetFloat("selectedIndex"));
    }
    //return;    
}

function UpdateMessagesListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj, GameDataStore, QM, Q, MessageObj,
	    MessageData;

    local /*0x97E50000-0x00000000*/ private bool bMessageRead, bCanPlayVideoMessages, bDisabled;
    local /*0x97E50000-0x00000000*/ private editfixedsize array MailMessages;
    local /*0x97E50000-0x00000000*/ private float UniversalTime;
    local /*0x97E50000-0x00000000*/ private editfixedsize string dateFormat;
    local /*0x97E50000-0x00000000*/ private int QuestIdx, ObjectiveIdx, FoundMessageIdx, NewMessagesPassIdx;

    // End:0x11
    if(ListMC == none)
    {
        return;
    }
    bCanPlayVideoMessages = CanPlayVideoMessages();
    FoundMessageIdx = 0;
    DataProvider = Outer.CreateArray();
    Messages.Length = 0;
    dateFormat = Class'SPEngine.SPUtil'.static.GetRegionalDateFormat();
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0xA17
    if(GameDataStore.QuestManager != none)
    {
        QM = GameDataStore.QuestManager;
        QM.QuestTuneDataContainer.GetAllQuestsInChain('MailMessages', MailMessages);
        NewMessagesPassIdx = 0;
        J0x17D:

        // End:0xA17 [Loop If]
        if(NewMessagesPassIdx < 2)
        {
            QuestIdx = 0;
            J0x198:

            // End:0xA09 [Loop If]
            if(QuestIdx < MailMessages.Length)
            {
                Q = MailMessages[QuestIdx];
                ObjectiveIdx = 0;
                J0x1D8:

                // End:0x9FB [Loop If]
                if(ObjectiveIdx < Q.Objectives.Length)
                {
                    MessageObj = LPQO_ObjectiveMailMessage(Q.Objectives[ObjectiveIdx]);
                    // End:0x9ED
                    if(MessageObj != none)
                    {
                        // End:0x2BC
                        if((MessageObj.bSentMessage && MessageFilterIndex != 1) || !MessageObj.bSentMessage && MessageFilterIndex != 0)
                        {                            
                        }
                        else
                        {
                            // End:0x9ED
                            if(int(MessageObj.GetQuestStatus()) != int(1))
                            {
                                bMessageRead = int(MessageObj.GetQuestStatus()) == int(4);
                                // End:0x35B
                                if((bMessageRead && NewMessagesPassIdx == 0) || !bMessageRead && NewMessagesPassIdx > 0)
                                {                                    
                                }
                                else
                                {
                                    // End:0x374
                                    if(bMessageRead)
                                    {
                                        bNewContent = true;
                                    }
                                    MessageData = MessageObj.Message;
                                    TempObj = Outer.CreateObject("Object");
                                    bDisabled = false;
                                    // End:0x3F9
                                    if(LPMailMessageDataText(MessageData) != none)
                                    {
                                        goto J0x9ED;                                        
                                    }
                                    else
                                    {
                                        // End:0x417
                                        if(LPMailMessageDataAudio(MessageData) != none)
                                        {
                                            goto J0x9ED;                                            
                                        }
                                        else
                                        {
                                            // End:0x4C2
                                            if(LPMailMessageDataVideo(MessageData) != none)
                                            {
                                                TempObj.SetString("type", JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.MessageTypeVideo>"));
                                                // End:0x4C2
                                                if(bCanPlayVideoMessages == false)
                                                {
                                                    bDisabled = true;
                                                }
                                            }
                                        }
                                    }
                                    Messages.AddItem(MessageObj);                                    
                                    TempObj.SetBool("disabled", bDisabled);
                                    TempObj.SetString("subject", MessageData.MessageSubject);
                                    TempObj.SetString("sender", MessageData.MessageSender);
                                    TempObj.SetFloat("second", float(MessageData.Second));
                                    TempObj.SetFloat("minute", float(MessageData.Minute));
                                    TempObj.SetFloat("hour", float(MessageData.Hour));
                                    TempObj.SetFloat("day", float(MessageData.Day));
                                    TempObj.SetFloat("month", float(MessageData.Month));
                                    TempObj.SetFloat("year", float(MessageData.Year));
                                    TempObj.SetString("dateFormat", dateFormat);
                                    TempObj.SetString("yearPrefixString", ((MessageData.Year < 0) ? "<Strings:LostPlanetGame.JobLog.DatePrefix_TrialCentury>" : "<Strings:LostPlanetGame.JobLog.DatePrefix_AfterTrial>"));
                                    UniversalTime = ASGetUniversalTimeFromDate(float(MessageData.Year), float(MessageData.Month), float(MessageData.Day), float(MessageData.Hour), float(MessageData.Minute), float(MessageData.Second));
                                    TempObj.SetFloat("date", UniversalTime);
                                    TempObj.SetFloat("MessageObjectiveIndex", float(FoundMessageIdx));
                                    TempObj.SetBool("bMessageRead", bMessageRead);
                                    DataProvider.SetElementObject(FoundMessageIdx, TempObj);
                                    FoundMessageIdx++;
                                }
                            }
                        }
                    }
                    J0x9ED:

                    ObjectiveIdx++;
                    // [Loop Continue]
                    goto J0x1D8;
                }
                QuestIdx++;
                // [Loop Continue]
                goto J0x198;
            }
            NewMessagesPassIdx++;
            // [Loop Continue]
            goto J0x17D;
        }
    }
    ListMC.SetObject("dataProvider", DataProvider);
    ListMC.SetFloat("selectedIndex", float(((InitialItemIndex < 0) ? 0 : InitialItemIndex)));
    ListMC.AddEventListener('CLIK_itemPress', OnListItemPress);
    ListMC.AddEventListener('CLIK_change', OnListChange);
    ListMC.SetString("wrapping", ((FoundMessageIdx > 0) ? "wrap" : "normal"));
    JobLogMP.SetTabNewContentIndicator(MyTabIndex, bNewContent);
    // End:0xBA4
    if(FoundMessageIdx > 0)
    {
        InitSort();
    }
    //return;    
}

function ASGetUniversalTimeFromDate()
{
    local /*0x97E50000-0x00000000*/ private float Year[8388609], Month, Day, Hour, Minute, Second,
	    ReturnValue;

    return ActionScriptFloat("GetUniversalTimeFromDate");
    //return ReturnValue;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    return Retval;
    //return ReturnValue;    
}

function UpdateMessageFilterLabel()
{
    switch(MessageFilterIndex)
    {
        // End:0x83
        case 0:
            JobLogMP.SetTitleText(JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.Received>"), self);
            // End:0xF2
            break;
        // End:0xEF
        case 1:
            JobLogMP.SetTitleText(JobLogMP.GetLocalizedString("<Strings:LostPlanetGame.JobLog.Sent>"), self);
            // End:0xF2
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function InitSort()
{
    ActionScriptVoid("InitSort");
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;

    bWasHandled = true;
    switch(WidgetName)
    {
        // End:0x63
        case 'MessageList':
            // End:0x60
            if(ListMC == none)
            {
                ListMC = GFxClikWidget(Widget);
                UpdateMessagesListDataProvider();
            }
            // End:0x24B
            break;
        // End:0xCC
        case 'typeHeader':
            Widget.SetString("label", "<Strings:LostPlanetGame.JobLog.MessageTypeHeader>");
            // End:0x24B
            break;
        // End:0x137
        case 'senderHeader':
            Widget.SetString("label", "<Strings:LostPlanetGame.JobLog.MessageSenderHeader>");
            // End:0x24B
            break;
        // End:0x1A3
        case 'subjectHeader':
            Widget.SetString("label", "<Strings:LostPlanetGame.JobLog.MessageSubjectHeader>");
            // End:0x24B
            break;
        // End:0x20C
        case 'dateHeader':
            Widget.SetString("label", "<Strings:LostPlanetGame.JobLog.MessageDateHeader>");
            // End:0x24B
            break;
        // End:0x239
        case 'MessageBodyTextArea':
            MessageBodyTextArea = Widget;
            ShowMessage(0);
            // End:0x24B
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x24B
            break;
            break;
    }
    // End:0x28A
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function CanPlayVideoMessages()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(JobLogMP.GetPC());
    // End:0x99
    if(((LPPC != none) && LPVSPlayerPawn(LPPC.Pawn) != none) && LPPC.bIsInVitalSuit == true)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

private final function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int ListIndex;

    ListIndex = ev.Index;
    CurrentMessageIndex = ListIndex;
    PlayMessage(ListIndex);
    //return;    
}

function PlayMessage()
{
    local /*0x97E50000-0x00000000*/ private int ListIndex[8388609], MessageIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Data, VideoMsg, AudioMsg, LP, LPPC;

    // End:0x3D2
    if((ListIndex >= 0) && ListIndex < Messages.Length)
    {
        Data = ListMC.GetObject("dataProvider").GetElementObject(ListIndex);
        MessageIndex = int(Data.GetFloat("MessageObjectiveIndex"));
        LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
        // End:0x12D
        if(LP != none)
        {
            LPPC = LPPlayerController(LP.Actor);
        }
        VideoMsg = LPMailMessageDataVideo(Messages[MessageIndex].Message);
        // End:0x28E
        if(VideoMsg != none)
        {
            // End:0x262
            if((((JobLogMP != none) && CanPlayVideoMessages()) && VideoMsg.MovieStreamFilename != "") && VideoMsg.CanPlayMessage())
            {
                // End:0x20E
                if(LPPC != none)
                {
                    LPPC.AbortMailMessagePlayback();
                }
                Outer.PlaySoundFromTheme('PlayAudio');
                JobLogMP.PlayVideoMessage(VideoMsg);                
            }
            else
            {
                Outer.PlaySoundFromTheme('AudioLog_Busy');
            }            
        }
        else
        {
            AudioMsg = LPMailMessageDataAudio(Messages[MessageIndex].Message);
            // End:0x3D2
            if(AudioMsg != none)
            {
                // End:0x3A9
                if(AudioMsg.CanPlayMessage())
                {
                    // End:0x35E
                    if(LPPC != none)
                    {
                        LPPC.myLPHUD.ShowVideoMessage(false);
                        LPPC.AbortMailMessagePlayback();
                    }
                    Outer.PlaySoundFromTheme('PlayAudio');
                    AudioMsg.Play();                    
                }
                else
                {
                    Outer.PlaySoundFromTheme('AudioLog_Busy');
                }
            }
        }
    }
    //return;    
}

function Sort()
{
    //return;    
}

function Play()
{
    PlayMessage(CurrentMessageIndex);
    //return;    
}

function OnListChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int ListIndex;

    ListIndex = ev.Index;
    ShowMessage(ListIndex);
    JobLogMP.PlaySoundFromTheme('Select');
    //return;    
}

function ShowMessage()
{
    local /*0x97E50000-0x00000000*/ private int ListIndex[8388609], MessageIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Data;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageBodyString;

    CurrentMessageIndex = ListIndex;
    MessageBodyString = "";
    // End:0x16A
    if((ListIndex >= 0) && ListIndex < Messages.Length)
    {
        Data = ListMC.GetObject("dataProvider").GetElementObject(ListIndex);
        MessageIndex = int(Data.GetFloat("MessageObjectiveIndex"));
        MessageBodyString = Messages[MessageIndex].Message.MessageBody;
        MarkMessageObjectiveRead(MessageIndex);
        Data.SetBool("bMessageRead", true);
    }
    MessageBodyTextArea.SetText(MessageBodyString);
    //return;    
}

function MarkMessageObjectiveRead()
{
    local /*0x97E50000-0x00000000*/ private int MessageIndex[8388609];

    // End:0x58
    if((MessageIndex >= 0) && MessageIndex < Messages.Length)
    {
        Messages[MessageIndex].AdjustQuestProgress(1.0000000);
    }
    //return;    
}

function MessagesSorted()
{
    local /*0x97E50000-0x00000000*/ private int ListIndex;

    ListIndex = int(ListMC.GetFloat("selectedIndex"));
    ShowMessage(ListIndex);
    //return;    
}

function SetMessageButtonLegend()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string s1, s2, s3, s4, s5, s6;

    s1 = "";
    s2 = "";
    s3 = "<Strings:LostPlanetGame.JobLog.Sort>";
    s4 = "<Strings:LostPlanetGame.JobLog.Play>";
    s5 = "<Strings:LostPlanetGame.UI.ButtonBack>";
    s6 = "";
    JobLogMP.SetButtonLegendLabelStrings(s1, s2, s3, s4, s5, s6, self);
    JobLogMP.ASRepositionButtonPrompts();
    UpdateMessageFilterLabel();
    //return;    
}

function Viewed()
{
    bViewed = true;
    SetMessageButtonLegend();
    //return;    
}

defaultproperties
{
    SubWidgetBindings=/* Array type was not detected. */
}