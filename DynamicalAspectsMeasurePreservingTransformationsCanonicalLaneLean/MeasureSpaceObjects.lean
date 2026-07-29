import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure MeasureSpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  measure : carrier → ℝ
  sigmaAlgebraClosed : Prop
  measureNonnegative : ∀ s, measure s ≥ 0
  measureEmpty : measure ∅ = 0
  measureCountablyAdditive : Prop

structure MeasurableMap (X Y : MeasureSpace) where
  toFun : X.carrier → Y.carrier
  measurable : ∀ s ∈ Y.sigmaAlgebra, toFun⁻¹' s ∈ X.sigmaAlgebra

structure MeasurePreservingTransformation (X : MeasureSpace) where
  map : MeasurableMap X X
  preservesMeasure : ∀ s ∈ X.sigmaAlgebra, X.measure (map.toFun⁻¹' s) = X.measure s

structure AdmittedDynamicalObject where
  space : MeasureSpace
  transformation : MeasurePreservingTransformation space
  invariantSigmaAlgebra : Set (Set space.carrier)
  ergodicComponentDecomposition : Prop
  conclusion : ergodicComponentDecomposition

def DynamicalWitnessClosed (O : AdmittedDynamicalObject) : Prop :=
  O.ergodicComponentDecomposition

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse