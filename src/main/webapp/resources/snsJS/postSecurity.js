function infoSecurity(e) {
		let postNumber=e.id.substr(12);
		let securityVal;
		if(e.value=="전체 공개"){
			securityVal=0;
		}else if(e.value=="나만 보기"){
			securityVal=2;
		}else if(e.value=="친구 공개"){
			securityVal=1;
		}
		let securityData={
			"postNumber":postNumber,
			"securityVal":securityVal
		}
		$.ajaxSetup({
			beforeSend : function(xhr){
 			xhr.setRequestHeader(header,token);}
		});//먼저 보냄
		$.ajax({
				method:'post',
				url:"sns/post/security",
				data:securityData,
				dataType : "json"
		}).done((securityJson)=>{
   	          $('.info').text(securityJson.message)
    	         .fadeIn(400).delay(1000).fadeOut(400);
		});
	}