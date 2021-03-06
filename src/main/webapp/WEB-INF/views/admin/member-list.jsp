﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
            <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
        </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5">
                                <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input"  autocomplete="off" placeholder="開始日" name="start" id="start">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input class="layui-input"  autocomplete="off" placeholder="截止日" name="end" id="end">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <input type="text" name="username"  placeholder="請輸入使用者名稱" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-inline layui-show-xs-block">
                                    <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-header">
                            <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量刪除</button>
                            <button class="layui-btn" onclick="xadmin.open('新增使用者','./member-add.html',600,400)"><i class="layui-icon"></i>新增</button>
                        </div>
                        <div class="layui-card-body layui-table-body layui-table-main">
                            <table class="layui-table layui-form">
                                <thead>
                                  <tr>
                                    <th>
                                      <input type="checkbox" lay-filter="checkall" name="" lay-skin="primary">
                                    </th>
                                    <th>ID</th>
                                    <th>使用者名稱</th>
                                    <th>性別</th>
                                    <th>手機</th>
                                    <th>地址</th>
                                    <th>狀態</th>
                                    <th>操作</th></tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>
                                      <input type="checkbox" name="id" value="1"   lay-skin="primary"> 
                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td>男</td>
                                    <td>13000000000</td>
                                    <td>北京市 海淀區</td>
                                    <td class="td-status">
                                      <span class="layui-btn layui-btn-normal layui-btn-mini">已啟用</span></td>
                                    <td class="td-manage">
                                      <a onclick="member_stop(this,'10001')" href="javascript:;"  title="啟用">
                                        <i class="layui-icon">&#xe601;</i>
                                      </a>
                                      <a title="編輯"  onclick="xadmin.open('編輯','member-edit.html',600,400)" href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                      </a>
                                      <a onclick="xadmin.open('修改密碼','member-password.html',600,400)" title="修改密碼" href="javascript:;">
                                        <i class="layui-icon">&#xe631;</i>
                                      </a>
                                      <a title="刪除" onclick="member_del(this,'要刪除的id')" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                      </a>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <input type="checkbox" name="id"  value="2" lay-skin="primary">
                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td>男</td>
                                    <td>13000000000</td>
                                    <td>北京市 海淀區</td>
                                    <td class="td-status">
                                      <span class="layui-btn layui-btn-normal layui-btn-mini">已啟用</span></td>
                                    <td class="td-manage">
                                      <a onclick="member_stop(this,'10001')" href="javascript:;"  title="啟用">
                                        <i class="layui-icon">&#xe601;</i>
                                      </a>
                                      <a title="編輯"  onclick="xadmin.open('編輯','member-edit.html',600,400)" href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                      </a>
                                      <a onclick="xadmin.open('修改密碼','member-password.html',600,400)" title="修改密碼" href="javascript:;">
                                        <i class="layui-icon">&#xe631;</i>
                                      </a>
                                      <a title="刪除" onclick="member_del(this,'要刪除的id')" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                      </a>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <input type="checkbox" name="id" value="3"  lay-skin="primary">
                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td>男</td>
                                    <td>13000000000</td>
                                    <td>北京市 海淀區</td>
                                    <td class="td-status">
                                      <span class="layui-btn layui-btn-normal layui-btn-mini">已啟用</span></td>
                                    <td class="td-manage">
                                      <a onclick="member_stop(this,'10001')" href="javascript:;"  title="啟用">
                                        <i class="layui-icon">&#xe601;</i>
                                      </a>
                                      <a title="編輯"  onclick="xadmin.open('編輯','member-edit.html',600,400)" href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                      </a>
                                      <a onclick="xadmin.open('修改密碼','member-password.html',600,400)" title="修改密碼" href="javascript:;">
                                        <i class="layui-icon">&#xe631;</i>
                                      </a>
                                      <a title="刪除" onclick="member_del(this,'要刪除的id')" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                      </a>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <input type="checkbox" name="id" value="4"  lay-skin="primary">
                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td>男</td>
                                    <td>13000000000</td>
                                    <td>北京市 海淀區</td>
                                    <td class="td-status">
                                      <span class="layui-btn layui-btn-normal layui-btn-mini">已啟用</span></td>
                                    <td class="td-manage">
                                      <a onclick="member_stop(this,'10001')" href="javascript:;"  title="啟用">
                                        <i class="layui-icon">&#xe601;</i>
                                      </a>
                                      <a title="編輯"  onclick="xadmin.open('編輯','member-edit.html',600,400)" href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                      </a>
                                      <a onclick="xadmin.open('修改密碼','member-password.html',600,400)" title="修改密碼" href="javascript:;">
                                        <i class="layui-icon">&#xe631;</i>
                                      </a>
                                      <a title="刪除" onclick="member_del(this,'要刪除的id')" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                      </a>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>
                                      <input type="checkbox" name="id" value="5"  lay-skin="primary">
                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td>男</td>
                                    <td>13000000000</td>
                                    <td>北京市 海淀區</td>
                                    <td class="td-status">
                                      <span class="layui-btn layui-btn-normal layui-btn-mini">已啟用</span></td>
                                    <td class="td-manage">
                                      <a onclick="member_stop(this,'10001')" href="javascript:;"  title="啟用">
                                        <i class="layui-icon">&#xe601;</i>
                                      </a>
                                      <a title="編輯"  onclick="xadmin.open('編輯','member-edit.html',600,400)" href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                      </a>
                                      <a onclick="xadmin.open('修改密碼','member-password.html',600,400)" title="修改密碼" href="javascript:;">
                                        <i class="layui-icon">&#xe631;</i>
                                      </a>
                                      <a title="刪除" onclick="member_del(this,'要刪除的id')" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                      </a>
                                    </td>
                                  </tr>
                                  <tr>
                                    <td>
                                     <input type="checkbox" name="id" value="6" lay-skin="primary">
                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td>男</td>
                                    <td>13000000000</td>
                                    <td>北京市 海淀區</td>
                                    <td class="td-status">
                                      <span class="layui-btn layui-btn-normal layui-btn-mini">已啟用</span></td>
                                    <td class="td-manage">
                                      <a onclick="member_stop(this,'10001')" href="javascript:;"  title="啟用">
                                        <i class="layui-icon">&#xe601;</i>
                                      </a>
                                      <a title="編輯"  onclick="xadmin.open('編輯','member-edit.html',600,400)" href="javascript:;">
                                        <i class="layui-icon">&#xe642;</i>
                                      </a>
                                      <a onclick="xadmin.open('修改密碼','member-password.html',600,400)" title="修改密碼" href="javascript:;">
                                        <i class="layui-icon">&#xe631;</i>
                                      </a>
                                      <a title="刪除" onclick="member_del(this,'要刪除的id')" href="javascript:;">
                                        <i class="layui-icon">&#xe640;</i>
                                      </a>
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
                                  <a class="next" href="">&gt;&gt;</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
    </body>
    <script>
      layui.use(['laydate','form'], function(){
        var laydate = layui.laydate;
        var  form = layui.form;


        // 監聽全選
        form.on('checkbox(checkall)', function(data){

          if(data.elem.checked){
            $('tbody input').prop('checked',true);
          }else{
            $('tbody input').prop('checked',false);
          }
          form.render('checkbox');
        }); 
        
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
      function member_stop(obj,id){
          layer.confirm('確認要停用嗎？',function(index){

              if($(obj).attr('title')=='啟用'){

                //發非同步把使用者狀態進行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

              }else{
                $(obj).attr('title','啟用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已啟用');
                layer.msg('已啟用!',{icon: 5,time:1000});
              }
              
          });
      }

      /*使用者-刪除*/
      function member_del(obj,id){
          layer.confirm('確認要刪除嗎？',function(index){
              //發非同步刪除數據
              $(obj).parents("tr").remove();
              layer.msg('已刪除!',{icon:1,time:1000});
          });
      }



      function delAll (argument) {
        var ids = [];

        // 獲取選中的id 
        $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
               ids.push($(this).val())
            }
        });
  
        layer.confirm('確認要刪除嗎？'+ids.toString(),function(index){
            //捉到所有被選中的，發非同步進行刪除
            layer.msg('刪除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
      }
    </script>
</html>