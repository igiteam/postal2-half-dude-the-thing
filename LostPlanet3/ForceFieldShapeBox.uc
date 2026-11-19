class ForceFieldShapeBox extends ForceFieldShape
    editinlinenew;

var(*) /*0x35EA0000-0x00000400*/ private export @NULL Shape[524289];

event GetRadii()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Shape.BoxExtent;
    //return ReturnValue;    
}

event FillBySphere()
{
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];

    Shape.BoxExtent.X = Radius;
    Shape.BoxExtent.Y = Radius;
    Shape.BoxExtent.Z = Radius;
    //return;    
}

event FillByBox()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Extent[8388609];

    Shape.BoxExtent = Extent;
    //return;    
}

event FillByCapsule()
{
    local /*0x35EA0000-0x00000000*/ private float Height[8388609], Radius;

    Shape.BoxExtent.X = Radius;
    Shape.BoxExtent.Y = Radius;
    Shape.BoxExtent.Z = Radius + (Height / float(2));
    //return;    
}

event FillByCylinder()
{
    local /*0x35EA0000-0x00000000*/ private float BottomRadius[8388609], TopRadius, Height, HeightOffset;

    Shape.BoxExtent.X = FMax(BottomRadius, TopRadius);
    Shape.BoxExtent.Y = Shape.BoxExtent.X;
    Shape.BoxExtent.Z = (Height / float(2)) + Abs(HeightOffset);
    //return;    
}

event @NULL GetDrawComponent()
{
    local /*0x35EA0000-0x00000400*/ private @NULL ReturnValue[92274689];

    return Shape;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: DrawBoxComponent'Default__ForceFieldShapeBox.DrawBox0'
    begin object name=DrawBox0 class=Class'DrawBoxComponent'
    end object
    Shape=DrawBox0
}