import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure MeshGeometry where
  vertexPositions : Type u
  vertexNormals : Type v
  indices : Type w
  geometryClosed : Prop

definition meshGeometryClosed (M : MeshGeometry) : Prop :=
  M.geometryClosed

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse