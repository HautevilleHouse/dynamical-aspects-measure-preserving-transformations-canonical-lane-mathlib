import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure DynamicalSystemPackage where
  space : Type u
  sigmaAlgebra : Set (Set space)
  measure : (Set space) → ℝ
  transformation : space → space
  measurePreserving : Prop
  invertible : Prop
  invertibleTerm : invertible
  measurePreservingTerm : measurePreserving

structure DynamicalSystemEvidence (D : DynamicalSystemPackage) where
  measurePreservingClosed : D.measurePreserving
  invertibleClosed : D.invertible

def DynamicalSystemClosed (D : DynamicalSystemPackage) : Prop :=
  D.measurePreserving ∧ D.invertible

theorem dynamical_system_closed_from_evidence (D : DynamicalSystemPackage)
    (E : DynamicalSystemEvidence D) : DynamicalSystemClosed D := by
  exact And.intro E.measurePreservingClosed E.invertibleClosed

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse