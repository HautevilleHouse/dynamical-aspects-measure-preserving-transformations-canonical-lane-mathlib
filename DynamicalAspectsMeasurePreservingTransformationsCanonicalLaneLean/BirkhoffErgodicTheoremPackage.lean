import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean.ErgodicPackage

namespace HautevilleHouse
namespace DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean

structure BirkhoffErgodicTheoremPackage {D : DynamicalSystemPackage}
    (E : ErgodicPackage D) where
  timeAveragesExist : Prop
  timeAveragesEqualSpaceAverage : Prop
  convergenceInL1 : Prop
  convergenceAlmostEverywhere : Prop
  timeAveragesExistTerm : timeAveragesExist
  timeAveragesEqualSpaceAverageTerm : timeAveragesEqualSpaceAverage
  convergenceInL1Term : convergenceInL1
  convergenceAlmostEverywhereTerm : convergenceAlmostEverywhere

structure BirkhoffErgodicTheoremEvidence {D : DynamicalSystemPackage}
    {E : ErgodicPackage D} (B : BirkhoffErgodicTheoremPackage E) where
  timeAveragesExistClosed : B.timeAveragesExist
  timeAveragesEqualSpaceAverageClosed : B.timeAveragesEqualSpaceAverage
  convergenceInL1Closed : B.convergenceInL1
  convergenceAlmostEverywhereClosed : B.convergenceAlmostEverywhere

def BirkhoffErgodicTheoremClosed {D : DynamicalSystemPackage}
    {E : ErgodicPackage D} (B : BirkhoffErgodicTheoremPackage E) : Prop :=
  B.timeAveragesExist ∧ B.timeAveragesEqualSpaceAverage ∧
  B.convergenceInL1 ∧ B.convergenceAlmostEverywhere

theorem birkhoff_ergodic_theorem_closed_from_evidence
    {D : DynamicalSystemPackage} {E : ErgodicPackage D}
    (B : BirkhoffErgodicTheoremPackage E)
    (Ev : BirkhoffErgodicTheoremEvidence B) : BirkhoffErgodicTheoremClosed B := by
  exact And.intro Ev.timeAveragesExistClosed
    (And.intro Ev.timeAveragesEqualSpaceAverageClosed
      (And.intro Ev.convergenceInL1Closed Ev.convergenceAlmostEverywhereClosed))

end DynamicalAspectsMeasurePreservingTransformationsCanonicalLaneLean
end HautevilleHouse