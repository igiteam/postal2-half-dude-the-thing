class SPCameraFrameData extends Object
    hidecategories(Object);

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL PreviousVT;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CurrentVT;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL IdealVT;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL DesiredVT;

function Init()
{
    IdealVT = new (self) Class'SPCameraRigOffset';
    CurrentVT = new (self) Class'SPCameraRigOffset';
    PreviousVT = new (self) Class'SPCameraRigOffset';
    DesiredVT = new (self) Class'SPCameraRigOffset';
    //return;    
}

function InitVT()
{
    local /*0x043A0000-0x00000000*/ private @NULL InVT[25296897];

    DesiredVT.ConvertFromTViewTarget(InVT);
    PreviousVT.CopyFrom(DesiredVT);
    CurrentVT.CopyFrom(DesiredVT);
    IdealVT.CopyFrom(DesiredVT);
    //return;    
}

function NextFrame()
{
    PreviousVT.CopyFrom(CurrentVT);
    CurrentVT.CopyFrom(IdealVT);
    //return;    
}

function Resync()
{
    IdealVT.Reset();
    CurrentVT.CopyFrom(IdealVT);
    PreviousVT.CopyFrom(IdealVT);
    //return;    
}

simulated function CheckValid()
{
    //return;    
}

simulated function DisplayDebug()
{
    local /*0x043A0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x043A0000-0x00000000*/ private float out_YL[25165825], out_YPos;

    HUD.Canvas.SetDrawColor(224, 224, 96);
    HUD.Canvas.SetPos(12.0000000, out_YPos);
    HUD.Canvas.DrawText("      IdealVT" @ IdealVT.ToString(), true);
    HUD.Canvas.SetDrawColor(255, 172, 96);
    out_YPos = HUD.Canvas.CurY;
    //return;    
}
