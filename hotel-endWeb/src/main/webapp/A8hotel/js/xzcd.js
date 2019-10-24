function moveSelection($oFrom,$oTo){//?????
 if($oFrom.selectedIndex==-1){//????,???
  return;
 }
 
 var $arrTMP =new Array();

 for(var $i=$oFrom.length-1;$i>=0;$i--){//??
  if($oFrom.options[$i].selected){//??????
   $arrTMP[$arrTMP.length]=$oFrom.options[$i];
   $oFrom.options[$i]=null;//??
  }
 }
 
 for(var $i=$arrTMP.length-1;$i>=0;$i--){//??
  $oTo.options[$oTo.length]=new Option($arrTMP[$i].text,$arrTMP[$i].value);
 }
}

