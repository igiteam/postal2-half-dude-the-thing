class LPAnimNotify_VSTightenWinchCable extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

event Notify()
{
    local /*0x97E50000-0x00000000*/ private @NULL Owner[8388609], AnimSeqInstigator, P;

    P = LPAIPawnVsLaroche(Owner);
    // End:0x60
    if(P != none)
    {
        P.WinchCable.SetTighten(true);
    }
    //return;    
}
