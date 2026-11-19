class SPCameraAttractor extends Actor
    abstract
    placeable
    hidecategories(AnimDependency,Navigation);

var(__Filter1__Delegate) /*0x05470000-0x00000400*/ private const export @NULL CylinderComponent[720897];
var(__Filter1__Delegate) /*0x05470000-0x00000000*/ private bool bEnabled[65537];
var(__Filter1__Delegate) /*0x05470000-0x00000000*/ private float MinDistance[65537];
var(__Filter1__Delegate) /*0x05470000-0x00000000*/ private float MaxDistance[65537];
var(__Filter1__Delegate) /*0x05470000-0x00000000*/ private float MinFOVDegrees[65537];

// Export USPCameraAttractor::execFindCameraAttractors(FFrame&, void* const)
native static simulated function FindCameraAttractors()
{
    local /*0x043A0000-0x00000000*/ private @NULL CameraPosition[8388609], Extent;
    local /*0x043A0000-0x00000000*/ private editfixedsize array Results[25165825];


}

simulated event @NULL PostBeginPlay()
{
    local /*0x043A0000-0x00000400*/ private @NULL ASpriteComp;

    // End:0x33
    foreach ComponentList(Class'Engine.SpriteComponent', ASpriteComp)
    {
        DetachComponent(ASpriteComp);        
    }    
    super.PostBeginPlay();
    //return;    
}

simulated function OnToggle()
{
    local /*0x043A0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__SPCameraAttractor.BoundCylinder'
    begin object name=BoundCylinder class=Class'Engine.CylinderComponent'
    end object
    CylinderComponent=BoundCylinder
    bEnabled=true
    MinDistance=50.0000000
    MaxDistance=1500.0000000
    MinFOVDegrees=40.0000000
    Components[0]=none
    Components[1]=BoundCylinder
    bHidden=true
    bNoDelete=true
    bCollideActors=true
}