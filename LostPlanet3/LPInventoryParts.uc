class LPInventoryParts extends SPInventoryParts
    abstract
    hidecategories(AnimDependency,Navigation);

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825];

    SPPartsCreateCheckpointRecord(Record.SPPartsRecord);
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25296897];

    //return;    
}
