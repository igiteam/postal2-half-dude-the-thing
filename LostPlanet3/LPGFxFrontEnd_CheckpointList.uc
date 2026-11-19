class LPGFxFrontEnd_CheckpointList extends LPGFxFrontEnd_Screen within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CurrentDescription;

function UpdateListDataProvider()
{
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[9437185];
    local /*0x97E50000-0x00000000*/ private byte I;
    local /*0x97E50000-0x00000000*/ private @NULL DataProvider, TempObj;

    0
    ClearSettingsList();
    DataProvider = Outer.CreateArray();
    I = 0;
    J0x44:

    // End:0x1AD [Loop If]
    if(int(I) < Class'LPCheckpointList'.default.CheckpointList.Length)
    {
        TempObj = Outer.CreateObject("Object");
        TempObj.SetString("label", Class'LPCheckpointList'.default.CheckpointList[int(I)].FriendlyName);
        TempObj.SetString("control", "menu");
        TempObj.SetBool("bUpdateFromUnreal", true);
        DataProvider.SetElementObject(int(I), TempObj);
        I++;
        // [Loop Continue]
        goto J0x44;
    }
    ListMC.SetString("wrapping", ((Class'LPCheckpointList'.default.CheckpointList.Length > 0) ? "wrap" : "normal"));
    ListMC.SetObject("dataProvider", DataProvider);
    ListDataProvider = ListMC.GetObject("dataProvider");
    //return;    
}

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;
    local /*0x97E50000-0x00000000*/ private @NULL SPPC;

    SPPC = SPPlayerController(Outer.GetPC());
    super(SPGFxUIViewSettingsMenuBase).OnListItemPress(ev);
    SelectedIndex = ev.Index;
    // End:0x48B
    if((SelectedIndex >= 0) && SelectedIndex < Class'LPCheckpointList'.default.CheckpointList.Length)
    {
        // End:0x196
        if((Class'LPCheckpointList'.default.CheckpointList[SelectedIndex].NoLevelTransitionConsoleCommand != "") && Class'LPCheckpointList'.default.CheckpointList[SelectedIndex].ConsoleCommand == "")
        {            
            SPPC.ConsoleCommand(Class'LPCheckpointList'.default.CheckpointList[SelectedIndex].NoLevelTransitionConsoleCommand);            
        }
        else
        {
            // End:0x2BC
            if(Class'LPCheckpointList'.default.CheckpointList[SelectedIndex].CheckpointNameToLoad != "")
            {
                // End:0x2B9
                if(SPPC.LoadCheckpointNamed(Class'LPCheckpointList'.default.CheckpointList[SelectedIndex].CheckpointNameToLoad))
                {
                    Outer.GetVariableObject("_root").SetVisible(false);
                    SPPC.ClientShowLoadingMovie(true);
                    Outer.Close(true);
                }                
            }
            else
            {
                // End:0x48B
                if(Class'LPCheckpointList'.default.CheckpointList[SelectedIndex].ConsoleCommand != "")
                {
                    Outer.GetVariableObject("_root").SetVisible(false);
                    // End:0x3E2
                    if(Class'LPCheckpointList'.default.CheckpointList[SelectedIndex].IntroMovie != "")
                    {
                        SPPC.ClientPlayMovie(Class'LPCheckpointList'.default.CheckpointList[SelectedIndex].IntroMovie);                        
                    }
                    else
                    {
                        SPPC.ClientShowLoadingMovie(true);
                    }                    
                    SPPC.ConsoleCommand(Class'LPCheckpointList'.default.CheckpointList[SelectedIndex].ConsoleCommand);
                    Outer.Close(true);
                }
            }
        }
    }
    //return;    
}

function OnListChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex;

    // End:0x1CE
    if(ListMC != none)
    {
        SelectedIndex = int(ListMC.GetFloat("selectedIndex"));
        // End:0x1CE
        if((SelectedIndex >= 0) && SelectedIndex < Class'LPCheckpointList'.default.CheckpointList.Length)
        {
            CurrentDescription = Class'LPCheckpointList'.default.CheckpointList[SelectedIndex].FriendlyDescription;
            // End:0x1CE
            if(LPFrontEndMoviePlayer != none)
            {
                // End:0x165
                if(LPFrontEndMoviePlayer.DisplayContent == none)
                {
                    LPFrontEndMoviePlayer.DisplayContent = Outer.GetVariableObject("_root.displaySecondary.displayContent");
                }
                // End:0x1CE
                if(LPFrontEndMoviePlayer.DisplayContent != none)
                {
                    AttachThumbnail(Class'LPCheckpointList'.default.CheckpointList[SelectedIndex].ThumbnailName);
                }
            }
        }
    }
    super(SPGFxUIViewSettingsMenuBase).OnListChange(ev);
    //return;    
}

function RemoveThumbnail()
{
    // End:0x69
    if(LPFrontEndMoviePlayer.DisplayContent != none)
    {
        LPFrontEndMoviePlayer.DisplayContent.ActionScriptVoid("RemoveThumbnail");
    }
    //return;    
}

function RemoveMovieClip()
{
    local /*0x97E50000-0x00000000*/ private @NULL MovieClip[8388609];

    // End:0x3F
    if(MovieClip != none)
    {
        MovieClip.ActionScriptVoid("removeMovieClip");
    }
    //return;    
}

function AttachThumbnail()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ThumbnailName[8388609];

    RemoveThumbnail();
    // End:0x73
    if(LPFrontEndMoviePlayer.DisplayContent != none)
    {
        LPFrontEndMoviePlayer.DisplayContent.ActionScriptVoid("AttachThumbnail");
    }
    //return;    
}

function UpdateDescription()
{
    local /*0x97E50000-0x00000000*/ private @NULL ManagerDescriptionMC;

    // End:0x6F
    if(LPFrontEndMoviePlayer != none)
    {
        ManagerDescriptionMC = LPFrontEndMoviePlayer.Description;
        // End:0x6F
        if(ManagerDescriptionMC != none)
        {
            ManagerDescriptionMC.SetText(CurrentDescription);
        }
    }
    //return;    
}

function OnEscapeKeyPress()
{
    Select_BackImpl();
    //return;    
}

function Select_BackImpl()
{
    PlayNavBackSoundEvent();
    // End:0x6B
    if(MenuViewLoader != none)
    {
        RemoveThumbnail();
        PlayCloseAnimation();
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    }
    //return;    
}
