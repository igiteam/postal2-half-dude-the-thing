/**
 * XDOTZMainMenu - the main menu for Xbox DOTZ, based on the Warfare
 *              "GUI" package.
 *
 * @author  Tod Baudais (tod.baudais@digitalextremes.com)
 * @version $Revision: 1.0 $
 * @date    January 19, 2005
 */

class XDOTZCharacterSelect extends XDOTZLivePage;




var localized string PageCaption;
var sound ClickSound;

var Automated GUILabel   CharacterTypeLabel;
var Automated GUILabel   HeadTypeLabel;
var Automated GUILabel   BodyTypeLabel;

var Automated BBXSelectBox   CharacterTypeValue;
var Automated BBXSelectBox   HeadTypeValue;
var Automated BBXSelectBox   BodyTypeValue;
//var Automated GUIButton    StartButton;

// Used for character (not just weapons!)
var SpinnyWeap			SpinnyDude; // MUST be set to null when you leave the window
var vector				SpinnyDudeOffset;

var string URL;

var string JackMesh;
var array<Material> JackHeadTextures;
var array<Material> JackBodyTextures;

var string OtisMesh;
var array<Material> OtisHeadTextures;
var array<Material> OtisBodyTextures;

var localized string Variant1Head;
var localized string Variant2Head;
var localized string OriginalHead;

var localized string Variant1Body;
var localized string Variant2Body;
var localized string OriginalBody;

/*****************************************************************
 * InitComponent
 *****************************************************************
 */
function InitComponent( GUIController MyController, GUIComponent MyOwner )
{
   local Mesh PlayerMesh;

   Super.Initcomponent(MyController, MyOwner);
   AdvancedPlayerController(PlayerOwner()).bCameraLock = true;
   // init my components...
   SetPageCaption (PageCaption);

	PlayerMesh = Mesh(DynamicLoadObject(JackMesh, class'Mesh'));
   CharacterTypeValue.AddItem("Jack",PlayerMesh,"XDOTZCharacters.JackSlade");

	PlayerMesh = Mesh(DynamicLoadObject(OtisMesh, class'Mesh'));
   CharacterTypeValue.AddItem("Otis",PlayerMesh,"XDOTZCharacters.PlayerOtis");

   HeadTypeValue.AddItem(OriginalHead,,"0");
   HeadTypeValue.AddItem(Variant1Head,,"1");
   HeadTypeValue.AddItem(Variant2Head,,"2");

   BodyTypeValue.AddItem(OriginalBody,,"0");
   BodyTypeValue.AddItem(Variant1Body,,"1");
   BodyTypeValue.AddItem(Variant2Body,,"2");

   AddBackButton ();
   AddContinueButton ();

   //Spawn spinning character actor
	SpinnyDude = PlayerOwner().spawn(class'GUI.SpinnyWeap');
	SpinnyDude.SetRotation(PlayerOwner().Rotation);
	SpinnyDude.SetDrawType(DT_Mesh);
	SpinnyDude.SetDrawScale(0.7);
	SpinnyDude.SpinRate = 5000;
   UpdateSpinnyDude();

}

/*****************************************************************
 * HandleParameters
 * Collect the URL from the calling page
 *****************************************************************
 */
event HandleParameters( String param1, String param2 ) {
   URL = Param1;
}

/*****************************************************************
 * Happens every time the menu is opened, not just the first.
 *****************************************************************
 */
event Opened( GUIComponent Sender ) {
    super.Opened(Sender);
}

/*****************************************************************
 * Closed
 *****************************************************************
 */
event Closed(GUIComponent Sender, bool bCancelled) {
   Super.Closed(Sender,bCancelled);
   AdvancedPlayerController(PlayerOwner()).bCameraLock = false;
   SpinnyDude.destroy();
   Controller.MouseEmulation(false);
}

/*****************************************************************
 *
 *****************************************************************
 */
function HandleCharacterSelection(GUIComponent Sender){
   UpdateSpinnyDude();
}

/*****************************************************************
 * ButtonClicked
 * Notification that the user clicked a component on the page
 *****************************************************************
 */
/*function bool ButtonClicked(GUIComponent Sender) {

   local string CustomURL;
   CustomURL = URL $ "?Character=" $ CharacterTypeValue.GetExtra()
                   $ "?Head=" $ HeadTypeValue.GetExtra()
                   $ "?Body=" $ BodyTypeValue.GetExtra();

   // Display loading screen
   Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu");
   PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
   PlayerOwner().ClientTravel( CustomURL ,TRAVEL_Absolute, false);
   return true;
}*/

/*****************************************************************
 * A Button pressed
 *
 *****************************************************************
 */

function DoButtonA ()
{
    local string CustomURL;
   CustomURL = URL $ "?Character=" $ CharacterTypeValue.GetExtra()
                   $ "?Head=" $ HeadTypeValue.GetExtra()
                   $ "?Body=" $ BodyTypeValue.GetExtra();

   // Display loading screen
   Controller.OpenMenu("DOTZMenu.XDOTZLoadingMenu");
   PlayerOwner().Pawn.PlayOwnedSound(ClickSound,SLOT_Interface,1.0);
   PlayerOwner().ClientTravel( CustomURL ,TRAVEL_Absolute, false);
}

/*****************************************************************
 * B Button pressed
 *
 *****************************************************************
 */

function DoButtonB ()
{
    Controller.CloseMenu(false);
}

/*****************************************************************
 * InternalDraw
 *****************************************************************
 */
function bool InternalDraw(Canvas canvas)
{
	local vector CamPos, X, Y, Z;
	local rotator CamRot;
   canvas.GetCameraLocation(CamPos, CamRot);
	GetAxes(CamRot, X, Y, Z);
	SpinnyDude.SetLocation(CamPos + (SpinnyDudeOffset.X * X) + (SpinnyDudeOffset.Y * Y) + (SpinnyDudeOffset.Z * Z));
	canvas.DrawActor(SpinnyDude, false, true, 90.0);
	return false;
}

/*****************************************************************
 *
 *****************************************************************
*/
function UpdateSpinnyDude()
{
	local Mesh PlayerMesh;
   local int HeadIndex, BodyIndex;
	//PlayerMesh = Mesh(DynamicLoadObject(string(CharacterTypeValue.GetObject()), class'Mesh'));
   PlayerMesh = mesh(CharacterTypeValue.GetObject());
	if(PlayerMesh == None){	return;	}
	SpinnyDude.LinkMesh(PlayerMesh);

   HeadIndex = int(HeadTypeValue.GetExtra());
   BodyIndex = int(BodyTypeValue.GetExtra());

   if(CharacterTypeValue.GetIndex() == 0){ //Jack is selected
   	SpinnyDude.Skins[0] = JackBodyTextures[BodyIndex];
	   SpinnyDude.Skins[1] = JackHeadTextures[HeadIndex];
   } else {                                //Otis is selected
   	SpinnyDude.Skins[0] = OtisBodyTextures[BodyIndex];
	   SpinnyDude.Skins[1] = OtisHeadTextures[HeadIndex];
   }

	SpinnyDude.LoopAnim( 'Bored', 1);
}


/*****************************************************************
 * NotifyLevelChange
 *
 *****************************************************************
 */
event NotifyLevelChange() {
    Controller.CloseMenu(true);
}

//===========================================================================
// DefaultProperties
//===========================================================================



// Decompiled with UE Explorer.
defaultproperties
{
    PageCaption="Customize Character"
    ClickSound=Sound'DOTZXInterface.Select'
    // Reference: GUILabel'XDOTZCharacterSelect.CharacterTypeLabel_lbl'
    begin object name=CharacterTypeLabel_lbl class=Class'GUI.GUILabel'
        Caption="Character:"
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2000000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    CharacterTypeLabel=CharacterTypeLabel_lbl
    // Reference: GUILabel'XDOTZCharacterSelect.HeadTypeLabel_lbl'
    begin object name=HeadTypeLabel_lbl class=Class'GUI.GUILabel'
        Caption="Skin: "
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.2700000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    HeadTypeLabel=HeadTypeLabel_lbl
    // Reference: GUILabel'XDOTZCharacterSelect.BodyTypeLabel_lbl'
    begin object name=BodyTypeLabel_lbl class=Class'GUI.GUILabel'
        Caption="Clothing: "
        StyleName="BBXTextStatic"
        bBoundToParent=true
        bScaleToParent=true
        WinTop=0.3400000
        WinLeft=0.1500000
        WinWidth=0.4000000
        WinHeight=0.1000000
    end object
    BodyTypeLabel=BodyTypeLabel_lbl
    // Reference: BBXSelectBox'XDOTZCharacterSelect.CharacterTypeValue_lbl'
    begin object name=CharacterTypeValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.2200000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
        OnChange=XDOTZCharacterSelect.HandleCharacterSelection
    end object
    CharacterTypeValue=CharacterTypeValue_lbl
    // Reference: BBXSelectBox'XDOTZCharacterSelect.HeadTypeValue_lbl'
    begin object name=HeadTypeValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.2900000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
        OnChange=XDOTZCharacterSelect.HandleCharacterSelection
    end object
    HeadTypeValue=HeadTypeValue_lbl
    // Reference: BBXSelectBox'XDOTZCharacterSelect.BodyTypeValue_lbl'
    begin object name=BodyTypeValue_lbl class=Class'BBGui.BBXSelectBox'
        StyleName="BBXSquareButton"
        WinTop=0.3600000
        WinLeft=0.4500000
        WinWidth=0.4000000
        WinHeight=0.0600000
        OnChange=XDOTZCharacterSelect.HandleCharacterSelection
    end object
    BodyTypeValue=BodyTypeValue_lbl
    SpinnyDudeOffset=(X=170.0000000,Y=-50.0000000,Z=-25.0000000)
    JackMesh="DOTZAHumans.JackSlade"
    JackHeadTextures[0]=Shader'DOTZTHumans.JackSlade.JackSladeHeadShaderA'
    JackHeadTextures[1]=Shader'DOTZTHumans.JackSlade.JackSladeHeadShaderB'
    JackHeadTextures[2]=Shader'DOTZTHumans.JackSlade.JackSladeHeadShaderC'
    JackBodyTextures[0]=Shader'DOTZTHumans.JackSlade.JackSladeBodyShaderA'
    JackBodyTextures[1]=Shader'DOTZTHumans.JackSlade.JackSladeBodyShaderB'
    JackBodyTextures[2]=Shader'DOTZTHumans.JackSlade.JackSladeBodyShaderC'
    OtisMesh="DOTZAHumans.Otis"
    OtisHeadTextures[0]=Shader'DOTZTHumans.Otis.OtisHeadShaderA'
    OtisHeadTextures[1]=Shader'DOTZTHumans.Otis.OtisHeadShaderB'
    OtisHeadTextures[2]=Shader'DOTZTHumans.Otis.OtisHeadShaderC'
    OtisBodyTextures[0]=Shader'DOTZTHumans.Otis.OtisBodyShaderA'
    OtisBodyTextures[1]=Shader'DOTZTHumans.Otis.OtisBodyShaderB'
    OtisBodyTextures[2]=Shader'DOTZTHumans.Otis.OtisBodyShaderC'
    Variant1Head="Camo"
    Variant2Head="Tattoo"
    OriginalHead="Normal"
    Variant1Body="Camo"
    Variant2Body="Bloody"
    OriginalBody="Normal"
    Background=Texture'DOTZTInterface.Menu.SettingsBackground'
    OnDraw=XDOTZCharacterSelect.InternalDraw
    OnKeyEvent=XDOTZCharacterSelect.HandleKeyEvent
}