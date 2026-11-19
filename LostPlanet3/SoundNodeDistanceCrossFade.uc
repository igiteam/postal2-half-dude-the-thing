class SoundNodeDistanceCrossFade extends SoundNode
    editinlinenew
    hidecategories(Object,Object);

struct native DistanceDatum
{
    var(*) /*0x1CFB0000-0x00000000*/ private float FadeInDistanceStart[65537];
    var(*) /*0x1CFB0000-0x00000000*/ private float FadeInDistanceEnd[65537];
    var(*) /*0x1CFB0000-0x00000000*/ private float FadeOutDistanceStart[65537];
    var(*) /*0x1CFB0000-0x00000000*/ private float FadeOutDistanceEnd[65537];
    var(*) /*0x1CFB0000-0x00000000*/ private float Volume[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export transient @NULL FadeInDistance;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize export transient @NULL FadeOutDistance;

    structdefaultproperties
    {
        FadeInDistanceStart=0.0000000
        FadeInDistanceEnd=0.0000000
        FadeOutDistanceStart=0.0000000
        FadeOutDistanceEnd=0.0000000
        Volume=1.0000000
    }
};

var(*) /*0x48660000-0x00000000*/ private editfixedsize export array CrossFadeInput[4784129];
