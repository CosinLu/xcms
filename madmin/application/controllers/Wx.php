<?php

/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 2017/3/2
 * Time: 9:48
 */
class Wx extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        //1.将timestamp，nonce，token按字段序排序
        $nonce = $this->input->get('nonce');
        $token = 'weixin';
        $timestamp = $this->input->get('timestamp');
        $echostr = $this->input->get('echostr');
        $signature = $this->input->get('signature');
        $arr = array($nonce, $timestamp, $token);
        sort($arr);
        //2.将排序后的三个参数拼接后用sha1加密
        $str = sha1(implode('', $arr));
        //3.将加密后的字符串与signature进行对比，判断该请求是否来自微信
        if ($str == $signature && $echostr) {
            //第一次接入weixin api接口的时候
            echo $echostr;
            exit;
        } else {
            $this->response_msg();
        }
    }

    //接收时间推送并回复
    public function response_msg()
    {
        //1.获取到微信推送过来的post数据(xml格式)
        $arr = $GLOBALS['HTTP_RAW_POST_DATA'];
        //2.处理消息类型并设置回复类型和内容
        /*<xml>
            <ToUserName><![CDATA[toUser]]></ToUserName>
            <FromUserName><![CDATA[FromUser]]></FromUserName>
            <CreateTime>123456789</CreateTime>
            <MsgType><![CDATA[event]]></MsgType>
            <Event><![CDATA[subscribe]]></Event>
        </xml>*/
        $obj = simplexml_load_string($arr);
        //判断该数据包是否是订阅的事件推送
        if (strtolower($obj->MsgType) == 'event') {
            //如果是关注 subscribe 事件
            if (strtolower($obj->Event) == 'subscribe') {
                //回复用户消息
                /*<xml>
                    <ToUserName><![CDATA[toUser]]></ToUserName>
                    <FromUserName><![CDATA[fromUser]]></FromUserName>
                    <CreateTime>12345678</CreateTime>
                    <MsgType><![CDATA[text]]></MsgType>
                    <Content><![CDATA[你好]]></Content>
                </xml>*/
                $toUserName = $obj->FromUserName;
                $fromUserName = $obj->ToUserName;
                $createTime = time();
                $msgType = 'text';
                $content = '你傻呀，你关注我的微信公众号';
                $template = '<xml>
                                <ToUserName><![CDATA[%s]]></ToUserName>
                                <FromUserName><![CDATA[%s]]></FromUserName>
                                <CreateTime>%s</CreateTime>
                                <MsgType><![CDATA[%s]]></MsgType>
                                <Content><![CDATA[%s]]></Content>
                            </xml>';
                $info = sprintf($template, $toUserName, $fromUserName, $createTime, $msgType, $content);
                echo $info;
            }
        }

        //根据关键词回复消息
        if (strtolower($obj->MsgType) == 'text') {
            //回复文本消息
            if (strtolower($obj->Content) == 'hello') {
                $toUserName = $obj->FromUserName;
                $fromUserName = $obj->ToUserName;
                $createTime = time();
                $msgType = 'text';
                $content = '尊敬的微信用户你好，恭喜你傻到家了！';
                $template = '<xml>
                                <ToUserName><![CDATA[%s]]></ToUserName>
                                <FromUserName><![CDATA[%s]]></FromUserName>
                                <CreateTime>%s</CreateTime>
                                <MsgType><![CDATA[%s]]></MsgType>
                                <Content><![CDATA[%s]]></Content>
                            </xml>';
                $info = sprintf($template, $toUserName, $fromUserName, $createTime, $msgType, $content);
                echo $info;
            }

            //回复图文消息
            if (strtolower($obj->Content) == 'list') {
                $toUserName = $obj->FromUserName;
                $fromUserName = $obj->ToUserName;
                $createTime = time();
                $msgType = 'news';
                $arrContent = array(
                    array(
                        'title' => '德州三生工作室',
                        'desc' => '企业官网',
                        'picUrl' => 'http://www.xuanyunet.com/uploads/20161223/2e83a96b77c25235eab52ba6549f201d.jpg',
                        'url' => 'http://www.xuanyunet.com/cases/show/1.html'
                    ),
                    array(
                        'title' => '北京鑫洲隆源商贸有限公司',
                        'desc' => '企业官网',
                        'picUrl' => 'http://www.xuanyunet.com/uploads/20161223/d71acfd1b510a47ae34a33df43c456b9.jpg',
                        'url' => 'http://www.xuanyunet.com/cases/show/2.html'
                    ),
                    array(
                        'title' => '亨通（北京）文化传媒有限公司',
                        'desc' => '企业官网',
                        'picUrl' => 'http://www.xuanyunet.com/uploads/20161223/39d88cf52d812e217d9c87476d27dc7f.jpg',
                        'url' => 'http://www.xuanyunet.com/cases/show/3.html'
                    )
                );
                $template = '<xml>
                                <ToUserName><![CDATA[%s]]></ToUserName>
                                <FromUserName><![CDATA[%s]]></FromUserName>
                                <CreateTime>%s</CreateTime>
                                <MsgType><![CDATA[%s]]></MsgType>
                                <ArticleCount>' . count($arrContent) . '</ArticleCount>
                                <Articles>';
                foreach ($arrContent as $val) {
                    $template .= '<item>
                                <Title><![CDATA[' . $val['title'] . ']]></Title> 
                                <Description><![CDATA[' . $val['desc'] . ']]></Description>
                                <PicUrl><![CDATA[' . $val['picUrl'] . ']]></PicUrl>
                                <Url><![CDATA[' . $val['url'] . ']]></Url>
                            </item>';
                }
                $template .= '</Articles>
                            </xml> ';
                $info = sprintf($template, $toUserName, $fromUserName, $createTime, $msgType, $content);
                echo $info;
            }
        }

    }

}