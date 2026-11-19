class SPDLightActor extends PointLight
    abstract
    hidecategories(AnimDependency,Navigation);

var(__OnDestroyed__Delegate) /*0x029D0000-0x00000000*/ private float FadeDownTime[65537];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float FadeDownEndTime[536870913];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000400*/ private export @NULL PointLight[524289];

function SetBrightness()
{
    local /*0x01C00000-0x00000000*/ private float Brightness[8388609];

    PointLight.SetLightProperties(Brightness, PointLight.LightColor, PointLight.Function);
    //return;    
}

function SetRadius()
{
    local /*0x01C00000-0x00000000*/ private float Radius[8388609];

    PointLight.Radius = Radius;
    //return;    
}

function SetColor()
{
    local /*0x01C00000-0x00000000*/ private @NULL LightColor[8388609];

    PointLight.SetLightProperties(PointLight.Brightness, LightColor, PointLight.Function);
    //return;    
}

function GetBrightness()
{
    local /*0x01C00000-0x00000000*/ private float ReturnValue[92274689];

    return PointLight.Brightness;
    //return ReturnValue;    
}

function GetRadius()
{
    local /*0x01C00000-0x00000000*/ private float ReturnValue[92274689];

    return PointLight.Radius;
    //return ReturnValue;    
}

function GetColor()
{
    local /*0x01C00000-0x00000000*/ private @NULL ReturnValue[92274689];

    return PointLight.LightColor;
    //return ReturnValue;    
}

auto simulated state Waiting
{Begin:

    Sleep(0.0000000);
    // End:0x29
    if(FadeDownTime > 0.0000000)
    {
        GotoState('StateFadeDown');
    }
    stop;            
}

simulated state StateFadeDown
{
    simulated function BeginState()
    {
        local /*0x01C00000-0x00000000*/ private name PreviousStateName[8388609];

        FadeDownEndTime = WorldInfo.TimeSeconds + FadeDownTime;
        SetTimer(0.0160000, true, 'FadeDownLight');
        //return;        
    }

    simulated function FadeDownLight()
    {
        local /*0x01C00000-0x00000000*/ private float Brightness;

        // End:0x19F
        if(PointLight != none)
        {
            Brightness = PointLight.Brightness;
            // End:0x108
            if(WorldInfo.TimeSeconds < FadeDownEndTime)
            {
                Brightness = (FadeDownEndTime - WorldInfo.TimeSeconds) / FadeDownTime;
                PointLight.SetLightProperties(Brightness, PointLight.LightColor, PointLight.Function);                
            }
            else
            {
                PointLight.SetLightProperties(0.0000000, PointLight.LightColor, PointLight.Function);
                PointLight.SetEnabled(false);
                ClearTimer('FadeDownLight');
                Destroy();
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: PointLightComponent'Default__SPDLightActor.PointLightComponent0'
    begin object name=PointLightComponent0
    end object
    PointLight=PointLightComponent0
    LightComponent=PointLightComponent0
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=PointLightComponent0
    bStatic=false
    bNoDelete=false
}