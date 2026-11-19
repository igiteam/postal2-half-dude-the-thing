/**
 *
 *
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @version $Revision: 1.9 $
 * @date    Sept 2003
 */
class DOTZControlSettings extends DOTZSettingsPanel;


struct KeyBinding {
   var bool             bIsSectionLabel;
   var localized string KeyLabel;
   var string           Alias;
   var array<int>              Binds;
   var array<string>           BindKeyNames;
   var array<string>    BindLocalizedKeyNames;
};

//controls
var GUIListBox MyListBox;
var Automated  moCheckBox InvertMouseBox;
var sound ClickSound;

const DefaultBindings=54;            // # of default bindings there are
var array<KeyBinding> Bindings;     // Holds the array of key bindings
var localized string  Labels[54];   // fixed-length array for
                                    // localization.
                                    // accesses clamped to [0,74]

var bool bSetNextKeyPress;
var int  NewIndex, NewSubIndex;
var GUIStyles SelStyle;
var int row, HackIndex;             // Hacky Hacky
var localized string Header,Footer;
var float SectionLabelMargin;
var bool bInvertMouse;
var bool bListInitialised;

var Automated GUILabel    SensLabel;
var Automated GuiSlider   SensSlider;



/*****************************************************************
 * InitComponent
 *****************************************************************
 */
function InitComponent(GUIController MyController, GUIComponent MyOwner){

   Super.Initcomponent(MyController, MyOwner);
   MyListBox = GUIListBox(Controls[0]);
   MyListBox.List.OnDrawItem = DrawBinding;
   MyListBox.List.SelectedImage=None;
   MyListbox.List.OnClick=GetNewKey;
   MyListBox.List.OnChange=ListChange;
   MyListBox.List.OnKeyEvent = ListOnKeyEvent;
   MyListBox.List.bHotTrack=true;
   MyListBox.List.OnClickSound=CS_None;
   MyListBox.List.OnAdjustTop = MyOnAdjustTop;

   SelStyle = Controller.GetStyle("BBTextButton");
   moCheckBox(Controls[5]).Checked(class'PlayerInput'.default.bInvertMouse);

   SensSlider = GuiSlider(Controls[8]);
   SensSlider.SetValue(class'PlayerInput'.default.MouseSensitivity);

}


/*****************************************************************
 * ShowPanel
 *****************************************************************
 */
function ShowPanel(bool bShow){

   Super.ShowPanel(bShow);

   if( bShow ) {
      if(!bListInitialised) {
         InitBindings();
         MyListBox.List.Index=1;
         HackIndex=1;
         bListInitialised = true;
      }

   }

}


/*****************************************************************
 * Weight
 *****************************************************************
 */
function int Weight(int i){

   if ( (i==0x01) || (i==0x02) ){
      return 100;
   }
   if ( (i>=0x30) && (i<=0x5A) ){
      return 50;
   }
   if (i==0x20){
      return 45;
   }
   if (i==0x04){
      return 40;
   }
   if (i==0xEC || i==0xED){
      return 35;
   }
   if (i>=0x21 && i<=0x28){
      return 30;
   }
   if (i>=0x60 && i<=0x6F){
      return 30;
   }

   return 25;
}


/*****************************************************************
 * Swap
 *****************************************************************
 */
function Swap(int index, int a, int b){

   local int TempInt;
   local string TempStrA, TempStrB;

   TempInt  = Bindings[Index].Binds[a];
   TempStrA = Bindings[Index].BindKeyNames[a];
   TempStrB = Bindings[Index].BindLocalizedKeyNames[a];

   Bindings[Index].Binds[a] = Bindings[Index].Binds[B];
   Bindings[Index].BindKeyNames[a] = Bindings[Index].BindKeyNames[b];
   Bindings[Index].BindLocalizedKeyNames[a] = Bindings[Index].BindLocalizedKeyNames[b];
   Bindings[Index].Binds[b] = TempInt;
   Bindings[Index].BindKeyNames[b] = TempStrA;
   Bindings[Index].BindLocalizedKeyNames[b] = TempStrB;

}


/*****************************************************************
 * AddToBindings
 *****************************************************************
 */
function AddToBindings(string Alias, string KeyLabel, bool bSectionLabel){

   local int At;

   At = Bindings.Length;
   Bindings.Length = Bindings.Length + 1;
   Bindings[At].bIsSectionLabel = bSectionLabel;
   Bindings[At].KeyLabel = KeyLabel;
   Bindings[At].Alias = Alias;
   MyListBox.List.Add(Bindings[At].KeyLabel);

}

/*****************************************************************
 * InitBindings
 *****************************************************************
 */
function InitBindings(){

   local int i,j,k,index;
   local string KeyName, Alias, LocalizedKeyName;
   local string UserKeyClass;
   local class<GUIUserKeyBinding> Key;

   local string temp;
   local KeyBinding tempBinding;

   // Clear them all.
   //===========================
   for (i=0;i<Bindings.Length;i++){
         if (Bindings[i].Binds.Length>0)
            Bindings[i].Binds.Remove(0,Bindings[i].Binds.Length);

         if (Bindings[i].BindKeyNames.Length>0)
            Bindings[i].BindKeyNames.Remove(0,Bindings[i].BindKeyNames.Length);

         if (Bindings[i].BindLocalizedKeyNames.Length>0)
            Bindings[i].BindLocalizedKeyNames.
                        Remove(0,Bindings[i].BindLocalizedKeyNames.Length);

         // Set the Localized name
         if (i<DefaultBindings)
            Bindings[i].KeyLabel = Labels[i];

         MyListBox.List.Add(Bindings[i].KeyLabel);
  }

   // Load Bindings from INT
   //===========================
   j = 0;
   while (UserKeyClass!=""){
      Key = class<GUIUserKeyBinding>(DynamicLoadObject(UserKeyClass,class'Class'));
      if (Key!=None){
         for (i=0;i<Key.Default.KeyData.Length;i++)
            AddToBindings(Key.Default.KeyData[i].Alias,
                          Key.Default.KeyData[i].KeyLabel,
                          Key.Default.KeyData[i].bIsSection);
         }
      }


   for (i=0;i<255;i++){
      KeyName = PlayerOwner().ConsoleCommand("KEYNAME"@i);
      LocalizedKeyName = PlayerOwner().ConsoleCommand("LOCALIZEDKEYNAME"@i);
      if (KeyName!=""){
         Alias = PlayerOwner().ConsoleCommand("KEYBINDING"@KeyName);
         if (Alias!=""){
            for (j=0;j<Bindings.Length;j++){

               temp = KeyName;
               temp = Alias;
               tempBinding = Bindings[j];

               if (Bindings[j].Alias ~= Alias){
                  index = Bindings[j].Binds.Length;

                  Bindings[j].Binds[index] = i;
                  Bindings[j].BindKeyNames[Index] = KeyName;
                  Bindings[j].BindLocalizedKeyNames[Index] = LocalizedKeyName;

                  for (k=0;k<index;k++){
                     if ( Weight(Bindings[j].Binds[k]) < Weight(Bindings[j].Binds[Index]) ){
                        //                        Swap(j,k,Index);
                        break;
                     }
                  }
               }
            }
         }
      }
   }

}


/*****************************************************************
 * GetCurrentKeyBind
 *****************************************************************
 */
function string GetCurrentKeyBind(int index, int bind){

   if ( index >= bindings.Length || index < 0)
      return "";

   if (Bindings[Index].bIsSectionLabel)
      return "";

   if (Index==NewIndex && Bind==NewSubIndex)
      return "???";

   if (Bind>=Bindings[Index].Binds.Length)
      return "";

 return Bindings[Index].BindLocalizedKeyNames[Bind];
}


/*****************************************************************
 * DrawBinding
 *****************************************************************
 */
function DrawBinding(Canvas Canvas, int Item, float X, float Y, float W, float H, bool bSelected){

   local int x1,w1;
   local bool InBindArea;

   if (Item>=Bindings.Length || Item<0){  return; }
   if (Controller.MouseX >= controls[2].Bounds[0] ){  InBindArea=true; }

   if ( (Controller.HasMouseMoved()) && (!bSetNextKeyPress) ){
      if (InBindArea) {
         if ( ( Controller.MouseX >= Controls[2].Bounds[0] ) &&
              ( Controller.MouseX <= Controls[2].Bounds[2] ) ){
                  Row = 0;
         }
         InBindArea=true;
      }

      if ( InBindArea && (MyListBox.List.Index != HackIndex) &&
           (MyListBox.List.Index<Bindings.Length) && (MyListBox.List.Index >= 0) &&
           (Bindings[MyListBox.List.Index].bIsSectionLabel) ){
         MyListBox.List.SetIndex(HackIndex);
      }
   }

   if(InBindArea){
      if ( (bSetNextKeyPress) && (MyListBox.List.Index!=HackIndex) ){
         MyListBox.List.SetIndex(HackIndex);
      }
      if ( HackIndex !=MyListBox.List.Index){
            UpdateHint(MyListBox.List.Index);
      }
      HackIndex = MyListBox.List.Index;
   }


   if ( Bindings[Item].bIsSectionLabel ){
         Canvas.CurX = Controls[1].ActualLeft ();
         Canvas.CurY = Y;
         Canvas.SetDrawColor(0,128,0,200);
         Canvas.DrawTile (Controller.DefaultPens[0],
                          Controls[1].ActualWidth () +
                          Controls[2].ActualWidth (),H, 0, 0, 1, 1);

         MyListBox.Style.DrawText(Canvas, MSAT_Pressed,
                   Controls[1].ClientBounds[0]+SectionLabelMargin,
                   Y, Controls[1].ClientBounds[2]-Controls[1].ClientBounds[0] ,
                   H, TXTA_Left, Bindings[Item].KeyLabel);
   } else {
         MyListBox.Style.DrawText(Canvas,MenuState, Controls[1].ActualLeft(),
                             Y,Controls[1].ActualWidth(),
                             H, TXTA_Center, Bindings[Item].KeyLabel);
   }


   MyListBox.Style.DrawText(Canvas,MenuState, Controls[2].ActualLeft(), Y,
                            Controls[2].ActualWidth(), H,
                            TXTA_Center, GetCurrentKeyBind(Item,0));

   if ( (bSelected) && (!Bindings[item].bIsSectionLabel) ){
      if (Row==0){
         x1 = Controls[2].ActualLeft();
         w1 = Controls[2].ActualWidth();
      }

      if (!bSetNextKeyPress){
         SelStyle.Draw(Canvas,MSAT_Watched, x1, y, w1, h );
      } else {
         SelStyle.Draw(Canvas,MSAT_Pressed, x1, y, w1, h );
      }
      UpdateHint(Item);
   }

}



/*****************************************************************
 * ListOnKeyEvent
 *****************************************************************
 */
function bool ListOnKeyEvent(out byte Key, out byte State, float delta){

   local bool result;
   local int oldIndex;

   if (Key==0x0D && State==3) {
         GetNewKey(None);
         return true;
   }

   //backspace
   if ( (Key==0x08) && (State==3) ) {
      // Clear Over
      if ( ( Controller.MouseX >= Controls[2].Bounds[0] ) &&
           ( Controller.MouseX <= Controls[2].Bounds[2] ) ){
         RemoveExistingKey(MyListBox.List.Index,0);
      }
      UpdateHint(MyListBox.List.Index);
      return true;
   }


   // -- WARNING.. really big hack here
   if ( (State==1) && (Key==0x25 || Key==0x64 || Key==0x27 || Key ==0x66) ) {
      if (row==0)
         row = 1;
      else
         row = 0;

      UpdateHint(MyListBox.List.Index);
      return true;
   }

   OldIndex = MyListBox.List.Index;
   result = MyListBox.List.InternalOnKeyEvent(Key,State,delta);
   if (MyListBox.List.Index!=OldIndex){

      if (Bindings[MyListBox.List.Index].bIsSectionLabel){
         if (MyListBox.List.Index<OldIndex)
            SearchUp(OldIndex);
         else
            SearchDown(OldIndex);
      }
   }
   UpdateHint(MyListBox.List.Index);

   return true;
}


/*****************************************************************
 * SearchUp
 *****************************************************************
 */
function SearchUp(int OldIndex){

   local int cindex;

   cindex = MyListBox.List.Index;
   while (cindex>0){
      if (!Bindings[cindex].bIsSectionLabel){
         MyListBox.List.SetIndex(cIndex);
         return;
      }
      cindex--;
   }
   MyListBox.List.SetIndex(OldIndex);


}

/*****************************************************************
 * SearchDown
 *****************************************************************
 */
function SearchDown(int OldIndex){

   local int cindex;

   cindex = MyListBox.List.Index;
   while (cindex<MyListBox.List.ItemCount-1){
      if (!Bindings[cindex].bIsSectionLabel){
         MyListBox.List.SetIndex(cIndex);
         return;
      }
      cindex++;
   }
   MyListBox.List.SetIndex(OldIndex);

}


/*****************************************************************
 * RemoveExistingKey
 *****************************************************************
 */
function RemoveExistingKey(int Index, int SubIndex){

   if ( (Index>=Bindings.Length) || (SubIndex>=Bindings[Index].Binds.Length) ||
        (Bindings[Index].Binds[SubIndex] <0) ){
      return;
   }

   // Clear the bind
   PlayerOwner().
      ConsoleCommand("SET Input"@Bindings[Index].BindKeyNames[SubIndex]);

   // Clear the entry
   Bindings[Index].Binds.Remove(SubIndex,1);
   Bindings[Index].BindKeyNames.Remove(SubIndex,1);
   Bindings[Index].BindLocalizedKeyNames.Remove(SubIndex,1);

}


/*****************************************************************
 * RemoveAllOccurances
 *****************************************************************
 */

function RemoveAllOccurance(byte NewKey){

   local int i,j;

   for (i=0;i<Bindings.Length;i++){
      for (j=Bindings[i].Binds.Length-1;j>=0;j--){
         if (Bindings[i].Binds[j]==NewKey){
            RemoveExistingKey(i,j);
         }
      }
   }
}


/*****************************************************************
 * UpdateHint
 *****************************************************************
 */
function UpdateHint(int index){

   local int i;
   local string t;

   if (Index<0 || Index>=Bindings.Length){
      MyListBox.List.Hint ="";
      Controller.ActivePage.ChangeHint(MyListBox.List.Hint);
      return;
   } else {
      t = "";
      for (i=0;i<Bindings[Index].Binds.Length;i++){
         if (t=="")
            t = ""$GetCurrentKeyBind(Index,i);
      }
   }
   MyListBox.List.Hint =Header$t$Footer;
   Controller.ActivePage.ChangeHint(MyListBox.List.Hint);

}


/*****************************************************************
 * AddNewKey
 *****************************************************************
 */
function AddNewKey(int Index, int SubIndex, byte NewKey){
   local int i;

   //local KeyBinding Where;
   if (Index >= Bindings.Length){
      return;
   }

   if ( (SubIndex<Bindings[Index].Binds.Length) &&
        (Bindings[Index].Binds[SubIndex] == NewKey) ){
      return;
   }

   //remove the existing binding so that the new one shows up
   for (i=0;i < Bindings[Index].Binds.length; i++){
         RemoveAllOccurance(Bindings[Index].Binds[i]);
   }
   RemoveAllOccurance(NewKey);

   if (SubIndex>=Bindings[Index].Binds.Length) {
      Bindings[Index].Binds.Length = Bindings[Index].Binds.Length + 1;
      Bindings[Index].BindKeyNames.Length = Bindings[Index].BindKeyNames.Length + 1;
      Bindings[Index].BindLocalizedKeyNames.Length = Bindings[Index].BindLocalizedKeyNames.Length + 1;
      SubIndex = Bindings[Index].Binds.Length-1;
   }
   Bindings[Index].Binds[SubIndex] = NewKey;
   Bindings[Index].BindKeyNames[SubIndex] = PlayerOwner().ConsoleCommand("KeyName"@NewKey);
   Bindings[Index].BindLocalizedKeyNames[SubIndex] = PlayerOwner().ConsoleCommand("LOCALIZEDKEYNAME"@NewKey);
   PlayerOwner().ConsoleCommand("SET Input"@Bindings[Index].BindKeyNames[SubIndex]@Bindings[Index].Alias);
   UpdateHint(Index);

}

/*****************************************************************
 * GetNewKey
 *****************************************************************
 */
function bool GetNewKey(GUIComponent Sender){

   local int SubIndex;

   if ( ( Controller.MouseX >= Controls[2].Bounds[0] ) && ( Controller.MouseX <= Controls[2].Bounds[2] ) ){
      SubIndex = 0;
   } else {
      return true;
   }

   NewIndex = MyListBox.List.Index;
   NewSubIndex = SubIndex;
   bSetNextKeyPress=true;
   Controller.OnNeedRawKeyPress = RawKey;
   Controller.Master.bRequireRawJoystick=true;

   PlayerOwner().ClientPlaySound(Controller.EditSound);
   PlayerOwner().ConsoleCommand("toggleime 0");

 return true;
}


/*****************************************************************
 * RawKey
 *****************************************************************
 */
function bool RawKey(byte NewKey){

   if (NewKey!=0x1B){
      AddNewKey(NewIndex, NewSubIndex, NewKey);
   }

   NewIndex = -1;
   NewSubIndex = -1;
   bSetNextKeyPress=false;
   Controller.OnNeedRawKeyPress = none;
   Controller.Master.bRequireRawJoystick=false;
   PlayerOwner().ClientPlaySound(Controller.ClickSound);

 return true;
}


/*****************************************************************
 * ListChange
 *****************************************************************
 */
function ListChange(GUIComponent Sender){
   UpdateHint(MyListBox.List.Index);
}


/*****************************************************************
 * MyOnAdjustTop
 *****************************************************************
 */

function MyOnAdjustTop(GUIComponent Sender){

   if( MyListBox.List.Index < MyListBox.List.Top ){
      MyListBox.List.SetIndex( MyListBox.List.Top );
   } else if( MyListBox.List.Index >= MyListBox.List.Top + MyListBox.List.ItemsPerPage ){
      MyListBox.List.SetIndex( MyListBox.List.Top +
                               MyListBox.List.ItemsPerPage );
   }
}

/****************************************************************
 * SliderChange
 ****************************************************************
 */
function SensSliderChange(GUICOmponent Sender){

  Log ("Sens Slider Change:" @ Sender);

  //class'PlayerInput'.default.MouseSensitivity = GuiSlider(Sender).Value;
  //class'PlayerInput'.static.StaticSaveConfig();

  PlayerOwner().
     ConsoleCommand( "SetSensitivity" @ GuiSlider(Sender).Value);

  Class.static.StaticSaveConfig();

}

/*****************************************************************
 * ResetClicked
 *****************************************************************
 */

function bool ResetClicked(GUIComponent Sender)
{
   Controller.ResetKeyboard();
   InitBindings();
   return true;
}


function OnInvertMouse(GUIComponent Sender){
   local bool bIsChecked;

   bIsChecked = moCheckBox(Sender).IsChecked();
   AdvancedPlayerController(PlayerOwner()).InvertLook(bIsChecked);
   //PlayerOwner().
     // ConsoleCommand("set PlayerInput bInvertMouse " $ bIsChecked);
   //class'PlayerInput'.default.bInvertMouse = bIsChecked;
   //class'PlayerInput'.static.StaticSaveConfig();
}


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ClickSound=Sound'DOTZXInterface.Select'
    Bindings[0]=(bIsSectionLabel=false,KeyLabel="Forward",Alias="MoveForward",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[1]=(bIsSectionLabel=false,KeyLabel="Backward",Alias="MoveBackward",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[2]=(bIsSectionLabel=false,KeyLabel="Strafe Left",Alias="StrafeLeft",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[3]=(bIsSectionLabel=false,KeyLabel="Strafe Right",Alias="StrafeRight",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[4]=(bIsSectionLabel=false,KeyLabel="Action",Alias="Action",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[5]=(bIsSectionLabel=false,KeyLabel="Crouch",Alias="Duck",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[6]=(bIsSectionLabel=false,KeyLabel="Jump",Alias="Jump",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[7]=(bIsSectionLabel=false,KeyLabel="Run",Alias="Walking",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[8]=(bIsSectionLabel=false,KeyLabel="Turn Left",Alias="TurnLeft",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[9]=(bIsSectionLabel=false,KeyLabel="Turn Right",Alias="TurnRight",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[10]=(bIsSectionLabel=false,KeyLabel="Look Up",Alias="LookUp",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[11]=(bIsSectionLabel=false,KeyLabel="Look Down",Alias="LookDown",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[12]=(bIsSectionLabel=false,KeyLabel="Fire",Alias="Fire",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[13]=(bIsSectionLabel=false,KeyLabel="Aim",Alias="AltFire",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[14]=(bIsSectionLabel=false,KeyLabel="Reload",Alias="ForceReload",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[15]=(bIsSectionLabel=false,KeyLabel="NextWeapon",Alias="NextWeapon",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[16]=(bIsSectionLabel=false,KeyLabel="PrevWeapon",Alias="PrevWeapon",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[17]=(bIsSectionLabel=false,KeyLabel="QuickSave",Alias="QuickSave",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[18]=(bIsSectionLabel=false,KeyLabel="QuickLoad",Alias="QuickLoad",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[19]=(bIsSectionLabel=false,KeyLabel="Display Objectives",Alias="ToggleObjectivesDisplay",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Bindings[20]=(bIsSectionLabel=false,KeyLabel="Talk",Alias="ReadyToSay",Binds=none,BindKeyNames=none,BindLocalizedKeyNames=none)
    Labels[0]="Forward"
    Labels[1]="Backward"
    Labels[2]="Strafe left"
    Labels[3]="Strafe right"
    Labels[4]="Action"
    Labels[5]="Crouch"
    Labels[6]="Jump"
    Labels[7]="Sprint"
    Labels[8]="Turn Left"
    Labels[9]="Turn Right"
    Labels[10]="Look Up"
    Labels[11]="Look Down"
    Labels[12]="Fire"
    Labels[13]="Zoom/Alt. Attack"
    Labels[14]="Reload"
    Labels[15]="Next Weapon"
    Labels[16]="Previous Weapon"
    Labels[17]="Quick Save"
    Labels[18]="Quick Load"
    Labels[19]="Objectives/Score"
    Labels[20]="Talk"
    NewIndex=-1
    Header="["
    Footer="] Perform this action "
    SectionLabelMargin=20.0000000
    // Reference: BBListBox'DOTZControlSettings.KeyConfigKeyList'
    begin object name=KeyConfigKeyList class=Class'BBGui.BBListBox'
        bVisibleWhenEmpty=true
        StyleName="BBRoundButton"
        bNeverFocus=true
        Hint="Select Control to config"
        WinTop=0.1000000
        WinLeft=0.1750000
        WinWidth=0.6500000
        WinHeight=0.5500000
    end object
    Controls[0]=KeyConfigKeyList
    // Reference: GUIImage'DOTZControlSettings.KeyConfigBK1'
    begin object name=KeyConfigBK1 class=Class'GUI.GUIImage'
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        bAcceptsInput=true
        bNeverFocus=true
        WinTop=0.0850000
        WinLeft=0.1000000
        WinWidth=0.3800000
        WinHeight=0.8000000
    end object
    Controls[1]=KeyConfigBK1
    // Reference: GUIImage'DOTZControlSettings.KeyConfigBK2'
    begin object name=KeyConfigBK2 class=Class'GUI.GUIImage'
        ImageColor=(R=255,G=255,B=255,A=160)
        ImageStyle=1
        WinTop=0.0850000
        WinLeft=0.5000000
        WinWidth=0.2309370
        WinHeight=0.8000000
    end object
    Controls[2]=KeyConfigBK2
    // Reference: GUILabel'DOTZControlSettings.KeyConfigAliasLabel'
    begin object name=KeyConfigAliasLabel class=Class'GUI.GUILabel'
        Caption="Action"
        TextAlign=1
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.0250000
        WinLeft=0.1000000
        WinWidth=0.4300000
        WinHeight=32.0000000
    end object
    Controls[3]=KeyConfigAliasLabel
    // Reference: GUILabel'DOTZControlSettings.KeyConfigAliasLabel2'
    begin object name=KeyConfigAliasLabel2 class=Class'GUI.GUILabel'
        Caption="Key"
        TextAlign=1
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.0250000
        WinLeft=0.5500000
        WinWidth=0.2300000
        WinHeight=32.0000000
    end object
    Controls[4]=KeyConfigAliasLabel2
    // Reference: moCheckBox'DOTZControlSettings.InvertMouse_button'
    begin object name=InvertMouse_button class=Class'GUI.moCheckBox'
        ComponentClassName="BBGui.BBCheckBoxButton"
        LabelFont="PlainGuiFont"
        IniOption="@internal"
        StyleName="BBTextButton"
        bNeverFocus=true
        WinTop=0.7000000
        WinLeft=0.4000000
        WinWidth=0.0700000
        WinHeight=0.1000000
        OnChange=DOTZControlSettings.OnInvertMouse
    end object
    Controls[5]=InvertMouse_button
    // Reference: GUILabel'DOTZControlSettings.invertLabel_l'
    begin object name=invertLabel_l class=Class'GUI.GUILabel'
        Caption="Invert Mouse"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.7000000
        WinLeft=0.2000000
        WinWidth=0.3800000
        WinHeight=0.0500000
    end object
    Controls[6]=invertLabel_l
    // Reference: GUILabel'DOTZControlSettings.sens_label'
    begin object name=sens_label class=Class'GUI.GUILabel'
        Caption="Mouse Sensitivity:"
        TextColor=(R=248,G=243,B=119,A=255)
        TextFont="PlainGuiFont"
        WinTop=0.8000000
        WinLeft=0.2000000
        WinWidth=0.2750000
        WinHeight=0.0600000
    end object
    Controls[7]=sens_label
    // Reference: BBGuiSlider'DOTZControlSettings.sens_slider'
    begin object name=sens_slider class=Class'BBGui.BBGuiSlider'
        MinValue=0.1000000
        MaxValue=10.0000000
        IniOption="ini:Engine.Engine.PlayerInput Sensitivity"
        IniDefault="4"
        Hint="Changes the mouse sensitivity for the game."
        WinTop=0.8100000
        WinLeft=0.4100000
        OnChange=DOTZControlSettings.SensSliderChange
    end object
    Controls[8]=sens_slider
    WinHeight=0.7400000
}