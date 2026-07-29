import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure InvariantMeasure where
  space : Type u
  transformation : space → space
  measure : MeasureTheory.Measure space
  invariant : MeasureTheory.MeasurePreserving transformation measure measure

def InvariantMeasureClosed (I : InvariantMeasure) : Prop :=
  I.invariant.property

set_option linter.unusedVariables false in
theorem invariant_measure_closed (I : InvariantMeasure) : InvariantMeasureClosed I := by
  exact I.invariant.property

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse
