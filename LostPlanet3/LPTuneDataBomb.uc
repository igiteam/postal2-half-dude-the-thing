class LPTuneDataBomb extends SPEngineTuneDataBase
    hidecategories(Object,Object);

var(0.25_Pct) /*0x06330000-0x00000000*/ private name SeqOpenHold[65537];
var(0.25_Pct) /*0x06330000-0x00000000*/ private name SeqClosedHold[65537];
var(0.25_Pct) /*0x06330000-0x00000000*/ private name SeqClosing[65537];
var(0.25_Pct) /*0x06330000-0x00000000*/ private name SeqOpening[65537];
var(0.25_Pct) /*0x14800000-0x00000000*/ private @NULL ExplosionSound[65537];
var(0.25_Pct) /*0x14800000-0x00000400*/ private editfixedsize @NULL ExplosionTemplate[589825];

defaultproperties
{
    SeqOpenHold="PRP_TPost_TPost_OpenHold_Core"
    SeqClosedHold="PRP_TPost_TPost_ClosedHold_Core"
    SeqClosing="PRP_TPost_TPost_Closing_Core"
    SeqOpening="PRP_TPost_TPost_Opening_Core"
}