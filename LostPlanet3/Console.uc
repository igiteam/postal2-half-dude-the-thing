class Console extends Interaction within GameViewportClient
    transient
    config(Input)
    hidecategories(Object,UIRoot);

const MaxHistory = 16;

struct native AutoCompleteCommand
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Command;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Desc;

    structdefaultproperties
    {
        Command=""
        Desc=""
    }
};

struct native SPDebugConsole_Params
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Font;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ContextStr;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL BackgroundColor;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ForegroundColor;
    var(*) /*0x35EA0000-0x00000000*/ private float TextoffsetX;
    var(*) /*0x35EA0000-0x00000000*/ private float OffsetX;
    var(*) /*0x35EA0000-0x00000000*/ private float OffsetY;
    var(*) /*0x35EA0000-0x00000000*/ private float SizeRatioX;
    var(*) /*0x35EA0000-0x00000000*/ private float SizeRatioY;
    var(*) /*0x35EA0000-0x00000000*/ private float CaretAlpha;

    structdefaultproperties
    {
        Font=none
        ContextStr=""
        BackgroundColor=(R=0,G=0,B=0,A=0)
        ForegroundColor=(R=0,G=0,B=0,A=0)
        TextoffsetX=0.0000000
        OffsetX=0.0000000
        OffsetY=0.0000000
        SizeRatioX=0.0000000
        SizeRatioY=0.0000000
        CaretAlpha=0.0000000
    }
};

struct native AutoCompleteNode
{
    var(*) /*0x35EA0000-0x00000000*/ private int IndexChar;
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array AutoCompleteListIndices;
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array ChildNodes;

    structdefaultproperties
    {
        IndexChar=0
        AutoCompleteListIndices=none
        ChildNodes=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL ConsoleTargetPlayer;
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultTexture_Black;
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultTexture_White;
var(*) /*0x35EA0000-0x00000000*/ private input name ConsoleKey[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input name TypeKey[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input int MaxScrollbackSize[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Scrollback;
var(*) /*0x35EA0000-0x00000000*/ private int SBHead;
var(*) /*0x35EA0000-0x00000000*/ private int SBPos;
var(*) /*0x35EA0000-0x00000000*/ private int HistoryTop[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int HistoryBot[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private int HistoryCur[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string History[1073741840];
var(*) /*0x35EA0000-0x00000000*/ private bool bNavigatingHistory[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bCaptureKeyInput[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bCtrl;
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableUI[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bAutoCompleteLocked[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bRequireCtrlToNavigateAutoComplete[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsRuntimeAutoCompleteUpToDate[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string TypedStr;
var(*) /*0x35EA0000-0x00000000*/ private int TypedStrPos;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ManualAutoCompleteList[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AutoCompleteList[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int AutoCompleteIndex[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AutoCompleteTree[805306369];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AutoCompleteIndices[536870913];

function Initialized()
{
    super.Initialized();
    //return;    
}

function SetInputText()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[8388609];

    TypedStr = Text;
    //return;    
}

function SetCursorPos()
{
    local /*0x35EA0000-0x00000000*/ private int Position[8388609];

    TypedStrPos = Position;
    //return;    
}

function PurgeCommandFromHistory()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Command[8388609];
    local /*0x35EA0000-0x00000000*/ private int HistoryIdx, Idx, NextIdx;

    // End:0x132
    if((HistoryTop >= 0) && HistoryTop < 16)
    {
        HistoryIdx = 0;
        J0x2C:

        // End:0x132 [Loop If]
        if(HistoryIdx < 16)
        {
            // End:0x124
            if(History[HistoryIdx] ~= Command)
            {
                Idx = HistoryIdx;
                NextIdx = (HistoryIdx + 1) % 16;
                J0x8A:

                // End:0xF8 [Loop If]
                if(Idx != HistoryTop)
                {
                    History[Idx] = History[NextIdx];
                    Idx = NextIdx;
                    NextIdx = (NextIdx + 1) % 16;
                    // [Loop Continue]
                    goto J0x8A;
                }
                HistoryTop = ((HistoryTop == 0) ? 16 - 1 : HistoryTop - 1);
            }
            ++HistoryIdx;
            // [Loop Continue]
            goto J0x2C;
        }
    }
    //return;    
}

function ConsoleCommand()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Command[8388609];

    // End:0xE3
    if(((HistoryTop == 0) ? !History[16 - 1] ~= Command : !History[HistoryTop - 1] ~= Command))
    {
        PurgeCommandFromHistory(Command);
        History[HistoryTop] = Command;
        HistoryTop = (HistoryTop + 1) % 16;
        // End:0xE3
        if((HistoryBot == -1) || HistoryBot == HistoryTop)
        {
            HistoryBot = (HistoryBot + 1) % 16;
        }
    }
    HistoryCur = HistoryTop;
    SaveConfig();
    OutputText(("\n>>>" @ Command) @ "<<<");
    // End:0x174
    if(ConsoleTargetPlayer != none)
    {        
        ConsoleTargetPlayer.Actor.ConsoleCommand(Command);        
    }
    else
    {
        // End:0x276
        if((Outer.Outer.GamePlayers.Length > 0) && Outer.Outer.GamePlayers[0].Actor != none)
        {            
            Outer.Outer.GamePlayers[0].Actor.ConsoleCommand(Command);            
        }
        else
        {            
            Outer.ConsoleCommand(Command);
        }
    }
    //return;    
}

function ClearOutput()
{
    SBHead = 0;
    Scrollback.Remove(0, Scrollback.Length);    
    //return;    
}

function OutputTextLine()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[142606337];

    // End:0x3E
    if(Scrollback.Length > MaxScrollbackSize)
    {
        Scrollback.Remove(0, 1);        
        SBHead = MaxScrollbackSize - 1;        
    }
    else
    {
        SBHead++;
    }
    Scrollback.Length = Scrollback.Length + 1;
    Scrollback[SBHead] = Text;
    //return;    
}

event OutputText()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[142606337], RemainingText;
    local /*0x35EA0000-0x00000000*/ private int StringLength, LineLength;

    RemainingText = Text;
    StringLength = Len(Text);
    J0x28:

    // End:0xD2 [Loop If]
    if(StringLength > 0)
    {
        LineLength = InStr(RemainingText, "\n");
        // End:0x78
        if(LineLength == -1)
        {
            LineLength = StringLength;
        }
        OutputTextLine(Left(RemainingText, LineLength));
        RemainingText = Mid(RemainingText, LineLength + 1);
        StringLength -= (LineLength + 1);
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

function StartTyping()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[142606337];

    GotoState('Typing');
    SetInputText(Text);
    SetCursorPos(Len(Text));
    //return;    
}

function PostRender_Console()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];

    //return;    
}

function InputKey()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private name Key[8388609];
    local /*0x35EA0000-0x00000000*/ private byte Event[8388609];
    local /*0x35EA0000-0x00000000*/ private float AmountDepressed[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bGamepad[9437185], ReturnValue;

    1.0000000
    false
    // End:0x97
    if(int(Event) == int(0))
    {
        bCaptureKeyInput = false;
        // End:0x64
        if(Key == ConsoleKey)
        {
            GotoState('Open');
            bCaptureKeyInput = true;
            return true;            
        }
        else
        {
            // End:0x97
            if(Key == TypeKey)
            {
                GotoState('Typing');
                bCaptureKeyInput = true;
                return true;
            }
        }
    }
    return bCaptureKeyInput;
    //return ReturnValue;    
}

function InputChar()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Unicode[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bCaptureKeyInput;
    //return ReturnValue;    
}

function FlushPlayerInput()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    // End:0x3A
    if(ConsoleTargetPlayer != none)
    {
        PC = ConsoleTargetPlayer.Actor;        
    }
    else
    {
        // End:0x11A
        if((Outer.Outer.GamePlayers.Length > 0) && Outer.Outer.GamePlayers[0].Actor != none)
        {
            PC = Outer.Outer.GamePlayers[0].Actor;
        }
    }
    // End:0x183
    if((PC != none) && PC.PlayerInput != none)
    {
        PC.PlayerInput.ResetInput();
    }
    //return;    
}

function ProcessControlKey()
{
    local /*0x35EA0000-0x00000000*/ private name Key[8388609];
    local /*0x35EA0000-0x00000000*/ private byte Event[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x78
    if((Key == 'LeftControl') || Key == 'RightControl')
    {
        // End:0x53
        if(int(Event) == int(1))
        {
            bCtrl = false;            
        }
        else
        {
            // End:0x73
            if(int(Event) == int(0))
            {
                bCtrl = true;
            }
        }
        return true;        
    }
    else
    {
        // End:0x2DD
        if(((bCtrl && int(Event) == int(0)) && Outer.Outer.GamePlayers.Length > 0) && Outer.Outer.GamePlayers[0].Actor != none)
        {
            // End:0x1AF
            if(Key == 'V')
            {
                AppendInputText(Outer.Outer.GamePlayers[0].Actor.PasteFromClipboard());
                return true;                
            }
            else
            {
                // End:0x234
                if(Key == 'C')
                {
                    Outer.Outer.GamePlayers[0].Actor.CopyToClipboard(TypedStr);
                    return true;                    
                }
                else
                {
                    // End:0x2DD
                    if(Key == 'X')
                    {
                        // End:0x2DB
                        if(TypedStr != "")
                        {
                            Outer.Outer.GamePlayers[0].Actor.CopyToClipboard(TypedStr);
                            SetInputText("");
                            SetCursorPos(0);
                        }
                        return true;
                    }
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function AppendInputText()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[8388609];
    local /*0x35EA0000-0x00000000*/ private int Character;

    J0x00:
    // End:0xCC [Loop If]
    if(Len(Text) > 0)
    {
        Character = Asc(Left(Text, 1));
        Text = Mid(Text, 1);
        // End:0xC9
        if((Character >= 32) && Character < 256)
        {
            SetInputText((Left(TypedStr, TypedStrPos) $ Chr(Character)) $ Right(TypedStr, Len(TypedStr) - TypedStrPos));
            SetCursorPos(TypedStrPos + 1);
        }
        // [Loop Continue]
        goto J0x00;
    }
    UpdateCompleteIndices();
    //return;    
}

// Export UConsole::execBuildRuntimeAutoCompleteList(FFrame&, void* const)
native final function BuildRuntimeAutoCompleteList()
{
    local /*0x35EA0000-0x00000000*/ private bool bForce[9437185];


}

// Export UConsole::execUpdateCompleteIndices(FFrame&, void* const)
native function UpdateCompleteIndices();

// Export UConsole::execSPDebugConsole_GetParams(FFrame&, void* const)
native static final function SPDebugConsole_GetParams()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689];


}

state Typing
{
    function InputChar()
    {
        local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
        local /*0x35EA0000-0x00000000*/ private editfixedsize string Unicode[8388609];
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(bCaptureKeyInput)
        {
            return true;
        }
        AppendInputText(Unicode);
        return true;
        //return ReturnValue;        
    }

    function InputKey()
    {
        local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
        local /*0x35EA0000-0x00000000*/ private name Key[8388609];
        local /*0x35EA0000-0x00000000*/ private byte Event[8388609];
        local /*0x35EA0000-0x00000000*/ private float AmountDepressed[9437185];
        local /*0x35EA0000-0x00000000*/ private bool bGamepad[9437185], ReturnValue;
        local /*0x35EA0000-0x00000000*/ private editfixedsize string Temp;
        local /*0x35EA0000-0x00000000*/ private int NewPos, SpacePos, PeriodPos;

        1.0000000
        false
        // End:0x2E
        if(int(Event) == int(0))
        {
            bCaptureKeyInput = false;
        }
        // End:0x52
        if(ProcessControlKey(Key, Event))
        {
            return true;            
        }
        else
        {
            // End:0x64
            if(bGamepad)
            {
                return false;                
            }
            else
            {
                // End:0xE3
                if((Key == 'Escape') && int(Event) == int(1))
                {
                    // End:0xD0
                    if(TypedStr != "")
                    {
                        SetInputText("");
                        SetCursorPos(0);
                        HistoryCur = HistoryTop;
                        return true;                        
                    }
                    else
                    {
                        GotoState('None');
                    }
                    return true;                    
                }
                else
                {
                    // End:0x12F
                    if((Key == ConsoleKey) && int(Event) == int(0))
                    {
                        GotoState('Open');
                        bCaptureKeyInput = true;
                        return true;                        
                    }
                    else
                    {
                        // End:0x1FA
                        if((Key == TypeKey) && int(Event) == int(0))
                        {
                            // End:0x1DB
                            if((AutoCompleteIndices.Length > 0) && !bAutoCompleteLocked)
                            {
                                TypedStr = AutoCompleteList[AutoCompleteIndices[AutoCompleteIndex]].Command;
                                SetCursorPos(Len(TypedStr));
                                bAutoCompleteLocked = true;                                
                            }
                            else
                            {
                                GotoState('None');
                                bCaptureKeyInput = true;
                            }
                            return true;                            
                        }
                        else
                        {
                            // End:0x2AE
                            if((Key == 'Enter') && int(Event) == int(1))
                            {
                                // End:0x29B
                                if(TypedStr != "")
                                {
                                    Temp = TypedStr;
                                    SetInputText("");
                                    SetCursorPos(0);
                                    ConsoleCommand(Temp);
                                    OutputText("");
                                    GotoState('None');
                                    UpdateCompleteIndices();                                    
                                }
                                else
                                {
                                    GotoState('None');
                                }
                                return true;                                
                            }
                            else
                            {
                                // End:0x2EE
                                if(global.InputKey(ControllerId, Key, Event, AmountDepressed, bGamepad))
                                {
                                    return true;                                    
                                }
                                else
                                {
                                    // End:0x373
                                    if((int(Event) != int(0)) && int(Event) != int(2))
                                    {
                                        // End:0x36E
                                        if(!bGamepad)
                                        {
                                            return ((Key != 'LeftMouseButton') && Key != 'MiddleMouseButton') && Key != 'RightMouseButton';
                                        }
                                        return false;                                        
                                    }
                                    else
                                    {
                                        // End:0x4CF
                                        if(Key == 'Up')
                                        {
                                            // End:0x413
                                            if(!bNavigatingHistory && (bRequireCtrlToNavigateAutoComplete && bCtrl) || (!bRequireCtrlToNavigateAutoComplete && !bCtrl) && AutoCompleteIndices.Length > 1)
                                            {
                                                // End:0x410
                                                if(++AutoCompleteIndex == AutoCompleteIndices.Length)
                                                {
                                                    AutoCompleteIndex = 0;
                                                }                                                
                                            }
                                            else
                                            {
                                                // End:0x4CA
                                                if(HistoryBot >= 0)
                                                {
                                                    // End:0x44F
                                                    if(HistoryCur == HistoryBot)
                                                    {
                                                        HistoryCur = HistoryTop;                                                        
                                                    }
                                                    else
                                                    {
                                                        HistoryCur--;
                                                        // End:0x478
                                                        if(HistoryCur < 0)
                                                        {
                                                            HistoryCur = 16 - 1;
                                                        }
                                                    }
                                                    SetInputText(History[HistoryCur]);
                                                    SetCursorPos(Len(History[HistoryCur]));
                                                    UpdateCompleteIndices();
                                                    bNavigatingHistory = true;
                                                }
                                            }
                                            return true;                                            
                                        }
                                        else
                                        {
                                            // End:0x629
                                            if(Key == 'Down')
                                            {
                                                // End:0x57E
                                                if(!bNavigatingHistory && (bRequireCtrlToNavigateAutoComplete && bCtrl) || (!bRequireCtrlToNavigateAutoComplete && !bCtrl) && AutoCompleteIndices.Length > 1)
                                                {
                                                    // End:0x56F
                                                    if(--AutoCompleteIndex < 0)
                                                    {
                                                        AutoCompleteIndex = AutoCompleteIndices.Length - 1;
                                                    }
                                                    bAutoCompleteLocked = false;                                                    
                                                }
                                                else
                                                {
                                                    // End:0x626
                                                    if(HistoryBot >= 0)
                                                    {
                                                        // End:0x5BA
                                                        if(HistoryCur == HistoryTop)
                                                        {
                                                            HistoryCur = HistoryBot;                                                            
                                                        }
                                                        else
                                                        {
                                                            HistoryCur = (HistoryCur + 1) % 16;
                                                        }
                                                        SetInputText(History[HistoryCur]);
                                                        SetCursorPos(Len(History[HistoryCur]));
                                                        UpdateCompleteIndices();
                                                        bNavigatingHistory = true;
                                                    }
                                                }                                                
                                            }
                                            else
                                            {
                                                // End:0x6BA
                                                if(Key == 'BackSpace')
                                                {
                                                    // End:0x6B5
                                                    if(TypedStrPos > 0)
                                                    {
                                                        SetInputText(Left(TypedStr, TypedStrPos - 1) $ Right(TypedStr, Len(TypedStr) - TypedStrPos));
                                                        SetCursorPos(TypedStrPos - 1);
                                                        bAutoCompleteLocked = false;
                                                    }
                                                    return true;                                                    
                                                }
                                                else
                                                {
                                                    // End:0x733
                                                    if(Key == 'Delete')
                                                    {
                                                        // End:0x72E
                                                        if(TypedStrPos < Len(TypedStr))
                                                        {
                                                            SetInputText(Left(TypedStr, TypedStrPos) $ Right(TypedStr, (Len(TypedStr) - TypedStrPos) - 1));
                                                        }
                                                        return true;                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x7CC
                                                        if(Key == 'Left')
                                                        {
                                                            // End:0x7AE
                                                            if(bCtrl)
                                                            {
                                                                NewPos = Max(InStr(TypedStr, ".", true, false, TypedStrPos), InStr(TypedStr, " ", true, false, TypedStrPos));
                                                                SetCursorPos(Max(0, NewPos));                                                                
                                                            }
                                                            else
                                                            {
                                                                SetCursorPos(Max(0, TypedStrPos - 1));
                                                            }
                                                            return true;                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x90C
                                                            if(Key == 'Right')
                                                            {
                                                                // End:0x8E4
                                                                if(bCtrl)
                                                                {
                                                                    SpacePos = InStr(TypedStr, " ", false, false, TypedStrPos + 1);
                                                                    PeriodPos = InStr(TypedStr, ".", false, false, TypedStrPos + 1);
                                                                    NewPos = ((SpacePos < 0) ? PeriodPos : ((PeriodPos < 0) ? SpacePos : Min(SpacePos, PeriodPos)));
                                                                    // End:0x8B6
                                                                    if(NewPos == -1)
                                                                    {
                                                                        NewPos = Len(TypedStr);
                                                                    }
                                                                    SetCursorPos(Min(Len(TypedStr), Max(TypedStrPos, NewPos)));                                                                    
                                                                }
                                                                else
                                                                {
                                                                    SetCursorPos(Min(Len(TypedStr), TypedStrPos + 1));
                                                                }
                                                                return true;                                                                
                                                            }
                                                            else
                                                            {
                                                                // End:0x933
                                                                if(Key == 'Home')
                                                                {
                                                                    SetCursorPos(0);
                                                                    return true;                                                                    
                                                                }
                                                                else
                                                                {
                                                                    // End:0x961
                                                                    if(Key == 'End')
                                                                    {
                                                                        SetCursorPos(Len(TypedStr));
                                                                        return true;
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return true;
        //return ReturnValue;        
    }

    event PostRender_Console()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];
        local /*0x35EA0000-0x00000000*/ private float Y, XL, YL, info_xl, info_yl, ClipX,
	        ClipY, LeftPos;

        local /*0x35EA0000-0x00000000*/ private editfixedsize string OutStr;
        local /*0x35EA0000-0x00000000*/ private int MatchIdx, Idx, StartIdx;

        global.PostRender_Console(Canvas);
        Canvas.Font = Class'Engine'.static.GetSmallFont();
        OutStr = "(>" @ TypedStr;
        Canvas.StrLen(OutStr, XL, YL);
        ClipX = Canvas.ClipX;
        ClipY = Canvas.ClipY;
        LeftPos = 0.0000000;
        // End:0x153
        if(Class'WorldInfo'.static.IsConsoleBuild())
        {
            ClipX -= float(32);
            ClipY -= float(32);
            LeftPos = 32.0000000;
        }
        Canvas.SetPos(LeftPos, (ClipY - float(6)) - YL);
        Canvas.DrawTile(DefaultTexture_Black, ClipX, YL + float(6), 0.0000000, 0.0000000, 32.0000000, 32.0000000);
        Canvas.SetPos(LeftPos, (ClipY - float(6)) - YL);
        Canvas.SetDrawColor(0, 255, 0);
        Canvas.DrawTile(DefaultTexture_White, ClipX, 2.0000000, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
        Canvas.SetPos(LeftPos, (ClipY - float(3)) - YL);
        Canvas.bCenter = false;
        Canvas.DrawText(OutStr, false);
        // End:0x961
        if(AutoCompleteIndices.Length > 0)
        {
            Idx = AutoCompleteIndices[AutoCompleteIndex];
            Canvas.SetPos(LeftPos + XL, (ClipY - float(3)) - YL);
            Canvas.SetDrawColor(87, 148, 87);
            Canvas.DrawText(Right(AutoCompleteList[Idx].Command, Len(AutoCompleteList[Idx].Command) - Len(TypedStr)), false);
            Canvas.StrLen("(>", XL, YL);
            StartIdx = AutoCompleteIndex - 5;
            // End:0x4D1
            if(StartIdx < 0)
            {
                StartIdx = Max(0, AutoCompleteIndices.Length + StartIdx);
            }
            Idx = StartIdx;
            Y = (ClipY - float(6)) - (YL * float(2));
            MatchIdx = 0;
            J0x519:

            // End:0x7A0 [Loop If]
            if(MatchIdx < 10)
            {
                OutStr = AutoCompleteList[AutoCompleteIndices[Idx]].Desc;
                Canvas.StrLen(OutStr, info_xl, info_yl);
                Y -= (info_yl - YL);
                Canvas.SetPos(LeftPos + XL, Y);
                Canvas.SetDrawColor(0, 0, 0);
                Canvas.DrawTile(DefaultTexture_White, info_xl, info_yl, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
                Canvas.SetPos(LeftPos + XL, Y);
                // End:0x6ED
                if(Idx == AutoCompleteIndex)
                {
                    Canvas.SetDrawColor(0, 255, 0);                    
                }
                else
                {
                    Canvas.SetDrawColor(0, 150, 0);
                }
                Canvas.DrawText(OutStr, false);
                // End:0x764
                if(++Idx >= AutoCompleteIndices.Length)
                {
                    Idx = 0;
                }
                Y -= YL;
                // End:0x792
                if(Idx == StartIdx)
                {
                    // [Explicit Break]
                    goto J0x7A0;
                }
                MatchIdx++;
                // [Loop Continue]
                goto J0x519;
            }
            J0x7A0:

            // End:0x961
            if(AutoCompleteIndices.Length >= 10)
            {
                OutStr = ("[" $ string((AutoCompleteIndices.Length - 10) + 1)) @ "more matches]";
                Canvas.StrLen(OutStr, info_xl, info_yl);
                Canvas.SetPos(LeftPos + XL, Y);
                Canvas.SetDrawColor(0, 0, 0);
                Canvas.DrawTile(DefaultTexture_White, info_xl, info_yl, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
                Canvas.SetPos(LeftPos + XL, Y);
                Canvas.SetDrawColor(0, 255, 0);
                Canvas.DrawText(OutStr, false);
            }
        }
        OutStr = "(>" @ Left(TypedStr, TypedStrPos);
        Canvas.StrLen(OutStr, XL, YL);
        Canvas.SetPos(LeftPos + XL, (ClipY - float(1)) - YL);
        Canvas.DrawText("_");
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x21
        if(PreviousStateName == 'None')
        {
            FlushPlayerInput();
        }
        bCaptureKeyInput = true;
        HistoryCur = HistoryTop;
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        bAutoCompleteLocked = false;
        //return;        
    }
    stop;    
}

state Open
{
    function InputChar()
    {
        local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
        local /*0x35EA0000-0x00000000*/ private editfixedsize string Unicode[8388609];
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(bCaptureKeyInput)
        {
            return true;
        }
        AppendInputText(Unicode);
        return true;
        //return ReturnValue;        
    }

    function InputKey()
    {
        local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
        local /*0x35EA0000-0x00000000*/ private name Key[8388609];
        local /*0x35EA0000-0x00000000*/ private byte Event[8388609];
        local /*0x35EA0000-0x00000000*/ private float AmountDepressed[9437185];
        local /*0x35EA0000-0x00000000*/ private bool bGamepad[9437185], ReturnValue;
        local /*0x35EA0000-0x00000000*/ private editfixedsize string Temp;

        1.0000000
        false
        // End:0x2E
        if(int(Event) == int(0))
        {
            bCaptureKeyInput = false;
        }
        // End:0x52
        if(ProcessControlKey(Key, Event))
        {
            return true;            
        }
        else
        {
            // End:0x64
            if(bGamepad)
            {
                return false;                
            }
            else
            {
                // End:0xE1
                if((Key == 'Escape') && int(Event) == int(1))
                {
                    // End:0xD0
                    if(TypedStr != "")
                    {
                        SetInputText("");
                        SetCursorPos(0);
                        HistoryCur = HistoryTop;
                        return true;                        
                    }
                    else
                    {
                        GotoState('None');
                    }                    
                }
                else
                {
                    // End:0x12D
                    if((Key == ConsoleKey) && int(Event) == int(0))
                    {
                        GotoState('None');
                        bCaptureKeyInput = true;
                        return true;                        
                    }
                    else
                    {
                        // End:0x1F0
                        if((Key == TypeKey) && int(Event) == int(0))
                        {
                            // End:0x1D1
                            if((AutoCompleteIndices.Length > 0) && !bAutoCompleteLocked)
                            {
                                TypedStr = AutoCompleteList[AutoCompleteIndices[0]].Command;
                                SetCursorPos(Len(TypedStr));
                                bAutoCompleteLocked = true;                                
                            }
                            else
                            {
                                GotoState('None');
                                bCaptureKeyInput = true;
                            }
                            return true;                            
                        }
                        else
                        {
                            // End:0x299
                            if((Key == 'Enter') && int(Event) == int(1))
                            {
                                // End:0x294
                                if(TypedStr != "")
                                {
                                    Temp = TypedStr;
                                    SetInputText("");
                                    SetCursorPos(0);
                                    // End:0x277
                                    if(Temp ~= "cls")
                                    {
                                        ClearOutput();                                        
                                    }
                                    else
                                    {
                                        ConsoleCommand(Temp);
                                    }
                                    UpdateCompleteIndices();
                                }
                                return true;                                
                            }
                            else
                            {
                                // End:0x2D9
                                if(global.InputKey(ControllerId, Key, Event, AmountDepressed, bGamepad))
                                {
                                    return true;                                    
                                }
                                else
                                {
                                    // End:0x35E
                                    if((int(Event) != int(0)) && int(Event) != int(2))
                                    {
                                        // End:0x359
                                        if(!bGamepad)
                                        {
                                            return ((Key != 'LeftMouseButton') && Key != 'MiddleMouseButton') && Key != 'RightMouseButton';
                                        }
                                        return false;                                        
                                    }
                                    else
                                    {
                                        // End:0x482
                                        if(Key == 'Up')
                                        {
                                            // End:0x428
                                            if(!bCtrl)
                                            {
                                                // End:0x425
                                                if(HistoryBot >= 0)
                                                {
                                                    // End:0x3C0
                                                    if(HistoryCur == HistoryBot)
                                                    {
                                                        HistoryCur = HistoryTop;                                                        
                                                    }
                                                    else
                                                    {
                                                        HistoryCur--;
                                                        // End:0x3E9
                                                        if(HistoryCur < 0)
                                                        {
                                                            HistoryCur = 16 - 1;
                                                        }
                                                    }
                                                    SetInputText(History[HistoryCur]);
                                                    SetCursorPos(Len(History[HistoryCur]));
                                                }                                                
                                            }
                                            else
                                            {
                                                // End:0x47D
                                                if(SBPos < (Scrollback.Length - 1))
                                                {
                                                    SBPos++;
                                                    // End:0x47D
                                                    if(SBPos >= Scrollback.Length)
                                                    {
                                                        SBPos = Scrollback.Length - 1;
                                                    }
                                                }
                                            }
                                            return true;                                            
                                        }
                                        else
                                        {
                                            // End:0x576
                                            if(Key == 'Down')
                                            {
                                                // End:0x53D
                                                if(!bCtrl)
                                                {
                                                    // End:0x53A
                                                    if(HistoryBot >= 0)
                                                    {
                                                        // End:0x4E4
                                                        if(HistoryCur == HistoryTop)
                                                        {
                                                            HistoryCur = HistoryBot;                                                            
                                                        }
                                                        else
                                                        {
                                                            HistoryCur = (HistoryCur + 1) % 16;
                                                        }
                                                        SetInputText(History[HistoryCur]);
                                                        SetCursorPos(Len(History[HistoryCur]));
                                                    }                                                    
                                                }
                                                else
                                                {
                                                    // End:0x571
                                                    if(SBPos > 0)
                                                    {
                                                        SBPos--;
                                                        // End:0x571
                                                        if(SBPos < 0)
                                                        {
                                                            SBPos = 0;
                                                        }
                                                    }
                                                }
                                                return true;                                                
                                            }
                                            else
                                            {
                                                // End:0x607
                                                if(Key == 'BackSpace')
                                                {
                                                    // End:0x602
                                                    if(TypedStrPos > 0)
                                                    {
                                                        SetInputText(Left(TypedStr, TypedStrPos - 1) $ Right(TypedStr, Len(TypedStr) - TypedStrPos));
                                                        SetCursorPos(TypedStrPos - 1);
                                                        bAutoCompleteLocked = false;
                                                    }
                                                    return true;                                                    
                                                }
                                                else
                                                {
                                                    // End:0x680
                                                    if(Key == 'Delete')
                                                    {
                                                        // End:0x67B
                                                        if(TypedStrPos < Len(TypedStr))
                                                        {
                                                            SetInputText(Left(TypedStr, TypedStrPos) $ Right(TypedStr, (Len(TypedStr) - TypedStrPos) - 1));
                                                        }
                                                        return true;                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x6B5
                                                        if(Key == 'Left')
                                                        {
                                                            SetCursorPos(Max(0, TypedStrPos - 1));
                                                            return true;                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x6F4
                                                            if(Key == 'Right')
                                                            {
                                                                SetCursorPos(Min(Len(TypedStr), TypedStrPos + 1));
                                                                return true;                                                                
                                                            }
                                                            else
                                                            {
                                                                // End:0x728
                                                                if(bCtrl && Key == 'Home')
                                                                {
                                                                    SBPos = 0;                                                                    
                                                                }
                                                                else
                                                                {
                                                                    // End:0x74F
                                                                    if(Key == 'Home')
                                                                    {
                                                                        SetCursorPos(0);
                                                                        return true;                                                                        
                                                                    }
                                                                    else
                                                                    {
                                                                        // End:0x78F
                                                                        if(bCtrl && Key == 'End')
                                                                        {
                                                                            SBPos = Scrollback.Length - 1;                                                                            
                                                                        }
                                                                        else
                                                                        {
                                                                            // End:0x7C0
                                                                            if(Key == 'End')
                                                                            {
                                                                                SetCursorPos(Len(TypedStr));
                                                                                return true;                                                                                
                                                                            }
                                                                            else
                                                                            {
                                                                                // End:0x867
                                                                                if((Key == 'PageUp') || Key == 'MouseScrollUp')
                                                                                {
                                                                                    // End:0x862
                                                                                    if(SBPos < (Scrollback.Length - 1))
                                                                                    {
                                                                                        // End:0x828
                                                                                        if(bCtrl)
                                                                                        {
                                                                                            SBPos += 5;                                                                                            
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            SBPos++;
                                                                                        }
                                                                                        // End:0x862
                                                                                        if(SBPos >= Scrollback.Length)
                                                                                        {
                                                                                            SBPos = Scrollback.Length - 1;
                                                                                        }
                                                                                    }
                                                                                    return true;                                                                                    
                                                                                }
                                                                                else
                                                                                {
                                                                                    // End:0x8EA
                                                                                    if((Key == 'PageDown') || Key == 'MouseScrollDown')
                                                                                    {
                                                                                        // End:0x8E8
                                                                                        if(SBPos > 0)
                                                                                        {
                                                                                            // End:0x8C3
                                                                                            if(bCtrl)
                                                                                            {
                                                                                                SBPos -= 5;                                                                                                
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                SBPos--;
                                                                                            }
                                                                                            // End:0x8E8
                                                                                            if(SBPos < 0)
                                                                                            {
                                                                                                SBPos = 0;
                                                                                            }
                                                                                        }
                                                                                        return true;
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return true;
        //return ReturnValue;        
    }

    event PostRender_Console()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609], Params;
        local /*0x35EA0000-0x00000000*/ private float Height, XL, YL, Y, ScrollLineXL, ScrollLineYL,
	        info_xl, info_yl, cxl, cyl;

        local /*0x35EA0000-0x00000000*/ private editfixedsize string OutStr;
        local /*0x35EA0000-0x00000000*/ private int Idx, MatchIdx;

        Params = SPDebugConsole_GetParams();
        // End:0x9B
        if(Params.SizeRatioX < 1.0000000)
        {
            Params.OffsetX += (Canvas.ClipX * (1.0000000 - Params.SizeRatioX));
        }
        Canvas.Font = Params.Font;
        Height = Canvas.ClipY * Params.SizeRatioY;
        Canvas.SetDrawColor(Params.BackgroundColor.R, Params.BackgroundColor.G, Params.BackgroundColor.B, Params.BackgroundColor.A);
        Canvas.SetPos(Params.OffsetX, Params.OffsetY);
        Canvas.DrawTile(DefaultTexture_White, Canvas.ClipX, Height, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
        OutStr = "(>" @ TypedStr;
        Canvas.StrLen(OutStr, XL, YL);
        Canvas.SetPos(Params.OffsetX, ((Params.OffsetY + Height) - float(12)) - YL);
        Canvas.SetDrawColor(Params.ForegroundColor.R, Params.ForegroundColor.G, Params.ForegroundColor.B, Params.ForegroundColor.A);
        Canvas.DrawTile(DefaultTexture_White, Canvas.ClipX, 2.0000000, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
        Canvas.SetPos(Params.OffsetX, Params.OffsetY + Height);
        Canvas.DrawTile(DefaultTexture_White, Canvas.ClipX, 2.0000000, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
        Canvas.SetPos(Params.OffsetX + Params.TextoffsetX, ((Params.OffsetY + Height) - float(5)) - YL);
        Canvas.StrLen(Params.ContextStr, cxl, cyl);
        Canvas.DrawText(Params.ContextStr, false);
        Canvas.SetPos((Params.OffsetX + Params.TextoffsetX) + cxl, ((Params.OffsetY + Height) - float(5)) - YL);
        Canvas.bCenter = false;
        Canvas.DrawText(OutStr, false);
        // End:0xD8E
        if(AutoCompleteIndices.Length > 0)
        {
            Idx = AutoCompleteIndices[0];
            Canvas.SetPos(((Params.OffsetX + Params.TextoffsetX) + float(0)) + XL, ((Params.OffsetY + Height) - float(5)) - YL);
            Canvas.SetDrawColor(87, 148, 87, Params.ForegroundColor.A);
            Canvas.DrawText(Right(AutoCompleteList[Idx].Command, Len(AutoCompleteList[Idx].Command) - Len(TypedStr)), false);
            Canvas.StrLen("(>", XL, YL);
            Y = Height + float(5);
            MatchIdx = 0;
            J0x97A:

            // End:0xD8E [Loop If]
            if((MatchIdx < AutoCompleteIndices.Length) && MatchIdx < 10)
            {
                Idx = AutoCompleteIndices[MatchIdx];
                Canvas.SetPos((Params.OffsetX + float(0)) + XL, Params.OffsetY + Y);
                Canvas.StrLen(AutoCompleteList[Idx].Desc, info_xl, info_yl);
                Canvas.SetDrawColor(Params.BackgroundColor.R, Params.BackgroundColor.G, Params.BackgroundColor.B, Params.BackgroundColor.A);
                Canvas.DrawTile(DefaultTexture_White, info_xl, info_yl, 0.0000000, 0.0000000, 32.0000000, 32.0000000);
                Canvas.SetPos(((Params.OffsetX + Params.TextoffsetX) + float(0)) + XL, Params.OffsetY + Y);
                Canvas.SetDrawColor(Params.ForegroundColor.R, Params.ForegroundColor.G, Params.ForegroundColor.B, Params.ForegroundColor.A);
                Canvas.DrawText(AutoCompleteList[Idx].Desc, false);
                Y += info_yl;
                MatchIdx++;
                // [Loop Continue]
                goto J0x97A;
            }
        }
        OutStr = "(>" @ Left(TypedStr, TypedStrPos);
        Canvas.StrLen(OutStr, XL, YL);
        Canvas.SetPos(((Params.OffsetX + Params.TextoffsetX) + cxl) + XL, ((Params.OffsetY + Height) - float(3)) - YL);
        Canvas.SetDrawColor(Params.ForegroundColor.R, Params.ForegroundColor.G, Params.ForegroundColor.B, byte(float(Params.ForegroundColor.A) * Params.CaretAlpha));
        Canvas.DrawText("_");
        Idx = SBHead - SBPos;
        Y = (Height - float(16)) - (YL * float(2));
        // End:0x1011
        if(Scrollback.Length == 0)
        {
            return;
        }
        Canvas.SetDrawColor(Params.ForegroundColor.R, Params.ForegroundColor.G, Params.ForegroundColor.B, Params.ForegroundColor.A);
        J0x10EC:

        // End:0x12CB [Loop If]
        if((Y > YL) && Idx >= 0)
        {
            Canvas.SetPos(Params.OffsetX + Params.TextoffsetX, Params.OffsetY + Y);
            Canvas.StrLen(Scrollback[Idx], ScrollLineXL, ScrollLineYL);
            // End:0x1273
            if(ScrollLineYL > YL)
            {
                Y -= (ScrollLineYL - YL);
                Canvas.SetPos(Canvas.CurX, Y, Canvas.CurZ);
            }
            Canvas.DrawText(Scrollback[Idx], false);
            Idx--;
            Y -= YL;
            // [Loop Continue]
            goto J0x10EC;
        }
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        bCaptureKeyInput = true;
        HistoryCur = HistoryTop;
        SBPos = 0;
        bCtrl = false;
        // End:0x57
        if(PreviousStateName == 'None')
        {
            FlushPlayerInput();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    DefaultTexture_Black=Texture2D'EngineResources.Black'
    DefaultTexture_White=Texture2D'EngineResources.WhiteSquareTexture'
    ConsoleKey="Tilde"
    TypeKey="Tab"
    MaxScrollbackSize=1024
    HistoryBot=-1
    ManualAutoCompleteList=/* Array type was not detected. */
    OnReceivedNativeInputKey=InputKey
    OnReceivedNativeInputChar=InputChar
}