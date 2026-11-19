class LPGFxFrontEnd_StartNewGame extends LPGFxSaveSlot within GFxMoviePlayer
    config(UI);

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    // End:0x36
    if(Descriptions[ev.Index] == ReadingSlotDescription)
    {
        return;
    }
    super.OnListItemPress(ev);
    // End:0x8A
    if(Descriptions[ev.Index] != EmptySlotDescription)
    {
        ConfirmOverwrite();        
    }
    else
    {
        MenuViewLoader.SpawnDialog('SaveWarning', self);
    }
    //return;    
}

function ConfirmOverwrite()
{
    local /*0x97E50000-0x00000000*/ private @NULL ConfirmDialogMC;

    ConfirmDialogMC = LPGFxFrontEnd_InfoDialog(MenuViewLoader.SpawnDialog('InfoDialog', self, false));
    // End:0x2E9
    if(ConfirmDialogMC != none)
    {
        ConfirmDialogMC.SetDefaultFocusedButton(0);
        ConfirmDialogMC.EnableDialogBackground(true);
        ConfirmDialogMC.SetNumberOfOptions(2);
        ConfirmDialogMC.SetTitle("<Strings:LostPlanetGame.FrontEnd.ConfirmCheckpointOvewriteTitle>");
        // End:0x198
        if(Class'SPEngine.SPUtil'.static.IsConsoleBuild(2))
        {
            ConfirmDialogMC.SetInfo("<Strings:LostPlanetGame.FrontEnd.ConfirmCheckpointOvewriteInfoPS3>");            
        }
        else
        {
            ConfirmDialogMC.SetInfo("<Strings:LostPlanetGame.FrontEnd.ConfirmCheckpointOvewriteInfo>");
        }
        ConfirmDialogMC.SetButtonLabel(0, "<Strings:LostPlanetGame.PauseMenu.No>");
        ConfirmDialogMC.SetButtonLabel(1, "<Strings:LostPlanetGame.PauseMenu.Yes>");
        ConfirmDialogMC.SetButtonOnPress(0, ConfirmDialog_No);
        ConfirmDialogMC.SetButtonOnPress(1, ConfirmDialog_Yes);
    }
    //return;    
}

function ConfirmDialog_Yes()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    MenuViewLoader.SpawnDialog('SaveWarning', self);
    //return;    
}

function ConfirmDialog_No()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

defaultproperties
{
    // Reference: SPSeekFreePackageLoader'Default__LPGFxFrontEnd_StartNewGame.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
}