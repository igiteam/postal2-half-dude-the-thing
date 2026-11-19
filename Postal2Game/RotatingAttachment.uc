class RotatingAttachment extends Prop;

simulated event Tick(float Delta)
{
	SetRotation(Rotation + RotationRate);
}


// Decompiled with UE Explorer.
defaultproperties
{
    RemoteRole=2
    DrawType=8
    StaticMesh=StaticMesh'Editor.TexPropCube'
    RotationRate=(Pitch=0,Yaw=3000,Roll=0)
}