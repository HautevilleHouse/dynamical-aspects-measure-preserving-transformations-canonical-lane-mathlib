import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean.InvariantMeasurePackage
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean.BirkhoffErgodicTheorem

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure ErgodicDecompositionPackage (T : MeasurePreservingTransformation) (I : InvariantMeasurePackage T) where
  ergodicComponents : Type u
  componentMap : I.invariantMeasure.point → ergodicComponents
  eachComponentErgodic : Prop
  decompositionOfInvariantMeasures : Prop
  measureUniqueness : Prop
  
structure ErgodicDecompositionEvidence {T : MeasurePreservingTransformation} {I : InvariantMeasurePackage T}
  (D : ErgodicDecompositionPackage T I) where
  eachComponentErgodicClosed : D.eachComponentErgodic
  decompositionOfInvariantMeasuresClosed : D.decompositionOfInvariantMeasures
  measureUniquenessClosed : D.measureUniqueness

def ErgodicDecompositionClosed {T : MeasurePreservingTransformation} {I : InvariantMeasurePackage T}
  (D : ErgodicDecompositionPackage T I) : Prop :=
  D.eachComponentErgodic ∧ D.decompositionOfInvariantMeasures ∧ D.measureUniqueness

theorem ergodic_decomposition_closed_from_evidence
  {T : MeasurePreservingTransformation} {I : InvariantMeasurePackage T}
  (D : ErgodicDecompositionPackage T I) (E : ErgodicDecompositionEvidence D) :
  ErgodicDecompositionClosed D := by
  exact And.intro E.eachComponentErgodicClosed
    (And.intro E.decompositionOfInvariantMeasuresClosed E.measureUniquenessClosed)

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse