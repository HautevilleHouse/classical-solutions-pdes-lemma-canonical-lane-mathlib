import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.PDE

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure PDEStrongSolutionPackage (A : AdmissibleClass) where
  domainType : Type u
  boundaryConditions : Prop
  ellipticOperator : Prop
  strongSolutionExists : Prop
  strongSolutionRegularity : Prop
  strongSolutionUniqueness : Prop

structure PDEStrongSolutionEvidence {A : AdmissibleClass} (P : PDEStrongSolutionPackage A) where
  boundaryConditionsClosed : P.boundaryConditions
  ellipticOperatorClosed : P.ellipticOperator
  strongSolutionExistsClosed : P.strongSolutionExists
  strongSolutionRegularityClosed : P.strongSolutionRegularity
  strongSolutionUniquenessClosed : P.strongSolutionUniqueness

def PDEStrongSolutionClosed {A : AdmissibleClass} (P : PDEStrongSolutionPackage A) : Prop :=
  P.boundaryConditions ∧ P.ellipticOperator ∧ P.strongSolutionExists ∧ P.strongSolutionRegularity ∧ P.strongSolutionUniqueness

theorem pde_strong_solution_closed_from_evidence
    {A : AdmissibleClass} (P : PDEStrongSolutionPackage A) (E : PDEStrongSolutionEvidence P) :
    PDEStrongSolutionClosed P := by
  exact And.intro E.boundaryConditionsClosed
    (And.intro E.ellipticOperatorClosed
      (And.intro E.strongSolutionExistsClosed
        (And.intro E.strongSolutionRegularityClosed E.strongSolutionUniquenessClosed)))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse