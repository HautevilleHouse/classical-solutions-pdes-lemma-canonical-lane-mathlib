import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure ParabolicPdeEstimatePackage where
  equationType : Type u
  holderEstimate : Prop
  schauderEstimate : Prop
  maximumPrinciple : Prop

structure ParabolicPdeEstimateEvidence (P : ParabolicPdeEstimatePackage) where
  holderEstimateClosed : P.holderEstimate
  schauderEstimateClosed : P.schauderEstimate
  maximumPrincipleClosed : P.maximumPrinciple

def ParabolicPdeEstimateClosed (P : ParabolicPdeEstimatePackage) : Prop :=
  P.holderEstimate ∧ P.schauderEstimate ∧ P.maximumPrinciple

theorem parabolic_pde_estimate_closed_from_evidence (P : ParabolicPdeEstimatePackage) (E : ParabolicPdeEstimateEvidence P) : ParabolicPdeEstimateClosed P := by
  exact And.intro E.holderEstimateClosed (And.intro E.schauderEstimateClosed E.maximumPrincipleClosed)

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse