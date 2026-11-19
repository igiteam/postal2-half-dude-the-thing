/**
 * DOTZProfileManager - Profile Manager Menu
 *      -Create, Load, Delete, and auto-save profiles
 *
 * @author  Seelan Vamatheva
 * @version $Revision: 1.0 $
 * @date    March 2005
 */
class DOTZProfileManager extends DOTZProfilePanel;






var GUIListBox		lbProfiles;
var moEditBox		ebPlayerName, ebPlayerAge, ebDifficulty;

var localized string Difficulties[8];  // hardcoded for localization.  clamped 0,NumDifficulties where accessed.
var int NumDifficulties;			   // for external class access to size

//var Profiler profileHandle;





function InitComponent(GUIController pMyController, GUIComponent MyOwner)
{
    Log("In ProfileManager InitComponent");
	Super.Initcomponent(pMyController, MyOwner);

	//profileHandle = new class'DOTZProfile';

	lbProfiles=GUIListBox(Controls[0]);
	//lbProfiles.List.OnDblClick=DoubleClickList;
	ebPlayerName=moEditBox(Controls[1]);
	ebPlayerAge=moEditBox(Controls[2]);
	//ebDifficulty=moEditBox(Controls[2]);

    UpdateList();
}

function InitPanel()
{
	Super.InitPanel();
	//MyButton.Hint = class'UT2SinglePlayerMain'.default.TabHintProfileLoad;
	//UT2SinglePlayerMain(MyButton.MenuOwner.MenuOwner).ResetTitleBar(MyButton);
}



function ListInfoChange(GUIComponent Sender)
{
    local string profileName;

    //profileName = lbProfiles.List.Get();
    //DOTZPlayerControllerBase(PlayerOwner()).LoadProfile(profileName $ ".prof");

    ebPlayerName.SetText(profileName);
   // ebPlayerAge.SetText(DOTZPlayerControllerBase(PlayerOwner()).GetValue("blah"));
    //ebDifficulty.SetText(Difficulties[2]);

}


// Updated profile listbox (load from disk)
function UpdateList()
{
    local int i, count;

    lbProfiles.List.Clear();
    // Load up profile list and get total profiles
    //count = profileHandle.GetProfileCount();
    count = DOTZPlayerControllerBase(PlayerOwner()).GetProfileCount();
    for(i=0; i<count; i++)
    {
        lbProfiles.List.Add(DOTZPlayerControllerBase(PlayerOwner()).GetProfileName(i));
    }

}




function SaveAge(GUIComponent Sender)
{
    Log("in save INI");
    //profileHandle.SetValue("blah", ebPlayerAge.GetText());


}



/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {

    Log("In closed");

    //profileHandle.Save();
   DOTZPlayerControllerBase(PlayerOwner()).SaveProfile();

   Super.Closed(Sender,bCancelled);
   Controller.MouseEmulation(false);
}









// Decompiled with UE Explorer.
defaultproperties
{
    Difficulties[0]="Easy"
    Difficulties[1]="Normal"
    Difficulties[2]="Hard"
    NumDifficulties=3
    // Reference: BBListBox'DOTZProfileManager.LBoxProfile'
    begin object name=LBoxProfile class=Class'BBGui.BBListBox'
        bVisibleWhenEmpty=true
        bNeverFocus=true
        Hint="Select a profile"
        WinTop=0.1316670
        WinLeft=0.3305620
        WinWidth=0.2646090
        WinHeight=0.6106240
        OnChange=DOTZProfileManager.ListInfoChange
    end object
    Controls[0]=LBoxProfile
    // Reference: moEditBox'DOTZProfileManager.EBoxPlayerName'
    begin object name=EBoxPlayerName class=Class'GUI.moEditBox'
        bReadOnly=true
        Caption="Player Name: "
        LabelFont="UT2SmallFont"
        CaptionWidth=0.5500000
        LabelJustification=2
        Hint="Your character's name"
        WinTop=0.1438470
        WinLeft=0.4953600
        WinWidth=0.4937500
    end object
    Controls[1]=EBoxPlayerName
    // Reference: moEditBox'DOTZProfileManager.EBoxPlayerAge'
    begin object name=EBoxPlayerAge class=Class'GUI.moEditBox'
        Caption="Player comment: "
        LabelFont="UT2SmallFont"
        CaptionWidth=0.5500000
        LabelJustification=2
        Hint="Your character's comment"
        WinTop=0.3438470
        WinLeft=0.4953600
        WinWidth=0.4937500
        OnChange=DOTZProfileManager.SaveAge
    end object
    Controls[2]=EBoxPlayerAge
    // Reference: GUILabel'DOTZProfileManager.BoxStats'
    begin object name=BoxStats class=Class'GUI.GUILabel'
        Caption="PROFILE STATS"
        TextAlign=1
        WinTop=0.7345860
        WinLeft=0.5921860
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[3]=BoxStats
    // Reference: GUILabel'DOTZProfileManager.BoxListing'
    begin object name=BoxListing class=Class'GUI.GUILabel'
        Caption="PROFILE LISTING"
        TextAlign=1
        WinTop=0.7304170
        WinLeft=0.2640620
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    Controls[4]=BoxListing
    WinHeight=1.0000000
}