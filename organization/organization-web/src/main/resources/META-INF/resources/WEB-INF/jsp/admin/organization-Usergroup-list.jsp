<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../taglib.inc.jsp" %>

<title>用户组管理</title>
<style>
    .select-product-dialog {
        top: 50px;
    }

    .select-product-dialog tr {
        word-break: break-all;
    }

    .select-product-dialog .modal-content {
        min-height: 600px;
        min-width: 700px;
    }

    /*.select-dialog .modal-body{*/
    /*padding: 0;*/
    /*}*/
</style>
<!-- ajax layout which only needs content area -->
<div class="page-header">
    <h1>
        用户组管理
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            列表
        </small>
    </h1>
</div><!-- /.page-header -->

<div class="row">
    <div class="col-xs-12">

        <div class="table-header">
            用户组列表
        </div>

        <!-- <div class="table-responsive"> -->

        <!-- <div class="dataTables_borderWrap"> -->
        <div>
            <div class="dataTables_wrapper form-inline no-footer">
                <div class="row">
                    <div class="col-xs-6">
                        <div class="dataTables_length">
                            <a title="新增" class="btn btn-sm btn-info"
                               href="#admin/usergroup/toAdd">
                                <i class="ace-icon fa fa-plus align-bottom bigger-125"></i>
                                新&nbsp;增
                            </a>                           
                        </div>
                    </div>                    
                </div>
                <table class="table table-striped table-bordered table-hover dataTable no-footer">
                    <thead>
                    <tr role="row">     
                        <th>名称</th>        
                        <th>职员</th>    
                        <th class="sorting_disabled">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                           <c:forEach items="${result}" var="item" varStatus="current"> 
                            <tr>            
                                <td>${item.name}</td>  
                                <td>
                            	 	<a href="#admin/clerk/selectAllClerk?groupId=${item.id}" class="btn btn-primary btn-xs add-member-trigger" data-id="${item.id}"  data-name="人员管理-${item.name}">
                                    <i class="ace-icon fa fa-keyboard-o bigger-130"></i>人员管理</a>
                                </td>                      
                                <td>
                                <div class="hidden-sm hidden-xs action-buttons">
                                    <a title="修改基本信息" class="green" 
                                       href="#admin/usergroup/toEdit?id=${item.id}">
                                        <i class="ace-icon fa fa-pencil bigger-130"></i>
                                    </a>							                                 
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
        $(".add-member-trigger1").on("click", function () {
     		// 务必添加解绑事件，要不然会重复提交数据
     		$(document).off('click',".select-clerkPost-trigger");
     		$(document).off('click',".search-clerk-trigger");
     		var id = $(this).attr("data-id");
     		var name = $(this).attr("data-name");
            BootstrapDialog.show({                                
                title: name,
                message: $('<div></div>').load('/admin/clerk/selectAllClerk.do'),
                cssClass: "select-product-dialog",
                onshow: function (dialog) {
                	$(document).on("click", ".select-clerkPost-trigger", function (e) {
                	
	                });
                
                	$(document).on("click", ".search-clerk-trigger", function (e) {
                		var name = $("#name").val();
	                	dialog.getModalBody().html($('<div></div>').load('/admin/clerk/selectAllClerk.do?name='+name));
	                });
                }
            });
        });
         
    });
</script>
