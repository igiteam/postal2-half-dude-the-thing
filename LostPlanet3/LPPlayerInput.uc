class LPPlayerInput extends SPGFInput within LPPlayerController
    transient
    config(Input)
    hidecategories(Object,UIRoot);

enum EGameButtonActions
{
    GB_Jump,                        // 0
    GB_CenterCamera,                // 1
    GB_Use,                         // 2
    GB_Use2,                        // 3
    GB_Evasive,                     // 4
    GB_Melee,                       // 5
    GB_RightArmAction,              // 6
    GB_RightArmAltAction,           // 7
    GB_ShoulderAim,                 // 8
    GB_LeftArmAction,               // 9
    GB_GrapplingHook,               // 10
    GB_Grenade,                     // 11
    GB_GrabGameplayTest,            // 12
    GB_WinchArm,                    // 13
    GB_VSShieldBlock,               // 14
    GB_StruggleStab,                // 15
    GB_Reload,                      // 16
    GB_ChangeAmmo,                  // 17
    GB_ToggleFlashlight,            // 18
    GB_VSWinchCrush,                // 19
    GB_VSWinchShock,                // 20
    GB_ChangePosture,               // 21
    GB_SwitchWeapon,                // 22
    GB_Pause,                       // 23
    GB_Fire,                        // 24
    GB_AltFire,                     // 25
    GB_ToggleMusicPlayer,           // 26
    GB_CheatMapMenu,                // 27
    GB_IncomingMessage,             // 28
    GB_JobLog,                      // 29
    GB_Scoreboard,                  // 30
    GB_MusicPlayerOff,              // 31
    GB_Sprint,                      // 32
    GB_StruggleButton,              // 33
    GB_ReviveIncapacitated,         // 34
    GB_DropSwapWeapon,              // 35
    GB_VSSwitchWeapon,              // 36
    GB_OperateThermalPost,          // 37
    GB_RepairVS,                    // 38
    GB_SpecialAction,               // 39
    GB_TapIn,                       // 40
    GB_TapOut,                      // 41
    GB_TapOutNoxious,               // 42
    GB_UsePerk,                     // 43
    GB_OperatePerk,                 // 44
    GB_PickupUseCourierItem,        // 45
    GB_OperateBomb,                 // 46
    GB_PrepareThermalPostTransfer,  // 47
    GB_DoThermalPostTransfer,       // 48
    GB_DoGeneralInteractionOperation,// 49
    GB_DoHackDeployableOperation,   // 50
    GB_PickupItem,                  // 51
    GB_MusicPlayerPlay,             // 52
    GB_MusicPlayerStop,             // 53
    GB_MusicPlayerPrev,             // 54
    GB_MusicPlayerNext,             // 55
    GB_ChangeZoomLevel,             // 56
    GB_InteractiveMovieUP,          // 57
    GB_InteractiveMovieDN,          // 58
    GB_InteractiveMovieLT,          // 59
    GB_InteractiveMovieRT,          // 60
    GB_FastTravel,                  // 61
    GB_SwitchToPistol,              // 62
    GB_PingBreadcrumbs,             // 63
    GB_TakeCover,                   // 64
    GB_CancelMatinee,               // 65
    GB_CancelRepair,                // 66
    GB_Max                          // 67
};

struct native CommandConfig
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CommandName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string GameCommand;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Primary;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PrimaryDisplay;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Secondary;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string SecondaryDisplay;

    structdefaultproperties
    {
        CommandName=""
        GameCommand=""
        Primary=""
        PrimaryDisplay=""
        Secondary=""
        SecondaryDisplay=""
    }
};

struct KeyMapping
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name Key;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Mapping;

    structdefaultproperties
    {
        Key="None"
        Mapping=""
    }
};

var(0.25_Pct) /*0x81BC0000-0x00000000*/ private bool bUseNewFunkySprint[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisableMouseAiming;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnFootCommands[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array UtilityRigCommands[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VitalSuitCommands[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int KeyMappingsVersionNumber[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CurrentCommands[536870913];

// Export ULPPlayerInput::execSetUsingGamepad(FFrame&, void* const)
native function SetUsingGamepad()
{
    local /*0x97E50000-0x00000000*/ private bool bUsingPad[8388609];


}

// Export ULPPlayerInput::execLoadCommandMappings(FFrame&, void* const)
native function LoadCommandMappings();

// Export ULPPlayerInput::execSaveCommandMappings(FFrame&, void* const)
native function SaveCommandMappings();

// Export ULPPlayerInput::execSetDefaultCommandMappings(FFrame&, void* const)
native function SetDefaultCommandMappings();

function OnInputObjectCreate()
{
    super(SPInputBase).OnInputObjectCreate();
    Class'SPEngine.SPUtil'.static.SetIntegrateButtonSubSamples(true);
    // End:0x64
    if(!Class'Engine.WorldInfo'.static.IsConsoleBuild(0))
    {
        LoadCommandMappings();
        ApplyControlMapping();
    }
    //return;    
}

function ApplyControlMapping()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Keys;
    local /*0x97E50000-0x00000000*/ private name EscapeKey;

    // End:0x1FB
    if(!Class'Engine.WorldInfo'.static.IsPlayInEditor())
    {
        I = 0;
        J0x2F:

        // End:0x171 [Loop If]
        if(I < CurrentCommands.Length)
        {
            // End:0xD5
            if(CurrentCommands[I].Secondary != "")
            {
                AddKeyMapping(Keys, name(CurrentCommands[I].Secondary), CurrentCommands[I].GameCommand);
            }
            // End:0x163
            if(CurrentCommands[I].Primary != "")
            {
                AddKeyMapping(Keys, name(CurrentCommands[I].Primary), CurrentCommands[I].GameCommand);
            }
            I++;
            // [Loop Continue]
            goto J0x2F;
        }
        I = 0;
        J0x17C:

        // End:0x1F8 [Loop If]
        if(I < Keys.Length)
        {
            SetBind(Keys[I].Key, Keys[I].Mapping);
            I++;
            // [Loop Continue]
            goto J0x17C;
        }        
    }
    else
    {
        EscapeKey = 'Escape';
        SetBind(EscapeKey, "CloseEditorViewport");
    }
    //return;    
}

function AddKeyMapping()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Keys[25165825];
    local /*0x97E50000-0x00000000*/ private name KeyToFind[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string GameCommand[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Key;

    I = 0;
    J0x0B:

    // End:0x68 [Loop If]
    if(I < Keys.Length)
    {
        // End:0x5A
        if(Keys[I].Key == KeyToFind)
        {
            // [Explicit Break]
            goto J0x68;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x68:

    // End:0x11A
    if(I < Keys.Length)
    {
        // End:0x117
        if(InStr(Keys[I].Mapping, GameCommand) < 0)
        {
            Keys[I].Mapping = (Keys[I].Mapping @ "|") @ GameCommand;
        }        
    }
    else
    {
        Key.Key = KeyToFind;
        Key.Mapping = GameCommand;
        Keys.AddItem(Key);        
    }
    //return;    
}

function GetCurrentCommand()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CommandName[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689], Command;
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x85 [Loop If]
    if(I < CurrentCommands.Length)
    {
        // End:0x77
        if(CurrentCommands[I].CommandName == CommandName)
        {
            Command = CurrentCommands[I];
            // [Explicit Break]
            goto J0x85;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x85:

    return Command;
    //return ReturnValue;    
}

event InitializeButtonHandlingHandlers()
{
    //return;    
}

event PlayerInput()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPInputBase).PlayerInput(DeltaTime);
    Outer.UpdateJoystickRemapping();
    //return;    
}

function ApplyConfigToKeyBindings()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CurrentConfigName[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], confign, I;
    local /*0x97E50000-0x00000000*/ private bool funkysprint;

    confign = super(SPInputBase).ApplyConfigToKeyBindings(CurrentConfigName);
    funkysprint = false;
    I = 0;
    J0x34:

    // End:0xD3 [Loop If]
    if(I < Bindings.Length)
    {
        // End:0xC5
        if(Bindings[I].Name == 'XboxTypeS_A')
        {
            funkysprint = InStr(Bindings[I].Command, "GBA_Sprint", false, true) < 0;
        }
        ++I;
        // [Loop Continue]
        goto J0x34;
    }
    bUseNewFunkySprint = funkysprint;
    return confign;
    //return ReturnValue;    
}

function PostProcessInput()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0x2B
    if(bDisableMouseAiming)
    {
        aMouseX = 0.0000000;
        aMouseY = 0.0000000;
    }
    //return;    
}

event PreInputKey()
{
    local /*0x97E50000-0x00000000*/ private name KeyName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], ReturnValue;

    // End:0x54
    if((KeyName == 'RightMouseButton') && Outer.IsJobLogOpen())
    {
        bDisableMouseAiming = !bPressed;
        return true;
    }
    return false;
    //return ReturnValue;    
}

function FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];
    local /*0x97E50000-0x00000000*/ private int ButtonIdx[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = Outer;
    // End:0x3FB
    if(LPPC != none)
    {
        // End:0x329
        if(int(LPPC.WorldInfo.NetMode) != int(NM_Standalone))
        {
            switch(LPPC.GetStateName())
            {
                // End:0xAA
                case 'WaitingForGameStart':
                    // End:0xA7
                    if(ButtonName != 'Pause')
                    {
                        return true;
                    }
                    // End:0x329
                    break;
                // End:0xEB
                case 'RoundEnded':
                    // End:0xE8
                    if((ButtonName != 'Fire') && ButtonName != 'Pause')
                    {
                        return true;
                    }
                    // End:0x329
                    break;
                // End:0x1DB
                case 'Incapacitated':
                    // End:0x1D9
                    if(((((((ButtonName == 'Pause') || ButtonName == 'TapIn') || ButtonName == 'TapOut') || ButtonName == 'TapOutNoxious') || (ButtonName == 'ShoulderAim') && !bPressed) || (ButtonName == 'Fire') && !bPressed) || (ButtonName == 'AltFire') && !bPressed)
                    {
                        return false;
                    }
                    return true;
                // End:0x224
                case 'PlantThermalPost':
                    // End:0x219
                    if((ButtonName == 'Pause') || ButtonName == 'OperateThermalPost')
                    {
                        return false;
                    }
                    return bPressed;
                // End:0x26D
                case 'InflateThermalPost':
                    // End:0x262
                    if((ButtonName == 'Pause') || ButtonName == 'OperateThermalPost')
                    {
                        return false;
                    }
                    return bPressed;
                // End:0x2B6
                case 'PrepareThermalPostTransfer':
                    // End:0x2AB
                    if((ButtonName == 'Pause') || ButtonName == 'PrepareThermalPostTransfer')
                    {
                        return false;
                    }
                    return bPressed;
                // End:0x2FF
                case 'DoThermalPostTransfer':
                    // End:0x2F4
                    if((ButtonName == 'Pause') || ButtonName == 'DoThermalPostTransfer')
                    {
                        return false;
                    }
                    return bPressed;
                // End:0x326
                case 'Dead':
                    // End:0x324
                    if(ButtonName == 'Scoreboard')
                    {
                        return true;
                    }
                    return false;
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
            switch(LPPC.GetStateName())
            {
                // End:0x3F8
                case 'InteractingWithGeneralInteractionObject':
                    // End:0x3ED
                    if((((((ButtonName == 'Use') || ButtonName == 'DoGeneralInteractionOperation') || ButtonName == 'DoInteractiveMovieUP') || ButtonName == 'DoInteractiveMovieDN') || ButtonName == 'DoInteractiveMovieLT') || ButtonName == 'DoInteractiveMovieRT')
                    {
                        return false;
                    }
                    return bPressed;
                // End:0xFFFF
                default:
                    break;
                }
        }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x329! */
        else
        {
            return super(SPInputBase).FilterButtonInput(ButtonName, bPressed, ButtonIdx);
            //return ReturnValue;            
        }
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x013! */
}

function HandleShoulderAim()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPTDI;

    LPTDI = LPTuneDataInput(TuneDataInput);
    // End:0xA4
    if(bPressed)
    {
        Outer.ShoulderAimButtonPress(true);
        // End:0xA1
        if(LPTDI != none)
        {
            UseRotationInputCurve(LPTDI.GetADSInputCurveRotationStickX(), LPTDI.GetADSInputCurveRotationStickY());
        }        
    }
    else
    {
        Outer.ShoulderAimButtonPress(false);
        UseDefaultRotationInputCurve();
    }
    //return;    
}

function HandleMeleeMove()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    Outer.MeleeMoveButtonPress(bPressed);
    //return;    
}

function HandleSpecialAction()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    Outer.SpecialActionButtonPress(bPressed);
    //return;    
}

function HandleTakeCover()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    Outer.TakeCoverButtonPressed(bPressed);
    //return;    
}

function HandleEvade()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    Outer.EvadeButtonPress(bPressed);
    //return;    
}

function HandleGrapplingHook()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    Outer.GrapplingHookButtonPress(bPressed);
    //return;    
}

function HandleWinchArm()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x2D
    if(bPressed)
    {
        Outer.WinchArmButtonPress();
    }
    //return;    
}

function HandleGrenade()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    Outer.PlayerMoveInfo.bGrenadeButtonPressed = bPressed;
    // End:0xB0
    if(!Outer.IsMoveInputIgnored())
    {
        // End:0x91
        if(bPressed)
        {
            Outer.GrenadeButtonPress();            
        }
        else
        {
            Outer.GrenadeStopButtonPress();
        }
    }
    //return;    
}

function HandleReload()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x4E
    if(!Outer.IsMoveInputIgnored())
    {
        Outer.Reload(bPressed);
    }
    //return;    
}

function HandleChangeAmmo()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x53
    if(!Outer.IsMoveInputIgnored() && bPressed)
    {
        Outer.ChangeAmmo();
    }
    //return;    
}

function HandleFlashlight()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    //return;    
}

function HandleRightArmAction()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x30
    if(bPressed)
    {
        Outer.RightArmButtonPress();        
    }
    else
    {
        Outer.RightArmStopButtonPress();
    }
    //return;    
}

function HandleRightArmAltAction()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x30
    if(bPressed)
    {
        Outer.RightArmAltButtonPress();        
    }
    else
    {
        Outer.RightArmAltButtonRelease();
    }
    //return;    
}

function HandleLeftArmAction()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x30
    if(bPressed)
    {
        Outer.LeftArmButtonPress();        
    }
    else
    {
        Outer.LeftArmButtonRelease();
    }
    //return;    
}

function HandleGrabGameplayTest()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x62
    if(bPressed)
    {
        Outer.MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_GrabGameplayTest);
    }
    //return;    
}

function HandleVSShieldBlock()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x30
    if(bPressed)
    {
        Outer.VSShieldBlockButtonPress();        
    }
    else
    {
        Outer.VSShieldBlockButtonRelease();
    }
    //return;    
}

function HandleVSWinchCrush()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x2D
    if(bPressed)
    {
        Outer.VSCrushWithWinchArm();
    }
    //return;    
}

function HandleVSWinchShock()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x30
    if(bPressed)
    {
        Outer.VSShockWithWinchArm();        
    }
    else
    {
        Outer.VSShockWithWinchArmReleased();
    }
    //return;    
}

function HandlePause()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x30
    if(bPressed == false)
    {
        Outer.ConditionalPauseGame();
    }
    //return;    
}

function HandleFire()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    Outer.PlayerMoveInfo.bFirePressed = bPressed;
    // End:0x8E
    if(bPressed)
    {
        Outer.bFire = 1;
        Outer.ConditionalCancelPendingReload();        
    }
    else
    {
        Outer.bFire = 0;
        Outer.StopFire();
    }
    //return;    
}

function HandleAltFire()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    Outer.PlayerMoveInfo.bAltFirePressed = bPressed;
    // End:0x6E
    if(bPressed)
    {
        Outer.StartAltFire();        
    }
    else
    {
        Outer.StopAltFire();
    }
    //return;    
}

function HandleToggleVS()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x2D
    if(bPressed)
    {
        Outer.ToggleVS();
    }
    //return;    
}

function HandleStruggleStab()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x2D
    if(bPressed)
    {
        Outer.StruggleStabPress();
    }
    //return;    
}

function HandleStruggleButton()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x2D
    if(bPressed)
    {
        Outer.StruggleButtonPress();
    }
    //return;    
}

function HandleChangePosture()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0xA2
    if(bPressed && !Outer.IsMoveInputIgnored())
    {
        // End:0x7A
        if(Outer.IsInCoverState())
        {
            Outer.ClientBreakFromCover();
            return;            
        }
        else
        {
            // End:0xA2
            if(Outer.TryToRunToCover())
            {
                return;
            }
        }
    }
    // End:0x202
    if(bPressed && !Outer.IsMoveInputIgnored())
    {
        // End:0x121
        if(Outer.MyBasePlayerPawn.SprintControl.bSprinting)
        {
            return;
        }
        // End:0x1CB
        if(Outer.MyBasePlayerPawn.bIsCrouched || Outer.MyBasePlayerPawn.bWantsToCrouch)
        {
            Outer.MyBasePlayerPawn.ChangePosture(false);            
        }
        else
        {
            Outer.MyBasePlayerPawn.ChangePosture(true);
        }
    }
    //return;    
}

function HandleSwitchWeapon()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x98
    if((!Outer.IsMoveInputIgnored() && Outer.DoesPlayerCSAAllowWeapons()) && !Outer.PlayerIsDoingVSTransition())
    {
        Outer.SwitchPlayerWeaponButtonPress(bPressed);
    }
    //return;    
}

function HandleVSSwitchWeapon()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x77
    if(bPressed)
    {
        // End:0x77
        if(!Outer.IsMoveInputIgnored() && !Outer.PlayerIsDoingVSTransition())
        {
            Outer.NextVSWeapon();
        }
    }
    //return;    
}

function HandleSwitchToPistol()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0xD4
    if(bPressed)
    {
        // End:0xD4
        if(((!Outer.IsMoveInputIgnored() && Outer.DoesPlayerCSAAllowWeapons()) && !Outer.PlayerIsDoingVSTransition()) && !Outer.PlayerMoveInfo.bPlayerWeaponSwitchPressed)
        {
            Outer.DoSwitchToPistol();
        }
    }
    //return;    
}

function HandleToggleMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    //return;    
}

function HandleMusicPlayerOff()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    //return;    
}

function HandleMusicPlayerPlay()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x51
    if(bPressed)
    {
        // End:0x51
        if(!Outer.IsMoveInputIgnored())
        {
            Outer.MusicPlayerPlay();
        }
    }
    //return;    
}

function HandleMusicPlayerStop()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x51
    if(bPressed)
    {
        // End:0x51
        if(!Outer.IsMoveInputIgnored())
        {
            Outer.MusicPlayerStop();
        }
    }
    //return;    
}

function HandleMusicPlayerPrev()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x51
    if(bPressed)
    {
        // End:0x51
        if(!Outer.IsMoveInputIgnored())
        {
            Outer.MusicPlayerPrev();
        }
    }
    //return;    
}

function HandleMusicPlayerNext()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x51
    if(bPressed)
    {
        // End:0x51
        if(!Outer.IsMoveInputIgnored())
        {
            Outer.MusicPlayerNext();
        }
    }
    //return;    
}

function HandleCheatMapMenu()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x49
    if(bPressed)
    {        
        Outer.ConsoleCommand("OpenCheatMapMenu");
    }
    //return;    
}

function HandleIncomingMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x42
    if(bPressed)
    {
        Outer.myLPHUD.IncomingMessageButtonPress();
    }
    //return;    
}

function HandlePingBreadcrumbs()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPBM, CurrentObjective;

    // End:0x108
    if(bPressed)
    {
        // End:0x108
        if(!Outer.IsMoveInputIgnored())
        {
            LPBM = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager();
            // End:0x108
            if(LPBM != none)
            {
                LPBM.RequestShowPath(Outer);
                CurrentObjective = LPBM.GetObjectiveToTrack();
                // End:0x108
                if(CurrentObjective != none)
                {
                    Outer.myLPHUD.ShowQuestCurrentObjectiveMessage(CurrentObjective, true);
                }
            }
        }
    }
    //return;    
}

function HandleCancelMatinee()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x2D
    if(bPressed)
    {
        Outer.TryToCancelMatinee();
    }
    //return;    
}

function HandleJobLog()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove, bNetworkGame;

    // End:0x9C
    if(Outer.CoverPawn.IsUsingCover())
    {
        // End:0x9C
        if((int(Outer.CoverPawn.CoverType) == int(3)) || Outer.bLockInCover)
        {
            return;
        }
    }
    bNetworkGame = int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone);
    // End:0x169
    if(bPressed && !bNetworkGame)
    {
        // End:0x14A
        if(!Outer.IsJobLogOpen())
        {
            Outer.OpenJobLog();            
        }
        else
        {
            Outer.TryCloseJobLog();
        }
    }
    //return;    
}

function HandleScoreboard()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove, bNetworkGame, bScoreboardShown;

    bNetworkGame = int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone);
    // End:0x107
    if(bNetworkGame)
    {
        bScoreboardShown = Outer.myLPHUD.ScoreboardIsShown();
        // End:0x107
        if((bScoreboardShown && !bPressed) || !bScoreboardShown && bPressed)
        {
            Outer.myLPHUD.ToggleRoundScoreboard();
        }
    }
    //return;    
}

function HandleSprint()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    Outer.SprintButtonPress(bPressed);
    //return;    
}

function HandleReviveIncapacitated()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove, bNetworkGame;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    bNetworkGame = int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone);
    LPPC = Outer;
    // End:0x107
    if((((LPPC != none) && LPPC.myLPHUD != none) && LPPC.myLPHUD.IsMessageLayerTopmost(10)) && bNetworkGame)
    {
        // End:0x107
        if(bPressed)
        {
            LPPC.StartReviveIncapacitated();
        }
    }
    // End:0x144
    if(bNetworkGame && !bPressed)
    {
        LPPC.EndDoReviveIncapacitated();
    }
    LPPC.PlayerMoveInfo.bDoReviveIncapacitated = bPressed;
    //return;    
}

function HandleDropSwapWeapon()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPIM, LPP;

    // End:0xDC
    if(bPressed)
    {
        LPP = LPPlayerPawn(Outer.Pawn);
        // End:0xDC
        if(LPP != none)
        {
            LPIM = LPInventoryManager(LPP.InvManager);
            // End:0xDC
            if((LPIM != none) && !LPP.IsDoingASpecialMove())
            {
                LPIM.ServerDropAndSwapWeapons(LPP);
            }
        }
    }
    //return;    
}

function HandleDoPickupItem()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPIM, LPP;

    // End:0xDC
    if(bPressed)
    {
        LPP = LPPlayerPawn(Outer.Pawn);
        // End:0xDC
        if(LPP != none)
        {
            LPIM = LPInventoryManager(LPP.InvManager);
            // End:0xDC
            if((LPIM != none) && !LPP.IsDoingASpecialMove())
            {
                LPIM.ServerPickupClosestItem(LPP);
            }
        }
    }
    //return;    
}

function HandleOperateThermalPost()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = Outer;
    // End:0x40
    if(bPressed)
    {
        LPPC.StartThermalPostOperation();
    }
    LPPC.PlayerMoveInfo.bOperateThermalPostPressed = bPressed;
    //return;    
}

function HandlePrepareThermalPostTransfer()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x41
    if(int(Outer.WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    LPPC = Outer;
    // End:0x80
    if(bPressed)
    {
        LPPC.StartPrepareThermalPostTransfer();
    }
    LPPC.PlayerMoveInfo.bPrepareThermalPostTransferPressed = bPressed;
    //return;    
}

function HandleDoThermalPostTransfer()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x41
    if(int(Outer.WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    LPPC = Outer;
    // End:0x83
    if(bPressed)
    {
        LPPC.StartDoThermalPostTransfer();        
    }
    else
    {
        LPPC.EndDoThermalPostTransfer();
    }
    LPPC.PlayerMoveInfo.bDoThermalPostTransferPressed = bPressed;
    //return;    
}

function HandleDoGeneralInteractionOperation()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = Outer;
    // End:0xB5
    if((((LPPC != none) && LPPC.myLPHUD != none) && LPPC.myLPHUD.IsMessageLayerTopmost(13)) && bPressed)
    {
        LPPC.StartGeneralInteractionOperation();        
    }
    else
    {
        // End:0xE3
        if(!bPressed)
        {
            LPPC.EndDoGeneralInteractionOperation();
        }
    }
    LPPC.PlayerMoveInfo.bDoGeneralInteractionOperation = bPressed;
    //return;    
}

function HandleDoInteractiveMovieUP()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = Outer;
    // End:0x41
    if(bPressed)
    {
        LPPC.InteractiveMovieInput(1);
    }
    //return;    
}

function HandleDoInteractiveMovieDN()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = Outer;
    // End:0x42
    if(bPressed)
    {
        LPPC.InteractiveMovieInput(2);
    }
    //return;    
}

function HandleDoInteractiveMovieLT()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = Outer;
    // End:0x41
    if(bPressed)
    {
        LPPC.InteractiveMovieInput(0);
    }
    //return;    
}

function HandleDoInteractiveMovieRT()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = Outer;
    // End:0x42
    if(bPressed)
    {
        LPPC.InteractiveMovieInput(3);
    }
    //return;    
}

function HandleDoHackDeployableOperation()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = Outer;
    // End:0x43
    if(bPressed)
    {
        LPPC.StartHackDeployableOperation();        
    }
    else
    {
        LPPC.EndDoHackDeployableOperation();
    }
    LPPC.PlayerMoveInfo.bDoHackDeployableOperation = bPressed;
    //return;    
}

function HandleOperateBomb()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x62
    if((Outer.Pawn == none) || !Outer.Pawn.IsAliveAndWell())
    {
        return;
    }
    // End:0x153
    if((Outer.CurrentBombActor != none) && bPressed)
    {
        // End:0xF4
        if(Outer.CurrentBombActor.CanPlantBomb(Outer))
        {
            Outer.PlantBomb();
        }
        // End:0x153
        if(Outer.CurrentBombActor.CanDisarmBomb(Outer))
        {
            Outer.DisarmBomb();
        }
    }
    //return;    
}

function HandleRepairVS()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDbClickMove;

    Outer.RepairVS(bPressed);
    //return;    
}

function HandleFastTravel()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDbClickMove;

    Outer.FastTravelRequest(bPressed);
    //return;    
}

function HandleTapIn()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDbClickMove, bNetworkGame;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    bNetworkGame = int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone);
    // End:0xA6
    if(bPressed && bNetworkGame)
    {
        LPPC = Outer;
        // End:0xA6
        if(LPPC != none)
        {
            LPPC.StartTapIn();
        }
    }
    //return;    
}

function HandleTapOut()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDbClickMove, bNetworkGame;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    bNetworkGame = int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone);
    // End:0xA7
    if(bPressed && bNetworkGame)
    {
        LPPC = Outer;
        // End:0xA7
        if(LPPC != none)
        {
            LPPC.StartTapOut();
        }
    }
    //return;    
}

function HandleTapOutNoxious()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDbClickMove, bNetworkGame;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    bNetworkGame = int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone);
    // End:0xC8
    if(bPressed && bNetworkGame)
    {
        LPPC = Outer;
        // End:0xC8
        if(LPPC != none)
        {
            // End:0xC8
            if(LPPC.CanDeployNoxious())
            {
                LPPC.StartTapOutNoxious();
            }
        }
    }
    //return;    
}

function HandleUsePerk()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDbClickMove, bNetworkGame;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    bNetworkGame = true;
    // End:0x6A
    if(bPressed && bNetworkGame)
    {
        LPPC = Outer;
        // End:0x6A
        if(LPPC != none)
        {
            LPPC.UseActivePerk();
        }
    }
    //return;    
}

function HandleOperatePerk()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDbClickMove, bNetworkGame;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    bNetworkGame = true;
    // End:0x6A
    if(bPressed && bNetworkGame)
    {
        LPPC = Outer;
        // End:0x6A
        if(LPPC != none)
        {
            LPPC.OperateActivePerk();
        }
    }
    //return;    
}

function HandlePickupUseCourierItem()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDbClickMove, bNetworkGame;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, SPP;

    bNetworkGame = int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone);
    // End:0x10C
    if(bPressed && bNetworkGame)
    {
        LPPC = Outer;
        // End:0x10C
        if(LPPC != none)
        {
            SPP = SPPawn(LPPC.Pawn);
            // End:0x10C
            if((SPP != none) && !SPP.IsDoingASpecialMove())
            {
                LPPC.PickupUseCourierItem();
            }
        }
    }
    //return;    
}

function HandleChangeZoom()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDbClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x4F
    if(bPressed)
    {
        LPPC = Outer;
        // End:0x4F
        if(LPPC != none)
        {
            LPPC.ConditionalChangeZoom();
        }
    }
    //return;    
}

function HandleDoCancelRepair()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, SMRepair;

    // End:0x41
    if(int(Outer.WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    LPPC = Outer;
    SMRepair = LPSM_PlayerRepairMinigame(LPPC.MySPPawn.GetCurrentSpecialMoveInstance());
    // End:0xAC
    if(SMRepair == none)
    {
        return;
    }
    // End:0xBC
    if(bPressed)
    {        
    }
    else
    {
        // End:0x11C
        if(LPPC.AllowedToAbortRepair())
        {
            SMRepair.RepairAborted();
            LPPC.ServerEndRepair();
        }
    }
    //return;    
}

defaultproperties
{
    OnFootCommands=/* Array type was not detected. */
    UtilityRigCommands=/* Array type was not detected. */
    VitalSuitCommands=/* Array type was not detected. */
    KeyMappingsVersionNumber=23
    TuneDataInput=LPTuneDataInput'TuneData_Input.TuneData_Input'
    LookInputYawDeceleration=(bEnabled=true,RampUpTime=0.2000000)
    LookInputPitchDeceleration=(bEnabled=true,RampUpTime=0.2000000)
    InputButtonDataList=/* Array type was not detected. */
    bCurveAccelEnabled=true
    bInputBasisFilterEnabled=false
    StickSmoothingRate=3.0000000
    DeadZoneParams=(bCircularDeadZoneEnabled=false,SquareDeadZoneInnerPct=0.2200000,SquareDeadZoneOuterPct=0.9800000)
    Bindings=/* Array type was not detected. */
}