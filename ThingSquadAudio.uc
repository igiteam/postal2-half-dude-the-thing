//=============================================================================
// ThingSquadAudio.uc
//
// The Paranoia Engine - Action / Reaction / NPC State voice system
//
// Initial implementation:
//   - Stores structured voice records.
//   - Selects records by character, NPC state, language and line type.
//   - Supports separate Action and Reaction text/audio.
//   - Prevents immediate repetition where alternatives exist.
//   - Includes a small Blake/EN test catalogue.
//   - Leaves Sound references empty until the project's audio assets are imported.
//
// IMPORTANT:
//   This class is an Actor so it can use the UE2 PlaySound() function.
//   Place/spawn it at the speaking NPC's location (or keep its location
//   synchronized with that NPC) for correct 3D positional audio.
//
// The complete 142-line catalogue remains in ThingSquareAudio.md.
// Add the remaining records through AddVoiceRecord() once the data pipeline
// and final asset naming convention have been agreed.
//
// Target: Postal 2 / Unreal Engine 2 UnrealScript
//=============================================================================

class ThingSquadAudio extends Actor;

//-----------------------------------------------------------------------------
// Data
//-----------------------------------------------------------------------------

struct ThingAudioRecord
{
    var int    RecordID;
    var string CharacterID;
    var string NPCState;
    var string Language;

    var string ActionText;
    var string ReactionText;

    // These are intentionally optional. Text records can be tested before
    // audio assets have been imported and assigned.
    var Sound  ActionSound;
    var Sound  ReactionSound;
};

var array<ThingAudioRecord> VoiceRecords;

var() bool  bLoadSampleRecords;
var() float VoiceVolume;

// The most recently selected record is excluded when another matching
// record exists. This is per ThingSquadAudio instance.
var int LastSelectedRecordID;


//-----------------------------------------------------------------------------
// Lifecycle
//-----------------------------------------------------------------------------

function PostBeginPlay()
{
    Super.PostBeginPlay();

    LastSelectedRecordID = -1;

    if (bLoadSampleRecords)
        LoadSampleRecords();
}


//-----------------------------------------------------------------------------
// Record registration
//-----------------------------------------------------------------------------

function AddVoiceRecord(
    int InRecordID,
    string InCharacterID,
    string InNPCState,
    string InLanguage,
    string InActionText,
    string InReactionText,
    optional Sound InActionSound,
    optional Sound InReactionSound)
{
    local int NewIndex;

    NewIndex = VoiceRecords.Length;
    VoiceRecords.Length = NewIndex + 1;

    VoiceRecords[NewIndex].RecordID     = InRecordID;
    VoiceRecords[NewIndex].CharacterID  = InCharacterID;
    VoiceRecords[NewIndex].NPCState     = InNPCState;
    VoiceRecords[NewIndex].Language     = InLanguage;
    VoiceRecords[NewIndex].ActionText   = InActionText;
    VoiceRecords[NewIndex].ReactionText = InReactionText;
    VoiceRecords[NewIndex].ActionSound  = InActionSound;
    VoiceRecords[NewIndex].ReactionSound = InReactionSound;
}


//-----------------------------------------------------------------------------
// Sample records
//
// This is deliberately a small test set, not the full 142-record catalogue.
// Add the remaining rows after the data format and sound package references
// have been validated in the target Postal 2 build.
//-----------------------------------------------------------------------------

function LoadSampleRecords()
{
    AddVoiceRecord(
        1,
        "Blake",
        "Briefing",
        "EN",
        "Listen up, team. Command's lost all contact with U.S. Outpost #31. No radio, no distress signal—nothing. Last transmission was over 48 hours ago. Our job is simple: establish contact, secure survivors, and figure out what the hell happened out there.",
        "");

    AddVoiceRecord(
        10,
        "Blake",
        "Alert",
        "EN",
        "Drop your weapon!",
        "");

    AddVoiceRecord(
        14,
        "Blake",
        "Confident",
        "EN",
        "Headshot.",
        "");

    AddVoiceRecord(
        28,
        "Blake",
        "Alert",
        "EN",
        "Weapons ready!",
        "Lock and loaded.");

    AddVoiceRecord(
        46,
        "Blake",
        "Neutral",
        "EN",
        "On my six.",
        "Understood.");

    AddVoiceRecord(
        47,
        "Blake",
        "Neutral",
        "EN",
        "Follow me",
        "On your six Captain.");

    AddVoiceRecord(
        83,
        "Weldon",
        "Paranoid",
        "EN",
        "I think I saw something...",
        "It... it's just in my head, right?");

    AddVoiceRecord(
        87,
        "North",
        "Alive",
        "EN",
        "I hear something...",
        "Stay alert, eyes wide. It could be nothing.");

    AddVoiceRecord(
        99,
        "North",
        "Turning Infected",
        "EN",
        "You are all gonna die!",
        "Shit he is one of them!");

    AddVoiceRecord(
        138,
        "Blake",
        "Infected",
        "EN",
        "I'm hit! I'm hit!",
        "It burns... it feels like... it's spreading... inside me...");
}


//-----------------------------------------------------------------------------
// Matching and selection
//-----------------------------------------------------------------------------

function bool RecordMatches(
    int RecordIndex,
    string CharacterID,
    string NPCState,
    string Language,
    bool bReaction)
{
    if (RecordIndex < 0 || RecordIndex >= VoiceRecords.Length)
        return false;

    if (!(VoiceRecords[RecordIndex].CharacterID ~= CharacterID))
        return false;

    if (!(VoiceRecords[RecordIndex].Language ~= Language))
        return false;

    if (NPCState != "")
    {
        if (!(VoiceRecords[RecordIndex].NPCState ~= NPCState))
            return false;
    }

    if (bReaction)
    {
        if (VoiceRecords[RecordIndex].ReactionText == "")
            return false;
    }
    else
    {
        if (VoiceRecords[RecordIndex].ActionText == "")
            return false;
    }

    return true;
}


// Returns a record index, or -1 when no matching record exists.
// Matching is exact for character, language and (when supplied) NPC state.
// State fallback is intentionally not automatic at this stage.
function int SelectRecordIndex(
    string CharacterID,
    string NPCState,
    string Language,
    bool bReaction)
{
    local int i;
    local int MatchCount;
    local int PickNumber;
    local int CandidateCount;
    local bool bExcludeLast;

    // First count all eligible records except the last selected record.
    MatchCount = 0;

    for (i = 0; i < VoiceRecords.Length; i++)
    {
        if (RecordMatches(i, CharacterID, NPCState, Language, bReaction))
        {
            if (VoiceRecords[i].RecordID != LastSelectedRecordID)
                MatchCount++;
        }
    }

    // If there is only one matching line, allow it to play again.
    bExcludeLast = (MatchCount > 0);

    if (!bExcludeLast)
    {
        for (i = 0; i < VoiceRecords.Length; i++)
        {
            if (RecordMatches(i, CharacterID, NPCState, Language, bReaction))
                MatchCount++;
        }
    }

    if (MatchCount <= 0)
        return -1;

    PickNumber = Rand(MatchCount);
    CandidateCount = 0;

    for (i = 0; i < VoiceRecords.Length; i++)
    {
        if (!RecordMatches(i, CharacterID, NPCState, Language, bReaction))
            continue;

        if (bExcludeLast && VoiceRecords[i].RecordID == LastSelectedRecordID)
            continue;

        if (CandidateCount == PickNumber)
        {
            LastSelectedRecordID = VoiceRecords[i].RecordID;
            return i;
        }

        CandidateCount++;
    }

    return -1;
}


//-----------------------------------------------------------------------------
// Text lookup
//
// These functions are useful for subtitles, debugging and validating record
// selection before sound assets are connected.
//-----------------------------------------------------------------------------

function string GetActionText(
    string CharacterID,
    string NPCState,
    string Language)
{
    local int RecordIndex;

    RecordIndex = SelectRecordIndex(
        CharacterID,
        NPCState,
        Language,
        false);

    if (RecordIndex < 0)
        return "";

    return VoiceRecords[RecordIndex].ActionText;
}


function string GetReactionText(
    string CharacterID,
    string NPCState,
    string Language)
{
    local int RecordIndex;

    RecordIndex = SelectRecordIndex(
        CharacterID,
        NPCState,
        Language,
        true);

    if (RecordIndex < 0)
        return "";

    return VoiceRecords[RecordIndex].ReactionText;
}


//-----------------------------------------------------------------------------
// Playback
//
// A successful lookup does not guarantee that a Sound asset is assigned.
// The sample records contain text only, so these functions log the selected
// line and return false until a corresponding sound reference is supplied.
//-----------------------------------------------------------------------------

function bool PlayAction(
    string CharacterID,
    string NPCState,
    string Language,
    optional float Volume)
{
    local int RecordIndex;
    local float UseVolume;

    RecordIndex = SelectRecordIndex(
        CharacterID,
        NPCState,
        Language,
        false);

    if (RecordIndex < 0)
        return false;

    Log("ThingSquadAudio: ACTION [" $ CharacterID $ "] [" $ NPCState $ "] - "
        $ VoiceRecords[RecordIndex].ActionText);

    if (VoiceRecords[RecordIndex].ActionSound == None)
    {
        Log("ThingSquadAudio: No ActionSound assigned for record "
            $ string(VoiceRecords[RecordIndex].RecordID));
        return false;
    }

    UseVolume = VoiceVolume;
    if (Volume > 0.0)
        UseVolume = Volume;

    PlaySound(
        VoiceRecords[RecordIndex].ActionSound,
        SLOT_Talk,
        UseVolume,
        false);

    return true;
}


function bool PlayReaction(
    string CharacterID,
    string NPCState,
    string Language,
    optional float Volume)
{
    local int RecordIndex;
    local float UseVolume;

    RecordIndex = SelectRecordIndex(
        CharacterID,
        NPCState,
        Language,
        true);

    if (RecordIndex < 0)
        return false;

    Log("ThingSquadAudio: REACTION [" $ CharacterID $ "] [" $ NPCState $ "] - "
        $ VoiceRecords[RecordIndex].ReactionText);

    if (VoiceRecords[RecordIndex].ReactionSound == None)
    {
        Log("ThingSquadAudio: No ReactionSound assigned for record "
            $ string(VoiceRecords[RecordIndex].RecordID));
        return false;
    }

    UseVolume = VoiceVolume;
    if (Volume > 0.0)
        UseVolume = Volume;

    PlaySound(
        VoiceRecords[RecordIndex].ReactionSound,
        SLOT_Talk,
        UseVolume,
        false);

    return true;
}


//-----------------------------------------------------------------------------
// Utility
//-----------------------------------------------------------------------------

function int GetVoiceRecordCount()
{
    return VoiceRecords.Length;
}


function ClearVoiceRecords()
{
    VoiceRecords.Length = 0;
    LastSelectedRecordID = -1;
}


//-----------------------------------------------------------------------------
// Defaults
//-----------------------------------------------------------------------------

defaultproperties
{
    bLoadSampleRecords=True
    VoiceVolume=1.0
    LastSelectedRecordID=-1

    bHidden=True
    bNoDelete=False
    RemoteRole=ROLE_None
}
