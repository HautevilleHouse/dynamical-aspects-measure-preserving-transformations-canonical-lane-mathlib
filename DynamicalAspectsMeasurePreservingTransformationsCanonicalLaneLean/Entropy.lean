import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure EntropyPackage {X : Type u} [MeasurableSpace X] (μ : Measure X) where
  partitionEntropy : (Set (Set X)) → ℝ
  metricEntropy : ℝ
  kolmogorovSinaiEntropy : ℝ
  entropyProduction : Prop
  entropyUpperBound : Prop

structure EntropyEvidence {X : Type u} [MeasurableSpace X] {μ : Measure X}
    (E : EntropyPackage μ) where
  entropyProductionClosed : E.entropyProduction
  entropyUpperBoundClosed : E.entropyUpperBound

def EntropyClosed {X : Type u} [MeasurableSpace X] {μ : Measure X}
    (E : EntropyPackage μ) : Prop :=
  E.entropyProduction ∧ E.entropyUpperBound

theorem entropy_closed_from_evidence
    {X : Type u} [MeasurableSpace X] {μ : Measure X}
    (E : EntropyPackage μ) (Ev : EntropyEvidence E) : EntropyClosed E := by
  exact And.intro Ev.entropyProductionClosed Ev.entropyUpperBoundClosed

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse