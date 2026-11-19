class LPGameMessage extends SPGameMessage
    abstract;

static function ClientReceive()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private int Switch[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageString;
    local /*0x97E50000-0x00000000*/ private @NULL LPC, HUDMC;

    LPC = LPPlayerController(P);
    // End:0x31
    if(LPC == none)
    {
        return;
    }
    // End:0x57
    if(LPC.myLPHUD == none)
    {
        return;
    }
    HUDMC = LPC.myLPHUD.MyLPGFxMovie;
    // End:0xA5
    if(HUDMC == none)
    {
        return;
    }
    MessageString = GetString(Switch, RelatedPRI_1 == P.PlayerReplicationInfo, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    // End:0x17B
    if((MessageString != "") && HUDMC.MPNotifications != none)
    {
        HUDMC.MPNotifications.PostNotificationString(MessageString, "");
    }
    //return;    
}

static function GetString()
{
    local /*0x97E50000-0x00000000*/ private int Switch[9437185];
    local /*0x97E50000-0x00000000*/ private bool bPRI1HUD[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2, OptionalObject;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], SubjectName, OldSubjectName, LocalizedString;
    local /*0x97E50000-0x00000000*/ private @NULL LP, Eng, TransContext, TransTag, SubjectColor;

    local /*0x97E50000-0x00000000*/ private editfixedsize string SubjectColorString;

    Eng = Class'Engine.Engine'.static.GetEngine();
    LP = Eng.GamePlayers[0];
    TransContext = LP.GetTranslationContext();
    TransTag = TransContext.GetTranslatorTagFromName('Strings');
    SubjectColor = MakeColor(255, 255, 255, 255);
    // End:0x1A2
    if(RelatedPRI_1 != none)
    {
        // End:0x19F
        if(!RelatedPRI_1.bBot)
        {
            SubjectName = RelatedPRI_1.PlayerName;
            OldSubjectName = RelatedPRI_1.OldName;
            SubjectColor = Class'LPGameMP_Base'.static.GetTeamColor(int(RelatedPRI_1.GetTeamNum()));            
        }
        else
        {
            return "";
        }
    }
    SubjectColorString = ToHex(((Clamp(int(SubjectColor.R), 0, 255) * 65536) + (Clamp(int(SubjectColor.G), 0, 255) * 256)) + Clamp(int(SubjectColor.B), 0, 255));
    LocalizedString = "";
    switch(Switch)
    {
        // End:0x325
        case 1:
            // End:0x2C3
            if(RelatedPRI_1 == none)
            {
                LocalizedString = TransTag.Translate("LostPlanetGame.LPGameMessage.GameMessage_NewPlayer");                
            }
            else
            {
                LocalizedString = TransTag.Translate("LostPlanetGame.LPGameMessage.GameMessage_EnteredGame");
            }
            // End:0x39D
            break;
        // End:0x39A
        case 2:
            // End:0x397
            if(RelatedPRI_1 != none)
            {
                LocalizedString = TransTag.Translate("LostPlanetGame.LPGameMessage.GameMessage_ChangeName");
            }
            // End:0x39D
            break;
        // End:0xFFFF
        default:
            break;
    }
    LocalizedString = Repl(LocalizedString, "<Subject>", ((("<font color='#" $ SubjectColorString) $ "'>") $ SubjectName) $ "</font>");
    LocalizedString = Repl(LocalizedString, "<OldSubject>", ((("<font color='#" $ SubjectColorString) $ "'>") $ OldSubjectName) $ "</font>");
    return LocalizedString;
    //return ReturnValue;    
}
