class ForceFieldShapeCapsule extends ForceFieldShape
    editinlinenew;

var(*) /*0x35EA0000-0x00000400*/ private export @NULL Shape[524289];

event GetHeight()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return Shape.CapsuleHeight;
    //return ReturnValue;    
}

event GetRadius()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return Shape.CapsuleRadius;
    //return ReturnValue;    
}

event FillBySphere()
{
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];

    Shape.CapsuleRadius = Radius;
    Shape.CapsuleHeight = 0.0000000;
    //return;    
}

event FillByBox()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Extent[8388609];

    Shape.CapsuleRadius = Sqrt((Extent.X * Extent.X) + (Extent.Y * Extent.Y));
    Shape.CapsuleHeight = Extent.Z * float(2);
    //return;    
}

event FillByCapsule()
{
    local /*0x35EA0000-0x00000000*/ private float Height[8388609], Radius;

    Shape.CapsuleHeight = Height;
    Shape.CapsuleRadius = Radius;
    //return;    
}

event FillByCylinder()
{
    local /*0x35EA0000-0x00000000*/ private float BottomRadius[8388609], TopRadius, Height, HeightOffset;

    Shape.CapsuleRadius = FMax(BottomRadius, TopRadius);
    Shape.CapsuleHeight = Height;
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
    // Reference: DrawCapsuleComponent'Default__ForceFieldShapeCapsule.DrawCapsule0'
    begin object name=DrawCapsule0 class=Class'DrawCapsuleComponent'
    end object
    Shape=DrawCapsule0
}