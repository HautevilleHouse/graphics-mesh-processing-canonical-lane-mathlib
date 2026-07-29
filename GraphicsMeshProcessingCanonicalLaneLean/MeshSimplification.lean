import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure EdgeCollapseCandidate where
  edge : (Nat × Nat)
  qem : Float
  valid : Prop

structure MeshSimplification where
  collapseSequence : List EdgeCollapseCandidate
  preservedTopology : Prop
  errorBudget : Float
  fixedBoundary : Prop
  preservedTopologyTerm : preservedTopology
  fixedBoundaryTerm : fixedBoundary

structure MeshSimplificationEvidence (S : MeshSimplification) where
  collapsesValid : ∀ c ∈ S.collapseSequence, c.valid
  topologyPreserved : S.preservedTopology
  boundaryPreserved : S.fixedBoundary
  budgetAdhered : ∀ c ∈ S.collapseSequence, c.qem ≤ S.errorBudget

def MeshSimplificationClosed (S : MeshSimplification) : Prop :=
  (∀ c ∈ S.collapseSequence, c.valid) ∧
  S.preservedTopology ∧
  S.fixedBoundary ∧
  (∀ c ∈ S.collapseSequence, c.qem ≤ S.errorBudget)

theorem mesh_simplification_closed_from_evidence (S : MeshSimplification) (E : MeshSimplificationEvidence S) : MeshSimplificationClosed S := by
  exact And.intro E.collapsesValid (And.intro E.topologyPreserved (And.intro E.boundaryPreserved E.budgetAdhered))

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse