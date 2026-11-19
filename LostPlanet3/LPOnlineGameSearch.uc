class LPOnlineGameSearch extends SPOnlineGameSearch;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int QueryId_DLCExact;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int QueryId_DLCAny;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int QueryId_DLCMinRequired;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL FilterQuery_DLCExact;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL FilterQuery_DLCAny;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL FilterQuery_DLCMinRequired;

defaultproperties
{
    QueryId_DLCExact=7
    QueryId_DLCAny=8
    QueryId_DLCMinRequired=22
    FilterQuery_DLCExact=(OrClauses=/* Array type was not detected. */,SortClauses=none)
    FilterQuery_DLCAny=(OrClauses=/* Array type was not detected. */,SortClauses=none)
    FilterQuery_DLCMinRequired=(OrClauses=/* Array type was not detected. */,SortClauses=none)
    MaxSearchResults=50
    GameSettingsClass=Class'LPOnlineGameSettings'
    FilterQuery=(OrClauses=/* Array type was not detected. */)
    AdditionalSearchCriteria="ATS>0"
    LocalizedSettings=/* Array type was not detected. */
    Properties=/* Array type was not detected. */
    LocalizedSettingsMappings=/* Array type was not detected. */
    PropertyMappings=/* Array type was not detected. */
}