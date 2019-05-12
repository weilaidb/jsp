function showHide( id )
{
  var el= document.getElementById( id );//??<li>???id
  var bExpand = true;//???Action???
  var images = el.getElementsByTagName("IMG");//??<li></li>?????<IMG>??
  if (images[0].src.indexOf("minus.gif")!=-1)//?????????
  {
    bExpand = false;//??Action???
    images[0].src="images/plus.gif";//???????
  }else{
    images[0].src="images/minus.gif";//?????????
  }
  var subs=el.lastChild;//??<ul></ul>??
  if(bExpand)//?????
    subs.style.display="block";//??<ul></ul>?????
  else//?????
    subs.style.display="none";//??<ul></ul>?????
}

function getSubTree( id )
{
  var submitURL="treeview?parent="+id;
  postXmlHttp( submitURL, 'parseSubTree("'+id+'")' ,'load("'+id+'")');
}
function parseSubTree(id)
{
  var el= document.getElementById( id );//???id?<li>??
  var ulElmt= document.createElement("UL");//????<ul>??
  ulElmt.innerHTML=_xmlHttpRequestObj.responseText;//???????<ul>
  el.appendChild(ulElmt);//??????<li>???
  var images = el.getElementsByTagName("IMG");//??????
  images[0].setAttribute("src", "images/minus.gif");//???????????
  images[0].setAttribute("onclick", "showHide('"+id+"')");//???????onclick???showHide
  var aTag = el.getElementsByTagName("A");
  aTag[0].setAttribute("onclick", "showHide('"+id+"')");//?????onclick???showHide
  var loadDiv= document.getElementById( "load" );
  loadDiv.style.display="none";//????????????
}
function load(id)
{
 var loadDiv= document.getElementById( "load" );
 loadDiv.style.display="block";
}
var _postXmlHttpProcessPostChangeCallBack;
var _xmlHttpRequestObj;
var _loadingFunction;
function postXmlHttp( submitUrl, callbackFunc ,loadFunc)
{
  _postXmlHttpProcessPostChangeCallBack = callbackFunc;
  _loadingFunction = loadFunc;
  if(window.createRequest)
  {
    try{
      _xmlHttpRequestObj=window.createRequest();
      _xmlHttpRequestObj.open('POST',submitUrl,true);
      _xmlHttpRequestObj.onreadystatechange=postXmlHttpProcessPostChange;
      _xmlHttpRequestObj.send();
    }
    catch(ee){}
  }
  else if(window.XMLHttpRequest)
  {
    _xmlHttpRequestObj=new XMLHttpRequest();
    _xmlHttpRequestObj.overrideMimeType('text/xml');
    _xmlHttpRequestObj.open('POST',submitUrl,true);
    _xmlHttpRequestObj.onreadystatechange=postXmlHttpProcessPostChange;
    _xmlHttpRequestObj.send("");
  }
  else if(window.ActiveXObject)
  {
    _xmlHttpRequestObj=new ActiveXObject("Microsoft.XMLHTTP");
    _xmlHttpRequestObj.open('POST',submitUrl,true);
    _xmlHttpRequestObj.onreadystatechange=postXmlHttpProcessPostChange;
    _xmlHttpRequestObj.send();
  }
};

function postXmlHttpProcessPostChange( )
{
  if( _xmlHttpRequestObj.readyState==4 && _xmlHttpRequestObj.status==200 )
  {
    setTimeout( _postXmlHttpProcessPostChangeCallBack, 2 );
  }
  if ( _xmlHttpRequestObj.readyState==1 )
  {
    setTimeout( _loadingFunction, 2 );
  }
}