class CoverReplicator extends ReplicationInfo
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

struct ManualCoverTypeInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private byte SlotIndex;
    var(*) /*0x35EA0000-0x00000000*/ private byte ManualCoverType;

    structdefaultproperties
    {
        SlotIndex=0
        ManualCoverType=ECoverType.CT_None
    }
};

struct CoverReplicationInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Link;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SlotsEnabled;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SlotsDisabled;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SlotsAdjusted;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SlotsCoverTypeChanged;

    structdefaultproperties
    {
        Link=none
        SlotsEnabled=none
        SlotsDisabled=none
        SlotsAdjusted=none
        SlotsCoverTypeChanged=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CoverReplicationData;

function PurgeOldEntries()
{
    local /*0x35EA0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x74 [Loop If]
    if(I < CoverReplicationData.Length)
    {
        // End:0x66
        if(CoverReplicationData[I].Link == none)
        {
            CoverReplicationData.Remove(I--, 1);            
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function ReplicateInitialCoverInfo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL CoverReplicatorBase;

    CoverReplicatorBase = WorldInfo.Game.GetCoverReplicator();
    CoverReplicatorBase.PurgeOldEntries();
    CoverReplicationData = CoverReplicatorBase.CoverReplicationData;
    // End:0xC4
    if(PlayerController(Owner) != none)
    {
        ClientSetOwner(PlayerController(Owner));
        ServerSendInitialCoverReplicationInfo(0);
    }
    //return;    
}

reliable client simulated function ClientSetOwner()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];

    SetOwner(PC);
    //return;    
}

reliable server function ServerSendInitialCoverReplicationInfo()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private byte SlotsArrayIndex, NumSlotsEnabled, NumSlotsDisabled, NumSlotsAdjusted, NumCoverTypesChanged, SlotsEnabled,
	    SlotsDisabled, SlotsAdjusted;

    local /*0x35EA0000-0x00000000*/ private @NULL SlotsCoverTypeChanged[8];
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private bool bDone;

    J0x00:
    // End:0x5E [Loop If]
    if((Index < CoverReplicationData.Length) && CoverReplicationData[Index].Link == none)
    {
        CoverReplicationData.Remove(Index, 1);        
        // [Loop Continue]
        goto J0x00;
    }
    // End:0x711
    if(Index < CoverReplicationData.Length)
    {
        SlotsArrayIndex = 0;
        J0x82:

        NumSlotsEnabled = byte(Clamp(CoverReplicationData[Index].SlotsEnabled.Length - int(SlotsArrayIndex), 0, 8));
        NumSlotsDisabled = byte(Clamp(CoverReplicationData[Index].SlotsDisabled.Length - int(SlotsArrayIndex), 0, 8));
        NumSlotsAdjusted = byte(Clamp(CoverReplicationData[Index].SlotsAdjusted.Length - int(SlotsArrayIndex), 0, 8));
        NumCoverTypesChanged = byte(Clamp(CoverReplicationData[Index].SlotsCoverTypeChanged.Length - int(SlotsArrayIndex), 0, 8));
        // End:0x1EC
        if(int(NumSlotsEnabled) == int(0))
        {
            I = 0;
            J0x1B5:

            // End:0x1E9 [Loop If]
            if(I < 8)
            {
                SlotsEnabled[I] = 0;
                I++;
                // [Loop Continue]
                goto J0x1B5;
            }            
        }
        else
        {
            I = 0;
            J0x1F7:

            // End:0x26F [Loop If]
            if(I < int(NumSlotsEnabled))
            {
                SlotsEnabled[I] = CoverReplicationData[Index].SlotsEnabled[int(SlotsArrayIndex) + I];
                I++;
                // [Loop Continue]
                goto J0x1F7;
            }
        }
        // End:0x2C5
        if(int(NumSlotsDisabled) == int(0))
        {
            I = 0;
            J0x28E:

            // End:0x2C2 [Loop If]
            if(I < 8)
            {
                SlotsDisabled[I] = 0;
                I++;
                // [Loop Continue]
                goto J0x28E;
            }            
        }
        else
        {
            I = 0;
            J0x2D0:

            // End:0x348 [Loop If]
            if(I < int(NumSlotsDisabled))
            {
                SlotsDisabled[I] = CoverReplicationData[Index].SlotsDisabled[int(SlotsArrayIndex) + I];
                I++;
                // [Loop Continue]
                goto J0x2D0;
            }
        }
        // End:0x39E
        if(int(NumSlotsAdjusted) == int(0))
        {
            I = 0;
            J0x367:

            // End:0x39B [Loop If]
            if(I < 8)
            {
                SlotsAdjusted[I] = 0;
                I++;
                // [Loop Continue]
                goto J0x367;
            }            
        }
        else
        {
            I = 0;
            J0x3A9:

            // End:0x421 [Loop If]
            if(I < int(NumSlotsAdjusted))
            {
                SlotsAdjusted[I] = CoverReplicationData[Index].SlotsAdjusted[int(SlotsArrayIndex) + I];
                I++;
                // [Loop Continue]
                goto J0x3A9;
            }
        }
        // End:0x4B3
        if(int(NumCoverTypesChanged) == int(0))
        {
            I = 0;
            J0x440:

            // End:0x4B0 [Loop If]
            if(I < 8)
            {
                SlotsCoverTypeChanged[I].SlotIndex = 0;
                SlotsCoverTypeChanged[I].ManualCoverType = 0;
                I++;
                // [Loop Continue]
                goto J0x440;
            }            
        }
        else
        {
            I = 0;
            J0x4BE:

            // End:0x536 [Loop If]
            if(I < int(NumCoverTypesChanged))
            {
                SlotsCoverTypeChanged[I] = CoverReplicationData[Index].SlotsCoverTypeChanged[int(SlotsArrayIndex) + I];
                I++;
                // [Loop Continue]
                goto J0x4BE;
            }
        }
        bDone = ((((CoverReplicationData[Index].SlotsEnabled.Length - int(SlotsArrayIndex)) <= 8) && (CoverReplicationData[Index].SlotsDisabled.Length - int(SlotsArrayIndex)) <= 8) && (CoverReplicationData[Index].SlotsAdjusted.Length - int(SlotsArrayIndex)) <= 8) && (CoverReplicationData[Index].SlotsCoverTypeChanged.Length - int(SlotsArrayIndex)) <= 8;
        ClientReceiveInitialCoverReplicationInfo(Index, CoverReplicationData[Index].Link, CoverReplicationData[Index].Link.bDisabled, NumSlotsEnabled, SlotsEnabled, NumSlotsDisabled, SlotsDisabled, NumSlotsAdjusted, SlotsAdjusted, NumCoverTypesChanged, SlotsCoverTypeChanged, bDone);
        SlotsArrayIndex += 8;
        // End:0x82
        if(!(bDone))
            goto J0x82;
    }
    //return;    
}

reliable client simulated function ClientReceiveInitialCoverReplicationInfo()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bLinkDisabled[8388609];
    local /*0x35EA0000-0x00000000*/ private byte NumSlotsEnabled[8388609], SlotsEnabled, NumSlotsDisabled, SlotsDisabled, NumSlotsAdjusted, SlotsAdjusted,
	    NumCoverTypesChanged;

    local /*0x35EA0000-0x00000000*/ private @NULL SlotsCoverTypeChanged[8388616];
    local /*0x35EA0000-0x00000000*/ private bool bDone[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x32
    if(Link == none)
    {
        // End:0x2F
        if(bDone)
        {
            ServerSendInitialCoverReplicationInfo(Index);
        }        
    }
    else
    {
        Link.bDisabled = bLinkDisabled;
        I = 0;
        J0x67:

        // End:0xC3 [Loop If]
        if(I < int(NumSlotsEnabled))
        {
            Link.SetSlotEnabled(int(SlotsEnabled[I]), true);
            I++;
            // [Loop Continue]
            goto J0x67;
        }
        I = 0;
        J0xCE:

        // End:0x12A [Loop If]
        if(I < int(NumSlotsDisabled))
        {
            Link.SetSlotEnabled(int(SlotsDisabled[I]), false);
            I++;
            // [Loop Continue]
            goto J0xCE;
        }
        I = 0;
        J0x135:

        // End:0x2B9 [Loop If]
        if(I < int(NumSlotsAdjusted))
        {
            // End:0x2AB
            if((Link.AutoAdjustSlot(int(SlotsAdjusted[I]), false) && Link.Slots[int(SlotsAdjusted[I])].SlotOwner != none) && Link.Slots[int(SlotsAdjusted[I])].SlotOwner.Controller != none)
            {
                Link.Slots[int(SlotsAdjusted[I])].SlotOwner.Controller.NotifyCoverAdjusted();
            }
            I++;
            // [Loop Continue]
            goto J0x135;
        }
        I = 0;
        J0x2C4:

        // End:0x4C8 [Loop If]
        if(I < int(NumCoverTypesChanged))
        {
            Link.Slots[int(SlotsCoverTypeChanged[I].SlotIndex)].CoverType = SlotsCoverTypeChanged[I].ManualCoverType;
            // End:0x4BA
            if((Link.Slots[int(SlotsCoverTypeChanged[I].SlotIndex)].SlotOwner != none) && Link.Slots[int(SlotsCoverTypeChanged[I].SlotIndex)].SlotOwner.Controller != none)
            {
                Link.Slots[int(SlotsCoverTypeChanged[I].SlotIndex)].SlotOwner.Controller.NotifyCoverAdjusted();
            }
            I++;
            // [Loop Continue]
            goto J0x2C4;
        }
        // End:0x4EB
        if(bDone)
        {
            ServerSendInitialCoverReplicationInfo(Index + 1);
        }
    }
    //return;    
}

function NotifyEnabledSlots()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SlotIndices[25296897];
    local /*0x35EA0000-0x00000000*/ private int Index, SlotIndex, I;
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    Index = CoverReplicationData.Find('Link', Link);    
    // End:0x112
    if(Index == -1)
    {
        Index = CoverReplicationData.Length;
        CoverReplicationData.Length = CoverReplicationData.Length + 1;
        CoverReplicationData[Index].Link = Link;
        I = 0;
        J0xA3:

        // End:0x10F [Loop If]
        if(I < SlotIndices.Length)
        {
            CoverReplicationData[Index].SlotsEnabled[I] = byte(SlotIndices[I]);
            I++;
            // [Loop Continue]
            goto J0xA3;
        }        
    }
    else
    {
        I = 0;
        J0x11D:

        // End:0x291 [Loop If]
        if(I < SlotIndices.Length)
        {
            SlotIndex = CoverReplicationData[Index].SlotsEnabled.Find(byte(SlotIndices[I]));            
            // End:0x1F5
            if(SlotIndex == -1)
            {
                CoverReplicationData[Index].SlotsEnabled[CoverReplicationData[Index].SlotsEnabled.Length] = byte(SlotIndices[I]);
            }
            SlotIndex = CoverReplicationData[Index].SlotsDisabled.Find(byte(SlotIndices[I]));            
            // End:0x283
            if(SlotIndex != -1)
            {
                CoverReplicationData[Index].SlotsDisabled.Remove(SlotIndex, 1);                
            }
            I++;
            // [Loop Continue]
            goto J0x11D;
        }
    }
    // End:0x38D
    if(WorldInfo.Game.GetCoverReplicator() == self)
    {
        // End:0x38C
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            // End:0x345
            if(PC.MyCoverReplicator == none)
            {
                PC.SpawnCoverReplicator();
                // End:0x38B
                continue;
            }
            PC.MyCoverReplicator.NotifyEnabledSlots(Link, SlotIndices);            
        }        
    }
    // End:0x3B8
    if(PlayerController(Owner) != none)
    {
        ServerSendEnabledSlots(Index);
    }
    //return;    
}

reliable server function ServerSendEnabledSlots()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609], SlotsArrayIndex;
    local /*0x35EA0000-0x00000000*/ private byte NumSlotsEnabled, SlotsEnabled;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private bool bDone;

    // End:0x1AB
    if(CoverReplicationData[Index].Link != none)
    {
        SlotsArrayIndex = 0;
        J0x37:

        NumSlotsEnabled = byte(Clamp(CoverReplicationData[Index].SlotsEnabled.Length - SlotsArrayIndex, 0, 8));
        I = 0;
        J0x85:

        // End:0xFB [Loop If]
        if(I < int(NumSlotsEnabled))
        {
            SlotsEnabled[I] = CoverReplicationData[Index].SlotsEnabled[SlotsArrayIndex + I];
            I++;
            // [Loop Continue]
            goto J0x85;
        }
        bDone = (CoverReplicationData[Index].SlotsEnabled.Length - SlotsArrayIndex) <= 8;
        ClientReceiveEnabledSlots(Index, CoverReplicationData[Index].Link, NumSlotsEnabled, SlotsEnabled, bDone);
        SlotsArrayIndex += 8;
        // End:0x37
        if(!(bDone))
            goto J0x37;
    }
    //return;    
}

reliable client simulated function ClientReceiveEnabledSlots()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private byte NumSlotsEnabled[8388609], SlotsEnabled;
    local /*0x35EA0000-0x00000000*/ private bool bDone[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x32
    if(Link == none)
    {
        // End:0x2F
        if(bDone)
        {
            ServerSendEnabledSlots(Index);
        }        
    }
    else
    {
        I = 0;
        J0x3D:

        // End:0x99 [Loop If]
        if(I < int(NumSlotsEnabled))
        {
            Link.SetSlotEnabled(int(SlotsEnabled[I]), true);
            I++;
            // [Loop Continue]
            goto J0x3D;
        }
    }
    //return;    
}

function NotifyDisabledSlots()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SlotIndices[25296897];
    local /*0x35EA0000-0x00000000*/ private int Index, SlotIndex, I;
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    Index = CoverReplicationData.Find('Link', Link);    
    // End:0x112
    if(Index == -1)
    {
        Index = CoverReplicationData.Length;
        CoverReplicationData.Length = CoverReplicationData.Length + 1;
        CoverReplicationData[Index].Link = Link;
        I = 0;
        J0xA3:

        // End:0x10F [Loop If]
        if(I < SlotIndices.Length)
        {
            CoverReplicationData[Index].SlotsDisabled[I] = byte(SlotIndices[I]);
            I++;
            // [Loop Continue]
            goto J0xA3;
        }        
    }
    else
    {
        I = 0;
        J0x11D:

        // End:0x291 [Loop If]
        if(I < SlotIndices.Length)
        {
            SlotIndex = CoverReplicationData[Index].SlotsDisabled.Find(byte(SlotIndices[I]));            
            // End:0x1F5
            if(SlotIndex == -1)
            {
                CoverReplicationData[Index].SlotsDisabled[CoverReplicationData[Index].SlotsDisabled.Length] = byte(SlotIndices[I]);
            }
            SlotIndex = CoverReplicationData[Index].SlotsEnabled.Find(byte(SlotIndices[I]));            
            // End:0x283
            if(SlotIndex != -1)
            {
                CoverReplicationData[Index].SlotsEnabled.Remove(SlotIndex, 1);                
            }
            I++;
            // [Loop Continue]
            goto J0x11D;
        }
    }
    // End:0x38D
    if(WorldInfo.Game.GetCoverReplicator() == self)
    {
        // End:0x38C
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            // End:0x345
            if(PC.MyCoverReplicator == none)
            {
                PC.SpawnCoverReplicator();
                // End:0x38B
                continue;
            }
            PC.MyCoverReplicator.NotifyDisabledSlots(Link, SlotIndices);            
        }        
    }
    // End:0x3B8
    if(PlayerController(Owner) != none)
    {
        ServerSendDisabledSlots(Index);
    }
    //return;    
}

reliable server function ServerSendDisabledSlots()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609], SlotsArrayIndex;
    local /*0x35EA0000-0x00000000*/ private byte NumSlotsDisabled, SlotsDisabled;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private bool bDone;

    // End:0x1AB
    if(CoverReplicationData[Index].Link != none)
    {
        SlotsArrayIndex = 0;
        J0x37:

        NumSlotsDisabled = byte(Clamp(CoverReplicationData[Index].SlotsDisabled.Length - SlotsArrayIndex, 0, 8));
        I = 0;
        J0x85:

        // End:0xFB [Loop If]
        if(I < int(NumSlotsDisabled))
        {
            SlotsDisabled[I] = CoverReplicationData[Index].SlotsDisabled[SlotsArrayIndex + I];
            I++;
            // [Loop Continue]
            goto J0x85;
        }
        bDone = (CoverReplicationData[Index].SlotsDisabled.Length - SlotsArrayIndex) <= 8;
        ClientReceiveDisabledSlots(Index, CoverReplicationData[Index].Link, NumSlotsDisabled, SlotsDisabled, bDone);
        SlotsArrayIndex += 8;
        // End:0x37
        if(!(bDone))
            goto J0x37;
    }
    //return;    
}

reliable client simulated function ClientReceiveDisabledSlots()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private byte NumSlotsDisabled[8388609], SlotsDisabled;
    local /*0x35EA0000-0x00000000*/ private bool bDone[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x32
    if(Link == none)
    {
        // End:0x2F
        if(bDone)
        {
            ServerSendDisabledSlots(Index);
        }        
    }
    else
    {
        I = 0;
        J0x3D:

        // End:0x99 [Loop If]
        if(I < int(NumSlotsDisabled))
        {
            Link.SetSlotEnabled(int(SlotsDisabled[I]), false);
            I++;
            // [Loop Continue]
            goto J0x3D;
        }
    }
    //return;    
}

function NotifyAutoAdjustSlots()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SlotIndices[25296897];
    local /*0x35EA0000-0x00000000*/ private int Index, SlotIndex, I;
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    Index = CoverReplicationData.Find('Link', Link);    
    // End:0x112
    if(Index == -1)
    {
        Index = CoverReplicationData.Length;
        CoverReplicationData.Length = CoverReplicationData.Length + 1;
        CoverReplicationData[Index].Link = Link;
        I = 0;
        J0xA3:

        // End:0x10F [Loop If]
        if(I < SlotIndices.Length)
        {
            CoverReplicationData[Index].SlotsAdjusted[I] = byte(SlotIndices[I]);
            I++;
            // [Loop Continue]
            goto J0xA3;
        }        
    }
    else
    {
        I = 0;
        J0x11D:

        // End:0x29A [Loop If]
        if(I < SlotIndices.Length)
        {
            SlotIndex = CoverReplicationData[Index].SlotsAdjusted.Find(byte(SlotIndices[I]));            
            // End:0x1F5
            if(SlotIndex == -1)
            {
                CoverReplicationData[Index].SlotsAdjusted[CoverReplicationData[Index].SlotsAdjusted.Length] = byte(SlotIndices[I]);
            }
            SlotIndex = CoverReplicationData[Index].SlotsCoverTypeChanged.Find('SlotIndex', byte(SlotIndices[I]));            
            // End:0x28C
            if(SlotIndex != -1)
            {
                CoverReplicationData[Index].SlotsCoverTypeChanged.Remove(SlotIndex, 1);                
            }
            I++;
            // [Loop Continue]
            goto J0x11D;
        }
    }
    // End:0x396
    if(WorldInfo.Game.GetCoverReplicator() == self)
    {
        // End:0x395
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            // End:0x34E
            if(PC.MyCoverReplicator == none)
            {
                PC.SpawnCoverReplicator();
                // End:0x394
                continue;
            }
            PC.MyCoverReplicator.NotifyAutoAdjustSlots(Link, SlotIndices);            
        }        
    }
    // End:0x3C1
    if(PlayerController(Owner) != none)
    {
        ServerSendAdjustedSlots(Index);
    }
    //return;    
}

reliable server function ServerSendAdjustedSlots()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609], SlotsArrayIndex;
    local /*0x35EA0000-0x00000000*/ private byte NumSlotsAdjusted, SlotsAdjusted;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private bool bDone;

    // End:0x1AB
    if(CoverReplicationData[Index].Link != none)
    {
        SlotsArrayIndex = 0;
        J0x37:

        NumSlotsAdjusted = byte(Clamp(CoverReplicationData[Index].SlotsAdjusted.Length - SlotsArrayIndex, 0, 8));
        I = 0;
        J0x85:

        // End:0xFB [Loop If]
        if(I < int(NumSlotsAdjusted))
        {
            SlotsAdjusted[I] = CoverReplicationData[Index].SlotsAdjusted[SlotsArrayIndex + I];
            I++;
            // [Loop Continue]
            goto J0x85;
        }
        bDone = (CoverReplicationData[Index].SlotsAdjusted.Length - SlotsArrayIndex) <= 8;
        ClientReceiveAdjustedSlots(Index, CoverReplicationData[Index].Link, NumSlotsAdjusted, SlotsAdjusted, bDone);
        SlotsArrayIndex += 8;
        // End:0x37
        if(!(bDone))
            goto J0x37;
    }
    //return;    
}

reliable client simulated function ClientReceiveAdjustedSlots()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private byte NumSlotsAdjusted[8388609], SlotsAdjusted;
    local /*0x35EA0000-0x00000000*/ private bool bDone[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x32
    if(Link == none)
    {
        // End:0x2F
        if(bDone)
        {
            ServerSendAdjustedSlots(Index);
        }        
    }
    else
    {
        I = 0;
        J0x3D:

        // End:0x1C1 [Loop If]
        if(I < int(NumSlotsAdjusted))
        {
            // End:0x1B3
            if((Link.AutoAdjustSlot(int(SlotsAdjusted[I]), true) && Link.Slots[int(SlotsAdjusted[I])].SlotOwner != none) && Link.Slots[int(SlotsAdjusted[I])].SlotOwner.Controller != none)
            {
                Link.Slots[int(SlotsAdjusted[I])].SlotOwner.Controller.NotifyCoverAdjusted();
            }
            I++;
            // [Loop Continue]
            goto J0x3D;
        }
    }
    //return;    
}

function NotifySetManualCoverTypeForSlots()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array SlotIndices[25296897];
    local /*0x35EA0000-0x00000000*/ private byte NewCoverType[8388609];
    local /*0x35EA0000-0x00000000*/ private int Index, SlotIndex, I;
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    Index = CoverReplicationData.Find('Link', Link);    
    // End:0x1A4
    if(Index == -1)
    {
        Index = CoverReplicationData.Length;
        CoverReplicationData.Length = CoverReplicationData.Length + 1;
        CoverReplicationData[Index].Link = Link;
        CoverReplicationData[Index].SlotsCoverTypeChanged.Length = SlotIndices.Length;
        I = 0;
        J0xD5:

        // End:0x1A1 [Loop If]
        if(I < SlotIndices.Length)
        {
            CoverReplicationData[Index].SlotsCoverTypeChanged[I].SlotIndex = byte(SlotIndices[I]);
            CoverReplicationData[Index].SlotsCoverTypeChanged[I].ManualCoverType = NewCoverType;
            I++;
            // [Loop Continue]
            goto J0xD5;
        }        
    }
    else
    {
        I = 0;
        J0x1AF:

        // End:0x3F1 [Loop If]
        if(I < SlotIndices.Length)
        {
            SlotIndex = CoverReplicationData[Index].SlotsCoverTypeChanged.Find('SlotIndex', byte(SlotIndices[I]));            
            // End:0x308
            if(SlotIndex == -1)
            {
                SlotIndex = CoverReplicationData[Index].SlotsCoverTypeChanged.Length;
                CoverReplicationData[Index].SlotsCoverTypeChanged.Length = CoverReplicationData[Index].SlotsCoverTypeChanged.Length + 1;
                CoverReplicationData[Index].SlotsCoverTypeChanged[SlotIndex].SlotIndex = byte(SlotIndices[I]);
            }
            CoverReplicationData[Index].SlotsCoverTypeChanged[SlotIndex].ManualCoverType = NewCoverType;
            SlotIndex = CoverReplicationData[Index].SlotsAdjusted.Find(byte(SlotIndices[I]));            
            // End:0x3E3
            if(SlotIndex != -1)
            {
                CoverReplicationData[Index].SlotsAdjusted.Remove(SlotIndex, 1);                
            }
            I++;
            // [Loop Continue]
            goto J0x1AF;
        }
    }
    // End:0x4F6
    if(WorldInfo.Game.GetCoverReplicator() == self)
    {
        // End:0x4F5
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            // End:0x4A5
            if(PC.MyCoverReplicator == none)
            {
                PC.SpawnCoverReplicator();
                // End:0x4F4
                continue;
            }
            PC.MyCoverReplicator.NotifySetManualCoverTypeForSlots(Link, SlotIndices, NewCoverType);            
        }        
    }
    // End:0x521
    if(PlayerController(Owner) != none)
    {
        ServerSendManualCoverTypeSlots(Index);
    }
    //return;    
}

reliable server function ServerSendManualCoverTypeSlots()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609], SlotsArrayIndex;
    local /*0x35EA0000-0x00000000*/ private byte NumCoverTypesChanged;
    local /*0x35EA0000-0x00000000*/ private @NULL SlotsCoverTypeChanged[8];
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private bool bDone;

    // End:0x1AB
    if(CoverReplicationData[Index].Link != none)
    {
        SlotsArrayIndex = 0;
        J0x37:

        NumCoverTypesChanged = byte(Clamp(CoverReplicationData[Index].SlotsCoverTypeChanged.Length - SlotsArrayIndex, 0, 8));
        I = 0;
        J0x85:

        // End:0xFB [Loop If]
        if(I < int(NumCoverTypesChanged))
        {
            SlotsCoverTypeChanged[I] = CoverReplicationData[Index].SlotsCoverTypeChanged[SlotsArrayIndex + I];
            I++;
            // [Loop Continue]
            goto J0x85;
        }
        bDone = (CoverReplicationData[Index].SlotsCoverTypeChanged.Length - SlotsArrayIndex) <= 8;
        ClientReceiveManualCoverTypeSlots(Index, CoverReplicationData[Index].Link, NumCoverTypesChanged, SlotsCoverTypeChanged, bDone);
        SlotsArrayIndex += 8;
        // End:0x37
        if(!(bDone))
            goto J0x37;
    }
    //return;    
}

reliable client simulated function ClientReceiveManualCoverTypeSlots()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private byte NumCoverTypesChanged[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SlotsCoverTypeChanged[8388616];
    local /*0x35EA0000-0x00000000*/ private bool bDone[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;

    // End:0x32
    if(Link == none)
    {
        // End:0x2F
        if(bDone)
        {
            ServerSendManualCoverTypeSlots(Index);
        }        
    }
    else
    {
        I = 0;
        J0x3D:

        // End:0x241 [Loop If]
        if(I < int(NumCoverTypesChanged))
        {
            Link.Slots[int(SlotsCoverTypeChanged[I].SlotIndex)].CoverType = SlotsCoverTypeChanged[I].ManualCoverType;
            // End:0x233
            if((Link.Slots[int(SlotsCoverTypeChanged[I].SlotIndex)].SlotOwner != none) && Link.Slots[int(SlotsCoverTypeChanged[I].SlotIndex)].SlotOwner.Controller != none)
            {
                Link.Slots[int(SlotsCoverTypeChanged[I].SlotIndex)].SlotOwner.Controller.NotifyCoverAdjusted();
            }
            I++;
            // [Loop Continue]
            goto J0x3D;
        }
    }
    //return;    
}

function NotifyLinkDisabledStateChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private int Index;
    local /*0x35EA0000-0x00000000*/ private @NULL PC;

    Index = CoverReplicationData.Find('Link', Link);    
    // End:0x98
    if(Index == -1)
    {
        Index = CoverReplicationData.Length;
        CoverReplicationData.Length = CoverReplicationData.Length + 1;
        CoverReplicationData[Index].Link = Link;
    }
    // End:0x18B
    if(WorldInfo.Game.GetCoverReplicator() == self)
    {
        // End:0x18A
        foreach WorldInfo.AllControllers(Class'PlayerController', PC)
        {
            // End:0x14C
            if(PC.MyCoverReplicator == none)
            {
                PC.SpawnCoverReplicator();
                // End:0x189
                continue;
            }
            PC.MyCoverReplicator.NotifyLinkDisabledStateChange(Link);            
        }        
    }
    // End:0x1B6
    if(PlayerController(Owner) != none)
    {
        ServerSendLinkDisabledState(Index);
    }
    //return;    
}

reliable server function ServerSendLinkDisabledState()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];

    // End:0xA1
    if(CoverReplicationData[Index].Link != none)
    {
        ClientReceiveLinkDisabledState(Index, CoverReplicationData[Index].Link, CoverReplicationData[Index].Link.bDisabled);
    }
    //return;    
}

reliable client simulated function ClientReceiveLinkDisabledState()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bLinkDisabled[8388609];

    // End:0x25
    if(Link == none)
    {
        ServerSendLinkDisabledState(Index);        
    }
    else
    {
        Link.bDisabled = bLinkDisabled;
    }
    //return;    
}

defaultproperties
{
    bOnlyRelevantToOwner=true
    bAlwaysRelevant=false
    NetUpdateFrequency=0.1000000
}