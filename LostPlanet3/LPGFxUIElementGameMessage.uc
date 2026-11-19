class LPGFxUIElementGameMessage extends SPGFxUIElementGameMessage;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL useStatusMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL textLabel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CachedOwnerLPPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string useStatusModeFrameName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string buttonHolderClipName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string textLabelClipName;

// Export ULPGFxUIElementGameMessage::execGetLPPC(FFrame&, void* const)
native final function GetLPPC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x89
    if(useStatusMC != none)
    {
        DI = useStatusMC.GetDisplayInfo();
        DI.Visible = bShow;
        useStatusMC.SetDisplayInfo(DI);
    }
    //return;    
}

function InitButtonPrompt()
{
    local /*0x97E50000-0x00000000*/ private @NULL holder;

    // End:0x1CD
    if((useStatusMC != none) && useStatusModeFrameName != "")
    {
        useStatusMC.GotoAndStop(useStatusModeFrameName);
        switch(useStatusModeFrameName)
        {
            // End:0x67
            case "normal":
            // End:0x8B
            case "hold":
                buttonHolderClipName = "holderNormal";
                // End:0x114
                break;
            // End:0xB3
            case "mashing":
                buttonHolderClipName = "holderMashing";
                // End:0x114
                break;
            // End:0xE3
            case "shakeStickX":
                buttonHolderClipName = "holderShakeStickX";
                // End:0x114
                break;
            // End:0x111
            case "moveStickX":
                buttonHolderClipName = "holderMoveStickX";
                // End:0x114
                break;
            // End:0xFFFF
            default:
                break;
        }
        // End:0x1CD
        if((buttonHolderClipName != "") && textLabelClipName != "")
        {
            holder = useStatusMC.GetObject(buttonHolderClipName);
            // End:0x1CD
            if(holder != none)
            {
                textLabel = holder.GetObject(textLabelClipName);
                // End:0x1CD
                if(textLabel != none)
                {
                    SetInputCalloutTextLabel(textLabel);
                }
            }
        }
    }
    //return;    
}

function RefreshInputCalloutTextLabel()
{
    SetInputCalloutTextLabel(textLabel);
    //return;    
}

function SetRingPercent()
{
    local /*0x97E50000-0x00000000*/ private float ringPercent[8388609];

    // End:0x3E
    if(useStatusMC != none)
    {
        useStatusMC.ActionScriptVoid("SetRingPercent");
    }
    //return;    
}

defaultproperties
{
    textLabelClipName="Label1"
}