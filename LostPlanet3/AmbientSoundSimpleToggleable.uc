class AmbientSoundSimpleToggleable extends AmbientSoundSimple
    placeable
    hidecategories(AnimDependency,Navigation,Audio)
    autoexpandcategories(Audio,AmbientSoundSimple,AmbientSoundSimpleToggleable);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bCurrentlyPlaying;

    structdefaultproperties
    {
        bCurrentlyPlaying=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private travel bool bCurrentlyPlaying[2097153];
var(*) /*0x02520000-0x00000000*/ private bool bFadeOnToggle[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreAutoPlay[536870913];
var(*) /*0x02520000-0x00000000*/ private float FadeInDuration[65537];
var(*) /*0x02520000-0x00000000*/ private float FadeInVolumeLevel[65537];
var(*) /*0x02520000-0x00000000*/ private float FadeOutDuration[65537];
var(*) /*0x02520000-0x00000000*/ private float FadeOutVolumeLevel[65537];

simulated event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    bCurrentlyPlaying = AudioComponent.bAutoPlay;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x3E
    if(VarName == 'bCurrentlyPlaying')
    {
        // End:0x31
        if(bCurrentlyPlaying)
        {
            StartPlaying();            
        }
        else
        {
            StopPlaying();
        }        
    }
    else
    {
        super(Actor).ReplicatedEvent(VarName);
    }
    //return;    
}

simulated function StartPlaying()
{
    // End:0x41
    if(bFadeOnToggle)
    {
        AudioComponent.FadeIn(FadeInDuration, FadeInVolumeLevel);        
    }
    else
    {
        AudioComponent.Play();
    }
    bCurrentlyPlaying = true;
    //return;    
}

simulated function StopPlaying()
{
    // End:0x41
    if(bFadeOnToggle)
    {
        AudioComponent.FadeOut(FadeOutDuration, FadeOutVolumeLevel);        
    }
    else
    {
        AudioComponent.Stop();
    }
    bCurrentlyPlaying = false;
    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0xA4
    if(Action.InputLinks[0].bHasImpulse || Action.InputLinks[2].bHasImpulse && !AudioComponent.bWasPlaying)
    {
        StartPlaying();        
    }
    else
    {
        bIgnoreAutoPlay = true;
        StopPlaying();
    }
    ForceNetRelevant();
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25165825];

    Record.bCurrentlyPlaying = bCurrentlyPlaying;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897];

    bCurrentlyPlaying = Record.bCurrentlyPlaying;
    // End:0x42
    if(bCurrentlyPlaying)
    {
        StartPlaying();        
    }
    else
    {
        StopPlaying();
    }
    //return;    
}

defaultproperties
{
    FadeInDuration=1.0000000
    FadeInVolumeLevel=1.0000000
    FadeOutDuration=1.0000000
    // Reference: SoundCue'Default__AmbientSoundSimpleToggleable.SoundCue0'
    begin object name=SoundCue0
    end object
    SoundCueInstance=SoundCue0
    // Reference: SoundNodeAmbient'Default__AmbientSoundSimpleToggleable.SoundNodeAmbient0'
    begin object name=SoundNodeAmbient0
    end object
    SoundNodeInstance=SoundNodeAmbient0
    bAutoPlay=false
    // Reference: AudioComponent'Default__AmbientSoundSimpleToggleable.AudioComponent0'
    begin object name=AudioComponent0
    end object
    AudioComponent=AudioComponent0
    Components[0]=none
    Components[1]=none
    Components[2]=AudioComponent0
    bStatic=false
    bNoDelete=true
}