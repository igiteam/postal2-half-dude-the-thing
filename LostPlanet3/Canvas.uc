class Canvas extends Object
    transient;

enum ECanvasBlendMode
{
    BLEND_CANVAS_Opaque,            // 0
    BLEND_CANVAS_Masked,            // 1
    BLEND_CANVAS_Translucent,       // 2
    BLEND_CANVAS_Additive,          // 3
    BLEND_CANVAS_Modulate,          // 4
    BLEND_CANVAS_ModulateAndAdd,    // 5
    BLEND_CANVAS_SoftMasked,        // 6
    BLEND_CANVAS_AlphaComposite,    // 7
    BLEND_CANVAS_DitheredTranslucent,// 8
    BLEND_CANVAS_AlphaOnly,         // 9
    BLEND_CANVAS_MAX                // 10
};

struct native CanvasIcon
{
    var(*) /*0x110F0000-0x00000000*/ private @NULL Texture[65537];
    var(*) /*0x110F0000-0x00000000*/ private float U[65537];
    var(*) /*0x110F0000-0x00000000*/ private float V[65537];
    var(*) /*0x110F0000-0x00000000*/ private float UL[65537];
    var(*) /*0x110F0000-0x00000000*/ private float VL[65537];

    structdefaultproperties
    {
        Texture=none
        U=0.0000000
        V=0.0000000
        UL=0.0000000
        VL=0.0000000
    }
};

struct native DepthFieldGlowInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bEnableGlow;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL GlowColor;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL GlowOuterRadius;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL GlowInnerRadius;

    structdefaultproperties
    {
        bEnableGlow=false
        GlowColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
        GlowOuterRadius=(X=0.0000000,Y=0.0000000)
        GlowInnerRadius=(X=0.0000000,Y=0.0000000)
    }
};

struct native MobileDistanceFieldParams
{
    var(*) /*0x35EA0000-0x00000000*/ private float Gamma;
    var(*) /*0x35EA0000-0x00000000*/ private float AlphaRefVal;
    var(*) /*0x35EA0000-0x00000000*/ private float SmoothWidth;
    var(*) /*0x35EA0000-0x00000000*/ private bool EnableShadow;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ShadowDirection;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ShadowColor;
    var(*) /*0x35EA0000-0x00000000*/ private float ShadowSmoothWidth;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL GlowInfo[268435457];
    var(*) /*0x35EA0000-0x00000000*/ private int BlendMode;

    structdefaultproperties
    {
        Gamma=0.0000000
        AlphaRefVal=0.0000000
        SmoothWidth=0.0000000
        EnableShadow=false
        ShadowDirection=(X=0.0000000,Y=0.0000000)
        ShadowColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
        ShadowSmoothWidth=0.0000000
        BlendMode=0
    }
};

struct native FontRenderInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bClipText;
    var(*) /*0x35EA0000-0x00000000*/ private bool bEnableShadow;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL GlowInfo;

    structdefaultproperties
    {
        bClipText=false
        bEnableShadow=false
        GlowInfo=(bEnableGlow=false,GlowColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),GlowOuterRadius=(X=0.0000000,Y=0.0000000),GlowInnerRadius=(X=0.0000000,Y=0.0000000))
    }
};

struct native CanvasUVTri
{
    var(*) /*0x11110000-0x00000000*/ private @NULL V0_Pos[65537];
    var(*) /*0x11110000-0x00000000*/ private @NULL V0_UV[65537];
    var(*) /*0x11110000-0x00000000*/ private @NULL V1_Pos[65537];
    var(*) /*0x11110000-0x00000000*/ private @NULL V1_UV[65537];
    var(*) /*0x11110000-0x00000000*/ private @NULL V2_Pos[65537];
    var(*) /*0x11110000-0x00000000*/ private @NULL V2_UV[65537];

    structdefaultproperties
    {
        V0_Pos=(X=0.0000000,Y=0.0000000)
        V0_UV=(X=0.0000000,Y=0.0000000)
        V1_Pos=(X=0.0000000,Y=0.0000000)
        V1_UV=(X=0.0000000,Y=0.0000000)
        V2_Pos=(X=0.0000000,Y=0.0000000)
        V2_UV=(X=0.0000000,Y=0.0000000)
    }
};

struct native transient TextSizingParameters
{
    var(*) /*0x35EA0000-0x00000010*/ private float DrawX;
    var(*) /*0x35EA0000-0x00000010*/ private float DrawY;
    var(*) /*0x35EA0000-0x00000010*/ private float DrawXL;
    var(*) /*0x35EA0000-0x00000010*/ private float DrawYL;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL Scaling;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL DrawFont;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL SpacingAdjust;
    var(*) /*0x35EA0000-0x00000010*/ private float ViewportHeight;

    structdefaultproperties
    {
        DrawX=0.0000000
        DrawY=0.0000000
        DrawXL=0.0000000
        DrawYL=0.0000000
        Scaling=(X=0.0000000,Y=0.0000000)
        DrawFont=none
        SpacingAdjust=(X=0.0000000,Y=0.0000000)
        ViewportHeight=0.0000000
    }
};

struct native transient WrappedStringElement
{
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize string Value;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL LineExtent;

    structdefaultproperties
    {
        Value=""
        LineExtent=(X=0.0000000,Y=0.0000000)
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL Font;
var(*) /*0x35EA0000-0x00000000*/ private float OrgX;
var(*) /*0x35EA0000-0x00000000*/ private float OrgY;
var(*) /*0x35EA0000-0x00000000*/ private float ClipX;
var(*) /*0x35EA0000-0x00000000*/ private float ClipY;
var(*) /*0x35EA0000-0x00000000*/ private float CurX[131073];
var(*) /*0x35EA0000-0x00000000*/ private float CurY[131073];
var(*) /*0x35EA0000-0x00000000*/ private float CurZ[131073];
var(*) /*0x35EA0000-0x00000000*/ private float CurYL;
var(*) /*0x35EA0000-0x00000000*/ private @NULL DrawColor;
var(*) /*0x35EA0000-0x00000000*/ private bool bCenter;
var(*) /*0x35EA0000-0x00000000*/ private bool bNoSmooth;
var(*) /*0x35EA0000-0x00000000*/ private int SizeX[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SizeY[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Canvas[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SceneView[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ColorModulate;
var(*) /*0x35EA0000-0x00000000*/ private @NULL DefaultTexture;

// Export UCanvas::execDrawTile(FFrame&, void* const)
native final function DrawTile()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Tex[8388609];
    local /*0x35EA0000-0x00000000*/ private float XL[8388609], YL, U, V, UL, VL;

    local /*0x35EA0000-0x00000000*/ private @NULL LColor[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ClipTile[9437185];
    local /*0x35EA0000-0x00000000*/ private byte Blend[9437185];


}

// Export UCanvas::execPreOptimizeDrawTiles(FFrame&, void* const)
native final function PreOptimizeDrawTiles()
{
    local /*0x35EA0000-0x00000000*/ private int Num[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Tex[8388609];
    local /*0x35EA0000-0x00000000*/ private byte Blend[9437185];


}

// Export UCanvas::execDrawMaterialTile(FFrame&, void* const)
native final function DrawMaterialTile()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Mat[8388609];
    local /*0x35EA0000-0x00000000*/ private float XL[8388609], YL, U, V, UL, VL;

    local /*0x35EA0000-0x00000000*/ private bool bClipTile[9437185];


}

// Export UCanvas::execDrawRotatedTile(FFrame&, void* const)
native final function DrawRotatedTile()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Tex[8388609], Rotation;
    local /*0x35EA0000-0x00000000*/ private float XL[8388609], YL, U, V, UL, VL,
	    AnchorX, AnchorY;

    0.5000000
    0.5000000                                                
}

// Export UCanvas::execDrawRotatedMaterialTile(FFrame&, void* const)
native final function DrawRotatedMaterialTile()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Mat[8388609], Rotation;
    local /*0x35EA0000-0x00000000*/ private float XL[8388609], YL, U, V, UL, VL,
	    AnchorX, AnchorY;

    0.0000000
    0.0000000
    0.0000000
    0.0000000
    0.5000000
    0.5000000                                                
}

// Export UCanvas::execDrawTimer(FFrame&, void* const)
native final function DrawTimer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Tex[8388609];
    local /*0x35EA0000-0x00000000*/ private float StartTime[8388609], TotalTime, XL, YL, U, V,
	    UL, VL;

    local /*0x35EA0000-0x00000000*/ private @NULL LColor[9437185];
    local /*0x35EA0000-0x00000000*/ private byte Blend[9437185];


}

// Export UCanvas::execDrawTileStretched(FFrame&, void* const)
native final function DrawTileStretched()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Tex[8388609];
    local /*0x35EA0000-0x00000000*/ private float XL[8388609], YL, U, V, UL, VL;

    local /*0x35EA0000-0x00000000*/ private @NULL LColor[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bStretchHorizontally[9437185], bStretchVertically;
    local /*0x35EA0000-0x00000000*/ private float ScalingFactor[9437185];


}

// Export UCanvas::execDrawTris(FFrame&, void* const)
native final function DrawTris()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Tex[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array Triangles[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InColor[8388609];


}

static final function CreateFontRenderInfo()
{
    local /*0x35EA0000-0x00000000*/ private bool bClipText[9437185], bEnableShadow;
    local /*0x35EA0000-0x00000000*/ private @NULL GlowColor[9437185], GlowOuterRadius, GlowInnerRadius, ReturnValue, Result;

    Result.bClipText = bClipText;
    Result.bEnableShadow = bEnableShadow;
    Result.GlowInfo.bEnableGlow = GlowColor.A != 0.0000000;
    // End:0x14E
    if(Result.GlowInfo.bEnableGlow)
    {
        Result.GlowInfo.GlowOuterRadius = GlowOuterRadius;
        Result.GlowInfo.GlowInnerRadius = GlowInnerRadius;
    }
    return Result;
    //return ReturnValue;    
}

// Export UCanvas::execStrLen(FFrame&, void* const)
native final function StrLen()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string String[142606337];
    local /*0x35EA0000-0x00000000*/ private float XL[25165825], YL;


}

// Export UCanvas::execTextSize(FFrame&, void* const)
native final function TextSize()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string String[142606337];
    local /*0x35EA0000-0x00000000*/ private float XL[25165825], YL, XScale, YScale;

    1.0000000
    1.0000000                            
}

// Export UCanvas::execDrawText(FFrame&, void* const)
native final function DrawText()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Text[142606337];
    local /*0x35EA0000-0x00000000*/ private bool CR[9437185];
    local /*0x35EA0000-0x00000000*/ private float XScale[9437185], YScale;
    local /*0x35EA0000-0x00000000*/ private @NULL RenderInfo[26345473];

    true
    1.0000000
    1.0000000                                
}

// Export UCanvas::execProject(FFrame&, void* const)
native final function Project()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Location[8388609], ReturnValue;


}

// Export UCanvas::execDeProject(FFrame&, void* const)
native final function DeProject()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ScreenPos[8388609], WorldOrigin, WorldDirection;


}

// Export UCanvas::execPushTranslationMatrix(FFrame&, void* const)
native final function PushTranslationMatrix()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TranslationVector[8388609];


}

// Export UCanvas::execPopTransform(FFrame&, void* const)
native final function PopTransform();

event Reset()
{
    local /*0x35EA0000-0x00000000*/ private bool bKeepOrigin[9437185];

    Font = GetDefaultCanvasFont();
    // End:0x4A
    if(!bKeepOrigin)
    {
        OrgX = default.OrgX;
        OrgY = default.OrgY;
    }
    SetPos(default.CurX, default.CurY);
    DrawColor = default.DrawColor;
    CurYL = default.CurYL;
    bCenter = false;
    bNoSmooth = false;
    //return;    
}

function GetDefaultCanvasFont()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Class'Engine'.static.GetSmallFont();
    //return ReturnValue;    
}

// Export UCanvas::execSetPos(FFrame&, void* const)
native final function SetPos()
{
    local /*0x35EA0000-0x00000000*/ private float PosX[8388609], PosY, PosZ;

    0.0000000                    
}

final function SetOrigin()
{
    local /*0x35EA0000-0x00000000*/ private float X[8388609], Y;

    OrgX = X;
    OrgY = Y;
    //return;    
}

final function SetClip()
{
    local /*0x35EA0000-0x00000000*/ private float X[8388609], Y;

    ClipX = X;
    ClipY = Y;
    //return;    
}

// Export UCanvas::execPushMaskRegion(FFrame&, void* const)
native final function PushMaskRegion()
{
    local /*0x35EA0000-0x00000000*/ private float X[8388609], Y, XL, YL;


}

// Export UCanvas::execPopMaskRegion(FFrame&, void* const)
native final function PopMaskRegion();

final function DrawTexture()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Tex[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];

    // End:0xC1
    if(Tex != none)
    {
        DrawTile(Tex, Tex.GetSurfaceWidth() * Scale, Tex.GetSurfaceHeight() * Scale, 0.0000000, 0.0000000, Tex.GetSurfaceWidth(), Tex.GetSurfaceHeight());
    }
    //return;    
}

// Export UCanvas::execDrawBlendedTile(FFrame&, void* const)
native final function DrawBlendedTile()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Tex[8388609];
    local /*0x35EA0000-0x00000000*/ private float XL[8388609], YL, U, V, UL, VL;

    local /*0x35EA0000-0x00000000*/ private byte Blend[8388609];


}

final function MakeIcon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Texture[8388609];
    local /*0x35EA0000-0x00000000*/ private float U[9437185], V, UL, VL;
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Icon;

    // End:0x139
    if(Texture != none)
    {
        Icon.Texture = Texture;
        Icon.U = U;
        Icon.V = V;
        Icon.UL = ((UL != 0.0000000) ? UL : Texture.GetSurfaceWidth());
        Icon.VL = ((VL != 0.0000000) ? VL : Texture.GetSurfaceHeight());
    }
    return Icon;
    //return ReturnValue;    
}

final function DrawScaledIcon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Icon[8388609];
    local /*0x35EA0000-0x00000000*/ private float X[8388609], Y;
    local /*0x35EA0000-0x00000000*/ private @NULL Scale[8388609];

    // End:0x293
    if(Icon.Texture != none)
    {
        // End:0x7B
        if(VSize(Scale) <= 0.0000000)
        {
            Scale.X = 1.0000000;
            Scale.Y = 1.0000000;
        }
        // End:0xF0
        if(Icon.UL == 0.0000000)
        {
            Icon.UL = Icon.Texture.GetSurfaceWidth();
        }
        // End:0x165
        if(Icon.VL == 0.0000000)
        {
            Icon.VL = Icon.Texture.GetSurfaceHeight();
        }
        SetPos(CurX, CurY);
        DrawTile(Icon.Texture, Abs(Icon.UL) * Scale.X, Abs(Icon.VL) * Scale.Y, Icon.U, Icon.V, Icon.UL, Icon.VL);
    }
    //return;    
}

final function DrawIcon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Icon[8388609];
    local /*0x35EA0000-0x00000000*/ private float X[8388609], Y, Scale;

    // End:0x237
    if(Icon.Texture != none)
    {
        // End:0x45
        if(Scale <= 0.0000000)
        {
            Scale = 1.0000000;
        }
        // End:0xBA
        if(Icon.UL == 0.0000000)
        {
            Icon.UL = Icon.Texture.GetSurfaceWidth();
        }
        // End:0x12F
        if(Icon.VL == 0.0000000)
        {
            Icon.VL = Icon.Texture.GetSurfaceHeight();
        }
        SetPos(X, Y);
        DrawTile(Icon.Texture, Abs(Icon.UL) * Scale, Abs(Icon.VL) * Scale, Icon.U, Icon.V, Icon.UL, Icon.VL);
    }
    //return;    
}

final function DrawRect()
{
    local /*0x35EA0000-0x00000000*/ private float RectX[8388609], RectY;
    local /*0x35EA0000-0x00000000*/ private @NULL Tex[9437185];

    DefaultTexture
    DrawTile(Tex, RectX, RectY, 0.0000000, 0.0000000, Tex.GetSurfaceWidth(), Tex.GetSurfaceHeight());
    //return;    
}

final simulated function DrawBox()
{
    local /*0x35EA0000-0x00000000*/ private float Width[8388609], Height;
    local /*0x35EA0000-0x00000000*/ private int X, Y;

    X = int(CurX);
    Y = int(CurY);
    SetPos(float(X), float(Y));
    DrawRect(2.0000000, Height);
    SetPos((float(X) + Width) - float(2), float(Y));
    DrawRect(2.0000000, Height);
    SetPos(float(X + 2), float(Y));
    DrawRect(Width - float(4), 2.0000000);
    SetPos(float(X + 2), (float(Y) + Height) - float(2));
    DrawRect(Width - float(4), 2.0000000);
    SetPos(float(X), float(Y));
    //return;    
}

// Export UCanvas::execSetDrawColor(FFrame&, void* const)
native final function SetDrawColor()
{
    local /*0x35EA0000-0x00000000*/ private byte R[8388609], G, B, A;

    255                        
}

final function SetDrawColorStruct()
{
    local /*0x35EA0000-0x00000000*/ private @NULL C[8388609];

    SetDrawColor(C.R, C.G, C.B, C.A);
    //return;    
}

// Export UCanvas::execDraw2DLine(FFrame&, void* const)
native final function Draw2DLine()
{
    local /*0x35EA0000-0x00000000*/ private float X1[8388609], Y1, X2, Y2;
    local /*0x35EA0000-0x00000000*/ private @NULL LineColor[8388609];


}

// Export UCanvas::execDrawTextureLine(FFrame&, void* const)
native final function DrawTextureLine()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StartPoint[8388609], EndPoint;
    local /*0x35EA0000-0x00000000*/ private float Perc[8388609], Width;
    local /*0x35EA0000-0x00000000*/ private @NULL LineColor[8388609], LineTexture;
    local /*0x35EA0000-0x00000000*/ private float U[8388609], V, UL, VL;


}

// Export UCanvas::execDrawTextureDoubleLine(FFrame&, void* const)
native final function DrawTextureDoubleLine()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StartPoint[8388609], EndPoint;
    local /*0x35EA0000-0x00000000*/ private float Perc[8388609], Spacing, Width;
    local /*0x35EA0000-0x00000000*/ private @NULL LineColor[8388609], AltLineColor, Tex;
    local /*0x35EA0000-0x00000000*/ private float U[8388609], V, UL, VL;


}

function DrawDebugGraph()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Title[142606337];
    local /*0x35EA0000-0x00000000*/ private float ValueX[8388609], ValueY, UL_X, UL_Y, W, H;

    local /*0x35EA0000-0x00000000*/ private @NULL RangeX[8388609], RangeY;
    local /*0x35EA0000-0x00000000*/ private int X, Y;

    SetDrawColor(255, 255, 255, 255);
    SetPos(UL_X, UL_Y);
    DrawBox(W, H);
    SetDrawColor(255, 255, 0, 255);
    X = int((UL_X + (GetRangePctByValue(RangeX, ValueX) * W)) - float(8 / 2));
    Y = int((UL_Y + (GetRangePctByValue(RangeY, ValueY) * H)) - float(8 / 2));
    SetPos(float(X), float(Y));
    DrawRect(8.0000000, 8.0000000);
    SetDrawColor(128, 128, 0, 128);
    Draw2DLine(UL_X, float(Y), UL_X + W, float(Y), DrawColor);
    Draw2DLine(float(X), UL_Y, float(X), UL_Y + H, DrawColor);
    SetDrawColor(255, 255, 0, 255);
    SetPos(float(X), (UL_Y + H) + float(16));
    DrawText(string(ValueX));
    SetPos((UL_X + W) + float(8), float(Y));
    DrawText(string(ValueY));
    // End:0x2AF
    if(Title != "")
    {
        SetPos(UL_X, UL_Y - float(16));
        DrawText(Title);
    }
    //return;    
}

defaultproperties
{
    DrawColor=(R=127,G=127,B=127,A=255)
    ColorModulate=(W=1.0000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
    DefaultTexture=Texture2D'EngineResources.WhiteSquareTexture'
}