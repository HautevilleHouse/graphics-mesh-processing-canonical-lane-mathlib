import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure MeshCompressionPackage {M : MeshTopologyPackage} where
  originalSize : ℕ
  compressedSize : ℕ
  compressionRatio : ℝ
  distortionMetric : ℝ
  qualityMetric : ℝ
  algorithmType : String

structure MeshCompressionEvidence {M : MeshTopologyPackage}
    (C : MeshCompressionPackage M) where
  sizeReductionClosed : C.compressedSize < C.originalSize
  distortionBoundClosed : C.distortionMetric < 0.1

def MeshCompressionClosed {M : MeshTopologyPackage}
    (C : MeshCompressionPackage M) : Prop :=
  C.compressedSize < C.originalSize ∧ C.distortionMetric < 0.1

theorem mesh_compression_closed_from_evidence {M : MeshTopologyPackage}
    (C : MeshCompressionPackage M) (E : MeshCompressionEvidence C) :
    MeshCompressionClosed C := by
  exact And.intro E.sizeReductionClosed E.distortionBoundClosed

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse
