//=============================================================================
// Number Slot
//
// Description: This is an actionable number on the lock. It'll only go in one
// direction since we're not using a user interface.
//
// Written by: Gamefan74
//
// Date: October 12th, 2008
//=============================================================================
class NumberSlot extends Actor;

var bool bSolved;

var int CurrentNumber;
var int NumberSlotSkinIndex;
var int NumberSlotPlace;

var sound ToggleSound;

var Material NumberTextures[10];

function int GetActionablePriority(Controller InstigatingController)
{
    return iActionablePriority;
}

function string GetActionableMessage(Controller InstigatingController)
{
    local string Suffix;

    if (!bSolved)
    {
        switch (NumberSlotPlace)
        {
            case 0:    Suffix = "Thousands";
                       break;

            case 1:    Suffix = "Hundreds";
                       break;

            case 2:    Suffix = "Tens";
                       break;

            case 3:    Suffix = "Ones";
                       break;
        }

        return ActionableMessage $ Suffix;
    }
}

simulated function DoActionableAction(Controller InstigatingController)
{
    if (bSolved)
        return;

    CurrentNumber = (CurrentNumber + 1) % 10;
    Skins[NumberSlotSkinIndex] = NumberTextures[CurrentNumber];

    if (ToggleSound != None)
        PlaySound(ToggleSound);
}

function SetInitialNumber(int InitialNumber)
{
    CurrentNumber = InitialNumber;
    Skins[NumberSlotSkinIndex] = NumberTextures[CurrentNumber];
}


// Decompiled with UE Explorer.
defaultproperties
{
    iActionablePriority=2
    ActionableMessage="Press Action to toggle "
    iActionableRadius=128
    DrawType=8
}