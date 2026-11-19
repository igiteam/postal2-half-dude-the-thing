class PostProcessChain extends Object;

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Effects;

final function FindPostProcessEffect()
{
    local /*0x35EA0000-0x00000000*/ private name EffectName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x96 [Loop If]
    if(Idx < Effects.Length)
    {
        // End:0x88
        if((Effects[Idx] != none) && Effects[Idx].EffectName == EffectName)
        {
            return Effects[Idx];
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return none;
    //return ReturnValue;    
}
