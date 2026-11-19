class LPAnimNotify_PlayerDodgeWindow extends AnimNotify
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(0.25_Pct) /*0x7C0F0000-0x00000000*/ private byte AttackType[65537];
var(0.25_Pct) /*0x7C0F0000-0x00000000*/ private byte DodgePhase[65537];

static final function DoesThisAttackTypeHaveSpecialDodge()
{
    local /*0x97E50000-0x00000000*/ private int AttackTypeToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(AttackTypeToTest)
    {
        // End:0x17
        case 1:
        // End:0x1C
        case 2:
        // End:0x21
        case 3:
        // End:0x26
        case 5:
        // End:0x2B
        case 6:
        // End:0x30
        case 7:
        // End:0x35
        case 8:
        // End:0x3A
        case 9:
        // End:0x3F
        case 17:
        // End:0x44
        case 18:
        // End:0x49
        case 19:
        // End:0x4E
        case 20:
        // End:0x53
        case 21:
        // End:0x58
        case 22:
        // End:0x5D
        case 23:
        // End:0x62
        case 24:
        // End:0x67
        case 25:
        // End:0x6E
        case 26:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}
