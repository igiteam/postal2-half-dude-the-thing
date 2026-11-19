class LPAIResVsPhysAttackLocMgr extends SPAIObject within LPBaseVSPlayerPawn
    editinlinenew
    hidecategories(Object);

struct native VSAttackSlot
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Sockets;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TuneDataSocketsIdx;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisabled;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSlotUsed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorUsingIt;

    structdefaultproperties
    {
        Sockets=(StartSocketName="None",EndSocketName="None",PlayerOutsideRigSocketName="None")
        TuneDataSocketsIdx=0
        bDisabled=false
        bSlotUsed=false
        ActorUsingIt=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AttackSlots;

// Export ULPAIResVsPhysAttackLocMgr::execAllAttackers(FFrame&, void* const)
native final iterator function AllAttackers()
{
    local /*0x97E50000-0x00000000*/ private class BaseClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Attacker[25165825];


}

function Init()
{
    BuildAttackSocketData(Outer.TuneDataVSPlayerPawn.AttackSlotSockets);
    //return;    
}

function BuildAttackSocketData()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SocketsOnVs[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL newAttackSlot;
    local /*0x97E50000-0x00000000*/ private name SocketName;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x1A
    if(LPPlayerTurretPawn(Outer) != none)
    {
        return;
    }
    I = 0;
    J0x25:

    // End:0x1FF [Loop If]
    if(I < SocketsOnVs.Length)
    {
        SocketName = SocketsOnVs[I].StartSocketName;
        // End:0xB3
        if(Outer.Mesh.GetSocketByName(SocketName) == none)
        {            
        }
        else
        {
            SocketName = SocketsOnVs[I].EndSocketName;
            // End:0x129
            if(Outer.Mesh.GetSocketByName(SocketName) == none)
            {                
            }
            else
            {
                newAttackSlot.Sockets = SocketsOnVs[I];
                newAttackSlot.TuneDataSocketsIdx = I;
                newAttackSlot.bDisabled = false;
                newAttackSlot.bSlotUsed = false;
                newAttackSlot.ActorUsingIt = none;
                AttackSlots.AddItem(newAttackSlot);                
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x25;
    }
    //return;    
}

function GetFreeAttackSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAllowClaimingMultipleSlots[9437185];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I;

    false
    I = 0;
    J0x10:

    // End:0x170 [Loop If]
    if(I < AttackSlots.Length)
    {
        // End:0x55
        if(AttackSlots[I].bDisabled)
        {            
        }
        else
        {
            // End:0xE7
            if(!AttackSlots[I].bSlotUsed)
            {
                AttackSlots[I].bSlotUsed = true;
                AttackSlots[I].ActorUsingIt = Requester;
                return I;                
            }
            else
            {
                // End:0x162
                if((AttackSlots[I].bSlotUsed && !bAllowClaimingMultipleSlots) && AttackSlots[I].ActorUsingIt == Requester)
                {
                    return I;
                }
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x10;
    }
    return -1;
    //return ReturnValue;    
}

function IsThereFreeAttackSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x8C [Loop If]
    if(I < AttackSlots.Length)
    {
        // End:0x50
        if(AttackSlots[I].bDisabled)
        {            
        }
        else
        {
            // End:0x7E
            if(!AttackSlots[I].bSlotUsed)
            {
                return true;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function AreAnyAttackSlotOccupied()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x8A [Loop If]
    if(I < AttackSlots.Length)
    {
        // End:0x50
        if(AttackSlots[I].bDisabled)
        {            
        }
        else
        {
            // End:0x7C
            if(AttackSlots[I].bSlotUsed)
            {
                return true;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function ReleaseSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL ActorUsingIt[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xB8 [Loop If]
    if(I < AttackSlots.Length)
    {
        // End:0xAA
        if(ActorUsingIt == AttackSlots[I].ActorUsingIt)
        {
            AttackSlots[I].bSlotUsed = false;
            AttackSlots[I].ActorUsingIt = none;
            return;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function OnToggleAttackLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL Slot;
    local /*0x97E50000-0x00000000*/ private name EndSocket;

    // End:0xEF
    if(inAction.InputLinks[0].bHasImpulse)
    {
        // End:0xEE
        foreach inAction.SocketNames(EndSocket)
        {
            // End:0xEC
            foreach AttackSlots(Slot, Idx)
            {
                // End:0xEB
                if(Slot.Sockets.EndSocketName == EndSocket)
                {
                    AttackSlots[Idx].bDisabled = false;                    
                }
                else
                {                    
                }
            }                        
        }        
    }
    // End:0x1D6
    if(inAction.InputLinks[1].bHasImpulse)
    {
        // End:0x1D5
        foreach inAction.SocketNames(EndSocket)
        {
            // End:0x1D3
            foreach AttackSlots(Slot)
            {
                // End:0x1D2
                if(Slot.Sockets.EndSocketName == EndSocket)
                {
                    AttackSlots[Idx].bDisabled = true;                    
                }
                else
                {                    
                }
            }                        
        }        
    }
    // End:0x2DC
    if(inAction.InputLinks[2].bHasImpulse)
    {
        // End:0x2DB
        foreach inAction.SocketNames(EndSocket)
        {
            // End:0x2D9
            foreach AttackSlots(Slot)
            {
                // End:0x2D8
                if(Slot.Sockets.EndSocketName == EndSocket)
                {
                    AttackSlots[Idx].bDisabled = !Slot.bDisabled;                    
                }
                else
                {                    
                }
            }                        
        }        
    }
    // End:0x35E
    if(inAction.InputLinks[3].bHasImpulse)
    {
        // End:0x35D
        foreach AttackSlots(Slot, Idx)
        {
            AttackSlots[Idx].bDisabled = false;            
        }        
    }
    //return;    
}
