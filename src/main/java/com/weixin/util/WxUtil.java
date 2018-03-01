package com.weixin.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.alibaba.fastjson.JSON;


public class WxUtil {

    private static Long lastAccessTime = null;
    private static String lastAccessToken = null;

    private static Long lastAccessTicketTime = null;
    private static String lastAccessTicket = null;


    public static String post2(String url, String content,CloseableHttpClient httpclient) throws ClientProtocolException, IOException {
        String r = null;
        try {
            HttpPost httpPost = new HttpPost(url);
            //  //System.out.println("executing request" + httpPost.getRequestLine());
            //中文不成功是因为没加编码
            StringEntity myEntity = new StringEntity(content, "utf-8");
            httpPost.setEntity(myEntity);
            CloseableHttpResponse response = httpclient.execute(httpPost);
            try {
                HttpEntity entity1 = response.getEntity();
                //    //System.out.println("----------------------------------------");
                //    //System.out.println(response.getStatusLine());
                if (entity1 != null) {
                    // //System.out.println("Response content length: " + entity1.getContentLength());
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(entity1.getContent()));

                    r = "";
                    String line;
                    while ((line = bufferedReader.readLine()) != null) {
                        r += line;
                    }
                }
                EntityUtils.consume(entity1);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                response.close();
            }
        } finally {
            httpclient.close();
        }
        return r;

    }


    public static String post(String url, String content) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(content);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(
                    new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            //System.out.println("发送 POST 请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输出流、输入流
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    public static String get(String url, String encode) throws Exception {
        CloseableHttpClient httpclient = HttpClients.createDefault();
        try {
            HttpGet httpGet = new HttpGet(url);
            CloseableHttpResponse response = httpclient.execute(httpGet);

            try {
                if (response.getStatusLine().getStatusCode() == 200) {
                    HttpEntity entity = response.getEntity();
                    return EntityUtils.toString(entity, encode);
                } else {
                    return response.getStatusLine().toString();
                }

            }
            catch(Exception ex)
            {
                if(httpGet != null)

                {
                    try{
                        httpGet.abort();
                    }
                    catch(Exception ex2)
                    {
                        ex2.printStackTrace();
                    }
                }
                ex.printStackTrace();
            }


            finally {
                if(response != null)
                {
                    try{
                        response.close();
                    }
                    catch(Exception ex)
                    {
                        ex.printStackTrace();
                    }
                }
            }
        } finally {
            if(httpclient != null)

            {
                try{
                    httpclient.close();
                }
                catch(Exception ex)
                {
                    ex.printStackTrace();
                }
            }
        }
        return null;
    }

    public static String getNonceStr(int length) {
        String base = "abcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < length; i++) {
            int number = random.nextInt(base.length());
            sb.append(base.charAt(number));
        }
        return sb.toString();
    }

    public static String getTimeStamp() {
        String time = System.currentTimeMillis() + "";
        return time.substring(0, 10);
    }

    public static boolean mapEntryIsNotNull(Map dataMap ,String key)
    {

        if(dataMap != null && dataMap.containsKey(key) && dataMap.get(key) != null && !"".equals(dataMap.get(key)))
        {
            return true;
        }
        else
            return false;
    }


    public static Map getShareParam(String url,String wx_appId,String wx_appSecret)
    {
        Map r = new HashMap();
        try
        {
            System.out.println(3333);
            //公众号id,key
            String timestamp =  getTimeStamp();
            String nonceStr =  getNonceStr(20);
            System.out.println(4444);
            Map signMap = Getsignature(nonceStr,timestamp,url,wx_appId,wx_appSecret);

            //	//System.out.print("\n signature param:appI:" + wx_appId + ",timestamp:" + timestamp + ",nonceStr:" + nonceStr + ",url:" + url +",signature:" + signature);
            r.put("appId", wx_appId);
            r.put("timestamp", timestamp);
            r.put("nonceStr", nonceStr);
            System.out.println(5555);
            if( mapEntryIsNotNull(signMap, "sign"))
                r.put("signature", signMap.get("sign"));
            else
                r.put("signature", null);
            if( mapEntryIsNotNull(signMap, "ticket"))
                r.put("ticket", signMap.get("ticket"));
            else
                r.put("ticket", null);
        }
        catch(Exception ex)
        {
            System.out.println(6666);
            ex.printStackTrace();
        }
        return r;

    }




    public static String SHA1(String str) {
        try {
            MessageDigest digest = MessageDigest
                    .getInstance("SHA-1"); //如果是SHA加密只需要将"SHA-1"改成"SHA"即可
            digest.update(str.getBytes());
            byte messageDigest[] = digest.digest();
            // Create Hex String
            StringBuffer hexStr = new StringBuffer();
            // 字节数组转换为 十六进制 数
            for (int i = 0; i < messageDigest.length; i++) {
                String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
                if (shaHex.length() < 2) {
                    hexStr.append(0);
                }
                hexStr.append(shaHex);
            }
            return hexStr.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }




    public static Map Getsignature(String nonceStr, String timespanstr,String url,String wx_appId,String wx_appSecret)
    {


        Map r = null;
        String ticketzj = Getjsapi_ticket(wx_appId,wx_appSecret);

        if(ticketzj != null)
        {
            String str = "jsapi_ticket=" + ticketzj + "&noncestr=" + nonceStr +
                    "&timestamp=" + timespanstr + "&url=" + url;// +"&wxref=mp.weixin.qq.com";

            String[] paramArr = new String[] { "jsapi_ticket=" + ticketzj,
                    "timestamp=" + timespanstr, "noncestr=" + nonceStr, "url=" + url };
            //	Arrays.sort(paramArr);
            // 将排序后的结果拼接成一个字符串
            String content = paramArr[0].concat("&"+paramArr[1]).concat("&"+paramArr[2])
                    .concat("&"+paramArr[3]);

//			str = "jsapi_ticket=" + "kgt8ON7yVITDhtdwci0qeWhQRTpLlZkHwmvWVAZgX5dqwZ8CqdPD23Hz1i-1SMdITcyFrtd95pjqhYaIcm4U3g" + "&noncestr=" + "ypxozuwnvbuivmfx669b" +
//            "&timestamp=" + "1489731622" + "&url=" +  "http://" + ConfigUtil.siteDomain2 + "/common.do?service=front.cn.zhangfen.task_mgr&urlParam={ghId:%27youp-tk%27}&code=031vebLT1Yn15a1EREMT1vrkLT1vebLt&state=1";
//
            String sign =SHA1(str);//DigestUtils.sha1Hex(str);
            r = new HashMap();
            r.put("sign", sign);
            r.put("ticket", ticketzj);
        }

        return r;
    }



    public static String Getjsapi_ticket(String wx_appId, String wx_appSecret)
    {
        String strjson = null;
        try{
            if(lastAccessTicketTime == null)
                lastAccessTicketTime = new Date().getTime();
            else
            {
                Long now = new Date().getTime();
                if(now - lastAccessTicketTime > 7200 * 1000) //2小时过期
                {
                    lastAccessTicketTime = new Date().getTime();
                }
                else if(lastAccessTicket != null)
                {
                    return lastAccessTicket;
                }
            }

            String accesstoken = GetAccessToken(wx_appId,wx_appSecret);
            if(accesstoken != null)
            {
                String urljson = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + accesstoken + "&type=jsapi";
                String srcString = get(urljson, "UTF-8");;

                if (srcString.contains("ticket"))
                {
                    Map ticketMap = JSON.parseObject(srcString, Map.class);
                    strjson = ticketMap.get("ticket").toString();
                    lastAccessTicket = strjson;
                }
            }
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return strjson;
    }

    public static String getSystemDateTime(String dateFormat) {
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        return sdf.format(new Date());
    }

    public static String GetAccessToken(String wx_appId, String wx_appSecret)
    {
        String ret = null;
        try
        {
            if(lastAccessTime == null)
                lastAccessTime = new Date().getTime();
            else
            {
                Long now = new Date().getTime();
                if(now - lastAccessTime > 7200 * 1000) //2小时过期
                {
                    lastAccessTime = new Date().getTime();
                }
                else if(lastAccessToken != null)
                {
                    return lastAccessToken;
                }
            }
            if(!("".equals(wx_appId) && "".equals(wx_appSecret)) || (wx_appId == null && wx_appSecret == null))
            {
                String url = "https://api.weixin.qq.com/cgi-bin/token?appid="+ wx_appId +"&secret="+ wx_appSecret  +"&grant_type=client_credential";

                //	//System.out.print("\n" +  getSystemDateTime("yyyy-MM-dd HH:mm:ss") + "\t access_token Url:" + url);

                String message = get(url, "UTF-8");

                System.out.print("\n" +  getSystemDateTime("yyyy-MM-dd HH:mm:ss") + "\t message:" + message);

                Map rJson = JSON.parseObject(message, Map.class);
                if( mapEntryIsNotNull(rJson, "access_token"))
                {
                    ret = rJson.get("access_token").toString();
                    lastAccessToken = ret;
                }
            }



        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
        return ret;
    }





}
