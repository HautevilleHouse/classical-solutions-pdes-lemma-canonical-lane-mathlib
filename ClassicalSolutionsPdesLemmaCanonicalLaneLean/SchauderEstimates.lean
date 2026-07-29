import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure SchauderEstimates where
  holderExponent : ℝ
  interiorEstimate : Prop
  boundaryEstimate : Prop
  globalEstimate : Prop
  coefficientRegularity : Prop

structure SchauderEstimatesEvidence (S : SchauderEstimates) where
  interiorEstimateClosed : S.interiorEstimate
  boundaryEstimateClosed : S.boundaryEstimate
  globalEstimateClosed : S.globalEstimate
  coefficientRegularityClosed : S.coefficientRegularity

def SchauderEstimatesClosed (S : SchauderEstimates) : Prop :=
  S.interiorEstimate ∧ S.boundaryEstimate ∧
  S.globalEstimate ∧ S.coefficientRegularity

theorem schauder_estimates_closed_from_evidence (S : SchauderEstimates) (E : SchauderEstimatesEvidence S) :
    SchauderEstimatesClosed S := by
  exact And.intro E.interiorEstimateClosed
    (And.intro E.boundaryEstimateClosed
      (And.intro E.globalEstimateClosed E.coefficientRegularityClosed))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse