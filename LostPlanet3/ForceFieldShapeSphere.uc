class ForceFieldShapeSphere extends ForceFieldShape
    editinlinenew;

var(*) /*0x35EA0000-0x00000400*/ private export @NULL Shape[524289];

event GetRadius()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return Shape.SphereRadius;
    //return ReturnValue;    
}

event FillBySphere()
{
    local /*0x35EA0000-0x00000000*/ private float Radius[8388609];

    Shape.SphereRadius = Radius;
    //return;    
}

event FillByBox()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Extent[8388609];

    Shape.SphereRadius = VSize(Extent);
    //return;    
}

event FillByCapsule()
{
    local /*0x35EA0000-0x00000000*/ private float Height[8388609], Radius;

    Shape.SphereRadius = (Height / float(2)) + Radius;
    //return;    
}

event FillByCylinder()
{
    local /*0x35EA0000-0x00000000*/ private float BottomRadius[8388609], TopRadius, Height, HeightOffset, topDistance, bottomDistance,
	    centerBelowTop, centerAboveBottom;

    centerBelowTop = (Height / float(2)) + HeightOffset;
    centerAboveBottom = (Height / float(2)) - HeightOffset;
    topDistance = Sqrt((TopRadius * TopRadius) + (centerBelowTop * centerBelowTop));
    bottomDistance = Sqrt((BottomRadius * BottomRadius) + (centerAboveBottom * centerAboveBottom));
    Shape.SphereRadius = FMax(topDistance, bottomDistance);
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
    // Reference: DrawSphereComponent'Default__ForceFieldShapeSphere.DrawSphere0'
    begin object name=DrawSphere0 class=Class'DrawSphereComponent'
    end object
    Shape=DrawSphere0
}