class LPMapInfoEventAbsolute extends LPMapInfoEventBase
    editinlinenew
    hidecategories(Object,Object);

var(0.25_Pct) /*0x80AA0000-0x00000000*/ private float GameTime[65537];

function GetAbsoluteTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GameTime;
    //return ReturnValue;    
}
