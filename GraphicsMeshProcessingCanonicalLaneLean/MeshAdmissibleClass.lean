import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphicsMeshProcessingCanonicalLaneLean

structure MeshObject where
  vertices : Type
  faces : Type
  edgeConnectivity : Prop
  manifoldProperty : Prop
  conclusion : manifoldProperty

structure MeshAdmittedObject where
  object : MeshObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end GraphicsMeshProcessingCanonicalLaneLean
end HautevilleHouse
