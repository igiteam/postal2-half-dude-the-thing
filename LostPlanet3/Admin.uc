class Admin extends PlayerController
    config(Game)
    notplaceable
    hidecategories(AnimDependency,Navigation);

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    AddCheats();
    //return;    
}

exec function Admin()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string CommandLine[8388609];

    ServerAdmin(CommandLine);
    //return;    
}

reliable server function ServerAdmin()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string CommandLine[8388609], Result;

    Result = ConsoleCommand(CommandLine);
    // End:0x43
    if(Result != "")
    {
        ClientMessage(Result);
    }
    //return;    
}

exec function KickBan()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[8388609];

    ServerKickBan(S);
    //return;    
}

reliable server function ServerKickBan()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[8388609];

    WorldInfo.Game.KickBan(S);
    //return;    
}

exec function Kick()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[8388609];

    ServerKick(S);
    //return;    
}

reliable server function ServerKick()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string S[8388609];

    WorldInfo.Game.Kick(S);
    //return;    
}

exec function PlayerList()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PRI;

    // End:0x1A
    foreach DynamicActors(Class'PlayerReplicationInfo', PRI)
    {        
    }    
    //return;    
}

exec function RestartMap()
{
    ServerRestartMap();
    //return;    
}

reliable server function ServerRestartMap()
{
    ClientTravel("?restart", 2);
    //return;    
}

exec function Switch()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];

    ServerSwitch(URL);
    //return;    
}

reliable server function ServerSwitch()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];

    WorldInfo.ServerTravel(URL);
    //return;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__Admin.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}