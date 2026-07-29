import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure ParabolicExistenceRegularity where
  parabolicOperator : Type u
  initialCondition : Type v
  boundaryCondition : Type w
  shortTimeExistence : Prop
  longTimeExistence : Prop
  regularityGain : Prop
  maximumPrinciple : Prop

structure ParabolicExistenceRegularityEvidence (P : ParabolicExistenceRegularity) where
  shortTimeExistenceClosed : P.shortTimeExistence
  longTimeExistenceClosed : P.longTimeExistence
  regularityGainClosed : P.regularityGain
  maximumPrincipleClosed : P.maximumPrinciple

def ParabolicExistenceRegularityClosed (P : ParabolicExistenceRegularity) : Prop :=
  P.shortTimeExistence ∧ P.longTimeExistence ∧
  P.regularityGain ∧ P.maximumPrinciple

theorem parabolic_existence_regularity_closed_from_evidence
    (P : ParabolicExistenceRegularity) (E : ParabolicExistenceRegularityEvidence P) :
    ParabolicExistenceRegularityClosed P := by
  exact And.intro E.shortTimeExistenceClosed
    (And.intro E.longTimeExistenceClosed
      (And.intro E.regularityGainClosed E.maximumPrincipleClosed))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse