class LPAnimNotify_SpecialDodgeReady extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

event Notify()
{
    local /*0x97E50000-0x00000000*/ private @NULL Owner[8388609], AnimSeqInstigator;

    // End:0x56
    if(ClassIsChildOf(Owner.Class, Class'LPPlayerPawn'))
    {
        LPPlayerPawn(Owner).HandleAnimNotifySpecialDodgeReady(self);
    }
    //return;    
}
