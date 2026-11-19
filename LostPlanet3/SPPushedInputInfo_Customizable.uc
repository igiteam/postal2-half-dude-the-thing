class SPPushedInputInfo_Customizable extends SPPushedInputInfo
    abstract
    editinlinenew
    hidecategories(Object);

var(__HandleButtonInput__Delegate) /*0x02640000-0x00000400*/ private editfixedsize array SuppressedActions[589825];

function InitNewInput()
{
    local /*0x01E60000-0x00000000*/ private @NULL newinput[8388609];
    local /*0x01E60000-0x00000000*/ private int Idx;

    super.InitNewInput(newinput);
    Idx = 0;
    J0x1E:

    // End:0xA6 [Loop If]
    if(Idx < SuppressedActions.Length)
    {
        // End:0x98
        if(SuppressedActions[Idx] != none)
        {
            newinput.SetButtonNameFilteredState(SuppressedActions[Idx].GetButtonName(), true);
        }
        Idx++;
        // [Loop Continue]
        goto J0x1E;
    }
    //return;    
}
