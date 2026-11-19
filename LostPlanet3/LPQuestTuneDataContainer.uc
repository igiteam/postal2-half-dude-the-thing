class LPQuestTuneDataContainer extends SPQuestTuneDataContainer
    config(Game)
    editinlinenew;

// Export ULPQuestTuneDataContainer::execGetAllJobLogQuestChainNames(FFrame&, void* const)
native function GetAllJobLogQuestChainNames()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array OutNames[25165825];


}

// Export ULPQuestTuneDataContainer::execGetAllPersistentMapNames(FFrame&, void* const)
native function GetAllPersistentMapNames()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array OutNames[25165825];


}

defaultproperties
{
    // Reference: SPSeekFreePackageLoader'Default__LPQuestTuneDataContainer.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    AllAssetNames=/* Array type was not detected. */
}