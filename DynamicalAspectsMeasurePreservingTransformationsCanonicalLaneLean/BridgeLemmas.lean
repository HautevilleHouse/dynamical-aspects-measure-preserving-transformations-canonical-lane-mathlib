import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MeasurePreservingWitnessClosed A.invariant

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.invariant.property

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse
