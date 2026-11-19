class ColorScaleVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display,Collision,Brush,Attachment,Volume);

var(*) /*0x139E0000-0x00000000*/ private @NULL ColorScale[65537];
var(*) /*0x139E0000-0x00000000*/ private float InterpTime[65537];

event @NULL Touch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, P, PC;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    P = Pawn(Other);
    // End:0x105
    if(P != none)
    {
        PC = PlayerController(P.Controller);
        // End:0x105
        if((PC != none) && PC.PlayerCamera != none)
        {
            PC.PlayerCamera.SetDesiredColorScale(ColorScale, InterpTime);
        }
    }
    //return;    
}

event UnTouch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], P, PC, DesiredColorScale;
    local /*0x35EA0000-0x00000000*/ private float DesiredInterpTime;
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL CSV;

    super(Actor).UnTouch(Other);
    P = Pawn(Other);
    // End:0x23A
    if(P != none)
    {
        PC = PlayerController(P.Controller);
        // End:0x23A
        if((PC != none) && PC.PlayerCamera != none)
        {
            DesiredColorScale = WorldInfo.DefaultColorScale;
            DesiredInterpTime = 1.0000000;
            // End:0x1F4
            if(P.Touching.Length > 0)
            {
                Idx = P.Touching.Length;
                J0x129:

                // End:0x1F4 [Loop If]
                if(Idx >= 0)
                {
                    CSV = ColorScaleVolume(P.Touching[Idx]);
                    // End:0x1E6
                    if((CSV != none) && CSV != self)
                    {
                        DesiredColorScale = CSV.ColorScale;
                        DesiredInterpTime = CSV.InterpTime;
                        // [Explicit Break]
                        goto J0x1F4;
                    }
                    --Idx;
                    // [Loop Continue]
                    goto J0x129;
                }
            }
            J0x1F4:

            PC.PlayerCamera.SetDesiredColorScale(DesiredColorScale, DesiredInterpTime);
        }
    }
    //return;    
}

defaultproperties
{
    ColorScale=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    InterpTime=1.0000000
    // Reference: BrushComponent'Default__ColorScaleVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}