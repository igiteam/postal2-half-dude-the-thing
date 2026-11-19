class LPGFxUIElementReticle_VSFuture extends LPGFxUIElementReticle;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSReticuleMC;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    // End:0x10F
    if(MoviePlayer != none)
    {
        ReticleRoot = "_root.stagePanel.panel_fvsReticle";
        VSReticuleMC = MoviePlayer.GetVariableObject(ReticleRoot $ ".fvsReticle");
        // End:0x10F
        if(VSReticuleMC != none)
        {
            AimHalfWidth = VSReticuleMC.GetFloat("_width") / float(2);
            AimHalfHeight = VSReticuleMC.GetFloat("_height") / float(2);
        }
    }
    //return;    
}

// Export ULPGFxUIElementReticle_VSFuture::execSetPosition(FFrame&, void* const)
native function SetPosition()
{
    local /*0x97E50000-0x00000000*/ private float PosX[8388609], PosY;


}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x89
    if(VSReticuleMC != none)
    {
        DI = VSReticuleMC.GetDisplayInfo();
        DI.Visible = bShow;
        VSReticuleMC.SetDisplayInfo(DI);
    }
    //return;    
}

event SetColor()
{
    local /*0x97E50000-0x00000000*/ private int R[8388609], G, B;
    local /*0x97E50000-0x00000000*/ private @NULL cxform;

    // End:0x187
    if(VSReticuleMC != none)
    {
        cxform.Multiply.R = 0.0000000;
        cxform.Multiply.G = 0.0000000;
        cxform.Multiply.B = 0.0000000;
        cxform.Add.R = float(R);
        cxform.Add.G = float(G);
        cxform.Add.B = float(B);
        VSReticuleMC.SetColorTransform(cxform);
    }
    //return;    
}
