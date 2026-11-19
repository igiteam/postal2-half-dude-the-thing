class AnimNotify extends Object
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private @NULL NotifyColor;

simulated function FindNextNotifyOfClass()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimSeqInstigator[8388609];
    local /*0x35EA0000-0x00000000*/ private class NotifyClass[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL OutEvent[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Seq;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private bool bFoundThis;

    // End:0x181
    if(AnimSeqInstigator.AnimSeq != none)
    {
        Seq = AnimSeqInstigator.AnimSeq;
        I = 0;
        J0x57:

        // End:0x181 [Loop If]
        if(I < Seq.Notifies.Length)
        {
            // End:0xD1
            if(Seq.Notifies[I].Notify == self)
            {
                bFoundThis = true;
            }
            // End:0x173
            if(bFoundThis && ClassIsChildOf(Seq.Notifies[I].Notify.Class, NotifyClass))
            {
                OutEvent = Seq.Notifies[I];
                return true;
            }
            I++;
            // [Loop Continue]
            goto J0x57;
        }
    }
    return false;
    //return ReturnValue;    
}
