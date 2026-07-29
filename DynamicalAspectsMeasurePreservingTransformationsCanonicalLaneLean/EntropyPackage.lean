import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean.DynamicalSystemPackage

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure EntropyPackage (D : DynamicalSystemPackage) where
  measureTheoreticEntropy : Type u
  topologicalEntropy : Type v
  kolmogorovSinaiEntropy : Prop
  variationalPrinciple : Prop
  kolmogorovSinaiEntropyTerm : kolmogorovSinaiEntropy
  variationalPrincipleTerm : variationalPrinciple

structure EntropyEvidence {D : DynamicalSystemPackage} (E : EntropyPackage D) where
  kolmogorovSinaiEntropyClosed : E.kolmogorovSinaiEntropy
  variationalPrincipleClosed : E.variationalPrinciple

def EntropyClosed {D : DynamicalSystemPackage} (E : EntropyPackage D) : Prop :=
  E.kolmogorovSinaiEntropy ∧ E.variationalPrinciple

theorem entropy_closed_from_evidence {D : DynamicalSystemPackage}
    (E : EntropyPackage D) (Ev : EntropyEvidence E) : EntropyClosed E := by
  exact And.intro Ev.kolmogorovSinaiEntropyClosed Ev.variationalPrincipleClosed

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse