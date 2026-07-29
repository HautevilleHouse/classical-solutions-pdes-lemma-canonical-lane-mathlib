import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure NonlinearPDEExistence where
  nonlinearOperator : Type u
  fixedPointArgument : Prop
  aPrioriEstimates : Prop
  continuityMethod : Prop
  localExistence : Prop
  globalExistence : Prop

structure NonlinearPDEExistenceEvidence (N : NonlinearPDEExistence) where
  fixedPointArgumentClosed : N.fixedPointArgument
  aPrioriEstimatesClosed : N.aPrioriEstimates
  continuityMethodClosed : N.continuityMethod
  localExistenceClosed : N.localExistence
  globalExistenceClosed : N.globalExistence

def NonlinearPDEExistenceClosed (N : NonlinearPDEExistence) : Prop :=
  N.fixedPointArgument ∧ N.aPrioriEstimates ∧ N.continuityMethod ∧
  N.localExistence ∧ N.globalExistence

theorem nonlinear_pde_existence_closed_from_evidence
    (N : NonlinearPDEExistence) (E : NonlinearPDEExistenceEvidence N) :
    NonlinearPDEExistenceClosed N := by
  exact And.intro E.fixedPointArgumentClosed
    (And.intro E.aPrioriEstimatesClosed
      (And.intro E.continuityMethodClosed
        (And.intro E.localExistenceClosed E.globalExistenceClosed)))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse