class Info extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

struct native export transient KeyValuePair
{
    var(*) /*0x2D480000-0x00000010*/ private editfixedsize string Key[65537];
    var(*) /*0x2D480000-0x00000010*/ private editfixedsize string Value[65537];

    structdefaultproperties
    {
        Key=""
        Value=""
    }
};

struct native export transient PlayerResponseLine
{
    var(*) /*0x3D020000-0x00000010*/ private int PlayerNum[65537];
    var(*) /*0x3D020000-0x00000010*/ private int PlayerID[65537];
    var(*) /*0x3D020000-0x00000010*/ private editfixedsize string PlayerName[65537];
    var(*) /*0x3D020000-0x00000010*/ private int Ping[65537];
    var(*) /*0x3D020000-0x00000010*/ private int Score[65537];
    var(*) /*0x3D020000-0x00000010*/ private int StatsID[65537];
    var(*) /*0x3D020000-0x00000010*/ private editfixedsize array PlayerInfo[65537];

    structdefaultproperties
    {
        PlayerNum=0
        PlayerID=0
        PlayerName=""
        Ping=0
        Score=0
        StatsID=0
        PlayerInfo=none
    }
};

struct native export transient ServerResponseLine
{
    var(*) /*0x44DE0000-0x00000010*/ private int ServerID[65537];
    var(*) /*0x44DE0000-0x00000010*/ private editfixedsize string IP[65537];
    var(*) /*0x44DE0000-0x00000010*/ private int Port[65537];
    var(*) /*0x44DE0000-0x00000010*/ private int QueryPort[65537];
    var(*) /*0x44DE0000-0x00000010*/ private editfixedsize string ServerName[65537];
    var(*) /*0x44DE0000-0x00000010*/ private editfixedsize string MapName[65537];
    var(*) /*0x44DE0000-0x00000010*/ private editfixedsize string GameType[65537];
    var(*) /*0x44DE0000-0x00000010*/ private int CurrentPlayers[65537];
    var(*) /*0x44DE0000-0x00000010*/ private int MaxPlayers[65537];
    var(*) /*0x44DE0000-0x00000010*/ private int Ping[65537];
    var(*) /*0x44DE0000-0x00000010*/ private editfixedsize array ServerInfo[65537];
    var(*) /*0x44DE0000-0x00000010*/ private editfixedsize array PlayerInfo[65537];

    structdefaultproperties
    {
        ServerID=0
        IP=""
        Port=0
        QueryPort=0
        ServerName=""
        MapName=""
        GameType=""
        CurrentPlayers=0
        MaxPlayers=0
        Ping=0
        ServerInfo=none
        PlayerInfo=none
    }
};

defaultproperties
{
    Components[0]=none
    bHidden=true
    bSkipActorPropertyReplication=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=10.0000000
}