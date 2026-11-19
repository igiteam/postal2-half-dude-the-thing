class AnimNotify_PawnMaterialParam extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x02EE0000-0x00000000*/ private editfixedsize array ScalarParameterInterpArray[65537];

event Notify()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Owner[8388609], AnimSeqInstigator, P;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private @NULL ScalarParam;

    P = Pawn(Owner);
    // End:0xA1
    if(P != none)
    {
        I = 0;
        J0x36:

        // End:0xA1 [Loop If]
        if(I < ScalarParameterInterpArray.Length)
        {
            ScalarParam = ScalarParameterInterpArray[I];
            P.SetScalarParameterInterp(ScalarParam);
            I++;
            // [Loop Continue]
            goto J0x36;
        }
    }
    //return;    
}
