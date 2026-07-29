import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean.DynamicalSystemPackage

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure SpectralPackage (D : DynamicalSystemPackage) where
  koopmanOperator : Type u
  spectrum : Type v
  spectralMeasure : Prop
  discreteSpectrum : Prop
  continuousSpectrum : Prop
  koopmanOperatorTerm : koopmanOperator
  spectralMeasureTerm : spectralMeasure
  discreteSpectrumTerm : discreteSpectrum
  continuousSpectrumTerm : continuousSpectrum

structure SpectralEvidence {D : DynamicalSystemPackage} (S : SpectralPackage D) where
  spectralMeasureClosed : S.spectralMeasure
  discreteSpectrumClosed : S.discreteSpectrum
  continuousSpectrumClosed : S.continuousSpectrum

def SpectralClosed {D : DynamicalSystemPackage} (S : SpectralPackage D) : Prop :=
  S.spectralMeasure ∧ S.discreteSpectrum ∧ S.continuousSpectrum

theorem spectral_closed_from_evidence {D : DynamicalSystemPackage}
    (S : SpectralPackage D) (Ev : SpectralEvidence S) : SpectralClosed S := by
  exact And.intro Ev.spectralMeasureClosed
    (And.intro Ev.discreteSpectrumClosed Ev.continuousSpectrumClosed)

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse