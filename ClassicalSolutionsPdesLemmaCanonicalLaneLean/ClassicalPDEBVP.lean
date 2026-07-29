import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure ClassicalPDEBVP where
  domain : Type u
  topology : TopologicalSpace domain
  boundary : Type v
  boundaryTopology : TopologicalSpace boundary
  pdeOperator : Type w
  sourceTerm : Type x
  boundaryCondition : Type y
  domainSmooth : Prop
  operatorElliptic : Prop
  boundaryRegular : Prop
  sourceCompatible : Prop

structure ClassicalPDEBVEvidence (P : ClassicalPDEBVP) where
  domainSmoothClosed : P.domainSmooth
  operatorEllipticClosed : P.operatorElliptic
  boundaryRegularClosed : P.boundaryRegular
  sourceCompatibleClosed : P.sourceCompatible

def ClassicalPDEBVClosed (P : ClassicalPDEBVP) : Prop :=
  P.domainSmooth ∧ P.operatorElliptic ∧ P.boundaryRegular ∧ P.sourceCompatible

theorem classical_pde_bv_closed_from_evidence (P : ClassicalPDEBVP) (E : ClassicalPDEBVEvidence P) :
    ClassicalPDEBVClosed P := by
  exact And.intro E.domainSmoothClosed
    (And.intro E.operatorEllipticClosed
      (And.intro E.boundaryRegularClosed E.sourceCompatibleClosed))

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse