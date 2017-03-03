$(function(){
    var mobnum = $('.u-mobile .f-text');
    var vernum = $('.verwrap .getvernum');
    var creapass = $('#creapass');
    var checkpass = $('#checkpass');
    var messver = $('.messver');
    var getvernum = $('.getvernum');
    var exist = false;
    var flag = true;
    creapass.blur(function(){
        var createpass = creapass.val();
        if(createpass==''){
            $('#native').css('display','none');
            creapass.siblings('.inline-tip').css('display','inline-block');
        }else if(createpass.length>0&&createpass.length<6){
            creapass.siblings('.inline-tip').html('<i class="tipstatus"></i>密码太短，至少6个字符');
            creapass.siblings('.inline-tip').css('display','inline-block');
        }else if(createpass.length>=6){
            creapass.siblings('.inline-tip').css('color','#fff');
            creapass.siblings('.inline-tip').children('.tipstatus').css('background-position','0  -451px');
        }
        
    });
    creapass.focus(function(){
        creapass.keyup();
    });
   
    checkpass.blur(function(){
        if(checkpass.val()==''){
                $('#native').css('display','none');
                $('#checkpass').siblings('.inline-tip').css('display','inline-block');
        }else if(checkpass.val()==creapass.val()){
                $('#checkpass').siblings('.inline-tip').css('color','#fff');
                $('#checkpass').siblings('.inline-tip').children('.tipstatus').css('background-position','0  -451px');
        }else{
      
        }
        
    });
    messver.blur(function(){
        if($('.messver').val()==''){
                $('#native').css('display','none');
                $(this).siblings('.inline-tip').css('display','inline-block');
        }
    });
    mobnum.blur(vermoblie);
    vernum.click(function(){
        $('.u-vbtn').css('display','block');
    });
    getvernum.click(function(){
    	smsCheck();
    	
    });
    
  //验证手机号
    function vermoblie(){
        if(mobnum.val()==''){
            $('#native').css('display','none');
            $(this).siblings('.inline-tip').css('display','inline-block');
        }else if(isPhoneNo(mobnum.val())==true&&mobnum.val().length==11){
        	
            if(checkPhoneIsExist()){
                $('#native').css('display','none');
                mobnum.siblings('.inline-tip').html('<i class="tipstatus"></i>该手机号已被绑定<a class="derictlogin" href="./login.jsp">请直接登录</a>')
                mobnum.siblings('.inline-tip').css('display','inline-block');
            }else{
                $('#native').css('display','none');//注册成功后全美团通用隐藏
                mobnum.siblings('.inline-tip').css('display','inline-block');
                mobnum.siblings('.inline-tip').css('color','#fff');
                mobnum.siblings('.inline-tip').children('.tipstatus').css('background-position','0  -451px');//出现对勾
            }
       
        }else{
             mobnum.siblings('.inline-tip').css('display','inline-block');
            $('#native').css('display','none');
        }
  }
  //验证手机号
    function isPhoneNo(phone) { 
        var pattern = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/; 
        return pattern.test(phone); 
    }
    $('#agreebtn').click(function(){
        if(mobnum.val()==''){
            $('#native').css('display','none');
            $('#phone').siblings('.inline-tip').css('display','inline-block');
            $('#agreebtn').attr('type','');
        }
        if($('.messver').val()==''){
            $('#native').css('display','none');
            $('#messver').siblings('.inline-tip').css('display','inline-block');
            $('#agreebtn').attr('type','');
        }
        if($('#creapass').val()==''){
            $('#native').css('display','none');
            $('#creapass').siblings('.inline-tip').css('display','inline-block');
            $('#agreebtn').attr('type','');
        }
        if($('#checkpass').val()==''){
            $('#native').css('display','none');
            $('#checkpass').siblings('.inline-tip').css('display','inline-block');
            $('#agreebtn').attr('type','');
        }
    
    });
    creapass.keyup(function(){
        var  inputpwd= $(this);
        
        if (!inputpwd.val()) {
            primary();
            return;
        }
        if (inputpwd.val().length < 6) {
            weak();
            return;
        }
        var  returnVal = checkPassword(inputpwd);
        if (returnVal < 1) {
            primary();
            return;
        }
        if (returnVal > 0 && returnVal < 2) {
            weak();
        } else if (returnVal >= 2 && returnVal < 4) {
            medium();
        } else if (returnVal >= 4) {
            tough();
        }
    });
    function checkPassword(pwdinput) {
        var maths, smalls, bigs, corps, cat, num;
        var str = $(pwdinput).val()
        var len = str.length;

        var cat = /.{16}/g
        if (len == 0) return 1;
        if (len > 16) { $(pwdinput).val(str.match(cat)[0]); }
        cat = /.*[\u4e00-\u9fa5]+.*$/
        if (cat.test(str)) {
            return -1;
        }
        cat = /\d/;
        var maths = cat.test(str);
        cat = /[a-z]/;
        var smalls = cat.test(str);
        cat = /[A-Z]/;
        var bigs = cat.test(str);
        var corps = corpses(pwdinput);
        var num = maths + smalls + bigs + corps;

        if (len < 6) { return 1; }

        if (len >= 6 && len <= 8) {
            if (num == 1) return 1;
            if (num == 2 || num == 3) return 2;
            if (num == 4) return 3;
        }

        if (len > 8 && len <= 11) {
            if (num == 1) return 2;
            if (num == 2) return 3;
            if (num == 3) return 4;
            if (num == 4) return 5;
        }

        if (len > 11) {
            if (num == 1) return 3;
            if (num == 2) return 4;
            if (num > 2) return 5;
        }
    }

    function corpses(pwdinput) {
        var cat = /./g
        var str = $(pwdinput).val();
        var sz = str.match(cat)
        for (var i = 0; i < sz.length; i++) {
            cat = /\d/;
            maths_01 = cat.test(sz[i]);
            cat = /[a-z]/;
            smalls_01 = cat.test(sz[i]);
            cat = /[A-Z]/;
            bigs_01 = cat.test(sz[i]);
            if (!maths_01 && !smalls_01 && !bigs_01) { return true; }
        }
        return false;
    }
    function  weak(){
        $('#weak').attr('class','pwstrength weak');
        $('#medium').attr('class','pwstrength primary');
        $('#advance').attr('class','pwstrength primary');
    }
    function  medium(){
        $('#weak').attr('class','pwstrength medium');
        $('#medium').attr('class','pwstrength medium');
        $('#advance').attr('class','pwstrength primary');
    }
    function tough(){
        $('#weak').attr('class','pwstrength tough');
        $('#medium').attr('class','pwstrength tough');
        $('#advance').attr('class','pwstrength tough');
    }
    function primary(){
        $('#weak').attr('class','pwstrength primary');
        $('#medium').attr('class','pwstrength primary');
        $('#advance').attr('class','pwstrength primary');
    }
    function checkPhoneIsExist(){
        
        var phone = document.getElementById("phone").value;
        var req = new XMLHttpRequest();
        req.open('POST','validate.jsp',true);
        req.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        req.send('phone=' + phone);

        req.onreadystatechange = function () {
         if (req.readyState == 4 && req.status == 200) {

            var response = req.responseText;
            
            if(response == 1){
            alert("用户不存在1");
            console.log(req.getAllResponseHeaders());
            exist = true;
            flag = false;
            
            }
            else if(response == 0){
            	alert("用户存在0");
            	flag = true;
               }
        }
         
    }
        return flag;
}
function smsCheck(){
	alert(exist);
    if(exist){
    	var phone = document.getElementById("phone").value;
        var req = new XMLHttpRequest();
        req.open('POST','servlet/smsUtil',true);
        req.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
        req.send('phone=' + phone);
        req.onreadystatechange = function () {
        if (req.readyState == 4 && req.status == 200) {
               var response = req.responseText;
               alert("验证码已经发送");
               console.log(req.getAllResponseHeaders());
         }
      }
    }

}           
  
       //   var phone = $("#phone").val();
       //   var flag = true;
       //   $.ajax(
       //    { url: "checkPhone?t=" + (new Date()).getTime(),
       //    {url: "checkPhone?t=" + (new Date()).getTime(),
       //      data:{},
       //      dataType:"json",
       //         type:"POST",
       //         async:false,
       //         success:function(data) {
       //         var status = data.status;
       //         if(status == "0"){
       //           flag = false;
       //         }
       //       }
       //  });
       //  return flag;
    
})
  
