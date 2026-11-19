class LPAIResSurroundLocation extends LPAIResLocation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

struct native LPAIResSurround_AngularRange
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartAngle;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EndAngle;

    structdefaultproperties
    {
        StartAngle=0.0000000
        EndAngle=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AngularRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngularPosition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ColorToggle[536870913];

function ForceNotifyChangeLocation()
{
    NotifyChangeLocation();
    //return;    
}

defaultproperties
{
    AngularRange=(StartAngle=0.0000000,EndAngle=6.2831850)
}