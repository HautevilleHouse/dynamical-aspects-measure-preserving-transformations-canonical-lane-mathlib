import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.ergodicComponent ∨ A.mixingProperty

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  unfold gateClosed
  exact Or.inl A.ergodicComponent

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse
