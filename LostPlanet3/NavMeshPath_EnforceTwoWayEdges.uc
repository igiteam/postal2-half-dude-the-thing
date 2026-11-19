class NavMeshPath_EnforceTwoWayEdges extends NavMeshPathConstraint;

static function EnforceTwoWayEdges()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Con;

    // End:0x83
    if(NavHandle != none)
    {
        Con = NavMeshPath_EnforceTwoWayEdges(NavHandle.CreatePathConstraint(default.Class));
        // End:0x83
        if(Con != none)
        {
            NavHandle.AddPathConstraint(Con);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}
