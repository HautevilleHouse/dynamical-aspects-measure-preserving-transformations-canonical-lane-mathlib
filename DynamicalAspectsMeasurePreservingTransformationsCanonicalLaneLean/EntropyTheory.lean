import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure Partition (X : MeasureSpace) where
  atoms : Set (Set X.carrier)
  measurable : ∀ a ∈ atoms, a ∈ X.sigmaAlgebra
  disjoint : ∀ a b ∈ atoms, a ≠ b → a ∩ b = ∅
  covers : ⋃₀ atoms = X.carrier

structure Entropy {X : MeasureSpace} (T : MeasurePreservingTransformation X X) where
  entropyOfPartition : Partition X → ℝ≥0
  kolmogorovSinaiEntropy : ℝ≥0
  entropyDefined : Prop
  entropyInvariant : Prop
  entropyMixingRelation : Prop

structure EntropyPackage {X : MeasureSpace} {T : MeasurePreservingTransformation X X} (E : Entropy T) where
  entropyFormula : Prop
  entropyUpperBound : Prop
  entropyLowerBound : Prop

structure EntropyEvidence {X : MeasureSpace} {T : MeasurePreservingTransformation X X} {E : Entropy T} (P : EntropyPackage E) where
  entropyFormulaClosed : P.entropyFormula
  entropyUpperBoundClosed : P.entropyUpperBound
  entropyLowerBoundClosed : P.entropyLowerBound

def EntropyClosed {X : MeasureSpace} {T : MeasurePreservingTransformation X X} {E : Entropy T} (P : EntropyPackage E) : Prop :=
  P.entropyFormula ∧ P.entropyUpperBound ∧ P.entropyLowerBound

theorem entropy_closed_from_evidence {X : MeasureSpace} {T : MeasurePreservingTransformation X X} {E : Entropy T} (P : EntropyPackage E) (ev : EntropyEvidence P) : EntropyClosed P := by
  exact And.intro ev.entropyFormulaClosed (And.intro ev.entropyUpperBoundClosed ev.entropyLowerBoundClosed)

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse