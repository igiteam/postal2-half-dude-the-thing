class SPInputPlayerController extends SPPlayerController
    nativereplication
    config(SPInput)
    hidecategories(AnimDependency,Navigation);

var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize array PlayerInputStack;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private int InputIsDisabledCount;

function PostPlayerInputObjectChanged()
{
    //return;    
}

function GetInputCoordinateSystem()
{
    local /*0x01E60000-0x00000000*/ private bool bIgnorePitch[9437185];
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];

    true
    return SPInputBase(PlayerInput).super(SPInputPlayerController).GetInputCoordinateSystem(bIgnorePitch);
    //return ReturnValue;    
}

function GetInputCoordinateSystemAxes()
{
    local /*0x01E60000-0x00000000*/ private @NULL X[25165825], Y, Z;
    local /*0x01E60000-0x00000000*/ private bool bIgnorePitch[9437185];

    true
    SPInputBase(PlayerInput).super(SPInputPlayerController).GetInputCoordinateSystemAxes(X, Y, Z, bIgnorePitch);
    //return;    
}

event InitInputSystem()
{
    local /*0x01E60000-0x00000000*/ private bool bPushInputObject;
    local /*0x01E60000-0x00000000*/ private @NULL SPPI;

    // End:0x1B
    if(PlayerInput == none)
    {
        bPushInputObject = true;
    }
    super.InitInputSystem();
    // End:0xAB
    if(bPushInputObject)
    {
        MainPlayerInput = SPPlayerInput(PlayerInput);
        SPPI = SPInputBase(PlayerInput);
        // End:0xAB
        if(SPPI != none)
        {
            SPPI.OnInputObjectCreate();
            PushPlayerInput(PlayerInput);
        }
    }
    //return;    
}

final function PushPlayerInput()
{
    local /*0x01E60000-0x00000000*/ private @NULL NewPlayerInput[8388609], PrevInputObject;
    local /*0x01E60000-0x00000000*/ private int InteractionIdx;

    // End:0x143
    if(NewPlayerInput != none)
    {
        // End:0x49
        if(PlayerInputStack.Length > 0)
        {
            PrevInputObject = SPInputBase(PlayerInputStack[PlayerInputStack.Length - 1]);
        }
        PlayerInputStack.AddItem(NewPlayerInput);        
        InteractionIdx = Interactions.Find(PlayerInput);        
        PlayerInput = NewPlayerInput;
        // End:0xC6
        if(InteractionIdx == -1)
        {
            Interactions[Interactions.Length] = PlayerInput;            
        }
        else
        {
            Interactions[InteractionIdx] = PlayerInput;
        }
        SPInputBase(PlayerInput).PushedOnTopOfInputStack(PrevInputObject, false);
        // End:0x143
        if(PrevInputObject != none)
        {
            PrevInputObject.PushedBackOnInputStack();
        }
    }
    UpdateControllerConfig();
    PostPlayerInputObjectChanged();
    //return;    
}

final function PopPlayerInput()
{
    local /*0x01E60000-0x00000000*/ private @NULL PlayerInputToPop[9437185], PrevInputObject;
    local /*0x01E60000-0x00000000*/ private int IndexToRemove, InteractionIdx;
    local /*0x01E60000-0x00000000*/ private bool bRemovedCurrentInputHandler;

    // End:0xC6
    if(PlayerInputStack.Length > 0)
    {
        IndexToRemove = ((PlayerInputToPop != none) ? PlayerInputStack.Find(PlayerInputToPop) : );
        PlayerInputStack.Length - 1;
        // End:0x64
        if(IndexToRemove == -1)
        {
            return;
        }
        PrevInputObject = SPInputBase(PlayerInputStack[IndexToRemove]);
        bRemovedCurrentInputHandler = ((PlayerInput == PrevInputObject) ? true : false);
        PlayerInputStack.RemoveItem(PrevInputObject);        
    }
    // End:0x1DF
    if(bRemovedCurrentInputHandler)
    {
        // End:0x1A7
        if(PlayerInputStack.Length > 0)
        {
            InteractionIdx = Interactions.Find(PlayerInput);            
            PlayerInput = PlayerInputStack[PlayerInputStack.Length - 1];
            // End:0x158
            if(InteractionIdx == -1)
            {
                Interactions[Interactions.Length] = PlayerInput;                
            }
            else
            {
                Interactions[InteractionIdx] = PlayerInput;
            }
            SPInputBase(PlayerInput).PoppedToTopOfInputStack(PrevInputObject, false);
        }
        // End:0x1D5
        if(PrevInputObject != none)
        {
            PrevInputObject.PoppedOffOfInputStack();
        }
        PostPlayerInputObjectChanged();
    }
    UpdateControllerConfig();
    //return;    
}

function OnPopPlayerInput()
{
    local /*0x01E60000-0x00000000*/ private @NULL Action[8388609];

    // End:0x12
    if(PlayerInputStack.Length == 1)
    {
        return;
    }
    // End:0x55
    if(Action.bRestoreToDefault)
    {
        J0x34:

        // End:0x52 [Loop If]
        if(PlayerInputStack.Length > 1)
        {
            PopPlayerInput(none);
            // [Loop Continue]
            goto J0x34;
        }        
    }
    else
    {
        PopPlayerInput(none);
    }
    //return;    
}

function OnPushPlayerInput()
{
    local /*0x01E60000-0x00000000*/ private @NULL Action[8388609], newinput;

    // End:0x85
    if(Action.InputInfo != none)
    {
        newinput = Action.InputInfo.GetNewInput(self);
        // End:0x85
        if(newinput != none)
        {
            PushPlayerInput(newinput);
        }
    }
    //return;    
}

private final function UpdateControllerSettings_Worker()
{
    local /*0x01E60000-0x00000000*/ private name TheName[8388609];
    local /*0x01E60000-0x00000000*/ private editfixedsize string TheCommand[8388609];
    local /*0x01E60000-0x00000000*/ private int BindIndex;

    BindIndex = 0;
    J0x0B:

    // End:0xD4 [Loop If]
    if(BindIndex < PlayerInput.Bindings.Length)
    {
        // End:0xC6
        if(PlayerInput.Bindings[BindIndex].Name == TheName)
        {
            PlayerInput.Bindings[BindIndex].Command = TheCommand;
        }
        ++BindIndex;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function OnToggleInput()
{
    local /*0x01E60000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x01E60000-0x00000000*/ private bool bToggleButtons;

    // End:0x60
    if(ClassIsChildOf(inAction.Class, Class'SPEngine.SPSeqAct_ToggleInput'))
    {
        bToggleButtons = SPSeqAct_ToggleInput(inAction).bToggleButtons;
    }
    // End:0xEC
    if(inAction.InputLinks[0].bHasImpulse)
    {
        EnableInput(bToggleButtons, inAction.bToggleMovement, inAction.bToggleTurning);        
    }
    else
    {
        // End:0x178
        if(inAction.InputLinks[1].bHasImpulse)
        {
            DisableInput(bToggleButtons, inAction.bToggleMovement, inAction.bToggleTurning);            
        }
        else
        {
            // End:0x259
            if(inAction.InputLinks[2].bHasImpulse)
            {
                // End:0x1E9
                if(bToggleButtons)
                {
                    // End:0x1DC
                    if(InputIsDisabledCount == 0)
                    {
                        DisableInput(true, false, false);                        
                    }
                    else
                    {
                        EnableInput(true, false, false);
                    }
                }
                // End:0x221
                if(inAction.bToggleMovement)
                {
                    IgnoreMoveInput(!IsMoveInputIgnored());
                }
                // End:0x259
                if(inAction.bToggleTurning)
                {
                    IgnoreLookInput(!IsLookInputIgnored());
                }
            }
        }
    }
    //return;    
}

function DisableInput()
{
    local /*0x01E60000-0x00000000*/ private bool bDisableButtons[8388609], bDisableMovement, bDisableLook;

    // End:0x4F
    if(bDisableButtons)
    {
        // End:0x44
        if(InputIsDisabledCount == 0)
        {
            SPInputBase(PlayerInput).DisableButtonInput();
        }
        InputIsDisabledCount++;
    }
    // End:0x67
    if(bDisableMovement)
    {
        IgnoreMoveInput(true);
    }
    // End:0x7F
    if(bDisableLook)
    {
        IgnoreLookInput(true);
    }
    //return;    
}

function EnableInput()
{
    local /*0x01E60000-0x00000000*/ private bool bEnableButtons[8388609], bEnableMovement, bEnableLook;

    // End:0x60
    if(bEnableButtons && InputIsDisabledCount > 0)
    {
        InputIsDisabledCount--;
        // End:0x60
        if(InputIsDisabledCount == 0)
        {
            SPInputBase(PlayerInput).EnableButtonInput();
        }
    }
    // End:0x78
    if(bEnableMovement)
    {
        IgnoreMoveInput(false);
    }
    // End:0x90
    if(bEnableLook)
    {
        IgnoreLookInput(false);
    }
    //return;    
}

final function IsButtonActive()
{
    local /*0x01E60000-0x00000000*/ private int Button[8388609];
    local /*0x01E60000-0x00000000*/ private bool bRaw[9437185], ReturnValue;

    // End:0x1C
    if(PlayerInput == none)
    {
        ScriptTrace();
        return false;
    }
    return SPInputBase(PlayerInput).super(SPInputPlayerController).IsButtonActive(Button, bRaw);
    //return ReturnValue;    
}

final function ForceButtonRelease()
{
    local /*0x01E60000-0x00000000*/ private int Button[8388609];
    local /*0x01E60000-0x00000000*/ private bool bSilent[9437185];

    // End:0x54
    if(SPInputBase(PlayerInput) != none)
    {
        SPInputBase(PlayerInput).super(SPInputPlayerController).ForceButtonRelease(Button, bSilent);
    }
    //return;    
}

function IsValidNextWeapon()
{
    local /*0x01E60000-0x00000000*/ private @NULL W[8388609];
    local /*0x01E60000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetTriggerGameButtonActionUseList()
{
    local /*0x01E60000-0x00000000*/ private float interactDistanceToCheck[8388609], crosshairDist, minDot;
    local /*0x01E60000-0x00000000*/ private bool bUsuableOnly[8388609];
    local /*0x01E60000-0x00000000*/ private name GBA_ButtonName[8388609];
    local /*0x01E60000-0x00000000*/ private editfixedsize array out_useList[25165825];
    local /*0x01E60000-0x00000000*/ private int Idx;
    local /*0x01E60000-0x00000000*/ private @NULL CameraLoc, CameraRot, checkTrigger, UseSeq;

    // End:0x372
    if(Pawn != none)
    {
        GetPlayerViewPoint(CameraLoc, CameraRot);
        // End:0x371
        foreach Pawn.CollidingActors(Class'Engine.Trigger', checkTrigger, interactDistanceToCheck)
        {
            Idx = 0;
            J0x70:

            // End:0x370 [Loop If]
            if(Idx < checkTrigger.GeneratedEvents.Length)
            {
                UseSeq = SPSeqEvent_GameButtonActionUsed(checkTrigger.GeneratedEvents[Idx]);
                // End:0x362
                if(UseSeq != none)
                {
                    // End:0x362
                    if((((UseSeq.GBA_Button == GBA_ButtonName) && !bUsuableOnly || checkTrigger.GeneratedEvents[Idx].CheckActivate(checkTrigger, Pawn, true)) && !UseSeq.bLookToInteract || (Normal(checkTrigger.Location - CameraLoc) Dot Vector(CameraRot)) >= minDot) && ((UseSeq.bAimToInteract && IsAimingAt(checkTrigger, 0.9800000)) && VSize(Pawn.Location - checkTrigger.Location) <= UseSeq.InteractDistance) || !UseSeq.bAimToInteract && VSize(Pawn.Location - checkTrigger.Location) <= UseSeq.InteractDistance)
                    {
                        out_useList[out_useList.Length] = checkTrigger;
                        Idx = checkTrigger.GeneratedEvents.Length;
                    }
                }
                Idx++;
                // [Loop Continue]
                goto J0x70;
            }            
        }        
    }
    //return;    
}

event TriggerGameButtonActionInteraction()
{
    local /*0x01E60000-0x00000000*/ private name GBA_ButtonName[8388609];
    local /*0x01E60000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x01E60000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x01E60000-0x00000000*/ private @NULL A;
    local /*0x01E60000-0x00000000*/ private int Idx, I;
    local /*0x01E60000-0x00000000*/ private float Weight;
    local /*0x01E60000-0x00000000*/ private bool bInserted;
    local /*0x01E60000-0x00000000*/ private @NULL CameraLoc, CameraRot;
    local /*0x01E60000-0x00000000*/ private editfixedsize array useList, sortedList, weightList;
    local /*0x01E60000-0x00000000*/ private @NULL UseSeq;

    // End:0x2A
    if((InputIsDisabledCount > 0) && GBA_ButtonName != 'Pause')
    {
        return true;
    }
    // End:0x404
    if(Pawn != none)
    {
        GetTriggerGameButtonActionUseList(InteractDistance, 60.0000000, 0.0000000, true, GBA_ButtonName, useList);
        // End:0x404
        if(useList.Length > 0)
        {
            GetPlayerViewPoint(CameraLoc, CameraRot);
            J0x95:

            // End:0x2BC [Loop If]
            if(useList.Length > 0)
            {
                A = useList[useList.Length - 1];
                useList.Length = useList.Length - 1;
                Weight = Normal(A.Location - CameraLoc) Dot Vector(CameraRot);
                Weight += (1.0000000 - (VSize(A.Location - Pawn.Location) / InteractDistance));
                bInserted = false;
                Idx = 0;
                J0x194:

                // End:0x25C [Loop If]
                if((Idx < sortedList.Length) && !bInserted)
                {
                    // End:0x24E
                    if(weightList[Idx] < Weight)
                    {
                        sortedList.Insert(Idx, 1);                        
                        weightList.Insert(Idx, 1);                        
                        sortedList[Idx] = A;
                        weightList[Idx] = Weight;
                        bInserted = true;
                    }
                    Idx++;
                    // [Loop Continue]
                    goto J0x194;
                }
                // End:0x2B9
                if(!bInserted)
                {
                    Idx = sortedList.Length;
                    sortedList[Idx] = A;
                    weightList[Idx] = Weight;
                }
                // [Loop Continue]
                goto J0x95;
            }
            Idx = 0;
            J0x2C7:

            // End:0x404 [Loop If]
            if(Idx < sortedList.Length)
            {
                // End:0x3F6
                if(sortedList[Idx].TriggerEventClass(Class'SPSeqEvent_GameButtonActionUsed', Pawn, int(InputEvent)))
                {
                    I = 0;
                    J0x335:

                    // End:0x3F4 [Loop If]
                    if(I < sortedList[Idx].GeneratedEvents.Length)
                    {
                        UseSeq = SPSeqEvent_GameButtonActionUsed(sortedList[Idx].GeneratedEvents[I]);
                        // End:0x3E6
                        if((UseSeq != none) && UseSeq.bDisableGameAction)
                        {
                            return true;
                        }
                        I++;
                        // [Loop Continue]
                        goto J0x335;
                    }
                    return false;
                }
                Idx++;
                // [Loop Continue]
                goto J0x2C7;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function IgnoreMoveInput()
{
    local /*0x01E60000-0x00000000*/ private bool bNewMoveInput[8388609];

    SPInputBase(PlayerInput).MovementStickHandsOffTime = 0.0000000;
    super(PlayerController).IgnoreMoveInput(bNewMoveInput);
    //return;    
}

state AttachToOtherActor extends BaseSpectating
{
    ignores StartFire;

    event BeginState()
    {
        local /*0x01E60000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        bCollideWorld = false;
        //return;        
    }

    event EndState()
    {
        local /*0x01E60000-0x00000000*/ private name NextStateName[8388609];

        bCollideWorld = true;
        super.EndState(NextStateName);
        //return;        
    }

    function PlayerMove()
    {
        local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x01E60000-0x00000000*/ private @NULL X, Y, Z, newAccel, ViewRotation;

        local /*0x01E60000-0x00000000*/ private float BaseSpectatorCameraSpeed, MinCameraSpeedMultiplier, MaxCameraSpeedMultiplier;

        // End:0x82
        if(WorldInfo.Game.GameSpeed < 1.0000000)
        {
            DeltaTime *= (1.0000000 / WorldInfo.Game.GameSpeed);
        }
        GetAxes(Rotation, X, Y, Z);
        newAccel = ((PlayerInput.aForward * X) + (PlayerInput.aStrafe * Y)) + (PlayerInput.aUp * vect(0.0000000, 0.0000000, 1.0000000));
        ViewRotation = Rotation;
        ViewRotation.Yaw += int(PlayerInput.aTurn);
        ViewRotation.Pitch += int(PlayerInput.aLookUp);
        SetRotation(ViewRotation);
        BaseSpectatorCameraSpeed = SpectatorCameraSpeed;
        MinCameraSpeedMultiplier = 5.0000000;
        MaxCameraSpeedMultiplier = 10.0000000;
        SpectatorCameraSpeed /= FMax(1.0000000, PlayerInput.aLeftAnalogTrigger * MinCameraSpeedMultiplier);
        SpectatorCameraSpeed *= FMax(1.0000000, PlayerInput.aRightAnalogTrigger * MaxCameraSpeedMultiplier);
        // End:0x309
        if(((PlayerInput.aRightAnalogTrigger == 0.0000000) && SPInputBase(PlayerInput) != none) && SPInputBase(PlayerInput).IsButtonPressed(name("Fire")))
        {
            SpectatorCameraSpeed *= MaxCameraSpeedMultiplier;
        }
        // End:0x34B
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, newAccel, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, newAccel, 0, rot(0, 0, 0));
        }
        SpectatorCameraSpeed = BaseSpectatorCameraSpeed;
        //return;        
    }

    function ProcessMove()
    {
        local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x01E60000-0x00000000*/ private @NULL newAccel[8388609];
        local /*0x01E60000-0x00000000*/ private byte DoubleClickMove[8388609];
        local /*0x01E60000-0x00000000*/ private @NULL DeltaRot[8388609], DebugModeManager;

        DebugModeManager = mySPHUD.GetDebugModeManager();
        // End:0xAC
        if((DebugModeManager != none) && DebugModeManager.GetDebugMode().IsFlagEnabled('FreeCamMovePlayer'))
        {
            global.ProcessMove(DeltaTime, newAccel, DoubleClickMove, DeltaRot);            
        }
        else
        {
            super.ProcessMove(DeltaTime, newAccel, DoubleClickMove, DeltaRot);
        }
        //return;        
    }
Begin:

    stop;                
}

defaultproperties
{
    InputClass=Class'SPInputBase'
    // Reference: CylinderComponent'Default__SPInputPlayerController.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}