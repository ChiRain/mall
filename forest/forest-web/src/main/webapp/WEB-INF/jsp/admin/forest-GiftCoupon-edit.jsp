<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../taglib.inc.jsp" %>

<title>编辑赠品券</title>
<link rel="stylesheet" href="/qcloud-admin/assets/css/colorbox.css"/>
<link rel="stylesheet" href="/qcloud-admin/assets/css/chosen.css" />

<!-- ajax layout which only needs content area -->
<div class="page-header">
    <h1>
      赠品券管理
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            编辑
        </small>
    </h1>
</div><!-- /.page-header -->

<div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
        <form id="model-form" class="form-horizontal"  role="form" action="/admin/giftCoupon/edit.do">
            <!-- #section:elements.form -->
			<input type="hidden" name="id" value="${giftCoupon.id}">
			<input type="hidden" name="queryStr" value="${queryStr}">
			
                  		<div class="space-4"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="name"> 赠品券名称 </label>
                <div class="col-sm-9">
					<span class="col-sm-5 no-padding block input-icon input-icon-right mr10">
						<input type="text" class="width-100" maxlength="20" id="name" name="name" placeholder="赠品券名称" value="${giftCoupon.name}"/>
						<i class="ace-icon fa"></i>
					</span>
                </div>
            </div>
                  		<div class="space-4"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="image"> 图片 </label>
                <div class="col-sm-9">
					<input type="hidden"  id="image" name="image" value="${giftCoupon.uid}" onchange="fileChange(this);"/>
					<button type="button" mult="false" sid="image" vid="pic-pic-view2" class="btn btn-sm btn-purple btn-upload-pic"  upfrom="0"  ><i class="ace-icon fa fa-upload">
					</i> 上 传</button>
                    <ul sid="image" id="pic-pic-view2" class="ace-thumbnails clearfix">
                        <li pic-id="">
                            <a style="line-height: 150px;text-align: center;width:150px;height: 150px;" href="" data-rel="colorbox" class="cboxElement">
                                <img style="max-height: 150px;max-width: 150px;" alt="" src="${giftCoupon.image}">
                            </a>
                            <div class="tools tools-bottom"><a onclick="imgDel(this);" href="javascript:;" title="删除"><i class="ace-icon fa fa-times red"></i></a></div>
                        </li>
                    </ul>
                </div>
            </div>
                  		<div class="space-4"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="validDate"> 生效日期 </label>
                <div class="col-sm-9">
					<span class="col-sm-5 no-padding block input-icon input-icon-right mr10">
						<input type="text" class="width-100" maxlength="20" id="validDate" name="validDate" placeholder="生效日期" value="<fmt:formatDate value="${giftCoupon.validDate}"  pattern="yyyy-MM-dd"/>"/>
						<i class="ace-icon fa"></i>
					</span>
                </div>
            </div>
                  		<div class="space-4"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="inValidDate"> 失效日期 </label>
                <div class="col-sm-9">
					<span class="col-sm-5 no-padding block input-icon input-icon-right mr10">
						<input type="text" class="width-100" maxlength="20" id="inValidDate" name="inValidDate" placeholder="失效日期" value="<fmt:formatDate value="${giftCoupon.inValidDate}"  pattern="yyyy-MM-dd"/>"/>
						<i class="ace-icon fa"></i>
					</span>
                </div>
            </div>
        
                  		<div class="space-4"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right" for="desc"> 赠品券描述 </label>
                <div class="col-sm-9">
					<span class="col-sm-5 no-padding block input-icon input-icon-right mr10">
 					<textarea   class="width-100" maxlength="30" row ="2" id="desc" name="desc"   placeholder="赠品券描述 ">${giftCoupon.desc}</textarea>				
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
var scripts = [null,"/qcloud-admin/assets/js/moment.min.js","/qcloud-admin/assets/js/bootstrap-datetimepicker.js", "/qcloud-admin/assets/js/jquery.colorbox-min.js","/qcloud-admin/assets/js/upload-img.js","/qcloud-admin/assets/js/chosen.jquery.min.js","/qcloud-admin/assets/js/chosen.jquery.min.js","/qcloud-admin/assets/js/date-time/bootstrap-datetimepicker.min.js","/qcloud-admin/assets/js/bootstrap.min.js", null];
    ace.load_ajax_scripts(scripts, function () {
        //inline scripts related to this page
        jQuery(function ($) {
            $(window)
            .off('resize.chosen')
            .on('resize.chosen', function() {
                $('.chosen-select').each(function() {
                     var $this = $(this);
                     $this.next().css({'width': $this.parent().width()});
                })
            }).trigger('resize.chosen');
            // 图片上传 
         	 $('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
            $("#cboxLoadingGraphic").html("<i class='ace-icon fa fa-spinner orange'></i>");
            var btnUpload = $(".btn-upload-pic");
            delEvent(getButtonSetting(btnUpload));
            btnUpload.on('click', function () {
                var bs = getButtonSetting($(this));
                uploadDialog(bs);
            });
				
            //获取当前时间
		    var date = new Date();
		    var seperator1 = "-";
		    var seperator2 = ":";
		    var month = date.getMonth() + 1;
		    var strDate = date.getDate();
		    if (month >= 1 && month <= 9) {
		        month = "0" + month;
		    }
		    if (strDate >= 0 && strDate <= 9) {
		        strDate = "0" + strDate;
		    }
		    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
		            + " " + date.getHours() + seperator2 + date.getMinutes()
		            + seperator2 + date.getSeconds();  

           //生效日期按钮
          $('#validDate').datetimepicker({
          
	    			language: 'zh-cn',
	    			//format: 'MM/DD/YYYY'
	    			format: 'YYYY-MM-DD',
	    		}).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
	            
			//失效日期按钮
			$('#inValidDate').datetimepicker({
	    			language: 'zh-cn',
	    			//format: 'MM/DD/YYYY'
	    			format: 'YYYY-MM-DD',
	    			minDate:currentdate
	    		}).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
                   
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
