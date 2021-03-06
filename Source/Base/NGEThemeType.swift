import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

@objc
class NGEThemeType : NSObject{
    
    var `ThemeID`: String!
    
    var `ColorPalette`: NGEColorPaletteType?
    
    var `ButtonImageSet`: NGEButtonSetType?
    
    var `Fonts`: NGEFontsType?
    
    func readAttributes(_ reader: xmlTextReaderPtr) {
        
        if let attrValue = xmlTextReaderGetAttribute(reader, "ThemeID") {
            
            self.ThemeID = String(cString: attrValue)
            xmlFree(attrValue)
        }
    }
    
    init(_ reader: xmlTextReaderPtr) {
        let _complexTypeXmlDept = xmlTextReaderDepth(reader)
        super.init()
        
        self.readAttributes(reader)
        
        var _readerOk = xmlTextReaderRead(reader)
        var _currentNodeType = xmlTextReaderNodeType(reader)
        var _currentXmlDept = xmlTextReaderDepth(reader)
        
        while(_readerOk > 0 && _currentNodeType != 0/*XML_READER_TYPE_NONE*/ && _complexTypeXmlDept < _currentXmlDept) {
            var handledInChild = false
            if(_currentNodeType == 1/*XML_READER_TYPE_ELEMENT*/ || _currentNodeType == 3/*XML_READER_TYPE_TEXT*/) {
                if let _currentElementNameXmlChar = xmlTextReaderConstLocalName(reader) {
                    let _currentElementName = String(cString: _currentElementNameXmlChar)
                    if("ColorPalette" == _currentElementName) {
                        
                        self.ColorPalette = NGEColorPaletteType(reader)
                        handledInChild = true
                        
                    } else if("ButtonImageSet" == _currentElementName) {
                        
                        self.ButtonImageSet = NGEButtonSetType(reader)
                        handledInChild = true
                        
                    } else if("Fonts" == _currentElementName) {
                        
                        self.Fonts = NGEFontsType(reader)
                        handledInChild = true
                        
                    } else   if(true) {
                        print("Ignoring unexpected in NGEThemeType: \(_currentElementName)")
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
        
    }
    
}

