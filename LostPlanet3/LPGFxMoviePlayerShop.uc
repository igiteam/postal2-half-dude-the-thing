class LPGFxMoviePlayerShop extends SPGFxMoviePlayer
    config(UI);

struct ShopDataStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ShopType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ShopQuestChainName;

    structdefaultproperties
    {
        ShopType=EShopTypes.EShopTypes_Gale
        ShopQuestChainName=""
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ListMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ShopTypeLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DialogHeaderLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DialogBodyLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DialogBalanceLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ShopItems;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentItemIdx;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentlyPurchasingShopItemObj;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentlyPurchasingShopItemType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ShopType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ShopCurrencyType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ShopQuestChainName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ShopData[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bClosing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ShopSequenceAction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SkipSelectSounds;

function Start()
{
    local /*0x97E50000-0x00000000*/ private bool StartPaused[9437185], ReturnValue;

    false
    super.Start();
    Advance(0.0000000);    
    GetPC().ConsoleCommand("HideLPHUD 1");
    bClosing = false;
    PlaySoundFromTheme('Enter');
    return true;
    //return ReturnValue;    
}

function SetShopType()
{
    local /*0x97E50000-0x00000000*/ private byte InShopType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string enumString;
    local /*0x97E50000-0x00000000*/ private int I;

    ShopType = InShopType;
    enumString = string(GetEnum(Enum'LPTypes.EShopTypes', int(InShopType)));
    ASSetShopType(enumString);
    UpdateShopTypeLabel(ShopType);
    ShopQuestChainName = "";
    I = 0;
    J0x7A:

    // End:0x10B [Loop If]
    if(I < ShopData.Length)
    {
        // End:0xFD
        if(int(ShopData[I].ShopType) == int(ShopType))
        {
            ShopQuestChainName = ShopData[I].ShopQuestChainName;
            // [Explicit Break]
            goto J0x10B;
        }
        I++;
        // [Loop Continue]
        goto J0x7A;
    }
    J0x10B:

    //return;    
}

function SetShopKismetAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL InShopAction[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL DDS;
    local /*0x97E50000-0x00000000*/ private bool bNewItemsFound;

    ShopSequenceAction = InShopAction;
    I = 0;
    J0x1E:

    // End:0xC1 [Loop If]
    if(I < ShopItems.Length)
    {
        DDS = LPQDD_ObjectiveShopItem(ShopItems[I].DynamicData);
        // End:0xB3
        if(DDS != none)
        {
            // End:0xB3
            if(!DDS.bItemViewedInShop)
            {
                bNewItemsFound = true;
                // [Explicit Break]
                goto J0xC1;
            }
        }
        I++;
        // [Loop Continue]
        goto J0x1E;
    }
    J0xC1:

    UpdateShopListDataProvider();
    ShopSequenceAction.StartShop(bNewItemsFound);
    //return;    
}

function UpdateShopTypeLabel()
{
    local /*0x97E50000-0x00000000*/ private byte InShopType[8388609];

    switch(ShopType)
    {
        // End:0x8A
        case 0:
            ShopTypeLabel.GetObject("textField").SetText("<Strings:LostPlanetGame.Shop.GalesWorkshop>");
            // End:0x1F0
            break;
        // End:0xFD
        case 1:
            ShopTypeLabel.GetObject("textField").SetText("<Strings:LostPlanetGame.Shop.NEVECShop>");
            // End:0x1F0
            break;
        // End:0x175
        case 2:
            ShopTypeLabel.GetObject("textField").SetText("<Strings:LostPlanetGame.Shop.SnowPirateShop>");
            // End:0x1F0
            break;
        // End:0x1ED
        case 3:
            ShopTypeLabel.GetObject("textField").SetText("<Strings:LostPlanetGame.Shop.EthologistShop>");
            // End:0x1F0
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function ASSetShopType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InShopTypeString[8388609];

    ActionScriptVoid("SetShopType");
    //return;    
}

function SetShopCurrencyType()
{
    local /*0x97E50000-0x00000000*/ private byte InShopCurrencyType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string enumString;

    enumString = string(GetEnum(Enum'LPTypes.ECurrencyType', int(InShopCurrencyType)));
    ASSetShopCurrencyType(enumString);
    //return;    
}

function ASSetShopCurrencyType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InShopCurrencyTypeString[8388609];

    ActionScriptVoid("SetShopCurrencyType");
    //return;    
}

function DebugAction()
{
    local /*0x97E50000-0x00000000*/ private int Mode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore, QM;
    local /*0x97E50000-0x00000000*/ private name ShopName;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ShopQuests;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private int QuestIdx;

    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    ShopName = name(ShopQuestChainName);
    // End:0x16E
    if(Mode == 1)
    {
        // End:0x16B
        if(GameDataStore.QuestManager != none)
        {
            QM = GameDataStore.QuestManager;
            QM.QuestTuneDataContainer.GetAllQuestsInChain(ShopName, ShopQuests);
            QuestIdx = 0;
            J0x112:

            // End:0x16B [Loop If]
            if(QuestIdx < ShopQuests.Length)
            {
                QM.ForceUnlockAllObjectives(ShopQuests[QuestIdx]);
                QuestIdx++;
                // [Loop Continue]
                goto J0x112;
            }
        }        
    }
    else
    {
        // End:0x20D
        if(Mode == 3)
        {
            LPPC = LPPlayerController(GetPC());
            LPPC.UsedCurrency(1, -10000.0000000);
            LPPC.UsedCurrency(0, -10000.0000000);
            LPPC.UsedCurrency(2, -10000.0000000);
        }
    }
    UpdateShopListDataProvider();
    UpdateBalanceDisplay();
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    // End:0x1B
    if(bClosing)
    {
        return true;
    }
    // End:0x6D
    if(((ButtonName == 'XboxTypeS_A') || ButtonName == 'Enter') && int(InputEvent) == int(2))
    {
        Retval = true;
    }
    // End:0x185
    if(bDebugMode)
    {
        // End:0xBC
        if(ButtonName == 'XboxTypeS_A')
        {
            // End:0xB0
            if(int(InputEvent) == int(0))
            {
                DebugAction(1);
            }
            Retval = true;
        }
        // End:0xFF
        if(ButtonName == 'XboxTypeS_B')
        {
            // End:0xF3
            if(int(InputEvent) == int(0))
            {
                DebugAction(2);
            }
            Retval = true;
        }
        // End:0x142
        if(ButtonName == 'XboxTypeS_X')
        {
            // End:0x136
            if(int(InputEvent) == int(0))
            {
                DebugAction(3);
            }
            Retval = true;
        }
        // End:0x185
        if(ButtonName == 'XboxTypeS_Y')
        {
            // End:0x179
            if(int(InputEvent) == int(0))
            {
                DebugAction(4);
            }
            Retval = true;
        }
    }
    return Retval;
    //return ReturnValue;    
}

function GoToPrompt()
{
    ActionScriptVoid("GoToPrompt");
    //return;    
}

function UpdateBalanceDisplay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize string S;
    local /*0x97E50000-0x00000000*/ private int Amount, ListIndex, ItemIndex;
    local /*0x97E50000-0x00000000*/ private bool bSufficientBalance;
    local /*0x97E50000-0x00000000*/ private @NULL LPSI, Data;
    local /*0x97E50000-0x00000000*/ private int Cost;
    local /*0x97E50000-0x00000000*/ private editfixedsize string balanceMsg;

    LPPC = LPPlayerController(GetPC());
    ListIndex = int(ListMC.GetFloat("selectedIndex"));
    bSufficientBalance = true;
    // End:0x24F
    if((ListIndex >= 0) && ListIndex < ShopItems.Length)
    {
        Data = ListMC.GetObject("dataProvider").GetElementObject(ListIndex);
        ItemIndex = int(Data.GetFloat("ShopItemObjectiveIndex"));
        LPSI = LPShopInterface(ShopItems[ItemIndex].ItemTuneData.ShopInterface);
        // End:0x24F
        if(LPSI != none)
        {
            // End:0x24F
            if(int(LPSI.CanPurchase(LPPC, ShopItems[ItemIndex])) != int(4))
            {
                Cost = LPSI.GetPurchaseCost(LPPC, ShopItems[ItemIndex]);
                bSufficientBalance = LPPC.HasEnoughCurrency(ShopCurrencyType, float(Cost));
            }
        }
    }
    Amount = int(LPPC.GetCurrencyAmount(ShopCurrencyType));
    S = S $ string(Amount);
    balanceMsg = ((bSufficientBalance) ? "" : GetLocalizedString("<Strings:LostPlanetGame.Shop.InsufficientBalance>"));
    ASUpdateBalanceDisplay(S, bSufficientBalance, balanceMsg);
    //return;    
}

function ASUpdateBalanceDisplay()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string balanceString[8388609];
    local /*0x97E50000-0x00000000*/ private bool bSufficientBalance[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string balanceMsg[8388609];

    ActionScriptVoid("UpdateBalanceDisplay");
    //return;    
}

function SetUpPurchasePromptStrings()
{
    // End:0x8F
    if(CurrentlyPurchasingShopItemObj != none)
    {
        // End:0x8F
        if(DialogBodyLabel != none)
        {
            DialogBodyLabel.GetObject("textField").SetText("<Strings:LostPlanetGame.Shop.ConfirmPurchase>");
        }
    }
    //return;    
}

function SetUpPurchaseConfirmStrings()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPSI, LPPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize string S;
    local /*0x97E50000-0x00000000*/ private int Amount;

    // End:0x221
    if(CurrentlyPurchasingShopItemObj != none)
    {
        LPPC = LPPlayerController(GetPC());
        LPSI = LPShopInterface(CurrentlyPurchasingShopItemObj.ItemTuneData.ShopInterface);
        // End:0xF1
        if(DialogBodyLabel != none)
        {
            DialogBodyLabel.GetObject("textField").SetText("<Strings:LostPlanetGame.Shop.InventoryAdded>");
        }
        // End:0x173
        if(DialogHeaderLabel != none)
        {
            DialogHeaderLabel.GetObject("textField").SetText(LPSI.GetItemTitle(LPPC, CurrentlyPurchasingShopItemObj));
        }
        // End:0x221
        if(DialogBalanceLabel != none)
        {
            Amount = int(LPPC.GetCurrencyAmount(ShopCurrencyType));
            S = S $ string(Amount);
            DialogBalanceLabel.GetObject("textField").SetText(S);
        }
    }
    //return;    
}

function NotifyDialogShown()
{
    local /*0x97E50000-0x00000000*/ private @NULL confirmDialogClip[8388609], LPPC;
    local /*0x97E50000-0x00000000*/ private int InitialQuantity, UnitCost, Balance, MaxQuantity;
    local /*0x97E50000-0x00000000*/ private @NULL LPSI, TuneData;

    LPPC = LPPlayerController(GetPC());
    // End:0x205
    if(confirmDialogClip != none)
    {
        Balance = int(LPPC.GetCurrencyAmount(ShopCurrencyType));
        TuneData = CurrentlyPurchasingShopItemObj.ItemTuneData;
        LPSI = LPShopInterface(TuneData.ShopInterface);
        InitialQuantity = LPSI.GetQuantity(LPPC, CurrentlyPurchasingShopItemObj);
        UnitCost = LPSI.GetPurchaseCost(LPPC, CurrentlyPurchasingShopItemObj);
        MaxQuantity = ((CurrentlyPurchasingShopItemObj.bRepeatablePurchase) ? 999 : 1);
        ASInitDialogQuantityDisplay(GetLocalizedString("<Strings:LostPlanetGame.Shop.Quantity>"), InitialQuantity, MaxQuantity, GetLocalizedString("<Strings:LostPlanetGame.Shop.Cost>"), UnitCost, Balance);
        PlaySoundFromTheme('Prompt');
    }
    //return;    
}

function ASInitDialogQuantityDisplay()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string QuantityLabel[8388609];
    local /*0x97E50000-0x00000000*/ private int Quantity[8388609], MaxQuantity;
    local /*0x97E50000-0x00000000*/ private editfixedsize string CostLabel[8388609];
    local /*0x97E50000-0x00000000*/ private int UnitCost[8388609], Balance;

    ActionScriptVoid("InitDialogQuantityDisplay");
    //return;    
}

function NotifyDialogClosed()
{
    ClearDialogAssetPointers();
    SetSelectionToNextPurchasableItem();
    //return;    
}

function NotifyDialogCanceled()
{
    ClearDialogAssetPointers();
    PlaySoundFromTheme('buyCancel');
    //return;    
}

function SetSelectionToNextPurchasableItem()
{
    local /*0x97E50000-0x00000000*/ private int ItemIndex, CurrentIndex, StartingIndex;
    local /*0x97E50000-0x00000000*/ private bool bDone;
    local /*0x97E50000-0x00000000*/ private @NULL Data, LPSI;

    CurrentIndex = int(ListMC.GetFloat("selectedIndex"));
    // End:0x5D
    if((CurrentIndex < 0) || ShopItems.Length <= 0)
    {
        return;
    }
    StartingIndex = CurrentIndex;
    bDone = false;
    J0x7C:

    // End:0x21D [Loop If]
    if(!bDone)
    {
        Data = ListMC.GetObject("dataProvider").GetElementObject(CurrentIndex);
        ItemIndex = int(Data.GetFloat("ShopItemObjectiveIndex"));
        LPSI = LPShopInterface(ShopItems[ItemIndex].ItemTuneData.ShopInterface);
        // End:0x1C9
        if(int(LPSI.CanPurchase(LPPlayerController(GetPC()), ShopItems[ItemIndex])) == int(0))
        {
            // [Explicit Break]
            goto J0x21D;
        }
        CurrentIndex++;
        // End:0x1F7
        if(CurrentIndex >= ShopItems.Length)
        {
            CurrentIndex = 0;
        }
        // End:0x21A
        if(CurrentIndex == StartingIndex)
        {
            bDone = true;
        }
        // [Loop Continue]
        goto J0x7C;
    }
    J0x21D:

    // End:0x265
    if(!bDone)
    {
        ListMC.SetFloat("selectedIndex", float(CurrentIndex));
    }
    //return;    
}

function ClearDialogAssetPointers()
{
    DialogHeaderLabel = none;
    DialogBodyLabel = none;
    //return;    
}

function NotifyDialogConfirmed()
{
    local /*0x97E50000-0x00000000*/ private float Quantity[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    PlaySoundFromTheme('buySuccess');
    SetUpPurchaseConfirmStrings();
    I = 0;
    J0x29:

    // End:0x75 [Loop If]
    if(float(I) < Quantity)
    {
        CurrentlyPurchasingShopItemObj.AdjustQuestProgress(1.0000000, true);
        I++;
        // [Loop Continue]
        goto J0x29;
    }
    ShopSequenceAction.PurchasedItem(CurrentlyPurchasingShopItemObj);
    CheckForShopAchievement(CurrentlyPurchasingShopItemObj);
    UpdateShopListDataProvider(true);
    UpdateBalanceDisplay();
    //return;    
}

function CheckForShopAchievement()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShopItemObjective[8388609], MyPC, AchievementManager;
    local /*0x97E50000-0x00000000*/ private name PackageName;

    PackageName = ShopItemObjective.GetPackageName();
    // End:0x1EA
    if(PackageName == 'TuneData_Shop')
    {
        MyPC = LPPlayerController(GetPC());
        // End:0x1E7
        if(MyPC != none)
        {
            AchievementManager = MyPC.GetAchievementManager();
            // End:0x1E7
            if(AchievementManager != none)
            {
                // End:0x168
                if((LPTuneDataUpgradeBase(ShopItemObjective.ItemTuneData) != none) && LPTuneDataUpgradeBase(ShopItemObjective.ItemTuneData).bIsVSUpgrade)
                {
                    AchievementManager.IncrementAchievementValue('Home_Improvement');
                    AchievementManager.IncrementAchievementValue('Big_Spender');                    
                }
                else
                {
                    // End:0x1E7
                    if(SPTuneDataBaseWeaponUpgrade(ShopItemObjective.ItemTuneData) != none)
                    {
                        AchievementManager.IncrementAchievementValue('Armed_and_Dangerous');
                        AchievementManager.IncrementAchievementValue('Big_Spender');
                    }
                }
            }
        }        
    }
    //return;    
}

function CancelShop()
{
    // End:0x0F
    if(bClosing)
    {
        return;
    }
    bClosing = true;
    GoToOutro();
    //return;    
}

function GoToOutro()
{
    ActionScriptVoid("GoToOutro");
    //return;    
}

function ShopOutroComplete()
{
    EndSPGFxMoviePlayer();
    //return;    
}

function EndSPGFxMoviePlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    super.EndSPGFxMoviePlayer();
    ClearNewItemStatus();
    LPPC = LPPlayerController(GetPC());    
    LPPC.ConsoleCommand("HideLPHUD 0");
    PlaySoundFromTheme('Exit');
    LPPC.ShopFinished(ShopSequenceAction);
    ShopSequenceAction.StopShop();
    ShopSequenceAction = none;
    //return;    
}

function UpdateShopListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private bool bRefresh[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL TempObj, DataProvider, GameDataStore, QM, SQ;

    local /*0x97E50000-0x00000000*/ private int QuestIdx, ObjectiveIdx, FoundItemIdx;
    local /*0x97E50000-0x00000000*/ private @NULL ShopItemObj, LPSI, LPPC, DDS;
    local /*0x97E50000-0x00000000*/ private name ShopName;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ShopQuests;
    local /*0x97E50000-0x00000000*/ private bool bFoundCurrencyType;
    local /*0x97E50000-0x00000000*/ private float statPercent;
    local /*0x97E50000-0x00000000*/ private int StatIdx;
    local /*0x97E50000-0x00000000*/ private @NULL TuneData, TDUnloaded, TDUnloadedAmmo, TDScrap;
    local /*0x97E50000-0x00000000*/ private byte purchaseResult;
    local /*0x97E50000-0x00000000*/ private editfixedsize string IconNameString;
    local /*0x97E50000-0x00000000*/ private int QuantityOwned;

    false
    // End:0x16
    if(ListMC == none)
    {
        return;
    }
    LPPC = LPPlayerController(GetPC());
    FoundItemIdx = 0;
    DataProvider = CreateArray();
    ShopItems.Length = 0;
    ShopName = name(ShopQuestChainName);
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x10BB
    if(GameDataStore.QuestManager != none)
    {
        QM = GameDataStore.QuestManager;
        QM.QuestTuneDataContainer.GetAllQuestsInChain(ShopName, ShopQuests);
        QuestIdx = 0;
        J0x161:

        // End:0x10BB [Loop If]
        if(QuestIdx < ShopQuests.Length)
        {
            SQ = LPQO_Shop(ShopQuests[QuestIdx]);
            // End:0x10AD
            if(SQ != none)
            {
                // End:0x211
                if(!bFoundCurrencyType)
                {
                    ShopCurrencyType = SQ.currencyType;
                    bFoundCurrencyType = true;
                    // End:0x211
                    if(int(ShopType) == int(0))
                    {
                        ShopCurrencyType = 1;
                    }
                }
                ObjectiveIdx = 0;
                J0x21C:

                // End:0x10AD [Loop If]
                if(ObjectiveIdx < SQ.Objectives.Length)
                {
                    ShopItemObj = LPQO_ObjectiveShopItem(SQ.Objectives[ObjectiveIdx]);
                    // End:0x109F
                    if(ShopItemObj != none)
                    {
                        // End:0x109F
                        if(ShopItemObj.ItemTuneData != none)
                        {
                            TuneData = ShopItemObj.ItemTuneData;
                            LPSI = LPShopInterface(TuneData.ShopInterface);
                            // End:0x109F
                            if((LPSI != none) && LPSI.ShouldDisplayInShop(LPPC, ShopItemObj))
                            {
                                TempObj = CreateObject("Object");
                                DDS = LPQDD_ObjectiveShopItem(ShopItemObj.DynamicData);
                                // End:0x3FC
                                if(DDS != none)
                                {
                                    TempObj.SetBool("newItem", !DDS.bItemViewedInShop);
                                }
                                ShopItems.AddItem(ShopItemObj);                                
                                TempObj.SetString("item", LPSI.GetItemTitle(LPPC, ShopItemObj));
                                TempObj.SetString("description", GetLocalizedString(LPSI.GetItemDescription(LPPC, ShopItemObj)));
                                TDUnloaded = LPTuneDataUnloadedWeaponInfo(TuneData);
                                // End:0x564
                                if(TDUnloaded != none)
                                {
                                    IconNameString = GetUILoaderPathForTexture(TDUnloaded.HUDIconTexture);
                                    TempObj.SetString("iconName", IconNameString);                                    
                                }
                                else
                                {
                                    IconNameString = GetUILoaderPathForTextureFromPathName(LPSI.IconTextureString);
                                    TempObj.SetString("iconName", IconNameString);
                                }
                                TempObj.SetBool("owned", false);
                                TempObj.SetFloat("quantity", 0.0000000);
                                TempObj.SetFloat("sortValue", -2.0000000);
                                // End:0x897
                                if(ShopItemObj.bRepeatablePurchase)
                                {
                                    TDUnloadedAmmo = LPTuneDataUnloadedAmmoInfo(TuneData);
                                    // End:0x796
                                    if(TDUnloadedAmmo != none)
                                    {
                                        QuantityOwned = LPPC.GetAmmoCountInMunitionsLockerFromString(TDUnloadedAmmo.AmmoTypeString);
                                        QuantityOwned += (GetWeaponAmmoFromAmmoTypeString(TDUnloadedAmmo.AmmoTypeString));
                                        TempObj.SetFloat("quantity", float(QuantityOwned));
                                        TempObj.SetFloat("sortValue", float(((QuantityOwned == 0) ? -2 : QuantityOwned)));                                        
                                    }
                                    else
                                    {
                                        TDScrap = LPTuneDataShopItemScrap(TuneData);
                                        // End:0x86D
                                        if(TDScrap != none)
                                        {
                                            QuantityOwned = int(LPPC.GetCurrencyAmount(1));
                                            TempObj.SetFloat("quantity", float(QuantityOwned));
                                            TempObj.SetFloat("sortValue", float(((QuantityOwned == 0) ? -2 : QuantityOwned)));
                                        }
                                    }
                                    TempObj.SetBool("owned", false);                                    
                                }
                                else
                                {
                                    TempObj.SetBool("owned", false);
                                    TempObj.SetFloat("quantity", 0.0000000);
                                    TempObj.SetFloat("sortValue", -2.0000000);
                                    TempObj.SetBool("redStatus", false);
                                }
                                purchaseResult = LPSI.CanPurchase(LPPC, ShopItemObj);
                                switch(purchaseResult)
                                {
                                    // End:0x99C
                                    case 0:
                                        // End:0xC07
                                        break;
                                    // End:0xA30
                                    case 1:
                                        TempObj.SetString("itemStatusMsg", "<Strings:LostPlanetGame.Shop.NotEnoughResources>");
                                        TempObj.SetBool("redStatus", true);
                                        // End:0xC07
                                        break;
                                    // End:0xA92
                                    case 2:
                                        TempObj.SetString("itemStatusMsg", "<Strings:LostPlanetGame.Shop.MaxCapacity>");
                                        // End:0xC07
                                        break;
                                    // End:0xB20
                                    case 3:
                                        TempObj.SetString("itemStatusMsg", "<Strings:LostPlanetGame.Shop.WeaponLocked>");
                                        TempObj.SetBool("redStatus", true);
                                        // End:0xC07
                                        break;
                                    // End:0xC04
                                    case 4:
                                        TempObj.SetString("itemStatusMsg", "<Strings:LostPlanetGame.Shop.Purchased>");
                                        TempObj.SetBool("owned", true);
                                        TempObj.SetFloat("quantity", 1.0000000);
                                        TempObj.SetFloat("sortValue", -1.0000000);
                                        // End:0xC07
                                        break;
                                    // End:0xFFFF
                                    default:
                                        break;
                                }
                                TempObj.SetFloat("cost", float(LPSI.GetPurchaseCost(LPPC, ShopItemObj)));
                                TempObj.SetString("iconType", string(LPSI.ShopItemType));
                                TempObj.SetBool("bShowStats", false);
                                StatIdx = 0;
                                J0xCE0:

                                // End:0x1021 [Loop If]
                                if(StatIdx < 3)
                                {
                                    // End:0xF50
                                    if(TuneData.ShopItemAttributes.Length > StatIdx)
                                    {
                                        TempObj.SetBool("bShowStats", true);
                                        statPercent = float(TuneData.ShopItemAttributes[StatIdx].InitialValue);
                                        statPercent = statPercent / 100.0000000;
                                        statPercent = FClamp(statPercent, 0.0000000, 1.0000000);
                                        TempObj.SetFloat("statValue" $ string(StatIdx + 1), statPercent);
                                        statPercent = float(TuneData.ShopItemAttributes[StatIdx].UpgradeValue);
                                        statPercent = statPercent / 100.0000000;
                                        statPercent = FClamp(statPercent, 0.0000000, 1.0000000);
                                        TempObj.SetFloat("statUpgradeValue" $ string(StatIdx + 1), statPercent);
                                        TempObj.SetString("statString" $ string(StatIdx + 1), TuneData.ShopItemAttributes[StatIdx].AttributeName);                                        
                                    }
                                    else
                                    {
                                        TempObj.SetFloat("statValue" $ string(StatIdx + 1), 0.0000000);
                                        TempObj.SetFloat("statUpgradeValue" $ string(StatIdx + 1), 0.0000000);
                                        TempObj.SetString("statString" $ string(StatIdx + 1), "");
                                    }
                                    StatIdx++;
                                    // [Loop Continue]
                                    goto J0xCE0;
                                }
                                TempObj.SetFloat("ShopItemObjectiveIndex", float(FoundItemIdx));
                                DataProvider.SetElementObject(FoundItemIdx, TempObj);
                                FoundItemIdx++;
                            }
                        }
                    }
                    ObjectiveIdx++;
                    // [Loop Continue]
                    goto J0x21C;
                }
            }
            QuestIdx++;
            // [Loop Continue]
            goto J0x161;
        }
    }
    ListMC.SetObject("dataProvider", DataProvider);
    // End:0x1133
    if(!bRefresh)
    {
        ListMC.SetFloat("selectedIndex", 0.0000000);
    }
    ASShowInitialItem();
    ListMC.SetString("wrapping", ((FoundItemIdx > 0) ? "wrap" : "normal"));
    SetShopCurrencyType(ShopCurrencyType);
    //return;    
}

function GetWeaponAmmoFromAmmoTypeString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string AmmoTypeString[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPP;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL W;

    LPPC = LPPlayerController(GetPC());
    // End:0x55
    if(LPPC != none)
    {
        LPP = LPPC.GetMyPlayerPawn();
    }
    // End:0x244
    if(LPP != none)
    {
        // End:0x243
        foreach LPP.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', W)
        {
            // End:0xE6
            if((W == none) || W.TuneDataBaseWeapon == none)
            {
                continue;                
            }
            I = 0;
            J0xF1:

            // End:0x242 [Loop If]
            if(I < W.TuneDataBaseWeapon.SupportedAmmoTypes.Length)
            {
                // End:0x234
                if(((string(W.TuneDataBaseWeapon.SupportedAmmoTypes[I].Name) == AmmoTypeString) && W.AmmoTypes.Length > I) && W.AmmoTypes[I] != none)
                {                    
                    return W.AmmoTypes[I].GetTotalAmmo();
                }
                I++;
                // [Loop Continue]
                goto J0xF1;
            }            
        }        
    }
    return 0;
    //return ReturnValue;    
}

function ASShowInitialItem()
{
    ActionScriptVoid("ShowInitialItem");
    //return;    
}

function ClearNewItemStatus()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL DDS;

    I = 0;
    J0x0B:

    // End:0x9C [Loop If]
    if(I < ShopItems.Length)
    {
        DDS = LPQDD_ObjectiveShopItem(ShopItems[I].DynamicData);
        // End:0x8E
        if(DDS != none)
        {
            DDS.bItemViewedInShop = true;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

private final function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int ListIndex, ItemIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Data, LPSI;

    ListIndex = ev.Index;
    // End:0x1E7
    if((ListIndex >= 0) && ListIndex < ShopItems.Length)
    {
        Data = ListMC.GetObject("dataProvider").GetElementObject(ListIndex);
        ItemIndex = int(Data.GetFloat("ShopItemObjectiveIndex"));
        CurrentlyPurchasingShopItemObj = ShopItems[ItemIndex];
        CurrentlyPurchasingShopItemType = Data.GetString("iconType");
        LPSI = LPShopInterface(CurrentlyPurchasingShopItemObj.ItemTuneData.ShopInterface);
        // End:0x1D3
        if(int(LPSI.CanPurchase(LPPlayerController(GetPC()), CurrentlyPurchasingShopItemObj)) == int(0))
        {
            GoToPrompt();            
        }
        else
        {
            PlaySoundFromTheme('buyError');
        }
    }
    //return;    
}

function OnListChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x1E
    if(SkipSelectSounds < 2)
    {
        SkipSelectSounds++;        
    }
    else
    {
        PlaySoundFromTheme('Select');
    }
    UpdateBalanceDisplay();
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
        // End:0xD1
        case 'List':
            // End:0xCE
            if(ListMC == none)
            {
                ListMC = GFxClikWidget(Widget);
                ListMC.AddEventListener('CLIK_itemPress', OnListItemPress);
                ListMC.AddEventListener('CLIK_change', OnListChange);
            }
            // End:0x869
            break;
        // End:0x137
        case 'Title':
            ShopTypeLabel = Widget;
            Widget.GetObject("textField").SetText("");
            // End:0x869
            break;
        // End:0x191
        case 'typeHeader':
            Widget.SetString("label", "<Strings:LostPlanetGame.Shop.Type>");
            // End:0x869
            break;
        // End:0x1EB
        case 'itemHeader':
            Widget.SetString("label", "<Strings:LostPlanetGame.Shop.Item>");
            // End:0x869
            break;
        // End:0x246
        case 'qtyHeader':
            Widget.SetString("label", "<Strings:LostPlanetGame.Shop.Owned>");
            // End:0x869
            break;
        // End:0x2A0
        case 'costHeader':
            Widget.SetString("label", "<Strings:LostPlanetGame.Shop.Cost>");
            // End:0x869
            break;
        // End:0x316
        case 'statHdrTxt':
            Widget.GetObject("textField").SetText("<Strings:LostPlanetGame.Shop.Stats>");
            // End:0x869
            break;
        // End:0x399
        case 'statTxt':
            // End:0x356
            if(InStr(string(WidgetPath), "itemYourBalance") >= 0)
            {
                UpdateBalanceDisplay();                
            }
            else
            {
                // End:0x396
                if(InStr(string(WidgetPath), "itemBalance") >= 0)
                {
                    DialogBalanceLabel = Widget;
                    SetUpPurchaseConfirmStrings();
                }
            }
            // End:0x869
            break;
        // End:0x4C7
        case 'statTxtLeft':
            // End:0x438
            if(InStr(string(WidgetPath), "itemYourBalance") >= 0)
            {
                Widget.GetObject("textField").SetText("<Strings:LostPlanetGame.Shop.Balance>");                
            }
            else
            {
                // End:0x4C4
                if(InStr(string(WidgetPath), "itemBalance") >= 0)
                {
                    Widget.GetObject("textField").SetText("<Strings:LostPlanetGame.Shop.Balance>");
                }
            }
            // End:0x869
            break;
        // End:0x510
        case 'missionBody':
            // End:0x50D
            if(InStr(string(WidgetPath), "popup") >= 0)
            {
                DialogBodyLabel = Widget;
                SetUpPurchasePromptStrings();
            }
            // End:0x869
            break;
        // End:0x559
        case 'missionHeader':
            // End:0x556
            if(InStr(string(WidgetPath), "popup") >= 0)
            {
                DialogHeaderLabel = Widget;
                SetUpPurchasePromptStrings();
            }
            // End:0x869
            break;
        // End:0x5BC
        case 'SelectLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonSelect>"));
            // End:0x869
            break;
        // End:0x619
        case 'SortLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.Shop.Sort>"));
            // End:0x869
            break;
        // End:0x675
        case 'BuyLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.Shop.Buy>"));
            // End:0x869
            break;
        // End:0x6D2
        case 'ExitLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.Shop.Exit>"));
            // End:0x869
            break;
        // End:0x736
        case 'DialogConfirmLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"));
            // End:0x869
            break;
        // End:0x79B
        case 'DialogCancelLabel':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.Shop.ButtonCancel>"));
            // End:0x869
            break;
        // End:0x857
        case 'DialogSelectLabel':
            // End:0x7FE
            if(CurrentlyPurchasingShopItemObj != none)
            {
                Widget.SetBool("_visible", CurrentlyPurchasingShopItemObj.bRepeatablePurchase);
            }
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.Shop.ButtonSelect>"));
            // End:0x869
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x869
            break;
            break;
    }
    // End:0x8A8
    if(!bWasHandled)
    {
        bWasHandled = super(GFxMoviePlayer).WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function ItemsSorted()
{
    //return;    
}

function PostWidgetInit()
{
    ASRepositionButtonPrompts();
    ASRepositionDialogButtonPrompts();
    //return;    
}

function ASRepositionButtonPrompts()
{
    ActionScriptVoid("repositionButtonPrompts");
    //return;    
}

function ASRepositionDialogButtonPrompts()
{
    ActionScriptVoid("repositionDialogButtonPrompts");
    //return;    
}

defaultproperties
{
    ShopData=/* Array type was not detected. */
    CaptureKeys=/* Array type was not detected. */
    Priority=10
    WidgetBindings=/* Array type was not detected. */
}