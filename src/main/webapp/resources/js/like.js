/**
 *  작성자 : 김사용
 *  like 기능
 */

 $(function(){
	$.ajax({
		
	url:"/noti/alarmCounts",
	 data:{userId:'${loginID}'}

	}).done(function(resp){
		console.log("rresp",resp)
		$("#ala").append(resp)
	})
})
$("#likeStar").on('click',function(){
	let businessName = '${list.businessName}'
	let sender = '${loginID}'
	let getter = "${list.seq}"
	let content = sender+" 님이 "+businessName+" 을  찜하였습니다."
	
	//let data ={seq:getter,content:sender+" 님이 좋아요를 눌렀습니다."}
	$.ajax({
		url:"/noti/likeAlarm",
		type:"post",
		data:{'seq':getter,'content':content},
		contentType:"application/json;charset=utf-8"
		
	}).done(function(resp){
		console.log(resp)
		if(socket){
			let scktMsg = "like,"+sender+","+getter+","+bno+","+"1";
			console.log(scktMsg);
			socket.send(scktMsg);
		}
	})
})
