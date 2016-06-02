<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../taglib.inc.jsp" %>

<title>管理员管理</title>

<!-- ajax layout which only needs content area -->
<div class="page-header">
    <h1>
        管理员管理
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            列表
        </small>
    </h1>
</div><!-- /.page-header -->

<div class="row">
    <div class="col-xs-12">

        <div class="table-header">
            管理员列表
        </div>

        <!-- <div class="table-responsive"> -->

        <!-- <div class="dataTables_borderWrap"> -->
        <div>
            <div class="dataTables_wrapper form-inline no-footer">
                <div class="row">
                    <div class="col-xs-6">
                        <div class="dataTables_length">
                            <a title="新增" class="btn btn-sm btn-info"
                               href="#admin/medication/toAdd">
                                <i class="ace-icon fa fa-plus align-bottom bigger-125"></i>
                                新&nbsp;增
                            </a>                           
                        </div>
                    </div>                    
                </div>
                <table class="table table-striped table-bordered table-hover dataTable no-footer">
                    <thead>
                    <tr role="row">     
                                                <th></th>           
                                                <th>提醒名称</th>           
                                                <th>图片</th>           
                                                <th>添加药品</th>           
                                                <th>添加对象</th>           
                                                <th>服用时间</th>           
                                                <th>每次用量</th>           
                                                <th>单位</th>           
                                                <th>服药周期</th>           
                                                <th>个人备注</th>           
                                                <th>是否启用</th>           
                                                <th>用户id</th>           
                                                <th class="sorting_disabled">操作</th>
                    </tr>
                    </thead>

                    <tbody>
                           <c:forEach items="${result}" var="item" varStatus="current"> 
                            <tr>            
                                                        <td>${id}</td>                         
                                                        <td>${theme}</td>                         
                                                        <td>${image}</td>                         
                                                        <td>${medicine}</td>                         
                                                        <td>${objectName}</td>                         
                                                        <td>${takeTime}</td>                         
                                                        <td>${dosage}</td>                         
                                                        <td>${unit}</td>                         
                                                        <td>${periodType}</td>                         
                                                        <td>${desc}</td>                         
                                                        <td>${enable}</td>                         
                                                        <td>${userId}</td>                         
                                                        <td>
                                <div class="hidden-sm hidden-xs action-buttons">
                                    <a title="修改基本信息" class="green" 
                                       href="#admin/medication/toEdit?id=${item.id}">
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
         
    });
</script>
