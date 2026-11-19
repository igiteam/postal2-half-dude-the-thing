class UISoundTheme extends Object;

struct native SoundEventMapping
{
    var(*) /*0x484E0000-0x00000000*/ private name SoundEventName[65537];
    var(*) /*0x484E0000-0x00000000*/ private @NULL SoundToPlay[65537];

    structdefaultproperties
    {
        SoundEventName="None"
        SoundToPlay=none
    }
};

var(*) /*0x4E610000-0x00000000*/ private editfixedsize array SoundEventBindings[65537];

event ProcessSoundEvent()
{
    local /*0x35EA0000-0x00000000*/ private name SoundEventName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SoundOwner[9437185];
    local /*0x35EA0000-0x00000000*/ private int EventIndex;

    EventIndex = SoundEventBindings.Find('SoundEventName', SoundEventName);    
    // End:0xFD
    if(EventIndex != -1)
    {
        // End:0x99
        if(SoundOwner != none)
        {
            SoundOwner.PlaySound(SoundEventBindings[EventIndex].SoundToPlay, true, true, true);            
        }
        else
        {
            Class'WorldInfo'.static.GetWorldInfo().PlaySound(SoundEventBindings[EventIndex].SoundToPlay, true, true, true);
        }        
    }
    //return;    
}
