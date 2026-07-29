import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure SpectralMeasurePackage where
  hilbertSpace : Type u
  unitaryOperator : hilbertSpace → hilbertSpace
  spectralMeasure : Prop
  spectralTheorem : Prop

def SpectralClosed (S : SpectralMeasurePackage) : Prop :=
  S.spectralMeasure ∧ S.spectralTheorem

theorem spectral_closed_from_evidence (S : SpectralMeasurePackage) (h : S.spectralMeasure ∧ S.spectralTheorem) : SpectralClosed S := h

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse
