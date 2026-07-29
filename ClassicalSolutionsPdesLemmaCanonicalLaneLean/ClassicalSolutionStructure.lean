import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure ClassicalSolutionPackage where
  domain : Type u
  pdeOperator : Type v
  regularityClass : Type w
  aPrioriEstimate : Prop
  existenceInterval : Prop
  regularityClassDefined : regularityClass
  aPrioriEstimateTerm : aPrioriEstimate
  existenceIntervalTerm : existenceInterval

structure ClassicalSolutionEvidence (C : ClassicalSolutionPackage) where
  regularityClassClosed : C.regularityClassDefined = C.regularityClass
  aPrioriEstimateClosed : C.aPrioriEstimate
  existenceIntervalClosed : C.existenceInterval

def ClassicalSolutionClosed (C : ClassicalSolutionPackage) : Prop :=
  C.aPrioriEstimate ∧ C.existenceInterval

theorem classical_solution_closed_from_evidence (C : ClassicalSolutionPackage)
    (E : ClassicalSolutionEvidence C) : ClassicalSolutionClosed C :=
  And.intro E.aPrioriEstimateClosed E.existenceIntervalClosed

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse