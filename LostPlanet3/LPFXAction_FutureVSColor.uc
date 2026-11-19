class LPFXAction_FutureVSColor extends LPFXActionBase;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NeutralColor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InteriorShaderMaterialInstanceIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ExteriorShaderMaterialInstanceIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InteriorShaderMaterialInstanceConst;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExteriorShaderMaterialInstanceConst;

// Export ULPFXAction_FutureVSColor::execShutDown(FFrame&, void* const)
native event ShutDown();

function Init()
{
    super(SPFXActionBase).Init();
    MyVSPawn = LPBaseVSPlayerPawn(FXActionManager().Owner);
    // End:0x4D
    if(MyVSPawn == none)
    {
        return;
    }
    InitMaterials();
    NeutralColor = LPTuneDataVSFuturePlayerPawn(LPVSFuturePlayerPawn(MyVSPawn).TuneDataVSPlayerPawn).NeutralColor;
    SetColor(NeutralColor);
    //return;    
}

function @NULL InitMaterials()
{
    local /*0x97E50000-0x00000400*/ private @NULL Mesh, TD;

    Mesh = MyVSPawn.Mesh;
    TD = LPTuneDataVSFuturePlayerPawn(LPVSFuturePlayerPawn(MyVSPawn).TuneDataVSPlayerPawn);
    // End:0x1D1
    if(TD != none)
    {
        // End:0x146
        if(ExteriorShaderMaterialInstanceConst == none)
        {
            ExteriorShaderMaterialInstanceIndex = GetMaterialIndex(Mesh, TD.TeamColorEmissiveMaterialExterior);
            // End:0x146
            if(ExteriorShaderMaterialInstanceIndex >= 0)
            {
                ExteriorShaderMaterialInstanceConst = MaterialInstanceConstant(Mesh.GetMaterial(ExteriorShaderMaterialInstanceIndex));
                // End:0x146
                if(ExteriorShaderMaterialInstanceConst == none)
                {
                    ExteriorShaderMaterialInstanceConst = Mesh.CreateAndSetMaterialInstanceConstant(ExteriorShaderMaterialInstanceIndex);
                }
            }
        }
        // End:0x1D1
        if(InteriorShaderMaterialInstanceConst == none)
        {
            InteriorShaderMaterialInstanceIndex = GetMaterialIndex(Mesh, TD.TeamColorEmissiveMaterialInterior);
            // End:0x1D1
            if(InteriorShaderMaterialInstanceIndex >= 0)
            {
                InteriorShaderMaterialInstanceConst = Mesh.CreateAndSetMaterialInstanceConstant(InteriorShaderMaterialInstanceIndex);
            }
        }
    }
    //return;    
}

function @NULL GetMaterialIndex()
{
    local /*0x97E50000-0x00000400*/ private @NULL Mesh[8388609], MI;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL M;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x26
    if((Mesh == none) || MI == none)
    {
        return -1;
    }
    // End:0x92
    foreach Mesh.SkeletalMesh.Materials(M, I)
    {
        // End:0x91
        if(M == MI)
        {            
            return I;
        }        
    }    
    return -1;
    //return ReturnValue;    
}

function GetTeamColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609], ReturnValue, Col;
    local /*0x97E50000-0x00000000*/ private int Team;
    local /*0x97E50000-0x00000000*/ private @NULL LCol;

    // End:0x21
    if(C == none)
    {
        Team = -1;        
    }
    else
    {
        Team = int(C.GetTeamNum());
    }
    // End:0x82
    if((Team < 0) || Team > 1)
    {
        LCol = NeutralColor;        
    }
    else
    {
        Col = Class'LPGameMP_Base'.static.GetTeamColor(Team);
        LCol.R = float(Col.R) / float(255);
        LCol.G = float(Col.G) / float(255);
        LCol.B = float(Col.B) / float(255);
        LCol.A = NeutralColor.A;
    }
    return LCol;
    //return ReturnValue;    
}

function SetColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Col[8388609];

    // End:0x40
    if(ExteriorShaderMaterialInstanceConst != none)
    {
        ExteriorShaderMaterialInstanceConst.SetVectorParameterValue('TeamColor', Col);
    }
    // End:0x80
    if(InteriorShaderMaterialInstanceConst != none)
    {
        InteriorShaderMaterialInstanceConst.SetVectorParameterValue('TeamColor', Col);
    }
    //return;    
}

defaultproperties
{
    NeutralColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
    InteriorShaderMaterialInstanceIndex=-1
    ExteriorShaderMaterialInstanceIndex=-1
}