part of website_app;

@Component(
    selector: 'style-guide',
    publishAs: 'ctrl',
    templateUrl: 'lib/components/styleguide.html',
    useShadowDom: false)
class StyleGuide implements AttachAware{
  bool _toggle = false;
  List<Element> _codeElements = [];
  List<Element> _snippets = [];

  StyleGuide(){
  }
  
  void attach() {
    if (_snippets.length == 0) {
      _createCodeSamples();
      _snippets = querySelectorAll('.auto-gen-code-snippet');
    }
  }
  
  bool get isToggle => _toggle;
  
  void clickToggle(){
    _toggle = !_toggle;
   
    attach();
    
   for(Element aElement in _snippets) {
      if (_toggle){
        if (!aElement.classes.contains("auto-gen-code-visible")) {
          aElement.classes.add("auto-gen-code-visible");
        }
      } else {
        if (aElement.classes.contains("auto-gen-code-visible")) {
          aElement.classes = aElement.classes.where((f) => f != "auto-gen-code-visible").toList();
          print("list:" +  aElement.classes.toString());
        }
        
      }
    }
  }
  
  void scrollTo(String iClass) {

    Element div = document.querySelector("."+iClass);
    
    if (div != null) {
      window.scrollTo(0, div.offsetTop);
    }
  }
  
  void _createCodeSamples(){
    _codeElements = document.querySelectorAll(".code-sample");
    
    for(Element aElement in _codeElements){
      List<Element> clonedElements = _getClonedNonTextElements(aElement);
     
      _beautifyElements(clonedElements);
     
      Element preElement = document.createElement('pre');
      Element codeElement = document.createElement('code');
      
      for (Element aCloneElement in clonedElements) {
        
        Element newElement = document.createElement("div");
        newElement.appendText(aCloneElement.outerHtml);
        codeElement.append(newElement);

        if (aCloneElement != clonedElements.last) {
          Element newReturnElement = document.createElement("div");
          newReturnElement.appendText("\n");
          codeElement.append(newReturnElement);
        }
        
        preElement.append(codeElement);
        preElement.classes.add('auto-gen-code-snippet');
        preElement.classes.add('container');

        var clearDiv = document.createElement('div');
        clearDiv.classes.add('clear');
        
        Node parent = aElement.parent;

        if (aElement.nextElementSibling != null) {
          parent.insertBefore(preElement, aElement.nextElementSibling);
        } else {
          parent.append(preElement);
        }

        parent.insertBefore(clearDiv, preElement);   
      }    
    }
  }
  
  List<Element> _getClonedNonTextElements(Element iElement) {
    List<Element> noTextChildElement = [];
    List<Element> childElements = iElement.children;
         
    for (Element aElement in childElements) {
      if (aElement.nodeType != 3) {
        // Found a valid child element
        noTextChildElement.add(aElement.clone(true));
      }
    }
    
    return noTextChildElement;
  }
  
  void _beautifyElements(List<Element> iElements) {       
    for (Element iElement in iElements) {
      _beautifyElement(iElement,0);
    }
  }
  
  void _beautifyElement(Element iElement, int depth) {
    List<Element> childNodes = iElement.children;
    String singleIndent = '    ';
    String currentDepthSpacing = '';

    for (var i = 0; i < depth; i++) {
      currentDepthSpacing += singleIndent;
    }
    
    String nextDepthSpacing = currentDepthSpacing + singleIndent;

    for (Node childElement in childNodes) {
      if (childElement.nodeType == 3) {
        // found a text node
        if (childElement.nodeValue.indexOf('\n') >= 0) {
          if (childElement != childNodes.last) {
            childElement.text += '\n' + nextDepthSpacing;
          } else {
            childElement.text += '\n' + currentDepthSpacing;
          }
        }
      } else {
        _beautifyElement(childElement, depth + 1);
      }
    }
  }

}