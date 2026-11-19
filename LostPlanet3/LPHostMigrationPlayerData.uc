class LPHostMigrationPlayerData extends SPHostMigrationPlayerData;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private class PawnClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyThermalPost;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int KillCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int HumanKillCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NonHumanKillCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DeathCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DeathNonHumanCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ReviveCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HealthHarmonized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MP_CreditsEarned;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MP_CreditsEarned_Round;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MP_CreditsEarned_PostRound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PlayerDamageList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPaidBackLastKiller;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWinchRangeExtension;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyAmount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ScrapAmountPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WhiteLeechDNAAmount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PartyOwnerUniqueId;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DesiredNevecPawnClassName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DesiredPiratePawnClassName;

function ResetForNewMatch()
{
    super.ResetForNewMatch();
    MyThermalPost = none;
    KillCount = 0;
    HumanKillCount = 0;
    NonHumanKillCount = 0;
    DeathCount = 0;
    DeathNonHumanCount = 0;
    ReviveCount = 0;
    HealthHarmonized = 0.0000000;
    MP_CreditsEarned = 0;
    MP_CreditsEarned_Round = 0;
    MP_CreditsEarned_PostRound = 0;
    PlayerDamageList.Remove(0, PlayerDamageList.Length);    
    bPaidBackLastKiller = false;
    TEnergyAmount = 0.0000000;
    ScrapAmountPlayer = 0;
    WhiteLeechDNAAmount = 0.0000000;
    //return;    
}

function ReadFromPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI[8388609];
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private @NULL LPPRI;

    LPPRI = LPPRI(PRI);
    // End:0x2D
    if(LPPRI == none)
    {
        return;
    }
    super.ReadFromPRI(LPPRI);
    PawnClass = LPPRI.PawnClass;
    MyThermalPost = LPPRI.MyThermalPost;
    KillCount = LPPRI.KillCount;
    HumanKillCount = LPPRI.HumanKillCount;
    NonHumanKillCount = LPPRI.NonHumanKillCount;
    DeathCount = LPPRI.DeathCount;
    DeathNonHumanCount = LPPRI.DeathNonHumanCount;
    ReviveCount = LPPRI.ReviveCount;
    HealthHarmonized = LPPRI.HealthHarmonized;
    MP_CreditsEarned = LPPRI.MP_CreditsEarned;
    MP_CreditsEarned_Round = LPPRI.MP_CreditsEarned_Round;
    MP_CreditsEarned_PostRound = LPPRI.MP_CreditsEarned_PostRound;
    bPaidBackLastKiller = LPPRI.bPaidBackLastKiller;
    bWinchRangeExtension = LPPRI.bWinchRangeExtension;
    TEnergyAmount = LPPRI.TEnergyAmount;
    ScrapAmountPlayer = LPPRI.ScrapAmountPlayer;
    WhiteLeechDNAAmount = LPPRI.WhiteLeechDNAAmount;
    PartyOwnerUniqueId = LPPRI.PartyOwnerUniqueId;
    DesiredNevecPawnClassName = LPPRI.DesiredNevecPawnClassName;
    DesiredPiratePawnClassName = LPPRI.DesiredPiratePawnClassName;
    Index = 0;
    J0x36F:

    // End:0x3E6 [Loop If]
    if(Index < LPPRI.PlayerDamageList.Length)
    {
        PlayerDamageList[Index] = LPPRI.PlayerDamageList[Index];
        Index++;
        // [Loop Continue]
        goto J0x36F;
    }
    //return;    
}

function WriteToPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI[8388609];
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private @NULL LPPRI;

    LPPRI = LPPRI(PRI);
    // End:0x2D
    if(LPPRI == none)
    {
        return;
    }
    super.WriteToPRI(LPPRI);
    LPPRI.PawnClass = PawnClass;
    LPPRI.MyThermalPost = MyThermalPost;
    LPPRI.KillCount = KillCount;
    LPPRI.HumanKillCount = HumanKillCount;
    LPPRI.NonHumanKillCount = NonHumanKillCount;
    LPPRI.DeathCount = DeathCount;
    LPPRI.DeathNonHumanCount = DeathNonHumanCount;
    LPPRI.ReviveCount = ReviveCount;
    LPPRI.HealthHarmonized = HealthHarmonized;
    LPPRI.MP_CreditsEarned = MP_CreditsEarned;
    LPPRI.MP_CreditsEarned_Round = MP_CreditsEarned_Round;
    LPPRI.MP_CreditsEarned_PostRound = MP_CreditsEarned_PostRound;
    LPPRI.bPaidBackLastKiller = bPaidBackLastKiller;
    LPPRI.bWinchRangeExtension = bWinchRangeExtension;
    LPPRI.TEnergyAmount = TEnergyAmount;
    LPPRI.ScrapAmountPlayer = ScrapAmountPlayer;
    LPPRI.WhiteLeechDNAAmount = WhiteLeechDNAAmount;
    LPPRI.PartyOwnerUniqueId = PartyOwnerUniqueId;
    LPPRI.DesiredNevecPawnClassName = DesiredNevecPawnClassName;
    LPPRI.DesiredPiratePawnClassName = DesiredPiratePawnClassName;
    Index = 0;
    J0x36F:

    // End:0x3D1 [Loop If]
    if(Index < PlayerDamageList.Length)
    {
        LPPRI.PlayerDamageList[Index] = PlayerDamageList[Index];
        Index++;
        // [Loop Continue]
        goto J0x36F;
    }
    //return;    
}
