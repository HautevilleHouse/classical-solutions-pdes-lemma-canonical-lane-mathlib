import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassicalSolutionsPdesLemmaCanonicalLaneLean

structure EnergyEstimatePackage where
  pdeType : Type u
  energyInequality : Prop
  coercivity : Prop
  energyInequalityTerm : energyInequality
  coercivityTerm : coercivity

structure EnergyEstimateEvidence (E : EnergyEstimatePackage) where
  energyInequalityClosed : E.energyInequality
  coercivityClosed : E.coercivity

def EnergyEstimateClosed (E : EnergyEstimatePackage) : Prop :=
  E.energyInequality ∧ E.coercivity

theorem energy_estimate_closed_from_evidence (E : EnergyEstimatePackage)
    (Ev : EnergyEstimateEvidence E) : EnergyEstimateClosed E :=
  And.intro Ev.energyInequalityClosed Ev.coercivityClosed

end ClassicalSolutionsPdesLemmaCanonicalLaneLean
end HautevilleHouse