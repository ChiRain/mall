<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../taglib.inc.jsp" %>

<title>新增评价</title>
<link rel="stylesheet" href="/qcloud-admin/assets/css/colorbox.css"/>
<link rel="stylesheet" href="/qcloud-admin/assets/css/chosen.css" />
<link rel="stylesheet" href="/qcloud-admin/assets/css/bootstrap-datetimepicker.css" />
<link rel="stylesheet" href="/qcloud-admin/assets/css/datepicker.css" />
<link rel="stylesheet" href="/qcloud-admin/assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="/qcloud-admin/assets/css/daterangepicker.css" />

<!-- ajax layout which only needs content area -->
<div class="page-header">
    <h1>
        评价管理
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            新增
        </small>
    </h1>
</div><!-- /.page-header -->

<div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
        <form id="model-form" class="form-horizontal"  role="form" action="/admin/merchandiseEvaluation/add.do">
            <!-- #section:elements.form -->
            <input type="hidden" name="merchandiseId" value="${merchandiseId}">

      		<div class="space-4"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="star"> 星级(1-5星)</label>
                <div class="col-sm-9">
					<span class="col-sm-5 no-padding block input-icon input-icon-right mr10">
						<input type="text" class="width-100" maxlength="20" id="star" name="star" placeholder="星级(1-5星)" value=""/>
						<i class="ace-icon fa"></i>
					</span>
                </div>
            </div>
            
      		<div class="space-4"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="specifications"> 规格 </label>
                <div class="col-sm-9">
					<span class="col-sm-5 no-padding block input-icon input-icon-right mr10">
						<select class="form-control" id="merchandiseItemId" name="merchandiseItemId">
                        	<c:forEach items="${merchandiseItemMap}" var="map" varStatus="status">
                            	<option value="${map.key}">${map.value}</option>
                            </c:forEach>
                        </select>
					</span>
                </div>
            </div>
            
      		<div class="space-4"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="userId"> 用户帐号 </label>
                <div class="col-sm-9">
					<span class="col-sm-5 no-padding block input-icon input-icon-right mr10">
						<input type="text" class="width-100" maxlength="20" id="account" name="account" placeholder="用户帐号" value=""/>
						<i class="ace-icon fa"></i>
					</span>
                </div>
            </div>
            
            <div class="space-4"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="time">时间</label>
                <div class="col-sm-9">
					<span class="col-sm-5 no-padding block input-icon input-icon-right mr10">
						<input id="time" name="time" type="text" class="form-control" />
					</span>
                </div>
            </div>
            
            <div class="space-4"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="content"> 评价内容 </label>
                <div class="col-sm-9">
					<span class="col-sm-5 no-padding block input-icon input-icon-right mr10">
						<textarea  class="width-100"  id="content" name="content" rows="6"></textarea>
						<i class="ace-icon fa"></i>
					</span>
                </div>
            </div>
                     
            <div class="space-4"></div>
            <div class="clearfix form-actions">
                <div class="col-md-offset-3 col-md-9">
                    <button class="btn btn-info" type="submit"><i class="ace-icon fa fa-check bigger-110"></i>&nbsp;保&nbsp;存&nbsp;</button>
                    &nbsp; &nbsp; &nbsp;
                    <button id="back" class="btn" type="button"><i class="ace-icon fa fa-undo bigger-110"></i>&nbsp;返&nbsp;回&nbsp;</button>
                </div>
            </div>

        </form>
        <!-- PAGE CONTENT ENDS -->
    </div>
    <!-- /.col -->
</div><!-- /.row -->

<script type="text/javascript">
    var scripts = [null, "/qcloud-admin/assets/js/jquery.colorbox-min.js","/qcloud-admin/assets/js/upload-img.js","/qcloud-admin/assets/js/chosen.jquery.min.js", "/qcloud-admin/assets/js/jquery-ui.custom.min.js","/qcloud-admin/assets/js/date-time/moment.min.js","/qcloud-admin/assets/js/date-time/bootstrap-datetimepicker.min.js", null];
    
    ace.load_ajax_scripts(scripts, function () {
        //inline scripts related to this page
        jQuery(function ($) {
        
    		$('#time').datetimepicker({
    			language: 'zh-cn',
    			//format: 'MM/DD/YYYY'
    			format: 'YYYY-MM-DD HH:mm:SS'
    			
    		}).next().on(ace.click_event, function(){
				$(this).prev().focus();
			});
				
            $(window)
            .off('resize.chosen')
            .on('resize.chosen', function() {
                $('.chosen-select').each(function() {
                     var $this = $(this);
                     $this.next().css({'width': $this.parent().width()});
                })
            }).trigger('resize.chosen');
                   
            //表单验证
            $("#model-form").validate({
                errorElement: 'div',
                errorClass: 'help-block col-xs-12 col-sm-reset inline',
                focusInvalid: false,
                rules: {
                    name: {
                        required: true
                    },
                    mobile: {
                        required: true
                    },

                    sort: {
                        required: true,
                        range: [0, 99999999],
                        digits: true
                    }
                },

                messages: {},

                highlight: function (e) {
                    $(e).closest('.form-group').removeClass('has-success').addClass('has-error');
                },

                success: function (e) {
                    $(e).closest('.form-group').removeClass('has-error').addClass('has-success');
                    $(e).remove();
                },

                errorPlacement: function (error, element) {
                    if (element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
                        var controls = element.closest('div[class*="col-"]');
                        if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
                        else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
                    }
                    else if (element.is('.select2')) {
                        error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
                    }
                    else if (element.is('.chosen-select')) {
                        error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
                    }
                    else error.insertAfter(element.parent());
                },

                submitHandler: function (form) {
                    postForm('model-form');
                },
                invalidHandler: function (form) {
                }
            });
        });
    })
</script>
