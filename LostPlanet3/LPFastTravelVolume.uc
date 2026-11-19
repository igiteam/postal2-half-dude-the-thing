class LPFastTravelVolume extends LPTriggerVolume
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(0.25_Pct) /*0x7E8C0000-0x00000000*/ private editfixedsize array FastTravelInfo[65537];

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPPC;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    LPPC = GetLPPC(Other);
    // End:0x9D
    if(LPPC != none)
    {
        // End:0x9D
        if(LPPC.Pawn != none)
        {
            LPPC.ShowFastTravelOptionMessage();
        }
    }
    //return;    
}

event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPPC;

    LPPC = GetLPPC(Other);
    // End:0x4B
    if(LPPC != none)
    {
        LPPC.ClearFastTravelOptionMessage();
    }
    //return;    
}

function HandleFastTravelRequest()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FTQuestObject;

    // End:0x164
    if(LPPC != none)
    {
        FTQuestObject = FastTravelInfo[0].ObjectiveEntry.GetQuestObject();
        // End:0x108
        if(FTQuestObject != none)
        {
            // End:0x108
            if(FTQuestObject.DynamicData != none)
            {
                // End:0x108
                if(int(FTQuestObject.GetQuestStatus()) == int(1))
                {
                    FTQuestObject.DynamicData.bSpecialPrerequisiteEventSent = true;
                    Class'SPEngine.SPUtil'.static.ForceUpdateQuestStatus(FTQuestObject);
                }
            }
        }
        // End:0x164
        if(FastTravelInfo.Length > 0)
        {
            LPPC.bOpenJobLogToAutopilot = true;
            LPPC.OpenJobLogFromFastTravelVolume(FastTravelInfo, false);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetLPPC()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], ReturnValue, ThePawn, LPPC;

    ThePawn = Pawn(Other);
    // End:0x5C
    if(ThePawn != none)
    {
        LPPC = LPPlayerController(ThePawn.Controller);
    }
    return LPPC;
    //return ReturnValue;    
}

static function GetBestMovieToPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array InFastTravelInfo[25296897];
    local /*0x97E50000-0x00000000*/ private int SelectedIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689], MovieInfo, QO;
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x168 [Loop If]
    if(Idx < InFastTravelInfo[SelectedIndex].ForcedMovieInfo.Length)
    {
        // End:0x15A
        if(InFastTravelInfo[SelectedIndex].ForcedMovieInfo[Idx].ObjectiveEntry != none)
        {
            QO = InFastTravelInfo[SelectedIndex].ForcedMovieInfo[Idx].ObjectiveEntry.GetQuestObject();
            // End:0x15A
            if(int(QO.GetQuestStatus()) == int(3))
            {
                return InFastTravelInfo[SelectedIndex].ForcedMovieInfo[Idx].ForcedMovie;
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    Idx = Rand(InFastTravelInfo[SelectedIndex].MovieInfo.Length);
    // End:0x212
    if((Idx >= 0) && Idx < InFastTravelInfo[SelectedIndex].MovieInfo.Length)
    {
        return InFastTravelInfo[SelectedIndex].MovieInfo[Idx];
    }
    return MovieInfo;
    //return ReturnValue;    
}

defaultproperties
{
    FastTravelInfo=/* Array type was not detected. */
    BrushColor=(R=255,G=0,B=0,A=255)
    // Reference: BrushComponent'Default__LPFastTravelVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}