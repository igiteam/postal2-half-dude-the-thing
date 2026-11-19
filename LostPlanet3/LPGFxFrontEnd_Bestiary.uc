class LPGFxFrontEnd_Bestiary extends SPGFxUIView within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCheatAllUnlocked[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCollectiblesInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableModelView;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AkridDNAIconName[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Small_DNATags;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Medium_DNATags;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Large_DNATags;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Giant_DNATags;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BestiaryViewMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ViewWidgets;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TitleLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DescriptionLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FirstFocus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PrevCollectibleSlotNum;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PrevCollectibleIndex;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __SetCurrentCollectibleDelegate__Delegate;

delegate SetCurrentCollectibleDelegate()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609], CollectibleIndex;

    //return;    
}

function SetSetCurrentCollectibleDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL _global;

    _global = Outer.GetVariableObject("_global");
    MoviePlayer.ActionScriptSetFunction(_global, "SetCurrentCollectible");
    //return;    
}

function OnViewLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL FEM;
    local /*0x97E50000-0x00000000*/ private editfixedsize string imgString;

    super.OnViewLoaded();
    PrevCollectibleSlotNum = -1;
    PrevCollectibleIndex = -1;
    bEnableModelView = false;
    SetSetCurrentCollectibleDelegate(SetCurrentCollectible);
    FEM = LPGFxMoviePlayerFrontEndManager(MoviePlayer);
    // End:0xC9
    if(FEM != none)
    {
        imgString = "img://" $ PathName(FEM.BestiarySceneCaptureTexture);
        SetSceneCaptureTexture(imgString);
    }
    //return;    
}

function SetSceneCaptureTexture()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string imgString[8388609];

    ActionScriptVoid("SetSceneCaptureTexture");
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    bEnableModelView = true;
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0x72
    if(FirstFocus != none)
    {
        MenuViewLoader.SetSelectionFocus(FirstFocus);
    }
    InitAkridCollectibles();
    SetSetCurrentCollectibleDelegate(SetCurrentCollectible);
    //return;    
}

function InitAkridCollectibles()
{
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore, QM, Q;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LocalQuestCache;
    local /*0x97E50000-0x00000000*/ private int QuestIdx, ObjectiveIdx, foundIdx;
    local /*0x97E50000-0x00000000*/ private @NULL ObjectiveObj;
    local /*0x97E50000-0x00000000*/ private bool bLocked;
    local /*0x97E50000-0x00000000*/ private int I, categorySlot;

    // End:0x0F
    if(bCollectiblesInitialized)
    {
        return;
    }
    Small_DNATags.Length = 0;
    Medium_DNATags.Length = 0;
    Large_DNATags.Length = 0;
    Giant_DNATags.Length = 0;
    foundIdx = 0;
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x3F6
    if(GameDataStore.QuestManager != none)
    {
        QM = GameDataStore.QuestManager;
        QM.QuestTuneDataContainer.GetAllQuestsInChain('DNATagging', LocalQuestCache);
        QuestIdx = 0;
        J0x138:

        // End:0x3F6 [Loop If]
        if(QuestIdx < LocalQuestCache.Length)
        {
            Q = LocalQuestCache[QuestIdx];
            ObjectiveIdx = 0;
            J0x178:

            // End:0x3E8 [Loop If]
            if(ObjectiveIdx < Q.Objectives.Length)
            {
                ObjectiveObj = LPQO_ObjectiveDNATag(Q.Objectives[ObjectiveIdx]);
                // End:0x3DA
                if(ObjectiveObj != none)
                {
                    // End:0x3DA
                    if(ObjectiveObj.bIncludeInBestiary)
                    {
                        switch(ObjectiveObj.BestiaryCategory)
                        {
                            // End:0x26B
                            case 0:
                                foundIdx = Small_DNATags.Length;
                                Small_DNATags.AddItem(ObjectiveObj);                                
                                // End:0x304
                                break;
                            // End:0x29D
                            case 1:
                                foundIdx = Medium_DNATags.Length;
                                Medium_DNATags.AddItem(ObjectiveObj);                                
                                // End:0x304
                                break;
                            // End:0x2CF
                            case 2:
                                foundIdx = Large_DNATags.Length;
                                Large_DNATags.AddItem(ObjectiveObj);                                
                                // End:0x304
                                break;
                            // End:0x301
                            case 3:
                                foundIdx = Giant_DNATags.Length;
                                Giant_DNATags.AddItem(ObjectiveObj);                                
                                // End:0x304
                                break;
                            // End:0xFFFF
                            default:
                                break;
                        }
                        // End:0x33D
                        if(int(ObjectiveObj.GetQuestStatus()) == int(4))
                        {
                            bLocked = false;                            
                        }
                        else
                        {
                            bLocked = true;
                        }
                        // End:0x362
                        if(bCheatAllUnlocked)
                        {
                            bLocked = false;
                        }
                        categorySlot = int(ObjectiveObj.BestiaryCategory);
                        InitCollectible(categorySlot, foundIdx, ObjectiveObj.Description, AkridDNAIconName, bLocked, false);
                    }
                }
                ObjectiveIdx++;
                // [Loop Continue]
                goto J0x178;
            }
            QuestIdx++;
            // [Loop Continue]
            goto J0x138;
        }
    }
    I = 0;
    J0x401:

    // End:0x45D [Loop If]
    if(I < ViewWidgets.Length)
    {
        // End:0x44F
        if(ViewWidgets[I] != none)
        {
            RefreshView(ViewWidgets[I]);
        }
        I++;
        // [Loop Continue]
        goto J0x401;
    }
    bCollectiblesInitialized = true;
    //return;    
}

function RefreshView()
{
    local /*0x97E50000-0x00000000*/ private @NULL ViewWidget[8388609];

    // End:0x6E
    if(ViewWidget != none)
    {
        ViewWidget.ActionScriptVoid("SpawnIcons");
        ViewWidget.ActionScriptVoid("SetInitialSelection");
    }
    //return;    
}

function InitCollectible()
{
    local /*0x97E50000-0x00000000*/ private int Type[8388609], Index;
    local /*0x97E50000-0x00000000*/ private editfixedsize string FriendlyName[8388609], HUDIconName;
    local /*0x97E50000-0x00000000*/ private bool bLocked[8388609], bPartialComplete;

    // End:0x3F
    if(BestiaryViewMC != none)
    {
        BestiaryViewMC.ActionScriptVoid("InitCollectible");
    }
    //return;    
}

function SetCurrentCollectible()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleSlotNum[8388609], CollectibleIndex;
    local /*0x97E50000-0x00000000*/ private @NULL GameSeq;
    local /*0x97E50000-0x00000000*/ private editfixedsize array EventsToActivate, ActivateIndices;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    switch(CollectibleSlotNum)
    {
        // End:0x2D
        case 0:
            UpdateSmallAkridInfo(CollectibleIndex);
            // End:0x80
            break;
        // End:0x47
        case 1:
            UpdateMediumAkridInfo(CollectibleIndex);
            // End:0x80
            break;
        // End:0x62
        case 2:
            UpdateLargeAkridInfo(CollectibleIndex);
            // End:0x80
            break;
        // End:0x7D
        case 3:
            UpdateGiantAkridInfo(CollectibleIndex);
            // End:0x80
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x3E7
    if(bEnableModelView && CollectibleIndex >= 0)
    {
        LPPC = LPPlayerController(Outer.GetPC());
        LPPC.BestiaryItemSlot = CollectibleSlotNum;
        LPPC.BestiaryItemIndex = CollectibleIndex;
        // End:0x272
        if(CollectibleSlotNum != PrevCollectibleSlotNum)
        {
            GameSeq = Outer.GetPC().WorldInfo.GetGameSequence();
            // End:0x26F
            if(GameSeq != none)
            {
                GameSeq.FindSeqObjectsByClass(Class'LPSeqEvent_BestiaryCategorySelected', true, EventsToActivate);
                I = 0;
                J0x1D7:

                // End:0x26F [Loop If]
                if(I < EventsToActivate.Length)
                {
                    SequenceEvent(EventsToActivate[I]).CheckActivate(Outer.GetPC().WorldInfo, none, false, ActivateIndices);
                    I++;
                    // [Loop Continue]
                    goto J0x1D7;
                }
            }            
        }
        else
        {
            // End:0x3C1
            if(CollectibleIndex != PrevCollectibleIndex)
            {
                GameSeq = Outer.GetPC().WorldInfo.GetGameSequence();
                // End:0x3C1
                if(GameSeq != none)
                {
                    GameSeq.FindSeqObjectsByClass(Class'LPSeqEvent_BestiaryItemSelected', true, EventsToActivate);
                    I = 0;
                    J0x329:

                    // End:0x3C1 [Loop If]
                    if(I < EventsToActivate.Length)
                    {
                        SequenceEvent(EventsToActivate[I]).CheckActivate(Outer.GetPC().WorldInfo, none, false, ActivateIndices);
                        I++;
                        // [Loop Continue]
                        goto J0x329;
                    }
                }
            }
        }
        PrevCollectibleSlotNum = CollectibleSlotNum;
        PrevCollectibleIndex = CollectibleIndex;
    }
    //return;    
}

function UpdateSmallAkridInfo()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleIndex[8388609];

    // End:0xB0
    if((CollectibleIndex >= 0) && CollectibleIndex < Small_DNATags.Length)
    {
        UpdateInfo(string(Small_DNATags[CollectibleIndex].NameID), Small_DNATags[CollectibleIndex].Description, Small_DNATags[CollectibleIndex].LongDescription);        
    }
    else
    {
        UpdateInfo("", "", "");
    }
    //return;    
}

function UpdateMediumAkridInfo()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleIndex[8388609];

    // End:0xB0
    if((CollectibleIndex >= 0) && CollectibleIndex < Medium_DNATags.Length)
    {
        UpdateInfo(string(Medium_DNATags[CollectibleIndex].NameID), Medium_DNATags[CollectibleIndex].Description, Medium_DNATags[CollectibleIndex].LongDescription);        
    }
    else
    {
        UpdateInfo("", "", "");
    }
    //return;    
}

function UpdateLargeAkridInfo()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleIndex[8388609];

    // End:0xB0
    if((CollectibleIndex >= 0) && CollectibleIndex < Large_DNATags.Length)
    {
        UpdateInfo(string(Large_DNATags[CollectibleIndex].NameID), Large_DNATags[CollectibleIndex].Description, Large_DNATags[CollectibleIndex].LongDescription);        
    }
    else
    {
        UpdateInfo("", "", "");
    }
    //return;    
}

function UpdateGiantAkridInfo()
{
    local /*0x97E50000-0x00000000*/ private int CollectibleIndex[8388609];

    // End:0xB0
    if((CollectibleIndex >= 0) && CollectibleIndex < Giant_DNATags.Length)
    {
        UpdateInfo(string(Giant_DNATags[CollectibleIndex].NameID), Giant_DNATags[CollectibleIndex].Description, Giant_DNATags[CollectibleIndex].LongDescription);        
    }
    else
    {
        UpdateInfo("", "", "");
    }
    //return;    
}

function UpdateInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string NameID[8388609], Title, Desc;

    // End:0x38
    if(TitleLabel != none)
    {
        TitleLabel.SetText(Title);
    }
    // End:0x70
    if(DescriptionLabel != none)
    {
        DescriptionLabel.SetText(Desc);
    }
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
        // End:0x41
        case 'BestiaryView':
            BestiaryViewMC = Widget;
            // End:0x4AB
            break;
        // End:0x66
        case 'CatSView':
            ViewWidgets.AddItem(Widget);            
            // End:0x4AB
            break;
        // End:0x8B
        case 'CatMView':
            ViewWidgets.AddItem(Widget);            
            // End:0x4AB
            break;
        // End:0xB0
        case 'CatLView':
            ViewWidgets.AddItem(Widget);            
            // End:0x4AB
            break;
        // End:0xD5
        case 'CatGView':
            ViewWidgets.AddItem(Widget);            
            // End:0x4AB
            break;
        // End:0x14F
        case 'b1':
            Widget.SetString("label", "<Strings:LostPlanetGame.Bestiary.CatSViewTitle>");
            FirstFocus = Widget;
            // End:0x4AB
            break;
        // End:0x1B6
        case 'b2':
            Widget.SetString("label", "<Strings:LostPlanetGame.Bestiary.CatMViewTitle>");
            // End:0x4AB
            break;
        // End:0x21D
        case 'b3':
            Widget.SetString("label", "<Strings:LostPlanetGame.Bestiary.CatLViewTitle>");
            // End:0x4AB
            break;
        // End:0x284
        case 'b4':
            Widget.SetString("label", "<Strings:LostPlanetGame.Bestiary.CatGViewTitle>");
            // End:0x4AB
            break;
        // End:0x2E9
        case 'TitleString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.Bestiary>"));
            // End:0x4AB
            break;
        // End:0x34D
        case 'ConfirmString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"));
            // End:0x4AB
            break;
        // End:0x3AE
        case 'BackString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
            // End:0x4AB
            break;
        // End:0x411
        case 'SelectString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonSelect>"));
            // End:0x4AB
            break;
        // End:0x455
        case 'TitleLabel':
            TitleLabel = Widget;
            Widget.SetText("");
            // End:0x4AB
            break;
        // End:0x499
        case 'DescriptionLabel':
            DescriptionLabel = Widget;
            Widget.SetText("");
            // End:0x4AB
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x4AB
            break;
            break;
    }
    // End:0x4ED
    if(!bWasHandled)
    {
        bWasHandled = super.WidgetInitialized(WidgetName, WidgetPath, Widget);        
    }
    return bWasHandled;
    //return ReturnValue;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2D
    if(super.FilterButtonInput(ControllerId, ButtonName, InputEvent) == true)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    AkridDNAIconName="iconAkridDNA"
}