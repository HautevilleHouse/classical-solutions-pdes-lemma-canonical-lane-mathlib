import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure WeakSolutionPackage where
  functionSpace : Type u
  weakFormulation : Prop
  existenceResult : Prop
  regularityResult : Prop

structure WeakSolutionEvidence (W : WeakSolutionPackage) where
  weakFormulationClosed : W.weakFormulation
  existenceResultClosed : W.existenceResult
  regularityResultClosed : W.regularityResult

def WeakSolutionClosed (W : WeakSolutionPackage) : Prop :=
  W.weakFormulation ∧ W.existenceResult ∧ W.regularityResult

theorem weak_solution_closed_from_evidence (W : WeakSolutionPackage) (E : WeakSolutionEvidence W) : WeakSolutionClosed W := by
  exact And.intro E.weakFormulationClosed (And.intro E.existenceResultClosed E.regularityResultClosed)

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse