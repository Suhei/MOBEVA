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
        <!--[if lt IE 9]>
          <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
          <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
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
                            <div class="layui-collapse" lay-filter="test">
                                <div class="layui-colla-item">
                                <h2 class="layui-colla-title">條件篩選<i class="layui-icon layui-colla-icon"></i></h2>
                                <div class="layui-colla-content">
                                  <form class="layui-form" action="">
                                      <div class="layui-form-item">
                                        <div class="layui-inline">
                                          <label class="layui-form-label">範圍</label>
                                          <div class="layui-input-inline" style="width: 100px;">
                                            <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input">
                                          </div>
                                          <div class="layui-form-mid">-</div>
                                          <div class="layui-input-inline" style="width: 100px;">
                                            <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input">
                                          </div>
                                        </div>
                                      </div>
                                      
                                      <div class="layui-form-item">
                                        <div class="layui-inline">
                                          <label class="layui-form-label">分組選擇框</label>
                                          <div class="layui-input-inline">
                                            <select name="quiz">
                                              <option value="">請選擇問題</option>
                                              <optgroup label="城市記憶">
                                                <option value="你工作的第一個城市">你工作的第一個城市</option>
                                              </optgroup>
                                              <optgroup label="學生時代">
                                                <option value="你的工號">你的工號</option>
                                                <option value="你最喜歡的老師">你最喜歡的老師</option>
                                              </optgroup>
                                            </select>
                                          </div>
                                        </div>
                                        <div class="layui-inline">
                                          <label class="layui-form-label">搜索選擇框</label>
                                          <div class="layui-input-inline">
                                            <select name="modules" lay-verify="required" lay-search="">
                                              <option value="">直接選擇或搜索選擇</option>
                                              <option value="1">layer</option>
                                              <option value="2">form</option>
                                              <option value="3">layim</option>
                                              <option value="4">element</option>
                                              <option value="5">laytpl</option>
                                              <option value="6">upload</option>
                                              <option value="7">laydate</option>
                                              <option value="8">laypage</option>
                                              <option value="9">flow</option>
                                              <option value="10">util</option>
                                              <option value="11">code</option>
                                              <option value="12">tree</option>
                                              <option value="13">layedit</option>
                                              <option value="14">nav</option>
                                              <option value="15">tab</option>
                                              <option value="16">table</option>
                                              <option value="17">select</option>
                                              <option value="18">checkbox</option>
                                              <option value="19">switch</option>
                                              <option value="20">radio</option>
                                            </select>
                                          </div>
                                        </div>
                                      </div>
                                      
                                      <div class="layui-form-item">
                                        <label class="layui-form-label">聯動選擇框</label>
                                        <div class="layui-input-inline">
                                          <select name="quiz1">
                                            <option value="">請選擇省</option>
                                            <option value="浙江" selected="">浙江省</option>
                                            <option value="你的工號">江西省</option>
                                            <option value="你最喜歡的老師">福建省</option>
                                          </select>
                                        </div>
                                        <div class="layui-input-inline">
                                          <select name="quiz2">
                                            <option value="">請選擇市</option>
                                            <option value="杭州">杭州</option>
                                            <option value="寧波" disabled="">寧波</option>
                                            <option value="溫州">溫州</option>
                                            <option value="溫州">臺州</option>
                                            <option value="溫州">紹興</option>
                                          </select>
                                        </div>
                                        <div class="layui-input-inline">
                                          <select name="quiz3">
                                            <option value="">請選擇縣/區</option>
                                            <option value="西湖區">西湖區</option>
                                            <option value="餘杭區">餘杭區</option>
                                            <option value="拱墅區">臨安市</option>
                                          </select>
                                        </div>
                                        <div class="layui-form-mid layui-word-aux">此處只是演示聯動排版，並未做聯動互動</div>
                                      </div>
                                      
                                      <div class="layui-form-item">
                                        <label class="layui-form-label">覈取方塊</label>
                                        <div class="layui-input-block">
                                          <input type="checkbox" name="like[write]" title="寫作">
                                          <input type="checkbox" name="like[read]" title="閱讀" checked="">
                                          <input type="checkbox" name="like[game]" title="遊戲">
                                        </div>
                                      </div>
                                      
                                      <div class="layui-form-item" pane="">
                                        <label class="layui-form-label">原始覈取方塊</label>
                                        <div class="layui-input-block">
                                          <input type="checkbox" name="like1[write]" lay-skin="primary" title="寫作" checked="">
                                          <input type="checkbox" name="like1[read]" lay-skin="primary" title="閱讀">
                                          <input type="checkbox" name="like1[game]" lay-skin="primary" title="遊戲" disabled="">
                                        </div>
                                      </div>
                                      
                                      <div class="layui-form-item">
                                        <label class="layui-form-label">開關-預設關</label>
                                        <div class="layui-input-block">
                                          <input type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF">
                                        </div>
                                      </div>
                                      <div class="layui-form-item">
                                        <label class="layui-form-label">開關-預設開</label>
                                        <div class="layui-input-block">
                                          <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">
                                        </div>
                                      </div>
                                      <div class="layui-form-item">
                                        <label class="layui-form-label">單選框</label>
                                        <div class="layui-input-block">
                                          <input type="radio" name="sex" value="男" title="男" checked="">
                                          <input type="radio" name="sex" value="女" title="女">
                                          <input type="radio" name="sex" value="禁" title="禁用" disabled="">
                                        </div>
                                      </div>
                                      <div class="layui-form-item">
                                        <div class="layui-input-block">
                                          <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                                          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                        </div>
                                      </div>
                                    </form>
                                </div>
                              </div>
                            </div>
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
                                            <input type="checkbox" name="" lay-skin="primary"></th>
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