package com.ssm.combine.service;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;
import org.springframework.stereotype.Service;

@Service("sendMesssageService")
public class SendMesssageService {
    public String sendCode(String telePhone)
    {
        String url="http://gw.api.taobao.com/router/rest";
        String appkey="23561852";
        String secret="105ca0b27141f74265d6e0dd205ba902";
        String code=getRandomCode(4);
        sendMessage(url, appkey, secret,telePhone,code);
        return code;
    }

    public void	 sendMessage(String url,String appkey,String secret,String telePhone,String code) {
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
        req.setExtend("123456");
        req.setSmsType("normal");
        req.setSmsFreeSignName("烟花易冷");
        req.setSmsParamString("{\"code\":\""+code+"\"}");
        req.setRecNum(telePhone);
        req.setSmsTemplateCode("SMS_33580432");
        AlibabaAliqinFcSmsNumSendResponse rsp=null;
        try {
            rsp = client.execute(req);
        } catch (ApiException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return;
        }
        System.out.println(rsp.getBody());
    }
    public String getRandomCode(int n) {
        String code="";
        for(int i=0;i<n;i++)
        {
            code+=(int)(Math.random()*10);
        }
        return code;
    }
    public static void main(String[] args) {

        new SendMesssageService().sendCode("18710896051");
    }
}