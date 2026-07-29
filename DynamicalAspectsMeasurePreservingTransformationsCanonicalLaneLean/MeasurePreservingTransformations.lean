import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure MeasureSpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  measure : (Set carrier) → ℝ
  measureNonNull : ∀ s, measure s ≥ 0
  measureCountablyAdditive : ∀ (f : ℕ → Set carrier), Disjoint f → measure (⋃ n, f n) = ∑' n, measure (f n)
  measureOfEmpty : measure ∅ = 0

structure MeasurePreservingTransformation (X : MeasureSpace) (Y : MeasureSpace) where
  map : X.carrier → Y.carrier
  measurable : ∀ s ∈ Y.sigmaAlgebra, map⁻¹' s ∈ X.sigmaAlgebra
  measurePreserving : ∀ s ∈ Y.sigmaAlgebra, X.measure (map⁻¹' s) = Y.measure s

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse