class LPHUDNotifications_MP extends Object;

struct MPNotification
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NotificationContainer;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Notification;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Text;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MessageId;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PosY;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisible;

    structdefaultproperties
    {
        NotificationContainer=none
        Notification=none
        Text=none
        MessageId=0
        PosY=0
        bVisible=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MessageId;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ParentHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MPNotificationContainer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Notifications;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NotificationHeight[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNotifications[131073];

function Update()
{
    // End:0x11
    if(!bEnabled)
    {
        return;
    }
    SetVisible(ShouldBeVisible());
    UpdateNotifications();
    //return;    
}

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Parent[8388609];
    local /*0x97E50000-0x00000000*/ private bool bMultiplayer;

    ParentHUD = Parent;
    // End:0x62
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        bMultiplayer = true;        
    }
    else
    {
        bMultiplayer = false;
    }
    bEnabled = bMultiplayer;
    InitNotificationMessages();
    bVisible = !bEnabled;
    SetVisible(bEnabled);
    //return;    
}

function InitNotificationMessages()
{
    local /*0x97E50000-0x00000000*/ private int A;
    local /*0x97E50000-0x00000000*/ private @NULL MessageContainer, Message, MessageText, Notification, DI;

    // End:0x67
    if((ParentHUD != none) && ParentHUD.MPHUD_Container != none)
    {
        MPNotificationContainer = GetNotificationCenter(ParentHUD.MPHUD_Container);
    }
    // End:0x34A
    if(MPNotificationContainer != none)
    {
        A = 0;
        J0x81:

        // End:0x34A [Loop If]
        if(A < MaxNotifications)
        {
            MessageContainer = MPNotificationContainer.AttachMovie("notificationMessage", "messageID" $ string(A));
            // End:0x102
            if(MessageContainer == none)
            {                
            }
            else
            {
                Message = MessageContainer.GetObject("notification");
                // End:0x14C
                if(Message == none)
                {                    
                }
                else
                {
                    MessageText = Message.GetObject("textField");
                    Notification.MessageId = A;
                    Notification.NotificationContainer = MessageContainer;
                    Notification.Notification = Message;
                    Notification.Text = MessageText;
                    Notification.bVisible = false;
                    Notification.PosY = 0;
                    Notifications[A] = Notification;
                    DI = Notifications[A].NotificationContainer.GetDisplayInfo();
                    DI.Visible = false;
                    DI.hasVisible = true;
                    Notifications[A].NotificationContainer.SetDisplayInfo(DI);
                }
            }
            ++A;
            // [Loop Continue]
            goto J0x81;
        }
    }
    //return;    
}

function GetNotificationCenter()
{
    local /*0x97E50000-0x00000000*/ private @NULL InMPHUD_Container[8388609], ReturnValue;

    // End:0x46
    if(InMPHUD_Container != none)
    {
        return InMPHUD_Container.ActionScriptObject("GetNotificationCenter");
    }
    return none;
    //return ReturnValue;    
}

function SetVisible()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0xD5
    if(bVisible != bShow)
    {
        // End:0xC0
        if(MPNotificationContainer != none)
        {
            DI = MPNotificationContainer.GetDisplayInfo();
            DI.Visible = bShow;
            DI.hasVisible = true;
            MPNotificationContainer.SetDisplayInfo(DI);
        }
        bVisible = bShow;
    }
    //return;    
}

function ShouldBeVisible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL P;

    P = LPBasePlayerPawn(ParentHUD.GetPC().Pawn);
    // End:0xC0
    if(((P != none) && P.Weapon != none) && SPInventoryWeapon(P.Weapon).IsScopeActive())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function FindFreeNotification()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], A;

    A = 0;
    J0x0B:

    // End:0x66 [Loop If]
    if(A < MaxNotifications)
    {
        // End:0x58
        if(!Notifications[A].bVisible)
        {
            return A;
        }
        ++A;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function PostNotificationString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponString[8388609], MessageString;
    local /*0x97E50000-0x00000000*/ private @NULL DI;
    local /*0x97E50000-0x00000000*/ private editfixedsize string StringMessage;
    local /*0x97E50000-0x00000000*/ private int NotificationIndex, PosY, Index, VisibleCount;

    // End:0x11
    if(!bEnabled)
    {
        return;
    }
    // End:0x22
    if(MPNotificationContainer == none)
    {
        return;
    }
    NotificationIndex = FindFreeNotification();
    // End:0xDB
    if(NotificationIndex < 0)
    {
        Index = 0;
        J0x50:

        // End:0xCA [Loop If]
        if(Index < MaxNotifications)
        {
            // End:0xBC
            if(Notifications[Index].PosY == 0)
            {
                HideNotification(Index);
                NotificationIndex = Index;
                // [Explicit Break]
                goto J0xCA;
            }
            ++Index;
            // [Loop Continue]
            goto J0x50;
        }
        J0xCA:

        // End:0xDB
        if(NotificationIndex < 0)
        {
            return;
        }
    }
    StringMessage = WeaponString $ MessageString;
    Notifications[NotificationIndex].Text.SetString("htmlText", StringMessage);
    Notifications[NotificationIndex].NotificationContainer.GotoAndPlay("show");
    Notifications[NotificationIndex].bVisible = true;
    PosY = 0;
    VisibleCount = 0;
    Index = 0;
    J0x1D5:

    // End:0x29E [Loop If]
    if(Index < MaxNotifications)
    {
        // End:0x290
        if(Notifications[Index].bVisible)
        {
            // End:0x285
            if(Notifications[Index].PosY >= PosY)
            {
                PosY = Notifications[Index].PosY + NotificationHeight;
            }
            ++VisibleCount;
        }
        ++Index;
        // [Loop Continue]
        goto J0x1D5;
    }
    Notifications[NotificationIndex].PosY = PosY;
    DI = Notifications[NotificationIndex].NotificationContainer.GetDisplayInfo();
    DI.hasVisible = true;
    DI.Visible = true;
    DI.hasY = true;
    DI.Y = float(PosY);
    Notifications[NotificationIndex].NotificationContainer.SetDisplayInfo(DI);
    //return;    
}

function PostKillNotification()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killed[8388609], KilledBy, Weapon;
    local /*0x97E50000-0x00000000*/ private editfixedsize string KilledName, KillerName;

    // End:0x11
    if(!bEnabled)
    {
        return;
    }
    KilledName = Killed.PlayerName;
    KillerName = KilledBy.PlayerName;
    // End:0xCE
    if((KilledBy.PlayerID == Killed.PlayerID) || KilledBy == Killed)
    {
        KillerName = "himself";
    }
    // End:0xF0
    if(KilledName == "")
    {
        KilledName = "Player";
    }
    // End:0x112
    if(KillerName == "")
    {
        KillerName = "Player";
    }
    PostNotificationString("<img src='notify_weapon_01' align='baseline' vspace='-14'/>", (KilledName $ " was killed by ") $ KillerName);
    //return;    
}

function UpdateNotifications()
{
    local /*0x97E50000-0x00000000*/ private @NULL DI;
    local /*0x97E50000-0x00000000*/ private int Index;

    Index = 0;
    J0x0B:

    // End:0xD7 [Loop If]
    if(Index < MaxNotifications)
    {
        // End:0xC9
        if(Notifications[Index].bVisible)
        {
            DI = Notifications[Index].Notification.GetDisplayInfo();
            // End:0xC9
            if(DI.Alpha <= float(0))
            {
                HideNotification(Index);
            }
        }
        ++Index;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function HideNotification()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609], PosY, I;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    PosY = Notifications[Index].PosY;
    I = 0;
    J0x3B:

    // End:0x1DE [Loop If]
    if(I < MaxNotifications)
    {
        // End:0x1D0
        if(Notifications[I].bVisible)
        {
            // End:0x1D0
            if(Notifications[I].PosY > PosY)
            {
                Notifications[I].PosY -= NotificationHeight;
                DI = Notifications[I].NotificationContainer.GetDisplayInfo();
                DI.hasY = true;
                DI.Y = float(Notifications[I].PosY);
                Notifications[I].NotificationContainer.SetDisplayInfo(DI);
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x3B;
    }
    DI = Notifications[Index].NotificationContainer.GetDisplayInfo();
    DI.hasVisible = true;
    DI.Visible = false;
    Notifications[Index].NotificationContainer.SetDisplayInfo(DI);
    Notifications[Index].bVisible = false;
    Notifications[Index].PosY = 0;
    //return;    
}

function HideAllNotifications()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x43 [Loop If]
    if(I < MaxNotifications)
    {
        HideNotification(I);
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

defaultproperties
{
    NotificationHeight=30
    MaxNotifications=8
}