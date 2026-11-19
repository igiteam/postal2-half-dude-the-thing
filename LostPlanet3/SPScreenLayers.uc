class SPScreenLayers extends PostProcessEffect
    abstract
    dontsortcategories(All)
    hidecategories(Object);

struct native SPScreenLayersSettings
{
    var(*) /*0x496E0000-0x00000000*/ private editconst bool bEnabled[65537];
    var(*) /*0x496E0000-0x00000000*/ private float InterpolationDuration[65537];
    var(*) /*0x496E0000-0x00000000*/ private @NULL Material[65537];
    var(*) /*0x496E0000-0x00000000*/ private @NULL AltMaterial[65537];
    var(*) /*0x496E0000-0x00000000*/ private editconst bool bUseAltMaterial[65537];
    var(*) /*0x496E0000-0x00000000*/ private editconst int NumPlanes[65537];
    var(*) /*0x496E0000-0x00000000*/ private editconst float DistanceNear[65537];
    var(*) /*0x496E0000-0x00000000*/ private editconst float DistanceFar[65537];
    var(*) /*0x496E0000-0x00000000*/ private editconst float TextureScale[65537];
    var(*) /*0x496E0000-0x00000000*/ private editconst float MotionScaleRotation[65537];
    var(*) /*0x496E0000-0x00000000*/ private editconst @NULL MotionScaleTranslation[65537];
    var(*) /*0x496E0000-0x00000000*/ private editconst @NULL TintColor[65537];
    var(*) /*0x496E0000-0x00000000*/ private editconst @NULL Scroll[65537];
    var(*) /*0x496E0000-0x00000000*/ private editconst bool bUseRotation[65537];
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_InterpolationDuration;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_NumPlanes;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Material;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_AltMaterial;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bUseAltMaterial;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DistanceNear;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_DistanceFar;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_TextureScale;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MotionScaleRotation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_MotionScaleTranslation;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_TintColor;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_Scroll;
    var(*) /*0x35EA0000-0x00000000*/ private bool bOverride_bUseRotation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_DistanceNear;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_DistanceFar;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_TextureScale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_MotionScaleRotation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_MotionScaleTranslation;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_TintColor;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Interp_Scroll;

    structdefaultproperties
    {
        bEnabled=false
        InterpolationDuration=1.0000000
        Material=none
        AltMaterial=none
        bUseAltMaterial=false
        NumPlanes=4
        DistanceNear=10.0000000
        DistanceFar=1010.0000000
        TextureScale=1.0000000
        MotionScaleRotation=0.5000000
        MotionScaleTranslation=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        TintColor=(R=255,G=255,B=255,A=255)
        Scroll=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        bUseRotation=true
        bOverride_bEnabled=true
        bOverride_InterpolationDuration=true
        bOverride_NumPlanes=true
        bOverride_Material=true
        bOverride_AltMaterial=true
        bOverride_bUseAltMaterial=true
        bOverride_DistanceNear=true
        bOverride_DistanceFar=true
        bOverride_TextureScale=true
        bOverride_MotionScaleRotation=true
        bOverride_MotionScaleTranslation=true
        bOverride_TintColor=true
        bOverride_Scroll=true
        bOverride_bUseRotation=true
        Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000)
        Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000)
        Interp_TextureScale=(Amount=0.0000000,Blend=1.0000000)
        Interp_MotionScaleRotation=(Amount=0.0000000,Blend=1.0000000)
        Interp_MotionScaleTranslation=(Amount=0.0000000,Blend=1.0000000)
        Interp_TintColor=(Amount=0.0000000,Blend=1.0000000)
        Interp_Scroll=(Amount=0.0000000,Blend=1.0000000)
    }
};

var(*) /*0x496D0000-0x00000000*/ private editconst @NULL Settings[65537];

defaultproperties
{
    Settings=(bEnabled=false,InterpolationDuration=1.0000000,Material=none,AltMaterial=none,bUseAltMaterial=false,NumPlanes=4,DistanceNear=10.0000000,DistanceFar=1010.0000000,TextureScale=1.0000000,MotionScaleRotation=0.5000000,MotionScaleTranslation=(X=1.0000000,Y=1.0000000,Z=1.0000000),TintColor=(R=255,G=255,B=255,A=255),Scroll=(X=0.0000000,Y=0.0000000,Z=0.0000000),bUseRotation=true,bOverride_bEnabled=true,bOverride_InterpolationDuration=true,bOverride_NumPlanes=true,bOverride_Material=true,bOverride_AltMaterial=true,bOverride_bUseAltMaterial=true,bOverride_DistanceNear=true,bOverride_DistanceFar=true,bOverride_TextureScale=true,bOverride_MotionScaleRotation=true,bOverride_MotionScaleTranslation=true,bOverride_TintColor=true,bOverride_Scroll=true,bOverride_bUseRotation=true,Interp_DistanceNear=(Amount=0.0000000,Blend=1.0000000),Interp_DistanceFar=(Amount=0.0000000,Blend=1.0000000),Interp_TextureScale=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleRotation=(Amount=0.0000000,Blend=1.0000000),Interp_MotionScaleTranslation=(Amount=0.0000000,Blend=1.0000000),Interp_TintColor=(Amount=0.0000000,Blend=1.0000000),Interp_Scroll=(Amount=0.0000000,Blend=1.0000000))
}