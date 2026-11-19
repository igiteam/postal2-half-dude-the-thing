//-----------------------------------------------------------
//
//-----------------------------------------------------------
class XDOTZCharacterSelectInvited extends XDOTZCharacterSelect;

function DoButtonA ()
{
    class'UtilsXbox'.static.Friends_Accept_Invitation();

    // Reboot to live client
    class'UtilsXbox'.static.Set_Reboot_Type(4);   // Is live client

    // Display loading screen
    //Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu");

    // Joining a friend
    class'UtilsXbox'.static.Live_Client_Set_Joining_Friend(true);
    class'UtilsXbox'.static.Live_Client_Set_Joining_Cross(false);

    // Reboot!
    //Console(Controller.Master.Console).ConsoleCommand("reboot");  // URL not part of command on xbox
    // 0.0.0.0 Gets replaced with the real IP after reboot
    // PlayerOwner().Level.ServerTravel("0.0.0.0", false);

    super.DoButtonA();
}


// Decompiled with UE Explorer.
defaultproperties
{
    OnDraw=XDOTZCharacterSelectInvited.InternalDraw
    OnKeyEvent=XDOTZCharacterSelectInvited.HandleKeyEvent
}