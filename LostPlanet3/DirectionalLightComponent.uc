class DirectionalLightComponent extends LightComponent
    editinlinenew
    hidecategories(Object);

var(*) /*0x01B50000-0x00000000*/ private float TraceDistance[65537];
var(*) /*0x11250000-0x00000000*/ private editconst float WholeSceneDynamicShadowRadius[65537];
var(*) /*0x11250000-0x00000000*/ private int NumWholeSceneDynamicShadowCascades[196609];
var(*) /*0x11250000-0x00000000*/ private float CascadeDistributionExponent[196609];
var(*) /*0x2ECC0000-0x00000000*/ private @NULL LightmassSettings[65537];

function OnUpdatePropertyLightColor()
{
    UpdateColorAndBrightness();
    //return;    
}

function OnUpdatePropertyBrightness()
{
    UpdateColorAndBrightness();
    //return;    
}
