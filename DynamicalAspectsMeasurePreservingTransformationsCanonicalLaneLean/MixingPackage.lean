import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean.DynamicalSystemPackage

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure MixingPackage (D : DynamicalSystemPackage) where
  strongMixingProperty : Prop
  weakMixingProperty : Prop
  mixingCoefficient : Type u
  strongMixingPropertyTerm : strongMixingProperty
  weakMixingPropertyTerm : weakMixingProperty

structure MixingEvidence {D : DynamicalSystemPackage} (M : MixingPackage D) where
  strongMixingPropertyClosed : M.strongMixingProperty
  weakMixingPropertyClosed : M.weakMixingProperty

def MixingClosed {D : DynamicalSystemPackage} (M : MixingPackage D) : Prop :=
  M.strongMixingProperty ∧ M.weakMixingProperty

theorem mixing_closed_from_evidence {D : DynamicalSystemPackage}
    (M : MixingPackage D) (Ev : MixingEvidence M) : MixingClosed M := by
  exact And.intro Ev.strongMixingPropertyClosed Ev.weakMixingPropertyClosed

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse