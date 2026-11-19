class LPGFxHUD_PickSaveSlot extends LPGFxSaveSlot within GFxMoviePlayer
    config(UI);

function OnListItemPress()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ev[8388609];

    super.OnListItemPress(ev);
    MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
    //return;    
}

defaultproperties
{
    // Reference: SPSeekFreePackageLoader'Default__LPGFxHUD_PickSaveSlot.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
}