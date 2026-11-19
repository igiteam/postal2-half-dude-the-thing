class LPWorldAttractor extends SPWorldAttractor
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

defaultproperties
{
    FalloffExponent=(Distribution=// Reference: DistributionFloatConstant'Default__LPWorldAttractor.DistributionFalloffExponent'
    begin object name=DistributionFalloffExponent
    end object
    Distribution=DistributionFalloffExponent)
    Range=(Distribution=// Reference: DistributionFloatConstant'Default__LPWorldAttractor.DistributionRange'
    begin object name=DistributionRange
    end object
    Distribution=DistributionRange)
    Strength=(Distribution=// Reference: DistributionFloatConstant'Default__LPWorldAttractor.DistributionStrength'
    begin object name=DistributionStrength
    end object
    Distribution=DistributionStrength)
    DragCoefficient=(Distribution=// Reference: DistributionFloatConstant'Default__LPWorldAttractor.DistributionDragCoefficient'
    begin object name=DistributionDragCoefficient
    end object
    Distribution=DistributionDragCoefficient)
    DragRadius=(Distribution=// Reference: DistributionFloatConstant'Default__LPWorldAttractor.DistributionDragRadius'
    begin object name=DistributionDragRadius
    end object
    Distribution=DistributionDragRadius)
}