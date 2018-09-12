<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="utf-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <title>管理系统</title>
<link href="css/base.css" rel="stylesheet">
<link href="css/platform.css" rel="stylesheet">
<link rel="stylesheet" href="custom/uimaker/easyui.css">
    <script type="text/javascript" src="custom/jquery.min.js"></script>
    <script type="text/javascript" src="custom/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>


</head> 
<body>
    <div class="container">
<!-- 头部 -->
        <div id="pf-hd">
            <div class="pf-logo">
                <img src="images/main/main_logo.png" alt="logo">
            </div>
<!-- 导航栏 -->
            <div class="pf-nav-wrap">
              <div class="pf-nav-ww">
                <ul class="pf-nav">
                  <li class="pf-nav-item home current" data-menu="sys-manage">
                      <a href="javascript:;">
                          <span class="iconfont">&#xe63f;</span>
                          <span class="pf-nav-title">系统管理</span>
                      </a>
                  </li>
                  <li class="pf-nav-item project" data-menu="org-manage">
                      <a href="javascript:;">
                          <span class="iconfont">&#xe60d;</span>
                          <span class="pf-nav-title">组织管理</span>
                      </a>
                  </li>
                  <li class="pf-nav-item static" data-menu="main-data">
                      <a href="javascript:;">
                          <span class="iconfont">&#xe61e;</span>
                          <span class="pf-nav-title">主数据</span>
                      </a>
                  </li>
               
                </ul>
              </div>

            </div>
<!-- //导航栏 -->


            <div class="pf-user">
                <div class="pf-user-photo">
                    <img src="images/main/user.png" alt="">
                </div>
                <h4 class="pf-user-name ellipsis">用户名</h4>
                <i class="iconfont xiala">&#xe607;</i>

                <div class="pf-user-panel">
                    <ul class="pf-user-opt">
                        <li>
                            <a href="javascript:;">
                                <i class="iconfont">&#xe60d;</i>
                                <span class="pf-opt-name">用户信息</span>
                            </a>
                        </li>
                        <li class="pf-modify-pwd">
                            <a href="javascript:;">
                                <i class="iconfont">&#xe634;</i>
                                <span class="pf-opt-name">修改密码</span>
                            </a>
                        </li>
                        <li class="pf-logout">
                            <a href="login.html">
                                <i class="iconfont">&#xe60e;</i>
                                <span class="pf-opt-name">退出</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
<!-- //头部 -->


        <div id="pf-bd">
<!-- 导航栏 -->
            <div id="pf-sider">
                <h2 class="pf-model-name">
                    <span class="iconfont">&#xe64a;</span>
                    <span class="pf-name">菜单</span>
                    <span class="toggle-icon"></span>
                </h2>

                <ul class="sider-nav">
                     <li class="current">
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe620;</span>
                            <span class="sider-nav-title">供应商组织</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                        <ul class="sider-nav-s">
                           <li class="opentabs" myurl="providers1.jsp"><a>供应商组织1</a></li>
                           <li class="opentabs" myurl="providers1.jsp"><a>供应商组织2</a></li>
                           <li class="opentabs" myurl="providers1.jsp"><a>供应商组织3</a></li>
                           <li class="opentabs" myurl="providers1.jsp"><a>供应商组织4</a></li>
                        </ul>
                     </li>
                     <li>
                        <a href="javascript:;">
                            <span class="iconfont sider-nav-icon">&#xe625;</span>
                            <span class="sider-nav-title">采购组织</span>
                            <i class="iconfont">&#xe642;</i>
                        </a>
                        <ul class="sider-nav-s">
                           <li><a href="#">供应商组织1</a></li>
                           <li><a href="#">供应商组织2</a></li>
                           <li><a href="#">供应商组织3</a></li>
                           <li><a href="#">供应商组织4</a></li>
                        </ul>
                     </li>
                  
                 </ul> 
            </div>
<!-- //导航栏 -->

<!-- 内容 -->
            <div id="pf-page">
                <div class="easyui-tabs1" id="mytabs" style="width:100%;height:100%;">
                  <div title="首页" style="padding:10px 5px 5px 10px;">
                    <iframe class="page-iframe" src="index.jsp" frameborder="no"   border="no" height="100%" width="100%" scrolling="auto"></iframe>
                  </div>
                </div>
            </div>
<!-- //内容 -->

        </div>
<!-- 底部 -->
        <div id="pf-ft">
            <div class="system-name">
              <i class="iconfont">&#xe6fe;</i>
              <span>管理系统&nbsp;v1.0</span>
            </div>
            <div class="copyright-name">
              <span>CopyRight&nbsp;2016&nbsp;&nbsp;uimaker.com&nbsp;版权所有</span>
              <i class="iconfont" >&#xe6ff;</i>
            </div>
        </div>
<!-- //底部 -->
    </div>


    <!--[if IE 7]>
      <script type="text/javascript">
        $(window).resize(function(){
          $('#pf-bd').height($(window).height()-76);
        }).resize();
        
      </script>
    <![endif]--> 

    
    <script type="text/javascript">
/* 内容页切换 */
    $('.easyui-tabs1').tabs({
      tabHeight: 44,
      onSelect:function(title,index){
        var currentTab = $('.easyui-tabs1').tabs("getSelected");
        if(currentTab.find("iframe") && currentTab.find("iframe").size()){
            currentTab.find("iframe").attr("src",currentTab.find("iframe").attr("src"));
        }
      }
    })


/*//导航栏上下翻页 */
    </script>
    <script type="text/javascript">
$(".opentabs").click(function(){
	
	
	
	$('#mytabs').tabs('add',{
	    title:$(this).text(),
	    href:$(this).attr("myurl"),
	    closable:true,
	    selected:true
	});
});

</script>
</body> 
</html>
