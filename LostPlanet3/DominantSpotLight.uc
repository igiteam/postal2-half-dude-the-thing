class DominantSpotLight extends SpotLight
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Lights,SpotLights);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PLCRecord;

    structdefaultproperties
    {
        bEnabled=false
        PLCRecord=(Radius=0.0000000,FalloffExponent=0.0000000,Brightness=0.0000000,LightColor=(R=0,G=0,B=0,A=0),bSelfShadowOnly=false,BloomScale=0.0000000,BloomTint=(R=0,G=0,B=0,A=0),OcclusionMaskDarkness=0.0000000)
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
    Record.PLCRecord.Radius = PointLightComponent(LightComponent).Radius;
    Record.PLCRecord.FalloffExponent = PointLightComponent(LightComponent).FalloffExponent;
    Record.PLCRecord.Brightness = PointLightComponent(LightComponent).Brightness;
    Record.PLCRecord.LightColor = PointLightComponent(LightComponent).LightColor;
    Record.PLCRecord.bSelfShadowOnly = PointLightComponent(LightComponent).bSelfShadowOnly;
    Record.PLCRecord.BloomScale = PointLightComponent(LightComponent).BloomScale;
    Record.PLCRecord.BloomTint = PointLightComponent(LightComponent).BloomTint;
    Record.PLCRecord.OcclusionMaskDarkness = PointLightComponent(LightComponent).OcclusionMaskDarkness;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897];

    bEnabled = Record.bEnabled;
    LightComponent.SetEnabled(bEnabled);
    PointLightComponent(LightComponent).Radius = Record.PLCRecord.Radius;
    PointLightComponent(LightComponent).FalloffExponent = Record.PLCRecord.FalloffExponent;
    LightComponent.SetLightProperties(Record.PLCRecord.Brightness, Record.PLCRecord.LightColor);
    PointLightComponent(LightComponent).bSelfShadowOnly = Record.PLCRecord.bSelfShadowOnly;
    PointLightComponent(LightComponent).BloomScale = Record.PLCRecord.BloomScale;
    PointLightComponent(LightComponent).BloomTint = Record.PLCRecord.BloomTint;
    PointLightComponent(LightComponent).OcclusionMaskDarkness = Record.PLCRecord.OcclusionMaskDarkness;
    ForceNetRelevant();
    //return;    
}

defaultproperties
{
    // Reference: DominantSpotLightComponent'Default__DominantSpotLight.DominantSpotLightComponent0'
    begin object name=DominantSpotLightComponent0 class=Class'DominantSpotLightComponent'
    end object
    LightComponent=DominantSpotLightComponent0
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=none
    Components[4]=none
    Components[5]=none
    Components[6]=DominantSpotLightComponent0
    bStatic=false
    bHardAttach=true
}