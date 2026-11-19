class DominantDirectionalLightMovable extends DominantDirectionalLight
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Lights,DirectionalLights);

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
    Record.Location = Location;
    Record.Rotation = Rotation;
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
    SetLocation(Record.Location);
    SetRotation(Record.Rotation);
    ForceNetRelevant();
    //return;    
}

defaultproperties
{
    // Reference: DominantDirectionalLightComponent'Default__DominantDirectionalLightMovable.DominantDirectionalLightComponent0'
    begin object name=DominantDirectionalLightComponent0
    end object
    LightComponent=DominantDirectionalLightComponent0
    Components[0]=none
    Components[1]=none
    Components[2]=DominantDirectionalLightComponent0
    Physics=EPhysics.PHYS_Interpolating
    bMovable=true
}