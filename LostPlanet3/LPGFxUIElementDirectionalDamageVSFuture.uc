class LPGFxUIElementDirectionalDamageVSFuture extends LPGFxUIElementDirectionalDamage;

function InitHitLocClips()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    HitLocMC[0] = MoviePlayer.GetVariableObject("_root.ddVSFutureFront");
    HitLocMC[1] = MoviePlayer.GetVariableObject("_root.ddVSFutureFrontRight");
    HitLocMC[2] = MoviePlayer.GetVariableObject("_root.ddVSFutureRight");
    HitLocMC[3] = MoviePlayer.GetVariableObject("_root.ddVSFutureBackRight");
    HitLocMC[4] = MoviePlayer.GetVariableObject("_root.ddVSFutureBack");
    HitLocMC[5] = MoviePlayer.GetVariableObject("_root.ddVSFutureBackLeft");
    HitLocMC[6] = MoviePlayer.GetVariableObject("_root.ddVSFutureLeft");
    HitLocMC[7] = MoviePlayer.GetVariableObject("_root.ddVSFutureFrontLeft");
    I = 0;
    J0x237:

    // End:0x2F2 [Loop If]
    if(I < 8)
    {
        // End:0x2E4
        if(HitLocMC[I] != none)
        {
            DI = HitLocMC[I].GetDisplayInfo();
            DI.Visible = false;
            HitLocMC[I].SetDisplayInfo(DI);
        }
        I++;
        // [Loop Continue]
        goto J0x237;
    }
    //return;    
}
