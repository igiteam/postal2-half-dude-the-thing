class DirectionalLightToggleable extends DirectionalLight
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Lights,DirectionalLights);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LCRecord;

    structdefaultproperties
    {
        bEnabled=false
        LCRecord=(Brightness=0.0000000,LightColor=(R=0,G=0,B=0,A=0),bSelfShadowOnly=false,BloomScale=0.0000000,BloomTint=(R=0,G=0,B=0,A=0),OcclusionMaskDarkness=0.0000000)
    }
};

function ShouldSaveForCheckpoint()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return int(RemoteRole) != int(ROLE_None);
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25165825];

    Record.bEnabled = bEnabled;
    Record.LCRecord.Brightness = LightComponent.Brightness;
    Record.LCRecord.LightColor = LightComponent.LightColor;
    Record.LCRecord.bSelfShadowOnly = LightComponent.bSelfShadowOnly;
    Record.LCRecord.BloomScale = LightComponent.BloomScale;
    Record.LCRecord.BloomTint = LightComponent.BloomTint;
    Record.LCRecord.OcclusionMaskDarkness = LightComponent.OcclusionMaskDarkness;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897];

    bEnabled = Record.bEnabled;
    LightComponent.SetEnabled(bEnabled);
    LightComponent.SetLightProperties(Record.LCRecord.Brightness, Record.LCRecord.LightColor);
    LightComponent.bSelfShadowOnly = Record.LCRecord.bSelfShadowOnly;
    LightComponent.BloomScale = Record.LCRecord.BloomScale;
    LightComponent.BloomTint = Record.LCRecord.BloomTint;
    LightComponent.OcclusionMaskDarkness = Record.LCRecord.OcclusionMaskDarkness;
    ForceNetRelevant();
    //return;    
}

defaultproperties
{
    // Reference: DirectionalLightComponent'Default__DirectionalLightToggleable.DirectionalLightComponent0'
    begin object name=DirectionalLightComponent0
    end object
    LightComponent=DirectionalLightComponent0
    Components[0]=none
    Components[1]=DirectionalLightComponent0
    Components[2]=none
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bStatic=false
    bHardAttach=true
}