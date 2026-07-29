import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure KoopmanOperator {X : MeasureSpace} (T : MeasurePreservingTransformation X X) where
  operator : (X.carrier → ℂ) → (X.carrier → ℂ)
  action : ∀ (f : X.carrier → ℂ), operator f = f ∘ T.map
  isometry : ∀ f, ∫ x, |operator f x|^2 dμ = ∫ x, |f x|^2 dμ
  spectralProperties : Prop

structure KoopmanPackage {X : MeasureSpace} {T : MeasurePreservingTransformation X X} (K : KoopmanOperator T) where
  spectralTheorem : Prop
  discreteSpectrum : Prop
  continuousSpectrum : Prop

structure KoopmanEvidence {X : MeasureSpace} {T : MeasurePreservingTransformation X X} {K : KoopmanOperator T} (P : KoopmanPackage K) where
  spectralTheoremClosed : P.spectralTheorem
  discreteSpectrumClosed : P.discreteSpectrum
  continuousSpectrumClosed : P.continuousSpectrum

def KoopmanClosed {X : MeasureSpace} {T : MeasurePreservingTransformation X X} {K : KoopmanOperator T} (P : KoopmanPackage K) : Prop :=
  P.spectralTheorem ∧ P.discreteSpectrum ∧ P.continuousSpectrum

theorem koopman_closed_from_evidence {X : MeasureSpace} {T : MeasurePreservingTransformation X X} {K : KoopmanOperator T} (P : KoopmanPackage K) (ev : KoopmanEvidence P) : KoopmanClosed P := by
  exact And.intro ev.spectralTheoremClosed (And.intro ev.discreteSpectrumClosed ev.continuousSpectrumClosed)

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse