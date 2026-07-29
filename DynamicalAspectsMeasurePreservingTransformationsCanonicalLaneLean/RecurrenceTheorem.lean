import canonicalLaneMathlib.AdmissibleClass
import DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean.MeasureSpaceObjects

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure PoincareRecurrencePackage (X : MeasureSpace) (T : MeasurePreservingTransformation X) where
  recurrentSet : Set X.carrier
  fullMeasure : Prop
  backwardsInvariant : Prop
  infinitelyOften : Prop

structure PoincareRecurrenceEvidence {X : MeasureSpace} {T : MeasurePreservingTransformation X}
    (R : PoincareRecurrencePackage X T) where
  fullMeasureClosed : R.fullMeasure
  backwardsInvariantClosed : R.backwardsInvariant
  infinitelyOftenClosed : R.infinitelyOften

def PoincareRecurrenceClosed {X : MeasureSpace} {T : MeasurePreservingTransformation X}
    (R : PoincareRecurrencePackage X T) : Prop :=
  R.fullMeasure ∧ R.backwardsInvariant ∧ R.infinitelyOften

theorem poincare_recurrence_closed_from_evidence
    {X : MeasureSpace} {T : MeasurePreservingTransformation X}
    (R : PoincareRecurrencePackage X T) (Ev : PoincareRecurrenceEvidence R) :
    PoincareRecurrenceClosed R := by
  exact And.intro Ev.fullMeasureClosed
    (And.intro Ev.backwardsInvariantClosed Ev.infinitelyOftenClosed)

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse