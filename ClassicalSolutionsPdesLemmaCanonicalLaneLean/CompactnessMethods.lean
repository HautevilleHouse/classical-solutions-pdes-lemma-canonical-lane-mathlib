import ClassicalSolutionsPdesLemmaCanonicalLaneLean.SchauderTheory

/-!
# Compactness Methods Package
-/

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure CompactnessPackage {D : PdeDomainPackage}
    {R : RegularityPackage D} {S : SchauderPackage R} where
  arzelaAscoliEstimate : Prop
  aprioriCompactness : Prop
  limitFunctionRegular : Prop

def CompactnessEvidence {D : PdeDomainPackage}
    {R : RegularityPackage D} {S : SchauderPackage R}
    (C : CompactnessPackage S) : Prop :=
  C.arzelaAscoliEstimate ∧ C.aprioriCompactness ∧ C.limitFunctionRegular

def CompactnessClosed {D : PdeDomainPackage}
    {R : RegularityPackage D} {S : SchauderPackage R}
    (C : CompactnessPackage S) : Prop :=
  C.arzelaAscoliEstimate ∧ C.aprioriCompactness ∧ C.limitFunctionRegular

theorem compactness_closed_from_evidence {D : PdeDomainPackage}
    {R : RegularityPackage D} {S : SchauderPackage R}
    (C : CompactnessPackage S) (E : CompactnessEvidence C) :
    CompactnessClosed C := by
  exact And.intro E.arzelaAscoliEstimateClosed
    (And.intro E.aprioriCompactnessClosed E.limitFunctionRegularClosed)

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse
