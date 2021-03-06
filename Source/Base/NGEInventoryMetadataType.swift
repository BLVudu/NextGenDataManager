import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEInventoryMetadataType : NSObject{
    
    var `ContentID`: String!
    
    var `ContainerReferenceList`: [NGEContainerReference]?
    
    var `BasicMetadata`: NGEBasicMetadataType?
    
    var `AliasList`: [NGEInventoryMetadataAliasType]?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "ContentID") {
            
            self.ContentID = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var ContainerReferenceListArray = [NGEContainerReference]()
        
        var AliasListArray = [NGEInventoryMetadataAliasType]()
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("ContainerReference" == _currentElementName) {
                        
                        ContainerReferenceListArray.append(NGEContainerReference(reader))
                        handledInChild = true
                        
                    } else if("BasicMetadata" == _currentElementName) {
                        
                        self.BasicMetadata = NGEBasicMetadataType(reader)
                        handledInChild = true
                        
                    } else if("Alias" == _currentElementName) {
                        
                        AliasListArray.append(NGEInventoryMetadataAliasType(reader))
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEInventoryMetadataType: \(_currentElementName)")
                        if superclass != NSObject.self {
                            break
                        }
                    }
                }
            }
            _readerOk = handledInChild ? xmlTextReaderReadState(reader) : xmlTextReaderRead(reader)
            _currentNodeType = xmlTextReaderNodeType(reader)
            _currentXmlDept = xmlTextReaderDepth(reader)
        }
        
        if(ContainerReferenceListArray.count > 0) { self.ContainerReferenceList = ContainerReferenceListArray }
        
        if(AliasListArray.count > 0) { self.AliasList = AliasListArray }
    }
    
}

