import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure SpectralPackage {X : Type u} [MeasurableSpace X] (μ : Measure X) where
  koopmanOperator : (X → ℂ) → (X → ℂ)
  spectrum : Set ℂ
  spectralMeasure : Measure ℂ
  spectralDecomposition : Prop
  spectralMultiplicity : Prop

structure SpectralEvidence {X : Type u} [MeasurableSpace X] {μ : Measure X}
    (S : SpectralPackage μ) where
  spectralDecompositionClosed : S.spectralDecomposition
  spectralMultiplicityClosed : S.spectralMultiplicity

def SpectralClosed {X : Type u} [MeasurableSpace X] {μ : Measure X}
    (S : SpectralPackage μ) : Prop :=
  S.spectralDecomposition ∧ S.spectralMultiplicity

theorem spectral_closed_from_evidence
    {X : Type u} [MeasurableSpace X] {μ : Measure X}
    (S : SpectralPackage μ) (E : SpectralEvidence S) : SpectralClosed S := by
  exact And.intro E.spectralDecompositionClosed E.spectralMultiplicityClosed

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse