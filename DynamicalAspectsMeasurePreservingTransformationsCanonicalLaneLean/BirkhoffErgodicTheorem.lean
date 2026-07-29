import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean.InvariantMeasurePackage

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure BirkhoffErgodicTheoremPackage (T : MeasurePreservingTransformation) (I : InvariantMeasurePackage T) where
  integrableFunction : T.source.point → ℝ
  timeAverages : ℕ → ℝ
  almostSureConvergence : Prop
  limitIsInvariant : Prop
  ergodicMeanEqualsSpaceAverage : Prop
  
structure BirkhoffErgodicEvidence {T : MeasurePreservingTransformation} {I : InvariantMeasurePackage T}
  (B : BirkhoffErgodicTheoremPackage T I) where
  almostSureConvergenceClosed : B.almostSureConvergence
  limitIsInvariantClosed : B.limitIsInvariant
  ergodicMeanEqualsSpaceAverageClosed : B.ergodicMeanEqualsSpaceAverage

def BirkhoffErgodicClosed {T : MeasurePreservingTransformation} {I : InvariantMeasurePackage T}
  (B : BirkhoffErgodicTheoremPackage T I) : Prop :=
  B.almostSureConvergence ∧ B.limitIsInvariant ∧ B.ergodicMeanEqualsSpaceAverage

theorem birkhoff_ergodic_closed_from_evidence
  {T : MeasurePreservingTransformation} {I : InvariantMeasurePackage T}
  (B : BirkhoffErgodicTheoremPackage T I) (E : BirkhoffErgodicEvidence B) :
  BirkhoffErgodicClosed B := by
  exact And.intro E.almostSureConvergenceClosed
    (And.intro E.limitIsInvariantClosed E.ergodicMeanEqualsSpaceAverageClosed)

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse