			var sel_files = [];


			var isEmpty = function(value){ 
				if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ) {
					 return true 
				}
				else {
				     return false
				 } 
			};
			// 파일 선택 변화가 있을 시 
            $(document).ready(function() {
                $("#input_imgs").on("change", handleImgFileSelect);
            }); 

            // 파일 선택시
            function fileUploadAction() {
                console.log("fileUploadAction");
                $("#input_imgs").trigger('click');
            }

            // 파일 이미지 보여주기
            function handleImgFileSelect(e) {

                // 이미지 정보들을 초기화
                sel_files = [];
                $(".imgs_list").empty();

                var files = e.target.files;
                var filesArr = Array.prototype.slice.call(files);

                var index = 0;
                filesArr.forEach(function(f) {
                    if(!f.type.match("image.*")) {
                        alert("확장자는 이미지 확장자만 가능합니다.");
                        return;
                    }

                    sel_files.push(f);

                    var reader = new FileReader();
                    reader.onload = function(e) {

                         var html = "<li class='img_li'><a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a></li>";

                        $(".imgs_list").append(html);
                        index++;

                    }
                    reader.readAsDataURL(f);
                    
                });
            }
		// 선택한 이미지 삭제
        function deleteImageAction(index) {            
            console.log("index : "+index);
            sel_files.splice(index, 1);
 
            var img_id = "#img_id_"+index;
            $(img_id).remove();
 
            console.log(sel_files);
        }

        
		// 상품 등록 버튼 눌렀을 시 
		
    	$("#btn_insert").click(function() {
    		var formData = new FormData();
    		var file_info = "";
    		var inputFile = $("input[name='file_list']");
    		var files = inputFile[0].files;
			console.log("파일 목록"+files);
    		
    		
    		if(isEmpty($('#pro_category').val())) {
    			alert("카테고리를 선택해주세요");
    		}
    		else if(isEmpty($('#pro_name').val())) {
    			alert("상품명을 입력해주세요 ");
    		}
    		else if(isEmpty($('#pro_com').val())) {
    			alert("제조사를 입력해주세요 ");
    		}
    		else if(isEmpty($('#pro_price').val())) {
    			alert("상품 가격을 입력해주세요");
    		}
    		else if(isEmpty($('#pro_info').val())) {
    			alert("상품 설명을 입력해주세요");
    		}
    		else if(isEmpty($('#pro_stock').val())) {
    			alert("수량을 입력해주세요");
    		}
    		else {
    			
    		
    			for(var i = 0 ; i < files.length ; i++) {
    				formData.append("files",files[i]);
    			}
    			formData.append("table_name","product");
    			console.log(formData);
    			$.ajax({
    				url : '/file/upload',
    				processData : false,
    				contentType : false,
    				data : formData,
    				type : 'POST' ,
    				dataType : 'JSON',
    				success : function(result) { 
    					
    					console.log(result);
    					console.log((result[0].fid));
    					for(var i = 0; i< result.length ; i++) {
    						file_info += "<input type = 'hidden' name ='fileList["+i+"].file_name' value='"+result[i].file_name+"'>";	
    						file_info += "<input type = 'hidden' name ='fileList["+i+"].file_real_name' value='"+result[i].file_real_name+"'>";	
    						file_info += "<input type = 'hidden' name ='fileList["+i+"].file_path' value='"+result[i].file_path+"'>";		
    						file_info += "<input type = 'hidden' name ='fileList["+i+"].table_name' value='"+result[i].table_name+"'>";		
    					}
    					console.log(file_info);
						$("#insert_form").append(file_info).submit();
    					
    					
    				}
    			});
    		}
    	});
		
		