import Foundation

#if (arch(i386) || arch(x86_64)) && os(iOS)
import libxmlSimu
#else
import libxml
#endif

extension NGEInventoryType {
    class func NGEInventoryTypeFromURL(url:NSURL) -> NGEInventoryType? {
        if let absoluteString = url.absoluteString, let s = NSString(string: absoluteString).utf8String {
            let reader = xmlReaderForFile( s, nil, 0/*options*/)
            
            if let reader = reader {
                let ret = xmlTextReaderRead(reader)
                if(ret == 1/*XML_READER_TYPE_ELEMENT*/) {
                    return NGEInventoryType(reader)
                }
                xmlFreeTextReader(reader)
            }
        }
        
        return nil
    }
    
    class func NGEInventoryTypeFromFile(path:String) -> NGEInventoryType? {
        let url = NSURL(fileURLWithPath:path)
        return self.NGEInventoryTypeFromURL(url: url)
    }
}

