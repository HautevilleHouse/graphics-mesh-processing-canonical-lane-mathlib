import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure MeshSmoothingPackage {M : MeshTopologyPackage} where
  laplacianMatrix : M.vertexSet → M.vertexSet → ℝ
  diffusionStep : ℝ
  iterationCount : ℕ
  smoothnessMeasure : M.vertexSet → ℝ
  initialNoiseLevel : ℝ
  finalNoiseLevel : ℝ

structure MeshSmoothingEvidence {M : MeshTopologyPackage}
    (S : MeshSmoothingPackage M) where
  noiseReductionClosed : S.finalNoiseLevel ≤ S.initialNoiseLevel
  iterationBoundClosed : S.iterationCount > 0

def MeshSmoothingClosed {M : MeshTopologyPackage}
    (S : MeshSmoothingPackage M) : Prop :=
  S.finalNoiseLevel ≤ S.initialNoiseLevel ∧ S.iterationCount > 0

theorem mesh_smoothing_closed_from_evidence {M : MeshTopologyPackage}
    (S : MeshSmoothingPackage M) (E : MeshSmoothingEvidence S) :
    MeshSmoothingClosed S := by
  exact And.intro E.noiseReductionClosed E.iterationBoundClosed

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse
