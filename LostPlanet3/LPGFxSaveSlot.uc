class LPGFxSaveSlot extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

const NumSaveSlots = 5;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string SlotName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string EmptySlotDescription;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ReadingSlotDescription;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Descriptions[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ImageNames[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Images[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InfoLoadingIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ImageLoadingIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL LoadedInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool ImageLoadComplete[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LoadedImage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PendingImageName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL SeekFreeLoader[524289];

function OnViewLoaded()
{
    super.OnViewLoaded();
    //return;    
}

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private int I;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    MoviePlayer.SetExternalInterface(self);
    LPFrontEndMoviePlayer.DisplayContent.GotoAndStop("saveLoad");
    I = 0;
    J0x98:

    // End:0xFE [Loop If]
    if(I < 5)
    {
        Descriptions[I] = ReadingSlotDescription;
        Images[I] = none;
        ImageNames[I] = "";
        I++;
        // [Loop Continue]
        goto J0x98;
    }
    Outer.GetPC().SetTimer(0.5000000, true, 'TimerTick', self);
    ImageLoadingIndex = -1;
    LoadInfo(0);
    //return;    
}

function Select_BackImpl()
{
    LPFrontEndMoviePlayer.DisplayContent.GotoAndStop("default");
    SeekFreeLoader.SetPackageName("");
    Outer.GetPC().ClearTimer('TimerTick', self);
    super(SPGFxUIViewSettingsMenuBase).Select_BackImpl();
    //return;    
}

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private byte I;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj;

    0
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x3A:

    // End:0x167 [Loop If]
    if(int(I) < 5)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", SlotName @ string(int(I) + int(1)));
        TempObj.SetString("control", "menu");
        TempObj.SetBool("bUpdateFromUnreal", true);
        DataProvider.SetElementObject(int(I), TempObj);
        I++;
        // [Loop Continue]
        goto J0x3A;
    }
    ListMC.SetString("wrapping", ((5 > 0) ? "wrap" : "normal"));
    ListMC.SetObject("dataProvider", DataProvider);
    ListDataProvider = ListMC.GetObject("dataProvider");
    ListMC.SetFloat("selectedIndex", float(SelectedIndex));
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609], MyEngine;
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;

    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    SelectedIndex = ev.Index;
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    MyEngine.PendingCheckpointSlot = SelectedIndex;
    //return;    
}

function UpdateDescription()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;

    SelectedIndex = int(ListMC.GetFloat("selectedIndex"));
    // End:0xCD
    if(LPFrontEndMoviePlayer != none)
    {
        // End:0xBA
        if((SelectedIndex >= 0) && SelectedIndex < Descriptions.Length)
        {
            LPFrontEndMoviePlayer.Description.SetText(Descriptions[SelectedIndex]);
        }
        DisplayImage(SelectedIndex);
    }
    //return;    
}

function DisplayImage()
{
    local /*0x97E50000-0x00000000*/ private int ImageIndex[8388609];

    // End:0x81
    if(((ImageIndex >= 0) && ImageIndex < ImageNames.Length) && Images[ImageIndex] != none)
    {
        PendingImageName = "img://" $ ImageNames[ImageIndex];
        SetSaveLoadImage(PendingImageName);        
    }
    else
    {
        SetSaveLoadImage("");
    }
    //return;    
}

function SetSaveLoadImage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ImageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ImageLoader;

    ImageLoader = Outer.GetVariableObject("_root.displaySecondary.displayContent.saveLoadImage");
    ImageLoader.SetBool("maintainAspectRatio", true);
    // End:0xD8
    if(ImageName != "")
    {
        ImageLoader.SetString("source", ImageName);        
    }
    else
    {
        ImageLoader.ActionScriptVoid("unload");
    }
    //return;    
}

function TimerTick()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine;

    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    // End:0x43
    if(MyEngine == none)
    {
        return;
    }
    // End:0x82
    if(MyEngine.GetCheckpointHeaderAsyncResult(LoadedInfo))
    {
        FinishInfoLoad();
        LoadNextImage();
    }
    // End:0xAF
    if(ImageLoadComplete)
    {
        ImageLoadComplete = false;
        LoadNextImage();
        UpdateDescription();
    }
    //return;    
}

function LoadInfo()
{
    local /*0x97E50000-0x00000000*/ private int SlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine;

    InfoLoadingIndex = SlotIndex;
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    MyEngine.GetCheckpointHeaderAsync("SaveSlot" $ string(SlotIndex), SlotIndex);
    //return;    
}

function FinishInfoLoad()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Description;

    // End:0x39
    if(LoadedInfo.DisplayName == "")
    {
        Description = EmptySlotDescription;        
    }
    else
    {
        Description = (((LoadedInfo.DisplayName $ "\n") $ LoadedInfo.SaveTime) $ "\n") $ LoadedInfo.TimePlayed;
    }
    Descriptions[InfoLoadingIndex] = Description;
    ImageNames[InfoLoadingIndex] = LoadedInfo.ImageName;
    UpdateDescription();
    InfoLoadingIndex++;
    // End:0x12A
    if(InfoLoadingIndex < 5)
    {
        LoadInfo(InfoLoadingIndex);
    }
    //return;    
}

function LoadNextImage()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEngine;
    local /*0x97E50000-0x00000000*/ private int I, J;

    // End:0x237
    if(ImageLoadingIndex < 0)
    {
        TheEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
        I = 0;
        J0x4C:

        // End:0x237 [Loop If]
        if(I < ImageNames.Length)
        {
            // End:0x229
            if((Images[I] == none) && ImageNames[I] != "")
            {
                J = 0;
                J0xA4:

                // End:0x217 [Loop If]
                if(J < TheEngine.CheckpointImages.Length)
                {
                    // End:0x209
                    if(TheEngine.CheckpointImages[J].Name == ImageNames[I])
                    {
                        ImageLoadingIndex = I;
                        LoadImage(TheEngine.CheckpointImages[J].SeekFreeName, TheEngine.CheckpointImages[J].AssetName);
                        ImageNames[I] = TheEngine.CheckpointImages[J].AssetName;
                        // [Explicit Break]
                        goto J0x217;
                    }
                    J++;
                    // [Loop Continue]
                    goto J0xA4;
                }
                J0x217:

                // End:0x229
                if(ImageLoadingIndex >= 0)
                {
                    // [Explicit Break]
                    goto J0x237;
                }
            }
            I++;
            // [Loop Continue]
            goto J0x4C;
        }
    }
    J0x237:

    //return;    
}

function LoadImage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string PackageName[8388609], ImageName;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NamesToLoad;

    SeekFreeLoader.SetPackageName(PackageName);
    NamesToLoad.AddItem(ImageName);    
    SeekFreeLoader.LoadAssetsFromPackage(NamesToLoad, false, false, false, false, false, ImageLoadCompleteCB);
    NamesToLoad.Length = 0;
    ImageLoadComplete = false;
    //return;    
}

function ImageLoadCompleteCB()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InLoadedAssets[8388609];

    Images[ImageLoadingIndex] = Texture2D(InLoadedAssets[0]);
    ImageLoadComplete = true;
    ImageLoadingIndex = -1;
    //return;    
}

defaultproperties
{
    SlotName="SLOT"
    EmptySlotDescription="EMPTY"
    ReadingSlotDescription="READING..."
    // Reference: SPSeekFreePackageLoader'Default__LPGFxSaveSlot.SFLoaderDefObj'
    begin object name=SFLoaderDefObj class=Class'SPEngine.SPSeekFreePackageLoader'
    end object
    SeekFreeLoader=SFLoaderDefObj
}