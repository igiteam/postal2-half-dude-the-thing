//=============================================================================
// Number Lock
//
// Description: This class spawns four numbers that are all actionable. The
// player can then enter a four digit number to try and unlock something.
//
// Written by: Gamefan74
//
// Date: October 12th, 2008
//=============================================================================
class NumberLock extends Actor
    placeable;

var(NumberLock) int SolutionNumber;
var(NumberLock) int InitialNumber;
var(NumberLock) int NumberSlotSkinIndex;

var(NumberLock) sound CorrectSound;
var(NumberLock) sound IncorrectSound;
var(NumberLock) sound ToggleSound;

var(NumberLock) vector NumberSlotOffsets[4];

var(NumberLock) name CorrectEvent;
var(NumberLock) name IncorrectEvent;

var(NumberLock) Material NumberTextures[10];

var(NumberLock) StaticMesh NumberSlotMesh;

var bool bSolved;

var class<NumberSlot> NumberSlotClass;

var NumberSlot NumberSlots[4];

var rotator InitialRotation;

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();

    InitialRotation = Rotation;

    SetRotation(rot(0,0,0));
    SetupNumberSlots();
    SetRotation(InitialRotation);
}

function int GetActionablePriority(Controller InstigatingController)
{
    return iActionablePriority;
}

function string GetActionableMessage(Controller InstigatingController)
{
    if (!bSolved)
        return ActionableMessage;
}

simulated function DoActionableAction(Controller InstigatingController)
{
    local int i;

    if (bSolved)
        return;

    if (GetCurrentNumber() == SolutionNumber)
    {
        TriggerEvent(CorrectEvent, self, InstigatingController.Pawn);
        PlaySound(CorrectSound);
        bSolved = true;

        for (i=0; i<4; i++)
            NumberSlots[i].bSolved = true;
    }
    else
    {
        TriggerEvent(IncorrectEvent, self, InstigatingController.Pawn);
        PlaySound(IncorrectSound);
    }
}

function int GetCurrentNumber()
{
    local int Thousand, Hundred, Ten, One, CurrentNumber;

    Thousand = NumberSlots[0].CurrentNumber;
    Thousand *= 1000;
    Hundred = NumberSlots[1].CurrentNumber;
    Hundred *= 100;
    Ten = NumberSlots[2].CurrentNumber;
    Ten *= 10;
    One = NumberSlots[3].CurrentNumber;
    CurrentNumber = Thousand + Hundred + Ten + One;

    Log("Number: " $ string(CurrentNumber));
    return CurrentNumber;
}

function SetupNumberSlots()
{
    local int i, ii, Thousand, Hundred, Ten, One, LockNumber;
    local vector SpawnLoc;

    for (i=0; i<4; i++)
    {
        SpawnLoc = Location + NumberSlotOffsets[i];
        NumberSlots[i] = Spawn(NumberSlotClass,,, SpawnLoc);
        NumberSlots[i].NumberSlotSkinIndex = NumberSlotSkinIndex;
        NumberSlots[i].NumberSlotPlace = i;
        NumberSlots[i].SetStaticMesh(NumberSlotMesh);
        NumberSlots[i].ToggleSound = ToggleSound;
        NumberSlots[i].SetBase(self);

        for (ii=0; ii<10; ii++)
            NumberSlots[i].NumberTextures[ii] = NumberTextures[ii];
    }

    LockNumber = InitialNumber;

    One = LockNumber % 10;
    LockNumber -= One;
    Ten = InitialNumber % 100;
    LockNumber -= Ten;
    Ten /= 10;
    Hundred = InitialNumber % 1000;
    LockNumber -= Hundred;
    Hundred /= 100;
    Thousand = LockNumber;
    Thousand /= 1000;

    NumberSlots[0].SetInitialNumber(Thousand);
    NumberSlots[1].SetInitialNumber(Hundred);
    NumberSlots[2].SetInitialNumber(Ten);
    NumberSlots[3].SetInitialNumber(One);
}


// Decompiled with UE Explorer.
defaultproperties
{
    NumberSlotClass=Class'NumberSlot'
    iActionablePriority=1
    ActionableMessage="Press Action to try the number"
    iActionableRadius=128
    bEdShouldSnap=true
}