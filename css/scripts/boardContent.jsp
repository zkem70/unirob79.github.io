// 댓글 리스트
	    function getReply(){
	    	$.ajax({
    			url: "/expro/GetReply.do", // 요청 url
                type: "POST", // post 방식
                data: {
                	board_no : ${ content.board_no } // board_no의 값을 넘겨줌
                },
                success: function (json) { // 성공하였을 경우
                	json = json.replace(/\n/gi,"\\r\\n"); // 개행문자 대체
                	$("#replyList").text(""); // 댓글리스트 영역 초기화
                	var obj = JSON.parse(json); // service 클래스로 부터 전달된 문자열 파싱
                	var replyList = obj.replyList; // replyList는 전달된 json의 키값을 의미
                	var output = ""; // 댓글 목록을 누적하여 보여주기 위한 변수
                	for (var i = 0; i < replyList.length; i++) { // 반복문을 통해 output에 누적
   	                    output += "<div class='w3-border w3-padding'>";
    	                for (var j = 0; j < replyList[i].length; j++) {
    	                    var reply = replyList[i][j];
    	                    if(j === 0){
    	     					output += "<i class='fa fa-user'></i>&nbsp;&nbsp;" + reply.id + "&nbsp;&nbsp;";
    	                    }else if(j === 1){
    	     					output += "&nbsp;&nbsp;<i class='fa fa-calendar'></i>&nbsp;&nbsp;" + reply.reply_date;
    	                    }else if(j === 2){
    	     					output += "<pre>" + reply.reply_content + "</pre></div>";
    	                    }
    	                };
    	        	};
   	              	$("#replyList").html(output); // replyList 영역에 output 출력
   	              	$(".reply_count").html(i);
                }
	    	})
	    }
	    getReply(); // 해당 페이지 실행 시 해당 함수 호출
[출처] [JSP/JAVA] 홈페이지 만들기 8-1 - 댓글 기능(목록,  리스트) 구현(JSON / ajax)|작성자 JOKER