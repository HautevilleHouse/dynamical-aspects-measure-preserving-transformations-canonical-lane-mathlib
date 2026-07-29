import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure AdmissibleClass where
  space : Type u
  measure : MeasureTheory.Measure space
  transformation : space → space
  invariant : MeasureTheory.MeasurePreserving transformation measure measure
  ergodicComponent : Prop
  mixingProperty : Prop
  spectralMeasure : Prop

def admittedClosure (A : AdmissibleClass) : Prop :=
  MeasurePreservingWitnessClosed A.invariant ∧ (A.ergodicComponent ∨ A.mixingProperty)

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse
