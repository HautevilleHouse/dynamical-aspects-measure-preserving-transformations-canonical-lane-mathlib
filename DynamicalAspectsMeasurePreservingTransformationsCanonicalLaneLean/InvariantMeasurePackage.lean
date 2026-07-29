import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure MeasureSpace where
  point : Type u
  sigmaAlgebra : Set (Set point)
  measure : point → ℝ
  sigmaAdditive : Prop
  measureNonnegative : ∀ s, measure s ≥ 0
  measureEmpty : measure ∅ = 0
  
structure MeasurePreservingTransformation where
  source : MeasureSpace
  target : MeasureSpace
  map : source.point → target.point
  measurable : ∀ s ∈ target.sigmaAlgebra, map⁻¹' s ∈ source.sigmaAlgebra
  measurePreserving : ∀ s ∈ target.sigmaAlgebra, source.measure (map⁻¹' s) = target.measure s

structure InvariantMeasurePackage (T : MeasurePreservingTransformation) where
  invariantMeasure : MeasureSpace
  invariantSigmaAlgebra : Set (Set invariantMeasure.point)
  invariantMeasureIsInvariant : ∀ s ∈ invariantSigmaAlgebra, T.measurePreserving s
  ergodicComponents : Type v
  ergodicDecomposition : Prop
  
end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse