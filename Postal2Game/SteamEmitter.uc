///////////////////////////////////////////////////////////////////////////////
// SteamEmitter. 
//
// For putting out fires.
///////////////////////////////////////////////////////////////////////////////
class SteamEmitter extends TimedEmitter;

var Sound SteamSound;


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
auto state Steaming
{
Begin:
	PlaySound(SteamSound,,1.0,,1.0);
	Sleep(GetSoundDuration(SteamSound));
	Goto('Begin');
}


// Decompiled with UE Explorer.
defaultproperties
{
    SteamSound=Sound'WeaponSounds.steam_loop'
    PlayTime=2.0000000
    FinishUpTime=1.5000000
    Emitters[0]=SuperSpriteEmitter'SuperSpriteEmitter11'
    AutoDestroy=true
}