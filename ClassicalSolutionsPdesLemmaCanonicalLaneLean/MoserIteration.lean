import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure MoserIterationPackage where
  pdeClass : Type u
  harnackInequality : Prop
  supBound : Prop
  harnackInequalityTerm : harnackInequality
  supBoundTerm : supBound

structure MoserIterationEvidence (M : MoserIterationPackage) where
  harnackInequalityClosed : M.harnackInequality
  supBoundClosed : M.supBound

def MoserIterationClosed (M : MoserIterationPackage) : Prop :=
  M.harnackInequality ∧ M.supBound

theorem moser_iteration_closed_from_evidence (M : MoserIterationPackage)
    (E : MoserIterationEvidence M) : MoserIterationClosed M :=
  And.intro E.harnackInequalityClosed E.supBoundClosed

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse