
   //회원가입 유효성검사
   function signUp_validate() {
      
        var userId=$("#cid_");
        
        //아이디 유효성 소문자+숫자
        var regExpId = /^[a-z0-9]{4,12}$/;
      if(!regExpId.test(form1.cid_.value)) {
         alert("아이디는 소문자,숫자 4글자 이상,15자이하로 가능합니다");
         return false;
      }
      
      
        //비밀번호 빈칸
        if (form1.cpass.value=="" || form1.cpass2.value=="") {
            alert("비밀번호를 입력하지 않았습니다.")
            cpass2.focus()
            return false;
        }
        
        //비밀번호길이 6,20
        if(form1.cpass.value.length<6 || form1.cpass.value.length>20) {
             alert("비밀번호를 6자이상,20자이하로 입력해주세요")
             cpass.focus();
             return false;
          }

          // 아이디 != 비밀번호
        if (form1.cpass.value == form1.cid_.value) {
            alert("아이디와 비밀번호가 같습니다.")
            cpass.focus()
            return false;
        }
          
         //이름 유효성
         var namePattern = /^[가-힣]{2,10}$/;
        if(!namePattern.test(form1.cname.value)){
         alert("이름은 한글만 입력이 가능합니다..");
         cname.focus();
         return false;
      }
          
        //이름 빈칸
        if(form1.cname.value==""){
         alert("이름을 입력해 주십시오.");
         cname.focus();
         return false;
      }
        
         //생년월일 빈칸
        if(form1.cbirthYY.value=="" ||form1.cbirthMM.value=="" ||form1.cbirthDD.value==""){
         alert("생년월일을 입력해 주십시오.");
         cbirthYY.focus();
         return false;
      }
          //성별 빈칸
         if(!form1.cgender0.checked && !form1.cgender1.checked) {
            alert("성별을 선택해 주십시오.");
         form1.cgender0.focus();
         return false;
         }
        
        //이메일 빈칸
        if(form1.cemail.value==""){
         alert("이메일을 입력해 주십시오.");
         cemail.focus();
         return false;
      }
         //핸드폰 빈칸
        if(form1.cphone.value==""){
         alert("핸드폰번호를 입력해 주십시오.");
         cphone.focus();
         return false;
      }
      //주소 빈칸
        if(form1.postcode1.value=="" || form1.postcode2.value==""){
         alert("우편번호를 입력해주세요.");
         postcode1.focus();
         return false;
      }
      
        if(form1.address.value=="" || form1.address_etc.value==""){
         alert("상세주소를 입력해주세요.");
         address_etc.focus();
         return false;
      }
         
        
        return true;
    }
   

   function checkId() {
      var userId=$("#cid_").val().trim();
      if(!userId || userId.length<4) {
         alert("아이디를 4글자 이상가능합니다.");
         return;
      }
      
      var regExpId = /^[a-z0-9]{4,12}$/;
      if(!regExpId.test(form1.cid_.value)) {
         alert("아이디는 소문자,숫자 4글자 이상,15자이하로 가능합니다");
         return false;
      }
   }