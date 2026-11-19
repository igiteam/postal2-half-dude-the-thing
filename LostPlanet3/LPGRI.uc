class LPGRI extends SPGFGRI
    abstract
    nativereplication
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

struct native DLCClassInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ClassName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RequiredDLCs;

    structdefaultproperties
    {
        ClassName="NotYetReplicated!"
        RequiredDLCs=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReplicatePirateSkins;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bServerPirateSkinsInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReplicateNevicSkins;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bServerNevecSkinsSkinsInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize travel DLCClassInfo ServerPirateSkins[2097167];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize travel @NULL ServerNevecSkins[2097167];

// Export ULPGRI::execIsPlayerEnemy(FFrame&, void* const)
native simulated function IsPlayerEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Player[8388609], TargetPawn;
    local /*0x97E50000-0x00000000*/ private bool bIgnoreHealth[9437185], ReturnValue;


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;

    switch(VarName)
    {
        // End:0xA1
        case 'ServerPirateSkins':
            bServerPirateSkinsInitialized = true;
            Idx = 0;
            J0x36:

            // End:0x9E [Loop If]
            if(Idx < 15)
            {
                // End:0x90
                if(ServerPirateSkins[Idx].ClassName ~= "NotYetReplicated!")
                {
                    bServerPirateSkinsInitialized = false;
                }
                ++Idx;
                // [Loop Continue]
                goto J0x36;
            }
            // End:0x148
            break;
        // End:0x12F
        case 'ServerNevecSkins':
            bServerNevecSkinsSkinsInitialized = true;
            Idx = 0;
            J0xC4:

            // End:0x12C [Loop If]
            if(Idx < 15)
            {
                // End:0x11E
                if(ServerNevecSkins[Idx].ClassName ~= "NotYetReplicated!")
                {
                    bServerNevecSkinsSkinsInitialized = false;
                }
                ++Idx;
                // [Loop Continue]
                goto J0xC4;
            }
            // End:0x148
            break;
        // End:0xFFFF
        default:
            super(SPGRI).ReplicatedEvent(VarName);
            // End:0x148
            break;
            break;
    }
    //return;    
}

simulated function InitServerDLCInfos()
{
    local /*0x97E50000-0x00000000*/ private int Idx, Num;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL DLCClassInfoDefault, DLCMan;

    DLCMan = LPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
    DLCClassInfoDefault.ClassName = "";
    Idx = 0;
    J0x5C:

    // End:0x97 [Loop If]
    if(Idx < 15)
    {
        ServerPirateSkins[Idx] = DLCClassInfoDefault;
        ++Idx;
        // [Loop Continue]
        goto J0x5C;
    }
    // End:0xE9
    if(Class'LPGFxPreGameLobbySettings'.default.PirateSkins.Length < 15)
    {
        Num = Class'LPGFxPreGameLobbySettings'.default.PirateSkins.Length;        
    }
    else
    {
        Num = 15;
    }
    Idx = 0;
    J0x100:

    // End:0x1F3 [Loop If]
    if(Idx < Num)
    {
        ServerPirateSkins[Idx].ClassName = Class'LPGFxPreGameLobbySettings'.default.PirateSkins[Idx].ClassName;
        ServerPirateSkins[Idx].RequiredDLCs = DLCMan.GetRequiredDLCIdForCharacterName(ServerPirateSkins[Idx].ClassName);
        ++Idx;
        // [Loop Continue]
        goto J0x100;
    }
    bReplicatePirateSkins = true;
    bServerPirateSkinsInitialized = true;
    Idx = 0;
    J0x216:

    // End:0x251 [Loop If]
    if(Idx < 15)
    {
        ServerNevecSkins[Idx] = DLCClassInfoDefault;
        ++Idx;
        // [Loop Continue]
        goto J0x216;
    }
    // End:0x2A3
    if(Class'LPGFxPreGameLobbySettings'.default.NevecSkins.Length < 15)
    {
        Num = Class'LPGFxPreGameLobbySettings'.default.NevecSkins.Length;        
    }
    else
    {
        Num = 15;
    }
    Idx = 0;
    J0x2BA:

    // End:0x3AD [Loop If]
    if(Idx < Num)
    {
        ServerNevecSkins[Idx].ClassName = Class'LPGFxPreGameLobbySettings'.default.NevecSkins[Idx].ClassName;
        ServerNevecSkins[Idx].RequiredDLCs = DLCMan.GetRequiredDLCIdForCharacterName(ServerNevecSkins[Idx].ClassName);
        ++Idx;
        // [Loop Continue]
        goto J0x2BA;
    }
    bReplicateNevicSkins = true;
    bServerNevecSkinsSkinsInitialized = true;
    //return;    
}

simulated function GetSkinDLClassInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InSkinClassName[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL OutDLCClassInfo[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x7C [Loop If]
    if(Idx < 15)
    {
        // End:0x6E
        if(ServerPirateSkins[Idx].ClassName ~= InSkinClassName)
        {
            OutDLCClassInfo = ServerPirateSkins[Idx];
            return true;
        }
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    Idx = 0;
    J0x87:

    // End:0xF8 [Loop If]
    if(Idx < 15)
    {
        // End:0xEA
        if(ServerNevecSkins[Idx].ClassName ~= InSkinClassName)
        {
            OutDLCClassInfo = ServerNevecSkins[Idx];
            return true;
        }
        ++Idx;
        // [Loop Continue]
        goto J0x87;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    ServerPirateSkins[0]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[1]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[2]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[3]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[4]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[5]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[6]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[7]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[8]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[9]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[10]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[11]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[12]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[13]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerPirateSkins[14]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[0]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[1]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[2]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[3]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[4]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[5]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[6]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[7]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[8]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[9]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[10]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[11]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[12]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[13]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerNevecSkins[14]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
}