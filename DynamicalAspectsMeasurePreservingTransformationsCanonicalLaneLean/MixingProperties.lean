import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure MixingProperty where
  strongMixing : Prop
  weakMixing : Prop
  mixingCoefficient : ℝ → Prop
  correlationDecay : Prop

def MixingClosed (M : MixingProperty) : Prop :=
  M.strongMixing ∧ M.weakMixing

theorem mixing_closed_from_evidence (M : MixingProperty) (h : M.strongMixing ∧ M.weakMixing) : MixingClosed M := h

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse
