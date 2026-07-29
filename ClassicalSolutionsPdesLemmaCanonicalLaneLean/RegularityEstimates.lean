import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.PDE

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure RegularityEstimatesPackage {A : AdmissibleClass}
    (P : PDEStrongSolutionPackage A) where
  holderContinuity : Prop
  sobolevEmbedding : Prop
  schauderEstimate : Prop
  energyEstimate : Prop

structure RegularityEstimatesEvidence {A : AdmissibleClass}
    {P : PDEStrongSolutionPackage A} (R : RegularityEstimatesPackage P) where
  holderContinuityClosed : R.holderContinuity
  sobolevEmbeddingClosed : R.sobolevEmbedding
  schauderEstimateClosed : R.schauderEstimate
  energyEstimateClosed : R.energyEstimate

def RegularityEstimatesClosed {A : AdmissibleClass}
    {P : PDEStrongSolutionPackage A} (R : RegularityEstimatesPackage P) : Prop :=
  R.holderContinuity ∧ R.sobolevEmbedding ∧ R.schauderEstimate ∧ R.energyEstimate

theorem regularity_estimates_closed_from_evidence
    {A : AdmissibleClass} {P : PDEStrongSolutionPackage A}
    (R : RegularityEstimatesPackage P) (E : RegularityEstimatesEvidence R) :
    RegularityEstimatesClosed R := by
  exact And.intro E.holderContinuityClosed
    (And.intro E.sobolevEmbeddingClosed
      (And.intro E.schauderEstimateClosed E.energyEstimateClosed))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse