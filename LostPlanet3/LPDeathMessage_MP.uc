class LPDeathMessage_MP extends LocalMessage;

struct TMessageDamageTypes
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name dmgType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DualSubjectMessage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string SingleSubjectMessage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponIcon;

    structdefaultproperties
    {
        dmgType="None"
        DualSubjectMessage=""
        SingleSubjectMessage=""
        WeaponIcon=""
    }
};

var(0.25_Pct) /*0x90540000-0x00000000*/ private editfixedsize string DeathMessage_Someone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MessageDamageTypes;

static function GetString()
{
    local /*0x97E50000-0x00000000*/ private int Switch[9437185];
    local /*0x97E50000-0x00000000*/ private bool bPRI1HUD[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], KillerName, VictimName, LocalizedString;
    local /*0x97E50000-0x00000000*/ private @NULL LP, Eng, TransContext, TransTag;
    local /*0x97E50000-0x00000000*/ private editfixedsize string LocalizationPrefix;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL dmgType, KillerColor, VictimColor;
    local /*0x97E50000-0x00000000*/ private editfixedsize string KillerColorString, VictimColorString, WeaponString;
    local /*0x97E50000-0x00000000*/ private class ourDamageType;

    Eng = Class'Engine.Engine'.static.GetEngine();
    LP = Eng.GamePlayers[0];
    TransContext = LP.GetTranslationContext();
    TransTag = TransContext.GetTranslatorTagFromName('Strings');
    LocalizationPrefix = "LostPlanetGame.LPDeathMessage_MP.";
    VictimColor = MakeColor(255, 255, 255, 255);
    KillerColor = VictimColor;
    ourDamageType = class<LPDamageType>(OptionalObject);
    // End:0x150
    if(RelatedPRI_2 == none)
    {
        VictimName = default.DeathMessage_Someone;        
    }
    else
    {
        VictimName = RelatedPRI_2.PlayerName;
        VictimColor = Class'LPGameMP_Base'.static.GetTeamColor(int(RelatedPRI_2.GetTeamNum()));
    }
    // End:0x1F6
    if(RelatedPRI_1 == none)
    {
        // End:0x1F3
        if(Switch != 1)
        {
            KillerName = default.DeathMessage_Someone;
        }        
    }
    else
    {
        // End:0x28C
        if(!RelatedPRI_1.bBot)
        {
            KillerName = RelatedPRI_1.PlayerName;
            KillerColor = Class'LPGameMP_Base'.static.GetTeamColor(int(RelatedPRI_1.GetTeamNum()));
        }
    }
    VictimColorString = ToHex(((Clamp(int(VictimColor.R), 0, 255) * 65536) + (Clamp(int(VictimColor.G), 0, 255) * 256)) + Clamp(int(VictimColor.B), 0, 255));
    KillerColorString = ToHex(((Clamp(int(KillerColor.R), 0, 255) * 65536) + (Clamp(int(KillerColor.G), 0, 255) * 256)) + Clamp(int(KillerColor.B), 0, 255));
    WeaponString = GetWeaponString(Switch, true, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x516
    if(ourDamageType != none)
    {
        // End:0x47B
        if((KillerName != "") && ourDamageType.default.DualSubjectMessage != "")
        {
            LocalizedString = TransTag.Translate(LocalizationPrefix $ ourDamageType.default.DualSubjectMessage);
        }
        // End:0x516
        if(((KillerName == "") || LocalizedString == "") && ourDamageType.default.SingleSubjectMessage != "")
        {
            LocalizedString = TransTag.Translate(LocalizationPrefix $ ourDamageType.default.SingleSubjectMessage);
        }
    }
    // End:0x6C3
    if((LocalizedString == "") && OptionalObject != none)
    {
        // End:0x6C2
        foreach default.MessageDamageTypes(dmgType)
        {
            // End:0x6C1
            if(OptionalObject.Name == dmgType.dmgType)
            {
                // End:0x64C
                if((KillerName != "") && dmgType.DualSubjectMessage != "")
                {
                    LocalizedString = TransTag.Translate(LocalizationPrefix $ dmgType.DualSubjectMessage);
                    // End:0x64C
                    if(WeaponString == "")
                    {
                        // End:0x64C
                        if(InStr(LocalizedString, "<weapon>") >= 0)
                        {
                            LocalizedString = "";
                        }
                    }
                }
                // End:0x6BE
                if((KillerName == "") || LocalizedString == "")
                {
                    LocalizedString = TransTag.Translate(LocalizationPrefix $ dmgType.SingleSubjectMessage);
                }                
            }
            else
            {                
            }
        }        
    }
    // End:0x785
    if(LocalizedString == "")
    {
        // End:0x736
        if(Switch == 1)
        {
            LocalizedString = TransTag.Translate(LocalizationPrefix $ "DeathMessage_LeftGameSingle");            
        }
        else
        {
            LocalizedString = TransTag.Translate(LocalizationPrefix $ "DeathMessage_KilledSingle");
        }
    }
    LocalizedString = Repl(LocalizedString, "<killer>", ((("<font color='#" $ KillerColorString) $ "'>") $ KillerName) $ "</font>");
    LocalizedString = Repl(LocalizedString, "<victim>", ((("<font color='#" $ VictimColorString) $ "'>") $ VictimName) $ "</font>");
    LocalizedString = Repl(LocalizedString, "<weapon>", WeaponString);
    return LocalizedString;
    //return ReturnValue;    
}

static function GetWeaponString()
{
    local /*0x97E50000-0x00000000*/ private int Switch[9437185];
    local /*0x97E50000-0x00000000*/ private bool bPRI1HUD[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL dmgType;
    local /*0x97E50000-0x00000000*/ private class ourDamageType;

    ourDamageType = class<LPDamageType>(OptionalObject);
    // End:0x174
    if(ourDamageType != none)
    {
        // End:0xA6
        if(ourDamageType.default.WeaponIcon != "")
        {
            return ("<img src='" $ ourDamageType.default.WeaponIcon) $ "' align='baseline' vspace='-6'/>";
        }
        // End:0x173
        foreach default.MessageDamageTypes(dmgType)
        {
            // End:0x172
            if(OptionalObject.Name == dmgType.dmgType)
            {
                // End:0x16F
                if(dmgType.WeaponIcon != "")
                {                    
                    return ("<img src='" $ dmgType.WeaponIcon) $ "' align='baseline' vspace='-6'/>";
                }                
            }
            else
            {                
            }
        }        
    }
    return "";
    //return ReturnValue;    
}

static function ClientReceive()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private int Switch[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject, LPP, HUD, HUDMC;

    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageString;

    LPP = LPPlayerController(P);
    // End:0x31
    if(LPP == none)
    {
        return;
    }
    // End:0x55
    if(RelatedPRI_2.bBot)
    {
        return;
    }
    // End:0xDF
    if((RelatedPRI_1 != none) && LPPlayerController(RelatedPRI_1.Owner) != none)
    {
        LPPRI(RelatedPRI_1).NotifyKill(LPPRI(RelatedPRI_2), class<DamageType>(OptionalObject));
    }
    // End:0x169
    if((RelatedPRI_2 != none) && LPPlayerController(RelatedPRI_2.Owner) != none)
    {
        LPPRI(RelatedPRI_2).NotifyKilledBy(LPPRI(RelatedPRI_1), class<DamageType>(OptionalObject));
    }
    // End:0x19C
    if(((RelatedPRI_1 == none) && RelatedPRI_2 == none) && OptionalObject == none)
    {
        return;
    }
    HUD = LPHUD(LPP.myHUD);
    // End:0x1DE
    if(HUD == none)
    {
        return;
    }
    HUDMC = HUD.MyLPGFxMovie;
    // End:0x217
    if(HUDMC == none)
    {
        return;
    }
    MessageString = GetString(Switch, true, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x262
    if(MessageString == "")
    {
        return;
    }
    HUDMC.MPNotifications.PostNotificationString(MessageString, "");
    //return;    
}

defaultproperties
{
    DeathMessage_Someone="Someone"
    MessageDamageTypes=/* Array type was not detected. */
}