var seckill ={
    URL:{
        now:function () {
            return 'seckill/time/now';
        },
        exposer:function (seckillId) {
            return 'seckill/'+seckillId+"/exposer";
        },
        execution:function (seckillId,md5) {
            return "seckill/"+seckillId+"/"+md5+"/execution";
        }

    },

    validatePhone:function(phone){
        if (phone && phone.length==11 && !isNaN(phone)){
            return true;
        } else{
            return false;
        }
    },

    handlerSeckill:function(seckillId,seckillBox){
        seckillBox.html('<button class="btn btn-primary btn-lg" id="killBtn">开始秒杀</button>');
        $.post(seckill.URL.exposer(seckillId),{},function (result) {
            if (result && result['success']){
                var exposer = result['result'];
                if (exposer['exposed']){
                    var md5 = exposer['md5'];
                    var killUrl = seckill.URL.execution(seckillId,md5);
                    console.log("killUrl:"+killUrl);
                    $('#killBtn').one('click',function () {
                        //先禁用按钮
                        $(this).addClass('disable');
                        //发送秒杀请求
                        $.post(killUrl,{},function (result) {
                            if (result){
                                var execution = result['result'];
                                var state = execution['state'];
                                var stateinfo = execution['stateinfo'];
                                seckillBox.html('<span class="label label-success">'+stateinfo+'</span>');
                            }
                        });
                    });
                }else {
                    var now = exposer['now'];
                    var start = exposer['start'];
                    var end = exposer['end'];
                    //重新计算计时逻辑
                    seckill.countdown(seckillId,now,start,end);
                }
            }else {
                console.log('result:',result);
            }
        })
    },

    countdown:function(seckillId,nowTime,startTime,endTime){
        var seckillBox= $('#seckill-box');
        if (nowTime>endTime){
            seckillBox.html("秒杀结束");
        } else if(nowTime<startTime){
            var killTime = new Date(startTime-0+1000);
            seckillBox.countdown(killTime,function (event) {
                var format = event.strftime('秒杀倒计时：%D天 %H时 %M分 %S秒');
                seckillBox.html(format);
            }).on('finish.countdown',function () {
                //获取秒杀地址，控制显示逻辑，执行秒杀
                seckill.handlerSeckill(seckillId,seckillBox);
            });
        }else {
            //执行秒杀
            seckill.handlerSeckill(seckillId,seckillBox);
        }
    },

    detail: {
        init: function (params) {
            var killPhone = $.cookie('killPhone');
            var seckillId = params['seckillId'];
            var startTime = params['startTime'];
            var endTime = params['endTime'];
            if (!seckill.validatePhone(killPhone)){
                var killPhoneModal = $('#killPhoneModal');
                killPhoneModal.modal({
                    show:true,
                    keyboard:false
                });
                $('#killPhoneBtn').click(function () {
                    var inputPhone = $('#killPhoneKey').val();
                    if (seckill.validatePhone(inputPhone)){
                        $.cookie('killPhone',inputPhone,{expires:7,path:'/seckill'});
                        window.location.reload();
                    }else{
                        $('#killPhoneMessage').html('<label class="label label-danger">手机号错误</label>').show(300);
                    }
                });
            }

            $.get(seckill.URL.now(),{},function (result) {
                if (result && result['success']){
                    var nowTime = result['result'];
                    seckill.countdown(seckillId,nowTime,startTime,endTime);
                }else {
                    console.log('result:'+result);
                }
            })
        }
    }
}