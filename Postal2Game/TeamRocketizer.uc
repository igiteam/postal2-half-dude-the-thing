class TeamRocketizer extends BoxLauncherProjectile;

///////////////////////////////////////////////////////////////////////////////
simulated function HitWall(vector HitNormal, actor Wall)
{	
	Destroy();
}


// Decompiled with UE Explorer.
defaultproperties
{
    speed=1500.0000000
    Skins[0]=ConstantColor'ConstantBlack'
}