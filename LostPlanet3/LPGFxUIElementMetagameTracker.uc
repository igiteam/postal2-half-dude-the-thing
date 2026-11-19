class LPGFxUIElementMetagameTracker extends LPGFxUIElement
    config(UI);

struct QueuedMetagameNotification
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Cell;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Progress;

    structdefaultproperties
    {
        Cell=(CellName="None",CellX=0,CellY=0,Image="None",RewardType="None",RewardClass="None",UnlockType="None",UnlockStat="None",StatAmount=0.0000000,IssuedTime=0.0000000,ActiveTime=0.0000000,CreditCost=0,CreditReward=0,bSecretCell=false,Prerequisite1="None",Prerequisite2="None",Prerequisite3="None",bInitiallyUnlocked=false,bNoDisplayCell=false,bForceReplicate=false)
        Progress=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NotificationManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array QueuedNotifications[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NotificationDuration[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NotificationTimeRemaining;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitForAwards[1073741825];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x59
    if(NotificationTimeRemaining > float(0))
    {
        // End:0x34
        if(DeltaTime >= NotificationTimeRemaining)
        {
            Show(false);
        }
        NotificationTimeRemaining = FMax(0.0000000, NotificationTimeRemaining - DeltaTime);
    }
    return super(SPGFxUIElement).Update(DeltaTime);
    //return ReturnValue;    
}

function ShowMetagameTracker()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cell[8388609];
    local /*0x97E50000-0x00000000*/ private float Progress[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TransTag;
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizedTitle, LocalizedSubHeading, LocalizedShortDesc;
    local /*0x97E50000-0x00000000*/ private bool bShowCredits;
    local /*0x97E50000-0x00000000*/ private int targetvalue;
    local /*0x97E50000-0x00000000*/ private @NULL QMN;

    // End:0xC6
    if((NotificationTimeRemaining > float(0)) || bWaitForAwards && LPGFxMoviePlayerHUD(MoviePlayer).IsAwardBusy())
    {
        QMN.Cell = Cell;
        QMN.Progress = Progress;
        QueuedNotifications.AddItem(QMN);        
        SetMetagameTrackerQueue(QueuedNotifications.Length);        
    }
    else
    {
        bShowCredits = string(Cell.UnlockType) == "Credits";
        targetvalue = ((bShowCredits) ? Cell.CreditCost : int(Cell.StatAmount));
        TransTag = Class'Engine.Engine'.static.GetEngine().GamePlayers[0].GetTranslationContext().GetTranslatorTagFromName('Strings');
        LocalizedTitle = TransTag.Translate(("LostPlanetGame.Metagame." $ string(Cell.CellName)) $ "_Title");
        LocalizedSubHeading = TransTag.Translate(("LostPlanetGame.Metagame." $ string(Cell.CellName)) $ "_Sub");
        // End:0x30B
        if(Progress >= float(targetvalue))
        {
            LocalizedShortDesc = TransTag.Translate("LostPlanetGame.MetagameUI.TrackingFinished");            
        }
        else
        {
            // End:0x3B6
            if(!bShowCredits)
            {
                LocalizedShortDesc = TransTag.Translate(("LostPlanetGame.Metagame." $ string(Cell.CellName)) $ "_Unlock");
                LocalizedShortDesc = Repl(LocalizedShortDesc, "<number>", string(targetvalue));                
            }
            else
            {
                LocalizedShortDesc = "";
            }
        }
        SetMetagameTracker(LocalizedTitle, LocalizedSubHeading, string(Cell.UnlockType), string(Cell.RewardType), Progress, float(targetvalue), LocalizedShortDesc);
        NotificationTimeRemaining = NotificationDuration;
        SetActive(true, false);
    }
    //return;    
}

function SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bImmediate;

    // End:0x48
    if(bSet)
    {
        // End:0x45
        if(bImmediate)
        {
            bPendingInactive = false;
            super(SPGFxUIElement).SetActive(bSet, bImmediate);
        }        
    }
    else
    {
        // End:0x84
        if(bImmediate)
        {
            bPendingInactive = false;
            super(SPGFxUIElement).SetActive(bSet, bImmediate);
            return;            
        }
        else
        {
            // End:0xA2
            if(!bPendingInactive)
            {
                bPendingInactive = true;                
            }
            else
            {
                Show(false, true);
            }
        }
    }
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;

    // End:0x72
    if(!bShow)
    {
        HideMetagameTracker(bImmediate);
        // End:0x72
        if(bImmediate)
        {
            // End:0x4A
            if(bPendingInactive)
            {
                SetActive(false, true);
            }
            LPGFxMoviePlayerHUD(MoviePlayer).NotifyMetagameTrackerOutroComplete();
        }
    }
    //return;    
}

function GetNotificationManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPMPHUD;

    // End:0x88
    if(NotificationManager == none)
    {
        LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
        // End:0x88
        if((LPMPHUD != none) && LPMPHUD.MPHUD_Container != none)
        {
            NotificationManager = LPMPHUD.MPHUD_Container;
        }
    }
    return NotificationManager;
    //return ReturnValue;    
}

function NextNotification()
{
    // End:0x77
    if(QueuedNotifications.Length > 0)
    {
        ShowMetagameTracker(QueuedNotifications[0].Cell, QueuedNotifications[0].Progress);
        QueuedNotifications.Remove(0, 1);        
        SetMetagameTrackerQueue(QueuedNotifications.Length);
    }
    //return;    
}

function NotifyAwardFinished()
{
    // End:0x1B
    if(NotificationTimeRemaining <= float(0))
    {
        NextNotification();
    }
    //return;    
}

function SetMetagameTracker()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CellTitle[8388609], SubHeading, UnlockType, RewardType;
    local /*0x97E50000-0x00000000*/ private float Progress[8388609], ProgressNeeded;
    local /*0x97E50000-0x00000000*/ private editfixedsize string TrackingMessage[9437185];

    ""
    // End:0x4A
    if((GetNotificationManager()) != none)
    {
        GetNotificationManager().ActionScriptVoid("SetMetagameTracker");
    }
    //return;    
}

function SetMetagameTrackerQueue()
{
    local /*0x97E50000-0x00000000*/ private int QueueLength[8388609];

    // End:0x49
    if((GetNotificationManager()) != none)
    {
        GetNotificationManager().ActionScriptVoid("setMetagameTrackerQueue");
    }
    //return;    
}

function HideMetagameTracker()
{
    local /*0x97E50000-0x00000000*/ private bool bImmediate[8388609];

    // End:0x45
    if((GetNotificationManager()) != none)
    {
        GetNotificationManager().ActionScriptVoid("HideMetagameTracker");
    }
    //return;    
}

defaultproperties
{
    NotificationDuration=2.0000000
    bWaitForAwards=true
}