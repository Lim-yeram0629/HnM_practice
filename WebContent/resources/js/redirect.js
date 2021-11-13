function moveLocation(intent) {
	
	var movePath = "/1km";
	
	switch(intent){
		case "/" : movePath += "/"; break;
		case "login" : movePath += "/member/loginpage"; break;
		case "signin" : movePath += "/member/signin"; break;
		case "modify" : movePath += "/store/modify"; break;
		case "insertNotice" : movePath += "/notice/insert"; break;
		case "logout" : movePath += "/member/logout"; break;
	}
	console.log('111111');
	location.href = movePath;
}