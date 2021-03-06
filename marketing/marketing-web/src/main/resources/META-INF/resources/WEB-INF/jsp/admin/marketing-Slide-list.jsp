<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../taglib.inc.jsp" %>

<title>广告区管理</title>

<!-- ajax layout which only needs content area -->
<div class="page-header">
    <h1>
       广告区管理
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            列表
        </small>
    </h1>
</div><!-- /.page-header -->

<div class="row">
    <div class="col-xs-12">

        <div class="table-header">
            广告图片列表
        </div>

        <!-- <div class="table-responsive"> -->

        <!-- <div class="dataTables_borderWrap"> -->
        <div>
            <div class="dataTables_wrapper form-inline no-footer">
                <div class="row">
                    <div class="col-xs-6">
                        <div class="dataTables_length">
                            <a title="新增" class="btn btn-sm btn-info"
                               href="#admin/slide/toAdd">
                                <i class="ace-icon fa fa-plus align-bottom bigger-125"></i>
                                新&nbsp;增
                            </a>                           
                        </div>
                    </div>                    
                </div>
                <table class="table table-striped table-bordered table-hover dataTable no-footer">
                    <thead>
                    <tr role="row">     
                                                <th>图片</th>    
                                                <th>场景</th>  
                                                <th>描述</th>  
                                                <th>点击地址</th>
                                                <th>开始时间</th>
                                                <th>结束时间</th>
                                                <th>启用</th>                                                     
                                                <th class="sorting_disabled">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                           <c:forEach items="${result}" var="item" varStatus="current"> 
                            <tr>                                                         							
	 							<td><img width="50" height="50" src="${item.image}"/></td>      
	                            <td>${item.senceStr}</td>      
	                            <td>${item.desc}</td>                                     
	                            <td>${item.clickUrl}</td>  
	                            <td>
    							 <fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd " />
           						</td>  
	                            <td>
    							 <fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd " />
           						</td>  
	                           	<td>                                                        
                                    <input value="${item.id}" type="checkbox" data-id="${item.id}" class="ace ace-switch ace-switch-5 ajax_switch"
                                    <c:if test="${item.enable > 0}">
                                    checked
                                    </c:if>>
                                    <span class="lbl middle"></span>  
                                </td>                       
	                            <td>
                                <div class="hidden-sm hidden-xs action-buttons">
                                    <a title="修改基本信息" class="green" 
                                       href="#admin/slide/toEdit?id=${item.id}">
                                        <i class="ace-icon fa fa-pencil bigger-130"></i>
                                    </a>	
                                    <a title="删除" class="red" style="cursor:pointer;"
                                       api-path="/admin/slide/delete.do?id=${item.id}">
                                        <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                    </a>						                                 
                                </div>
                                </div>
	                            </td>
	                        </tr>
							</c:forEach>
                    </tbody>
                </table>    
                <div class="row">
                    <div class="col-xs-12">                  
                       	<%@include file="../page.inc.jsp" %>
                    </div>
                </div>          
            </div>
        </div>
    </div>
</div>

<!-- page specific plugin scripts -->
<script type="text/javascript">
    var scripts = [null, null];
    ace.load_ajax_scripts(scripts, function () {
        //inline scripts related to this page
        //删除
         $(".red").click(function(){
         	var delUrl=$(this).attr("api-path");
         	BootstrapDialog.show({
				title:'确认删除？',
				message:'删除后将无法恢复',
				buttons:[{
					label:'确定',
					cssClass :'btn btn-primary',
					action :function(dialogItself){
						$.get(delUrl, {},function(data){
							data = JSON.parse(data);
                                if(parseInt(data["status"]) === 0){
                                    dialogItself.setTitle('删除失败');
                                    dialogItself.setMessage(data["message"]);
                                    dialogItself.setType(BootstrapDialog.TYPE_WARNING);
                                }else{
                                    dialogItself.setTitle('成功');
                                    dialogItself.setMessage("删除成功！");
                                    dialogItself.setType(BootstrapDialog.TYPE_SUCCESS);
                                    setTimeout(function(){
                                        dialogRef.close();
                                    }, 1000);
                                    setTimeout(function(){
                                        location.reload();
                                    }, 1500);
                                }
							});
						}
					},{
	                    label: '取消',
	                    action: function (dialogItself) {
	                        dialogItself.close();
	                    }
	                }
				]
         	});
         }); 
         //是否启用
         $(".ajax_switch").on('change',function(){
             var el = $(this);
             var data = {
                 id:el.attr('data-id'),
                 enable:el[0].checked?'1':'0'
             };
             $.ajax({
                 url:'/admin/slide/enable.do',
                 type:'POST',
                 data:data,
                 dataType: 'json',
                 cache: false,
                 async: false,
                 error: function(){
                     BootstrapDialog.alert({
                         title: '错误',
                         message:'网络错误，请稍后再尝试！',
                         type: BootstrapDialog.TYPE_DANGER,
                         callback: function(){setTimeout(function(){el[0].checked = !el[0].checked;},500)}
                     });
                 },
                 success:function(rd){
                     if(rd['status'] != 200){
                         BootstrapDialog.alert({
                             title: '错误',
                             message:rd.message,
                             type: BootstrapDialog.TYPE_DANGER,
                             callback: function(){setTimeout(function(){el[0].checked = !el[0].checked;},500)}
                         });
                     }
                 }
             })
         });  
    });
</script>
