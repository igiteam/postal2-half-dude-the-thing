class AppNotificationsBase extends PlatformInterfaceBase
    transient;

struct native NotificationMessageInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Key;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Value;

    structdefaultproperties
    {
        Key=""
        Value=""
    }
};

struct native NotificationInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsLocal;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MessageBody;
    var(*) /*0x35EA0000-0x00000000*/ private int BadgeNumber;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MessageInfo;

    structdefaultproperties
    {
        bIsLocal=false
        MessageBody=""
        BadgeNumber=0
        MessageInfo=none
    }
};

struct native LaunchNotificationInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bWasLaunchedViaNotification;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Notification;

    structdefaultproperties
    {
        bWasLaunchedViaNotification=false
        Notification=(bIsLocal=false,MessageBody="",BadgeNumber=0,MessageInfo=none)
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL AppLaunchNotification[131073];
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnReceivedLocalNotification__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnReceivedRemoteNotification__Delegate;

// Export UAppNotificationsBase::execInit(FFrame&, void* const)
native event Init();

function WasLaunchedViaNotification()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return AppLaunchNotification.bWasLaunchedViaNotification;
    //return ReturnValue;    
}

// Export UAppNotificationsBase::execScheduleLocalNotification(FFrame&, void* const)
native function ScheduleLocalNotification()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Notification[25296897];
    local /*0x35EA0000-0x00000000*/ private int StartOffsetSeconds[8388609];


}

// Export UAppNotificationsBase::execCancelAllScheduledLocalNotifications(FFrame&, void* const)
native function CancelAllScheduledLocalNotifications();

delegate OnReceivedLocalNotification()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Notification[25296897];
    local /*0x35EA0000-0x00000000*/ private bool bWasAppActive[8388609];

    //return;    
}

delegate OnReceivedRemoteNotification()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Notification[25296897];
    local /*0x35EA0000-0x00000000*/ private bool bWasAppActive[8388609];

    //return;    
}

function DebugLogNotification()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Notification[25296897];
    local /*0x35EA0000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x44 [Loop If]
    if(Idx < Notification.MessageInfo.Length)
    {
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}
