import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure MeshTopologyPackage where
  vertices : Type u
  edges : Type v
  faces : Type w
  vertexPositions : vertices → Type x
  edgeConnectivity : Prop
  faceOrientation : Prop
  manifoldCondition : Prop
  orientableSurface : Prop

structure MeshTopologyEvidence (M : MeshTopologyPackage) where
  edgeConnectivityClosed : M.edgeConnectivity
  faceOrientationClosed : M.faceOrientation
  manifoldConditionClosed : M.manifoldCondition
  orientableSurfaceClosed : M.orientableSurface

def MeshTopologyClosed (M : MeshTopologyPackage) : Prop :=
  M.edgeConnectivity ∧ M.faceOrientation ∧ M.manifoldCondition ∧ M.orientableSurface

theorem mesh_topology_closed_from_evidence (M : MeshTopologyPackage) (E : MeshTopologyEvidence M) : MeshTopologyClosed M := by
  exact And.intro E.edgeConnectivityClosed
    (And.intro E.faceOrientationClosed
      (And.intro E.manifoldConditionClosed E.orientableSurfaceClosed))

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse