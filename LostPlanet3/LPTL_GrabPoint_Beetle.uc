class LPTL_GrabPoint_Beetle extends LPTL_GrabPoint_Base
    hidecategories(Object,Object,Object,Object,ChildBlendTimes,AnimNodeBlendList,Performance,AnimNodeBlendBase,Morph);

enum EBeetleGrabPoints
{
    ebgpLeftSide,                   // 0
    ebgpRightSide,                  // 1
    ebgpHornFromComboEnd,           // 2
    ebgpHornFromActiveD1,           // 3
    ebgpHornFromActiveD2,           // 4
    ebgpHornFromActiveD3,           // 5
    ebgpLegLeftFrontFore,           // 6
    ebgpLegLeftFrontPort,           // 7
    ebgpLegLeftRearAft,             // 8
    ebgpLegLeftRearPort,            // 9
    ebgpLegRightFrontFore,          // 10
    ebgpLegRightFrontStarboard,     // 11
    ebgpLegRightRearAft,            // 12
    ebgpLegRightRearStarboard,      // 13
    EBeetleGrabPoints_MAX           // 14
};

var(0.25_Pct) /*0x895A0000-0x00000000*/ private editfixedsize array GrabPoints[4259841];
