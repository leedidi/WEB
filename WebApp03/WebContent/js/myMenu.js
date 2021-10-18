/**
 * myMenu.js
 */


/*
function myMenu1()
{
	
}

function myMenu2()
{
	
}
*/

function myMenu(status)
{
	var menu = document.getElementById("menuTable");
	
	if(status==1)
	{	
		// 확인
		//alert("1번 확인");
		menu.style.display = "block";
		//@ 메뉴 디스플레이 속성을 블럭단위로 구성하겠다.
	}
	else 
	{	
		// 확인
		//alert("2번 확인");
		menu.style.display = "none";
		//@ 메뉴 디스플레이 속성을 그리지 않겠다.
	}
}




