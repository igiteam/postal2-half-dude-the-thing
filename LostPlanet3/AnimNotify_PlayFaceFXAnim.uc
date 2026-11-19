class AnimNotify_PlayFaceFXAnim extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x02EF0000-0x00000000*/ private @NULL FaceFXAnimSetRef[65537];
var(*) /*0x02EF0000-0x00000000*/ private editfixedsize string GroupName[65537];
var(*) /*0x02EF0000-0x00000000*/ private editfixedsize string AnimName[65537];
var(*) /*0x02EF0000-0x00000000*/ private @NULL SoundCueToPlay[65537];
var(*) /*0x02EF0000-0x00000000*/ private @NULL AkEventToPlay[65537];
var(*) /*0x02EF0000-0x00000000*/ private bool bOverridePlayingAnim[65537];
var(*) /*0x02EF0000-0x00000000*/ private float PlayFrequency[65537];

event Notify()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Owner[8388609], AnimSeqInstigator;

    // End:0x28
    if(PlayFrequency < 1.0000000)
    {
        // End:0x25
        if(FRand() > PlayFrequency)
        {
            return;
        }        
    }
    else
    {
        // End:0x3B
        if(PlayFrequency > 1.0000000)
        {
        }
    }
    // End:0xF2
    if(Owner != none)
    {
        // End:0xF2
        if(Owner.CanActorPlayFaceFXAnim())
        {
            // End:0xF2
            if(bOverridePlayingAnim || !Owner.IsActorPlayingFaceFXAnim())
            {
                // End:0xF2
                if(Owner.PlayActorFaceFXAnim(FaceFXAnimSetRef, GroupName, AnimName, SoundCueToPlay, AkEventToPlay) == false)
                {
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    bOverridePlayingAnim=true
    PlayFrequency=1.0000000
}