import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure ClassicalSolutionExistencePackage where
  domain : Type u
  boundaryConditions : Prop
  initialCondition : Prop
  pdeOperator : Prop
  smoothnessClass : Nat
  existenceProof : Prop
  regularityProof : Prop
  uniquenessProof : Prop
  stabilityProof : Prop

structure ClassicalSolutionExistenceEvidence (C : ClassicalSolutionExistencePackage) where
  boundaryConditionsClosed : C.boundaryConditions
  initialConditionClosed : C.initialCondition
  pdeOperatorClosed : C.pdeOperator
  existenceProofClosed : C.existenceProof
  regularityProofClosed : C.regularityProof
  uniquenessProofClosed : C.uniquenessProof
  stabilityProofClosed : C.stabilityProof

def ClassicalSolutionExistenceClosed (C : ClassicalSolutionExistencePackage) : Prop :=
  C.boundaryConditions ∧ C.initialCondition ∧ C.pdeOperator ∧
  C.existenceProof ∧ C.regularityProof ∧ C.uniquenessProof ∧ C.stabilityProof

theorem classical_solution_existence_closed_from_evidence
    (C : ClassicalSolutionExistencePackage)
    (E : ClassicalSolutionExistenceEvidence C) :
    ClassicalSolutionExistenceClosed C := by
  exact And.intro E.boundaryConditionsClosed
    (And.intro E.initialConditionClosed
      (And.intro E.pdeOperatorClosed
        (And.intro E.existenceProofClosed
          (And.intro E.regularityProofClosed
            (And.intro E.uniquenessProofClosed E.stabilityProofClosed)))))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse