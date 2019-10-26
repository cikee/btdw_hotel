var isContralTime=true;
function sk_ts(a){
if(isContralTime)
	{
		if(document.getElementById(a).value.length!=0)
			setTimeout("tabText()",300);
	}
}
function tabText()
{
	document.getElementById("Submit").focus();
}
function focusText(a)
{
	document.getElementById(a).value="";
}