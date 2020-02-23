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
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 讓IE8/9支援媒體查詢，從而相容柵格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  
  <body>
    <div class="layui-fluid">
        <div class="layui-row">
            <form action="" method="post" class="layui-form layui-form-pane">
                <div class="layui-form-item">
                    <label for="name" class="layui-form-label">
                        <span class="x-red">*</span>角色名
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="name" name="name" required="" lay-verify="required"
                        autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">
                        擁有許可權
                    </label>
                    <table  class="layui-table layui-input-block">
                        <tbody>
                            <tr>
                                <td>
                                    <input type="checkbox" name="like1[write]" lay-skin="primary" lay-filter="father" title="使用者管理">
                                </td>
                                <td>
                                    <div class="layui-input-block">
                                        <input name="id[]" lay-skin="primary" type="checkbox" title="使用者停用" value="2"> 
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="使用者刪除"> 
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="使用者修改"> 
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="使用者改密"> 
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="使用者列表">
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="使用者改密"> 
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="使用者列表">
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="使用者改密"> 
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="使用者列表"> 
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                   
                                    <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="文章管理" lay-filter="father">
                                </td>
                                <td>
                                    <div class="layui-input-block">
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="文章新增"> 
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="文章刪除"> 
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="文章修改"> 
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="文章改密"> 
                                        <input name="id[]" lay-skin="primary" type="checkbox" value="2" title="文章列表"> 
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label for="desc" class="layui-form-label">
                        描述
                    </label>
                    <div class="layui-input-block">
                        <textarea placeholder="請輸入內容" id="desc" name="desc" class="layui-textarea"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                <button class="layui-btn" lay-submit="" lay-filter="add">增加</button>
              </div>
            </form>
        </div>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定義驗證規則
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵稱至少得5個字元啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密碼必須6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '兩次密碼不一致';
                }
            }
          });

          //監聽提交
          form.on('submit(add)', function(data){
            console.log(data);
            //發非同步，把數據提交給php
            layer.alert("增加成功", {icon: 6},function () {
                // 獲得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //關閉目前frame
                parent.layer.close(index);
            });
            return false;
          });


        form.on('checkbox(father)', function(data){

            if(data.elem.checked){
                $(data.elem).parent().siblings('td').find('input').prop("checked", true);
                form.render(); 
            }else{
               $(data.elem).parent().siblings('td').find('input').prop("checked", false);
                form.render();  
            }
        });
          
          
        });
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>