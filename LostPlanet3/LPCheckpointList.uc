class LPCheckpointList extends Object
    config(CheckpointList);

struct native CheckpointListItem
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string FriendlyName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string FriendlyDescription;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ThumbnailName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string IntroMovie;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ConsoleCommand;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string NoLevelTransitionConsoleCommand;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string CheckpointNameToLoad;

    structdefaultproperties
    {
        FriendlyName=""
        FriendlyDescription=""
        ThumbnailName=""
        IntroMovie=""
        ConsoleCommand=""
        NoLevelTransitionConsoleCommand=""
        CheckpointNameToLoad=""
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CheckpointList[1073741825];

defaultproperties
{
    CheckpointList=/* Array type was not detected. */
}