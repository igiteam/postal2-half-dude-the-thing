class ForceFieldShape extends Object
    abstract
    editinlinenew;

event FillBySphere()
{
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];

    //return;    
}

event FillByBox()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Dimension[8388609];

    //return;    
}

event FillByCapsule()
{
    local /*0x35EA0000-0x00000000*/ private float Height[8388609], Radius;

    //return;    
}

event FillByCylinder()
{
    local /*0x35EA0000-0x00000000*/ private float BottomRadius[8388609], TopRadius, Height, HeightOffset;

    //return;    
}

event @NULL GetDrawComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}
