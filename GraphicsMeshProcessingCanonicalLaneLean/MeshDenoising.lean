import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure BilateralFilterWeight where
  spatial : Float
  normal : Float

structure MeshDenoising where
  iterations : Nat
  filterWeights : List BilateralFilterWeight
  convergenceCriterion : Float
  normalsPreserved : Prop
  volumePreserved : Prop
  convergenceCriterionTerm : convergenceCriterion > 0.0
  normalsPreservedTerm : normalsPreserved
  volumePreservedTerm : volumePreserved

structure MeshDenoisingEvidence (D : MeshDenoising) where
  weightPositive : ∀ w ∈ D.filterWeights, w.spatial > 0.0 ∧ w.normal > 0.0
  convergenceReached : D.convergenceCriterion > 0.0
  normalsPreserved : D.normalsPreserved
  volumePreserved : D.volumePreserved

def MeshDenoisingClosed (D : MeshDenoising) : Prop :=
  (∀ w ∈ D.filterWeights, w.spatial > 0.0 ∧ w.normal > 0.0) ∧
  D.convergenceCriterion > 0.0 ∧
  D.normalsPreserved ∧
  D.volumePreserved

theorem mesh_denoising_closed_from_evidence (D : MeshDenoising) (E : MeshDenoisingEvidence D) : MeshDenoisingClosed D := by
  exact And.intro E.weightPositive (And.intro E.convergenceReached (And.intro E.normalsPreserved E.volumePreserved))

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse