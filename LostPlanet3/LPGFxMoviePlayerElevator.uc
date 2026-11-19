class LPGFxMoviePlayerElevator extends SPGFxMoviePlayer
    config(UI);

struct LevelNameToFloorMapInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LevelName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int FloorIndex;

    structdefaultproperties
    {
        LevelName=""
        FloorIndex=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NumberLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TitleLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HeaderLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DescriptionLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PromptElevatorMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LevelPipsMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LevelInterfaceMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ArrowUpMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ArrowDownMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LevelImageContainerMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LevelImageMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Pips;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ObjectiveTrackers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL KismetAction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentStandingFloorIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentDisplayFloorIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LevelNameToFloorMap[1073741825];

function Start()
{
    local /*0x97E50000-0x00000000*/ private bool StartPaused[9437185], ReturnValue;

    false
    super.Start();
    SetExternalInterface(self);
    Advance(0.0000000);
    PromptElevatorMC = GetVariableObject("_root.promptElevator");
    // End:0x182
    if(PromptElevatorMC != none)
    {
        LevelImageContainerMC = PromptElevatorMC.GetObject("mcImgLevel");
        LevelPipsMC = PromptElevatorMC.GetObject("mcLevelPips");
        LevelInterfaceMC = PromptElevatorMC.GetObject("levelInterface");
        // End:0x182
        if(LevelInterfaceMC != none)
        {
            ArrowUpMC = LevelInterfaceMC.GetObject("arrowUp");
            ArrowDownMC = LevelInterfaceMC.GetObject("arrowDown");
        }
    }    
    GetPC().ConsoleCommand("HideLPHUD 1");
    PlaySoundFromTheme('Enter');
    return true;
    //return ReturnValue;    
}

function SetKismetAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
    local /*0x97E50000-0x00000000*/ private int I, J;
    local /*0x97E50000-0x00000000*/ private @NULL pip, tracker, LPBM, CurrentObjective;
    local /*0x97E50000-0x00000000*/ private editfixedsize string CurrentObjectiveMapName;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Commands;
    local /*0x97E50000-0x00000000*/ private int ObjectiveFloorIndex, ExitFloorIndex;

    // End:0x11
    if(Action == none)
    {
        return;
    }
    KismetAction = Action;
    // End:0x4B
    if(KismetAction.ElevatorFloors.Length == 0)
    {
        return;
    }
    CurrentStandingFloorIndex = -1;
    I = 0;
    J0x65:

    // End:0x105 [Loop If]
    if(I < KismetAction.ElevatorFloors.Length)
    {
        // End:0xF7
        if(KismetAction.ElevatorFloors[I].bCurrentLevel)
        {
            // End:0xE4
            if(CurrentStandingFloorIndex != -1)
            {
            }
            CurrentStandingFloorIndex = I;
        }
        I++;
        // [Loop Continue]
        goto J0x65;
    }
    // End:0x123
    if(CurrentStandingFloorIndex == -1)
    {
        CurrentStandingFloorIndex = 0;
    }
    // End:0x215
    if(LevelPipsMC != none)
    {
        switch(KismetAction.ElevatorFloors.Length)
        {
            // End:0x187
            case 2:
                LevelPipsMC.GotoAndStop("two");
                // End:0x215
                break;
            // End:0x1B5
            case 3:
                LevelPipsMC.GotoAndStop("three");
                // End:0x215
                break;
            // End:0x1E2
            case 4:
                LevelPipsMC.GotoAndStop("four");
                // End:0x215
                break;
            // End:0x20F
            case 5:
                LevelPipsMC.GotoAndStop("five");
                // End:0x215
                break;
            // End:0xFFFF
            default:
                // End:0x215
                break;
                break;
        }
    }
    I = 0;
    J0x220:

    // End:0x30C [Loop If]
    if(I < 5)
    {
        pip = LevelPipsMC.GetObject("pip" $ string(I + 1));
        // End:0x294
        if(pip != none)
        {
            Pips.AddItem(pip);            
        }
        tracker = LevelPipsMC.GetObject("iconTrack" $ string(I + 1));
        // End:0x2FE
        if(tracker != none)
        {
            ObjectiveTrackers.AddItem(tracker);            
        }
        I++;
        // [Loop Continue]
        goto J0x220;
    }
    TitleLabel.GetObject("textField").SetText(KismetAction.ElevatorTitle.LocalizedTextMarkUp);
    CurrentDisplayFloorIndex = KismetAction.InitialFloorToDisplay;
    SetCurrentFloor(CurrentDisplayFloorIndex);
    ObjectiveFloorIndex = -1;
    ExitFloorIndex = -1;
    LPBM = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager();
    // End:0x6C2
    if(LPBM != none)
    {
        CurrentObjective = LPBM.GetObjectiveToTrack();
        // End:0x6C2
        if(CurrentObjective != none)
        {
            CurrentObjectiveMapName = string(LPBM.GetMapNameForObjective(CurrentObjective));
            CurrentObjectiveMapName = Locs(CurrentObjectiveMapName);
            I = 0;
            J0x49E:

            // End:0x53F [Loop If]
            if((I < LevelNameToFloorMap.Length) && ObjectiveFloorIndex == -1)
            {
                // End:0x531
                if(Locs(LevelNameToFloorMap[I].LevelName) == CurrentObjectiveMapName)
                {
                    ObjectiveFloorIndex = LevelNameToFloorMap[I].FloorIndex;
                }
                I++;
                // [Loop Continue]
                goto J0x49E;
            }
            I = 0;
            J0x54A:

            // End:0x6C2 [Loop If]
            if((I < KismetAction.ElevatorFloors.Length) && ObjectiveFloorIndex == -1)
            {
                Commands = SplitString(KismetAction.ElevatorFloors[I].LoadConsoleCommand, "?");
                J = 0;
                J0x5EA:

                // End:0x64D [Loop If]
                if(J < Commands.Length)
                {
                    // End:0x63F
                    if(InStr(Commands[J], CurrentObjectiveMapName,, true) >= 0)
                    {
                        ObjectiveFloorIndex = I;
                        // [Explicit Break]
                        goto J0x64D;
                    }
                    J++;
                    // [Loop Continue]
                    goto J0x5EA;
                }
                J0x64D:

                // End:0x6B4
                if((ExitFloorIndex == -1) && KismetAction.ElevatorFloors[I].bExitFloor)
                {
                    ExitFloorIndex = I;
                }
                I++;
                // [Loop Continue]
                goto J0x54A;
            }
        }
    }
    // End:0x71D
    if(ObjectiveFloorIndex != -1)
    {
        // End:0x71A
        if(ObjectiveFloorIndex < Pips.Length)
        {
            ObjectiveTrackers[ObjectiveFloorIndex].GotoAndStop("on");
        }        
    }
    else
    {
        // End:0x775
        if(ExitFloorIndex != -1)
        {
            // End:0x775
            if(ExitFloorIndex < Pips.Length)
            {
                ObjectiveTrackers[ExitFloorIndex].GotoAndStop("on");
            }
        }
    }
    //return;    
}

function SetCurrentFloor()
{
    local /*0x97E50000-0x00000000*/ private int FloorIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string S;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x40
    if((FloorIndex < 0) || FloorIndex > KismetAction.ElevatorFloors.Length)
    {
        return;
    }
    HeaderLabel.GetObject("textField").SetText(KismetAction.ElevatorFloors[FloorIndex].FloorTitle.LocalizedTextMarkUp);
    DescriptionLabel.GetObject("textField").SetText(KismetAction.ElevatorFloors[FloorIndex].FloorDescription.LocalizedTextMarkUp);
    S = S $ string(FloorIndex + 1);
    NumberLabel.GetObject("textField").SetText(S);
    I = 0;
    J0x1DD:

    // End:0x2C7 [Loop If]
    if(I < Pips.Length)
    {
        // End:0x242
        if(I == CurrentStandingFloorIndex)
        {
            Pips[I].GotoAndStop("selected");            
        }
        else
        {
            // End:0x28B
            if(I == FloorIndex)
            {
                Pips[I].GotoAndStop("over");                
            }
            else
            {
                Pips[I].GotoAndStop("off");
            }
        }
        I++;
        // [Loop Continue]
        goto J0x1DD;
    }
    // End:0x353
    if(ArrowUpMC != none)
    {
        // End:0x32E
        if(FloorIndex < (KismetAction.ElevatorFloors.Length - 1))
        {
            ArrowUpMC.GotoAndStop("move");            
        }
        else
        {
            ArrowUpMC.GotoAndStop("stop");
        }
    }
    // End:0x3BE
    if(ArrowDownMC != none)
    {
        // End:0x399
        if(FloorIndex > 0)
        {
            ArrowDownMC.GotoAndStop("move");            
        }
        else
        {
            ArrowDownMC.GotoAndStop("stop");
        }
    }
    // End:0x3FD
    if(LevelImageMC != none)
    {
        LevelImageMC.ActionScriptVoid("removeMovieClip");
    }
    // End:0x490
    if(LevelImageContainerMC != none)
    {
        S = string(KismetAction.ElevatorFloors[FloorIndex].ThumbnailName);
        LevelImageMC = LevelImageContainerMC.AttachMovie(S, S);
    }
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = false;
    // End:0xAF
    if(int(InputEvent) == int(0))
    {
        // End:0x69
        if((ButtonName == 'XboxTypeS_A') || ButtonName == 'Enter')
        {
            Accept();
            Retval = true;            
        }
        else
        {
            // End:0xAF
            if((ButtonName == 'XboxTypeS_B') || ButtonName == 'Escape')
            {
                Cancel();
                Retval = true;
            }
        }
    }
    // End:0x1E8
    if(int(InputEvent) == int(0))
    {
        // End:0x157
        if(((((ButtonName == 'XBoxTypeS_LeftStick_Up') || ButtonName == 'Gamepad_LeftStick_Up') || ButtonName == 'XboxTypeS_DPad_Up') || ButtonName == 'Up') || ButtonName == 'W')
        {
            LevelUp();
            Retval = true;            
        }
        else
        {
            // End:0x1E8
            if(((((ButtonName == 'XBoxTypeS_LeftStick_Down') || ButtonName == 'Gamepad_LeftStick_Down') || ButtonName == 'XboxTypeS_DPad_Down') || ButtonName == 'Down') || ButtonName == 'S')
            {
                LevelDown();
                Retval = true;
            }
        }
    }
    return Retval;
    //return ReturnValue;    
}

function LevelUp()
{
    local /*0x97E50000-0x00000000*/ private int PrevDisplayFloorIndex;

    PrevDisplayFloorIndex = CurrentDisplayFloorIndex;
    CurrentDisplayFloorIndex++;
    // End:0x38
    if(CurrentDisplayFloorIndex < 0)
    {
        CurrentDisplayFloorIndex = 0;
    }
    // End:0x91
    if(CurrentDisplayFloorIndex >= KismetAction.ElevatorFloors.Length)
    {
        CurrentDisplayFloorIndex = KismetAction.ElevatorFloors.Length - 1;
    }
    // End:0xBC
    if(PrevDisplayFloorIndex != CurrentDisplayFloorIndex)
    {
        PlaySoundFromTheme('Scroll');
    }
    SetCurrentFloor(CurrentDisplayFloorIndex);
    //return;    
}

function LevelDown()
{
    local /*0x97E50000-0x00000000*/ private int PrevDisplayFloorIndex;

    PrevDisplayFloorIndex = CurrentDisplayFloorIndex;
    CurrentDisplayFloorIndex--;
    // End:0x38
    if(CurrentDisplayFloorIndex < 0)
    {
        CurrentDisplayFloorIndex = 0;
    }
    // End:0x91
    if(CurrentDisplayFloorIndex >= KismetAction.ElevatorFloors.Length)
    {
        CurrentDisplayFloorIndex = KismetAction.ElevatorFloors.Length - 1;
    }
    // End:0xBC
    if(PrevDisplayFloorIndex != CurrentDisplayFloorIndex)
    {
        PlaySoundFromTheme('Scroll');
    }
    SetCurrentFloor(CurrentDisplayFloorIndex);
    //return;    
}

function Accept()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x2D
    if(CurrentDisplayFloorIndex == CurrentStandingFloorIndex)
    {
        PlaySoundFromTheme('Error');
        return;
    }
    LPPC = LPPlayerController(GetPC());
    // End:0xE2
    if(LPPC != none)
    {
        LPPC.ClientShowLoadingMovie(true);        
        LPPC.ConsoleCommand(KismetAction.ElevatorFloors[CurrentDisplayFloorIndex].LoadConsoleCommand);
    }
    PlaySoundFromTheme('Select');
    EndSPGFxMoviePlayer();
    //return;    
}

function Cancel()
{
    GoToOutro();
    //return;    
}

function GoToOutro()
{
    PromptElevatorMC.GotoAndPlay("close");
    PlaySoundFromTheme('Exit');
    //return;    
}

function OutroComplete()
{
    EndSPGFxMoviePlayer();
    //return;    
}

function EndSPGFxMoviePlayer()
{
    super.EndSPGFxMoviePlayer();    
    GetPC().ConsoleCommand("HideLPHUD 0");
    //return;    
}

event WidgetInitialized()
{
    local /*0x97E50000-0x00000000*/ private name WidgetName[8388609], WidgetPath;
    local /*0x97E50000-0x00000000*/ private @NULL Widget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bWasHandled;

    bWasHandled = true;
    switch(WidgetName)
    {
        // End:0x85
        case 'labelNumber':
            NumberLabel = Widget;
            Widget.GetObject("textField").SetText("");
            // End:0x2F1
            break;
        // End:0xEB
        case 'labelTitle':
            TitleLabel = Widget;
            Widget.GetObject("textField").SetText("");
            // End:0x2F1
            break;
        // End:0x151
        case 'labelHeader':
            HeaderLabel = Widget;
            Widget.GetObject("textField").SetText("");
            // End:0x2F1
            break;
        // End:0x1B7
        case 'labelDesc':
            DescriptionLabel = Widget;
            Widget.GetObject("textField").SetText("");
            // End:0x2F1
            break;
        // End:0x21A
        case 'SelectString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonSelect>"));
            // End:0x2F1
            break;
        // End:0x27E
        case 'ConfirmString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonConfirm>"));
            // End:0x2F1
            break;
        // End:0x2DF
        case 'BackString':
            Widget.SetText(GetLocalizedString("<Strings:LostPlanetGame.UI.ButtonBack>"));
            // End:0x2F1
            break;
        // End:0xFFFF
        default:
            bWasHandled = false;
            // End:0x2F1
            break;
            break;
    }
    // End:0x330
    if(!bWasHandled)
    {
        bWasHandled = super(GFxMoviePlayer).WidgetInitialized(WidgetName, WidgetPath, Widget);
    }
    return bWasHandled;
    //return ReturnValue;    
}

function PipClicked()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string pipName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL pip;
    local /*0x97E50000-0x00000000*/ private int I;

    pip = LevelPipsMC.GetObject(pipName);
    I = 0;
    J0x3E:

    // End:0xAE [Loop If]
    if(I < Pips.Length)
    {
        // End:0xA0
        if(Pips[I] == pip)
        {
            CurrentDisplayFloorIndex = I;
            SetCurrentFloor(I);
            // [Explicit Break]
            goto J0xAE;
        }
        I++;
        // [Loop Continue]
        goto J0x3E;
    }
    J0xAE:

    //return;    
}

defaultproperties
{
    LevelNameToFloorMap=/* Array type was not detected. */
    bPauseGameWhileActive=true
    CaptureKeys=/* Array type was not detected. */
    Priority=10
}