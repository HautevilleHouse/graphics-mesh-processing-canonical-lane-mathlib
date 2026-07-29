import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure PrimitiveTriangle where
  indices : List Nat
  normal : (Float × Float × Float)

structure PrimitiveMeshVertex where
  position : (Float × Float × Float)
  normal : (Float × Float × Float)
  uv : (Float × Float)

structure PrimitiveMeshFace where
  vertices : List Nat
  materialIndex : Nat

structure PrimitiveMeshGeometry where
  vertices : List PrimitiveMeshVertex
  faces : List PrimitiveMeshFace
  triangles : List PrimitiveTriangle
  boundingBox : (Float × Float × Float × Float × Float × Float)
  closed : Prop
  watertight : Prop
  closedTerm : closed
  watertightTerm : watertight

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse