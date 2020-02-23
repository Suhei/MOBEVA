<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="x-admin-sm">
    
    <head>
        <meta charset="utf-8">
        <title>歡迎頁面-X-admin2.2</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="stylesheet" href="./css/font.css">
        <link rel="stylesheet" href="./css/xadmin.css">
        <script src="./lib/layui/layui.js" charset="utf-8"></script>
        <script type="text/javascript" src="./js/xadmin.js"></script>
    </head>
    
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首頁</a>
                <a href="">演示</a>
                <a>
                    <cite>導航元素</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="重新整理">
                <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
            </a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5">
                                <div class="layui-input-inline layui-show-xs-block">
                                    <input class="layui-input" placeholder="開始日" name="start" id="start"></div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <input class="layui-input" placeholder="截止日" name="end" id="end"></div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <select name="contrller">
                                        <option>支付方式</option>
                                        <option>支付寶</option>
                                        <option>微信</option>
                                        <option>貨到付款</option></select>
                                </div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <select name="contrller">
                                        <option value="">訂單狀態</option>
                                        <option value="0">待確認</option>
                                        <option value="1">已確認</option>
                                        <option value="2">已收貨</option>
                                        <option value="3">已取消</option>
                                        <option value="4">已完成</option>
                                        <option value="5">已作廢</option></select>
                                </div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <input type="text" name="username" placeholder="請輸入訂單號" autocomplete="off" class="layui-input"></div>
                                <div class="layui-input-inline layui-show-xs-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="sreach">
                                        <i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()">
                                <i class="layui-icon"></i>批量刪除</button>
                            <button class="layui-btn" onclick="xadmin.open('新增使用者','./order-add.html',800,600)">
                                <i class="layui-icon"></i>新增</button></div>
                        <div class="layui-card-body ">
                            <table class="layui-table layui-form">
                                <thead>
                                    <tr>
                                        <th>
                                            <input type="checkbox" name="" lay-skin="primary">
                                        </th>
                                        <th>訂單編號</th>
                                        <th>收貨人</th>
                                        <th>總金額</th>
                                        <th>應付金額</th>
                                        <th>訂單狀態</th>
                                        <th>支付狀態</th>
                                        <th>發貨狀態</th>
                                        <th>支付方式</th>
                                        <th>配送方式</th>
                                        <th>下單時間</th>
                                        <th>操作</th></tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="" lay-skin="primary"></td>
                                        <td>2017009171822298053</td>
                                        <td>老王:18925139194</td>
                                        <td>7829.10</td>
                                        <td>7854.10</td>
                                        <td>待確認</td>
                                        <td>未支付</td>
                                        <td>未發貨</td>
                                        <td>其他方式</td>
                                        <td>申通物流</td>
                                        <td>2017-08-17 18:22</td>
                                        <td class="td-manage">
                                            <a title="檢視" onclick="xadmin.open('編輯','order-view.html')" href="javascript:;">
                                                <i class="layui-icon">&#xe63c;</i></a>
                                            <a title="刪除" onclick="member_del(this,'要刪除的id')" href="javascript:;">
                                                <i class="layui-icon">&#xe640;</i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="" lay-skin="primary"></td>
                                        <td>2017009171822298053</td>
                                        <td>老王:18925139194</td>
                                        <td>7829.10</td>
                                        <td>7854.10</td>
                                        <td>待確認</td>
                                        <td>未支付</td>
                                        <td>未發貨</td>
                                        <td>其他方式</td>
                                        <td>申通物流</td>
                                        <td>2017-08-17 18:22</td>
                                        <td class="td-manage">
                                            <a title="檢視" onclick="xadmin.open('編輯','order-view.html')" href="javascript:;">
                                                <i class="layui-icon">&#xe63c;</i></a>
                                            <a title="刪除" onclick="member_del(this,'要刪除的id')" href="javascript:;">
                                                <i class="layui-icon">&#xe640;</i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" name="" lay-skin="primary"></td>
                                        <td>2017009171822298053</td>
                                        <td>老王:18925139194</td>
                                        <td>7829.10</td>
                                        <td>7854.10</td>
                                        <td>待確認</td>
                                        <td>未支付</td>
                                        <td>未發貨</td>
                                        <td>其他方式</td>
                                        <td>申通物流</td>
                                        <td>2017-08-17 18:22</td>
                                        <td class="td-manage">
                                            <a title="檢視" onclick="xadmin.open('編輯','order-view.html')" href="javascript:;">
                                                <i class="layui-icon">&#xe63c;</i></a>
                                            <a title="刪除" onclick="member_del(this,'要刪除的id')" href="javascript:;">
                                                <i class="layui-icon">&#xe640;</i></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="layui-card-body ">
                            <div class="page">
                                <div>
                                    <a class="prev" href="">&lt;&lt;</a>
                                    <a class="num" href="">1</a>
                                    <span class="current">2</span>
                                    <a class="num" href="">3</a>
                                    <a class="num" href="">489</a>
                                    <a class="next" href="">&gt;&gt;</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>layui.use(['laydate', 'form'],
        function() {
            var laydate = layui.laydate;

            //執行一個laydate實例
            laydate.render({
                elem: '#start' //指定元素
            });

            //執行一個laydate實例
            laydate.render({
                elem: '#end' //指定元素
            });
        });

        /*使用者-停用*/
        function member_stop(obj, id) {
            layer.confirm('確認要停用嗎？',
            function(index) {

                if ($(obj).attr('title') == '啟用') {

                    //發非同步把使用者狀態進行更改
                    $(obj).attr('title', '停用');
                    $(obj).find('i').html('&#xe62f;');

                    $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                    layer.msg('已停用!', {
                        icon: 5,
                        time: 1000
                    });

                } else {
                    $(obj).attr('title', '啟用');
                    $(obj).find('i').html('&#xe601;');

                    $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已啟用');
                    layer.msg('已啟用!', {
                        icon: 5,
                        time: 1000
                    });
                }

            });
        }

        /*使用者-刪除*/
        function member_del(obj, id) {
            layer.confirm('確認要刪除嗎？',
            function(index) {
                //發非同步刪除數據
                $(obj).parents("tr").remove();
                layer.msg('已刪除!', {
                    icon: 1,
                    time: 1000
                });
            });
        }

        function delAll(argument) {

            var data = tableCheck.getData();

            layer.confirm('確認要刪除嗎？' + data,
            function(index) {
                //捉到所有被選中的，發非同步進行刪除
                layer.msg('刪除成功', {
                    icon: 1
                });
                $(".layui-form-checked").not('.header').parents('tr').remove();
            });
        }</script>

</html>