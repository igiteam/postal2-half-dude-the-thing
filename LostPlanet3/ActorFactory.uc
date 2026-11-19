class ActorFactory extends Object
    abstract
    config(Editor)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private class GameplayActorClass;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string MenuName;
var(*) /*0x35EA0000-0x00000000*/ private int MenuPriority[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private transient int AlternateMenuPriority;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string NewActorClassName[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private class NewActorClass;
var(*) /*0x35EA0000-0x00000000*/ private bool bPlaceable;
var(*) /*0x35EA0000-0x00000000*/ private bool bShowInEditorQuickMenu;
var(*) /*0x4A9F0000-0x00000000*/ private bool bKillSpawnedActorsOnUnload[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bAllowFailedSpawns;
var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreCollision;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SpawnedActors[536870913];
var(*) /*0x2EB80000-0x00000000*/ private @NULL LightingOverride[65537];
var(*) /*0x1CA30000-0x00000000*/ private @NULL LifeSpan[65537];
var(*) /*0x1CA30000-0x00000000*/ private @NULL DestructibleHitPoints[65537];
var(*) /*0x1CA30000-0x00000000*/ private @NULL DestructibleProperties[65537];
var(*) /*0x1CE70000-0x00000000*/ private @NULL ScaleOverride[65537];

simulated event PostCreateActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewActor[8388609], ActorFactoryData;

    //return;    
}

defaultproperties
{
    MenuName="Add Actor"
    MenuPriority=10
    bPlaceable=true
    bKillSpawnedActorsOnUnload=true
    LightingOverride=(bCastShadow=EBooleanOverride.EBO_NOOVERRIDE,bCastDynamicShadow=EBooleanOverride.EBO_NOOVERRIDE,bAcceptsLights=EBooleanOverride.EBO_NOOVERRIDE,bAcceptsDynamicLights=EBooleanOverride.EBO_NOOVERRIDE,bUsePrecomputedShadows=EBooleanOverride.EBO_NOOVERRIDE,LightingChannels=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,LightChannels=(bInitialized=false,BSP=false,Static=false,Dynamic=false,CompositeDynamic=false,Skybox=false,SPBackground=false,GeneratedMeshAreaLight=false,Unnamed_1=false,Unnamed_2=false,Unnamed_3=false,Unnamed_4=false,Unnamed_5=false,Unnamed_6=false,Cinematic_1=false,Cinematic_2=false,Cinematic_3=false,Cinematic_4=false,Cinematic_5=false,Cinematic_6=false,Cinematic_7=false,Cinematic_8=false,Cinematic_9=false,Cinematic_10=false,Gameplay_1=false,Gameplay_2=false,Gameplay_3=false,Gameplay_4=false,Crowd=false)),DynamicLightEnvironmentOverride=(bEnabled=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bForceNonCompositeDynamicLights=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=false),InvisibleUpdateTime=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=5.0000000),MinTimeBetweenFullUpdates=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=1.0000000),NumVolumeVisibilitySamples=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=1),AmbientShadowColor=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.0010000,G=0.0010000,B=0.0010000,A=1.0000000)),AmbientShadowSourceDirection=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(X=0.0100000,Y=0.0000000,Z=0.9900000)),AmbientGlow=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)),LightDesaturation=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=0.0000000),LightDistance=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=10.0000000),ShadowDistance=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=5.0000000),bCastShadows=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bCompositeShadowsFromDynamicLights=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),ModShadowFadeoutTime=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=0.7500000),ModShadowFadeoutExponent=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=3.0000000),MaxModulatedShadowColor=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=(R=0.5000000,G=0.5000000,B=0.5000000,A=1.0000000)),bDynamic=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bSynthesizeDirectionalLight=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),bSynthesizeSHLight=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=true),MinShadowAngle=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=35.0000000),bRequiresNonLatentUpdates=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,OverrideValue=false)))
    ScaleOverride=(Scale=(OverrideType=EOverrideType.SPEOT_NOOVERRIDE,Pad1=0,Pad2=0,Pad3=0,OverrideValue=1.0000000))
}