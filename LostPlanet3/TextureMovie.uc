class TextureMovie extends Texture
    hidecategories(Object);

enum ETexMovieDestroyState
{
    ETMDS_WaitForAsyncLoad,         // 0
    ETMDS_DestroyDecoder,           // 1
    ETMDS_WaitForFence,             // 2
    ETMDS_MAX                       // 3
};

enum EMovieStreamSource
{
    MovieStream_File,               // 0
    MovieStream_Memory,             // 1
    MovieStream_MAX                 // 2
};

var(*) /*0x35EA0000-0x00000000*/ private int SizeX[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SizeY[131073];
var(*) /*0x35EA0000-0x00000000*/ private byte Format[131073];
var(*) /*0x4C460000-0x00000000*/ private byte AddressX[65537];
var(*) /*0x4C460000-0x00000000*/ private byte AddressY[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte DestroyState;
var(*) /*0x4C460000-0x00000000*/ private const byte MovieStreamSource[65537];
var(*) /*0x35EA0000-0x00000000*/ private class DecoderClass[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Decoder[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedFinishOpenAsync[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool Paused[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool Stopped[537001985];
var(*) /*0x4C460000-0x00000000*/ private bool Looping[65537];
var(*) /*0x4C460000-0x00000000*/ private bool ResetOnLastFrame[65537];
var(*) /*0x4C460000-0x00000000*/ private bool AutoPlay[65537];
var(*) /*0x4C460000-0x00000000*/ private bool bUnloadFileMovieDecoderOnStop[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bWaitingForAsyncOpenToFinish[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Data[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ReleaseCodecFence[805437441];
var(*) /*0x4C460000-0x00000000*/ private const editfixedsize string MovieStreamFilename[65537];

// Export UTextureMovie::execPlay(FFrame&, void* const)
native function Play();

// Export UTextureMovie::execPause(FFrame&, void* const)
native function Pause();

// Export UTextureMovie::execStop(FFrame&, void* const)
native function Stop();

// Export UTextureMovie::execIsPlaying(FFrame&, void* const)
native function IsPlaying()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

defaultproperties
{
    MovieStreamSource=EMovieStreamSource.MovieStream_Memory
    DecoderClass=Class'CodecMovieFallback'
    Stopped=true
    Looping=true
    bUnloadFileMovieDecoderOnStop=true
    NeverStream=true
}