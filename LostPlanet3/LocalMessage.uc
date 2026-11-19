class LocalMessage extends Object
    abstract;

var(*) /*0x35EA0000-0x00000000*/ private bool bIsSpecial;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsUnique;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsPartiallyUnique;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsConsoleMessage;
var(*) /*0x35EA0000-0x00000000*/ private bool bBeep;
var(*) /*0x35EA0000-0x00000000*/ private bool bCountInstances;
var(*) /*0x35EA0000-0x00000000*/ private float Lifetime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL DrawColor;
var(*) /*0x35EA0000-0x00000000*/ private float PosY;
var(*) /*0x35EA0000-0x00000000*/ private int FontSize;

static function ClientReceive()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string MessageString;

    MessageString = GetString(Switch, RelatedPRI_1 == P.PlayerReplicationInfo, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x2B1
    if(MessageString != "")
    {
        // End:0x1B8
        if(P.myHUD != none)
        {
            P.myHUD.LocalizedMessage(default.Class, RelatedPRI_1, RelatedPRI_2, MessageString, Switch, GetPos(Switch, P.myHUD), GetLifeTime(Switch), GetFontSize(Switch, RelatedPRI_1, RelatedPRI_2, P.PlayerReplicationInfo), GetColor(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject), OptionalObject);
        }
        // End:0x2B1
        if(((IsConsoleMessage(Switch)) && LocalPlayer(P.Player) != none) && LocalPlayer(P.Player).ViewportClient != none)
        {
            LocalPlayer(P.Player).ViewportClient.ViewportConsole.OutputText(MessageString);
        }
    }
    //return;    
}

static function GetString()
{
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bPRI1HUD[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    // End:0x61
    if(class<Actor>(OptionalObject) != none)
    {
        return class<Actor>(OptionalObject).static.GetLocalString(Switch, RelatedPRI_1, RelatedPRI_2);
    }
    return "";
    //return ReturnValue;    
}

static function GetConsoleColor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[8388609], ReturnValue;

    return default.DrawColor;
    //return ReturnValue;    
}

static function GetColor()
{
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject, ReturnValue;

    return default.DrawColor;
    //return ReturnValue;    
}

static function GetPos()
{
    local /*0x35EA0000-0x00000000*/ private int Switch[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL myHUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return default.PosY;
    //return ReturnValue;    
}

static function GetFontSize()
{
    local /*0x35EA0000-0x00000000*/ private int Switch[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI1[8388609], RelatedPRI2, LocalPlayer;
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return default.FontSize;
    //return ReturnValue;    
}

static function GetLifeTime()
{
    local /*0x35EA0000-0x00000000*/ private int Switch[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return default.Lifetime;
    //return ReturnValue;    
}

static function IsConsoleMessage()
{
    local /*0x35EA0000-0x00000000*/ private int Switch[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return default.bIsConsoleMessage;
    //return ReturnValue;    
}

static function PartiallyDuplicates()
{
    local /*0x35EA0000-0x00000000*/ private int Switch1[8388609], Switch2;
    local /*0x35EA0000-0x00000000*/ private @NULL OptionalObject1[8388609], OptionalObject2;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return Switch1 == Switch2;
    //return ReturnValue;    
}

defaultproperties
{
    bIsSpecial=true
    bIsConsoleMessage=true
    Lifetime=3.0000000
    DrawColor=(R=255,G=255,B=255,A=255)
    PosY=0.8300000
}