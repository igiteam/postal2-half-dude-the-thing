class FailedConnect extends LocalMessage
    abstract;

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string FailMessage;

static function GetFailSwitch()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string FailString[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x18
    if(FailString ~= "NEEDPW")
    {
        return 0;
    }
    // End:0x31
    if(FailString ~= "WRONGPW")
    {
        return 1;
    }
    // End:0x4F
    if(FailString ~= "GAMESTARTED")
    {
        return 2;
    }
    return 3;
    //return ReturnValue;    
}

static function GetString()
{
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bPRI1HUD[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return default.FailMessage[Clamp(Switch, 0, 3)];
    //return ReturnValue;    
}

defaultproperties
{
    FailMessage[0]="FAILED TO JOIN GAME.  NEED PASSWORD."
    FailMessage[1]="FAILED TO JOIN GAME.  WRONG PASSWORD."
    FailMessage[2]="FAILED TO JOIN GAME.  GAME HAS STARTED."
    FailMessage[3]="FAILED TO JOIN GAME."
    bIsUnique=true
    DrawColor=(R=255,G=0,B=128,A=255)
    FontSize=1
}