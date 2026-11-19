class LPGFxFrontEnd_InfoDialogMP extends LPGFxFrontEnd_InfoDialog within GFxMoviePlayer
    config(UI);

defaultproperties
{
    DialogOpenSoundEventName="NetLobbyMenuSelect"
    ListItemPressSoundEventName="NetLobbyMenuConfirm"
    ListChangeSoundEventName="NetLobbyMenuSelect"
    NavBackSoundEventName="NetLobbyMenuBack"
}