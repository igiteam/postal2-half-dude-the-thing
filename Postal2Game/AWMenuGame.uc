///////////////////////////////////////////////////////////////////////////////
// AWMenuGame.uc
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
// The In-Game menu for AW.
//
///////////////////////////////////////////////////////////////////////////////
// This class describes the game menu details and processes game menu events.
///////////////////////////////////////////////////////////////////////////////
class AWMenuGame extends MenuGame;


///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts, enums...
///////////////////////////////////////////////////////////////////////////////
var class<ShellMenuCW> MenuCheatsClass;
var class<ShellMenuCW> MenuSaveClass;
var class<ShellMenuCW> MenuLoadClass;
var class<ShellMenuCW> MenuQuitClass;
var class<ShellMenuCW> MenuOptionsClass;


///////////////////////////////////////////////////////////////////////////////
// Handle notifications from controls
///////////////////////////////////////////////////////////////////////////////
function Notify(UWindowDialogControl C, byte E)
	{
	Super(BaseMenuBig).Notify(C, E);
	switch(E)
		{
		case DE_Click:
			switch (C)
				{
				case ResumeChoice:
					ResumeGame();
					break;
				case CheatsChoice:
					GoToMenu(MenuCheatsClass);
					break;
				case SaveChoice:
					GoToMenu(MenuSaveClass);
					break;
				case LoadChoice:
					GoToMenu(MenuLoadClass);
					break;
				case QuitChoice:
					GoToMenu(MenuQuitClass);	// 01/21/03 JMI Now looks for confirmation.
					break;
				case OptionsChoice:
					GoToMenu(MenuOptionsClass);
					break;
				}
			break;
		}
	}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////


// Decompiled with UE Explorer.
defaultproperties
{
    MenuCheatsClass=Class'AWMenuCheats'
    MenuSaveClass=Class'shell.MenuSave'
    MenuLoadClass=Class'shell.MenuLoad'
    MenuQuitClass=Class'shell.MenuQuitExitConfirmation'
    MenuOptionsClass=Class'AWMenuOptions'
}