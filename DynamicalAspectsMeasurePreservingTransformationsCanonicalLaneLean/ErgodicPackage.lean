import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean.DynamicalSystemPackage

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure ErgodicPackage (D : DynamicalSystemPackage) where
  invariantSets : Set (Set D.space)
  ergodicCondition : Prop
  ergodicConditionTerm : ergodicCondition

structure ErgodicEvidence {D : DynamicalSystemPackage} (E : ErgodicPackage D) where
  ergodicConditionClosed : E.ergodicCondition

def ErgodicClosed {D : DynamicalSystemPackage} (E : ErgodicPackage D) : Prop :=
  E.ergodicCondition

theorem ergodic_closed_from_evidence {D : DynamicalSystemPackage}
    (E : ErgodicPackage D) (Ev : ErgodicEvidence E) : ErgodicClosed E := by
  exact Ev.ergodicConditionClosed

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse