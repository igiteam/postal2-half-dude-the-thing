class LPMapInfoEventRelative extends LPMapInfoEventBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x80AD0000-0x00000000*/ private float GameTime[65537];
var(0.25_Pct) /*0x80AD0000-0x00000000*/ private float OffsetSeconds[65537];

function GetAbsoluteTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL WI, GRI;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0x3F
    if(WI == none)
    {
        return 0.0000000;
    }
    GRI = LPGRI_Base_MP(WI.GRI);
    // End:0x85
    if(GRI == none)
    {
        return 0.0000000;
    }
    return (float((GRI.TimeLimit * 60) + GRI.TimeAdded) * GameTime) + OffsetSeconds;
    //return ReturnValue;    
}
