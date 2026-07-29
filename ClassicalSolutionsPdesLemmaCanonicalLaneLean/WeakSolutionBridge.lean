import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.PDE

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure WeakSolutionBridgePackage {A : AdmissibleClass}
    (P : PDEStrongSolutionPackage A) (R : RegularityEstimatesPackage P) where
  weakSolutionDefined : Prop
  weakToStrongRegularity : Prop
  approximationScheme : Prop
  convergenceInNorm : Prop

structure WeakSolutionBridgeEvidence {A : AdmissibleClass}
    {P : PDEStrongSolutionPackage A} {R : RegularityEstimatesPackage P}
    (W : WeakSolutionBridgePackage P R) where
  weakSolutionDefinedClosed : W.weakSolutionDefined
  weakToStrongRegularityClosed : W.weakToStrongRegularity
  approximationSchemeClosed : W.approximationScheme
  convergenceInNormClosed : W.convergenceInNorm

def WeakSolutionBridgeClosed {A : AdmissibleClass}
    {P : PDEStrongSolutionPackage A} {R : RegularityEstimatesPackage P}
    (W : WeakSolutionBridgePackage P R) : Prop :=
  W.weakSolutionDefined ∧ W.weakToStrongRegularity ∧ W.approximationScheme ∧ W.convergenceInNorm

theorem weak_solution_bridge_closed_from_evidence
    {A : AdmissibleClass} {P : PDEStrongSolutionPackage A} {R : RegularityEstimatesPackage P}
    (W : WeakSolutionBridgePackage P R) (E : WeakSolutionBridgeEvidence W) :
    WeakSolutionBridgeClosed W := by
  exact And.intro E.weakSolutionDefinedClosed
    (And.intro E.weakToStrongRegularityClosed
      (And.intro E.approximationSchemeClosed E.convergenceInNormClosed))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse