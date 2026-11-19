class SPMeleeSocketGroup extends Object
    abstract
    hidecategories(Object);

struct MeleeSocketInfo
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private name SocketName;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float HalfWidth;

    structdefaultproperties
    {
        SocketName="None"
        HalfWidth=0.0000000
    }
};

struct MeleeSocketGroup
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private name GroupName;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array SocketInfo;

    structdefaultproperties
    {
        GroupName="None"
        SocketInfo=none
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array Group;
