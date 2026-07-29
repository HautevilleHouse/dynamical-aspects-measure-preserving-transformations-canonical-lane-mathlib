import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure ErgodicTransformation (X : MeasureSpace) extends MeasurePreservingTransformation X X where
  ergodic : ∀ s ∈ X.sigmaAlgebra, (T.map⁻¹' s = s) → (X.measure s = 0 ∨ X.measure s = X.measure X.carrier)

structure ErgodicPackage {X : MeasureSpace} (T : ErgodicTransformation X) where
  invariantSetsClassified : Prop
  meanErgodicTheorem : Prop
  pointwiseErgodicTheorem : Prop
  mixingProperties : Prop

structure ErgodicEvidence {X : MeasureSpace} {T : ErgodicTransformation X} (E : ErgodicPackage T) where
  invariantSetsClassifiedClosed : E.invariantSetsClassified
  meanErgodicTheoremClosed : E.meanErgodicTheorem
  pointwiseErgodicTheoremClosed : E.pointwiseErgodicTheorem
  mixingPropertiesClosed : E.mixingProperties

def ErgodicClosed {X : MeasureSpace} {T : ErgodicTransformation X} (E : ErgodicPackage T) : Prop :=
  E.invariantSetsClassified ∧ E.meanErgodicTheorem ∧ E.pointwiseErgodicTheorem ∧ E.mixingProperties

theorem ergodic_closed_from_evidence {X : MeasureSpace} {T : ErgodicTransformation X} (E : ErgodicPackage T) (ev : ErgodicEvidence E) : ErgodicClosed E := by
  exact And.intro ev.invariantSetsClassifiedClosed (And.intro ev.meanErgodicTheoremClosed (And.intro ev.pointwiseErgodicTheoremClosed ev.mixingPropertiesClosed))

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse