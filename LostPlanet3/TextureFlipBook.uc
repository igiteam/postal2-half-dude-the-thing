class TextureFlipBook extends Texture2D
    forcescriptorder(true)
    hidecategories(Object,Object);

enum TextureFlipBookMethod
{
    TFBM_UL_ROW,                    // 0
    TFBM_UL_COL,                    // 1
    TFBM_UR_ROW,                    // 2
    TFBM_UR_COL,                    // 3
    TFBM_LL_ROW,                    // 4
    TFBM_LL_COL,                    // 5
    TFBM_LR_ROW,                    // 6
    TFBM_LR_COL,                    // 7
    TFBM_RANDOM,                    // 8
    TFBM_MAX                        // 9
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_FTickableObject[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float TimeIntoMovie[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float TimeSinceLastFrame[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float HorizontalScale[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float VerticalScale[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bPaused[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bStopped[131073];
var(*) /*0x23690000-0x00000000*/ private bool bLooping[65537];
var(*) /*0x23690000-0x00000000*/ private bool bAutoPlay[65537];
var(*) /*0x23690000-0x00000000*/ private int HorizontalImages[65537];
var(*) /*0x23690000-0x00000000*/ private int VerticalImages[65537];
var(*) /*0x23690000-0x00000000*/ private byte FBMethod[65537];
var(*) /*0x23690000-0x00000000*/ private float FrameRate[65537];
var(*) /*0x35EA0000-0x00000000*/ private float FrameTime;
var(*) /*0x35EA0000-0x00000000*/ private int CurrentRow[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int CurrentColumn[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float RenderOffsetU[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float RenderOffsetV[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ReleaseResourcesFence[268566529];

// Export UTextureFlipBook::execPlay(FFrame&, void* const)
native function Play();

// Export UTextureFlipBook::execPause(FFrame&, void* const)
native function Pause();

// Export UTextureFlipBook::execStop(FFrame&, void* const)
native function Stop();

// Export UTextureFlipBook::execSetCurrentFrame(FFrame&, void* const)
native function SetCurrentFrame()
{
    local /*0x35EA0000-0x00000000*/ private int Row[8388609], Col;


}

defaultproperties
{
    bLooping=true
    bAutoPlay=true
    HorizontalImages=1
    VerticalImages=1
    FrameRate=4.0000000
    FrameTime=0.2500000
    AddressX=TextureAddress.TA_Clamp
    AddressY=TextureAddress.TA_Clamp
}