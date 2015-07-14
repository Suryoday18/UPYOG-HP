<!-- #-------------------------------------------------------------------------------
# eGov suite of products aim to improve the internal efficiency,transparency, 
#      accountability and the service delivery of the government  organizations.
#   
#       Copyright (C) <2015>  eGovernments Foundation
#   
#       The updated version of eGov suite of products as by eGovernments Foundation 
#       is available at http://www.egovernments.org
#   
#       This program is free software: you can redistribute it and/or modify
#       it under the terms of the GNU General Public License as published by
#       the Free Software Foundation, either version 3 of the License, or
#       any later version.
#   
#       This program is distributed in the hope that it will be useful,
#       but WITHOUT ANY WARRANTY; without even the implied warranty of
#       MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#       GNU General Public License for more details.
#   
#       You should have received a copy of the GNU General Public License
#       along with this program. If not, see http://www.gnu.org/licenses/ or 
#       http://www.gnu.org/licenses/gpl.html .
#   
#       In addition to the terms of the GPL license to be adhered to in using this
#       program, the following additional terms are to be complied with:
#   
#   	1) All versions of this program, verbatim or modified must carry this 
#   	   Legal Notice.
#   
#   	2) Any misrepresentation of the origin of the material is prohibited. It 
#   	   is required that all modified versions of this material be marked in 
#   	   reasonable ways as different from the original version.
#   
#   	3) This license does not grant any rights to any user of the program 
#   	   with regards to rights under trademark law for use of the trade names 
#   	   or trademarks of eGovernments Foundation.
#   
#     In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
#-------------------------------------------------------------------------------   -->
<%@ include file="/includes/taglibs.jsp" %>
<html>
<head>
 <%@ include file="/includes/meta.jsp" %> 
		<title>eGov Financials <decorator:title/></title>
		<link href="<c:url value='/resources/css/budget.css'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/resources/css/commonegovnew.css'/>" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/resources/css/error.css" rel="stylesheet" type="text/css"></link>
		<link rel="stylesheet" type="text/css" href="/egi/commonyui/yui2.8/fonts/fonts-min.css"/>
		<link rel="stylesheet" type="text/css" href="/egi/commonyui/yui2.8/datatable/assets/skins/sam/datatable.css"/>		
		<script type="text/javascript" src="/egi/commonyui/yui2.8/yuiloader/yuiloader-min.js"></script>
		<script type="text/javascript" src="/egi/commonyui/yui2.8/yahoo-dom-event/yahoo-dom-event.js"></script>
		<script type="text/javascript" src="/egi/commonyui/yui2.8/element/element-min.js"></script>
		<script type="text/javascript" src="/egi/commonyui/yui2.8/connection/connection-min.js"></script>
		<script type="text/javascript" src="/egi/commonyui/yui2.8/datasource/datasource-min.js"></script>
		<script type="text/javascript" src="/egi/commonyui/yui2.8/datatable/datatable-min.js"></script>
		<script type="text/javascript" src="/egi/commonyui/yui2.8/autocomplete/autocomplete-min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/jsCommonMethods.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/calenderNew.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/helper.js"></script>
		<script type="text/javascript" src="<c:url value='/resources/global/js/jquery/jquery.js' context='/egi'/>"> </script>
		<script type="text/javascript" src="<c:url value='/resources/global/js/jquery-ui/jquery-ui.js' context='/egi'/>"> </script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/ajax-script.js"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/global/js/jquery-ui/jquery-ui.css' context='/egi'/>" />
		<link href="<c:url value='/css/commonegovNew.css' context='/egi'/>" rel="stylesheet" type="text/css" />
		
		<link href="<c:url value='/resources/global/css/bootstrap/bootstrap.css' context='/egi'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/resources/global/css/egov/custom.css' context='/egi'/>" rel="stylesheet" type="text/css" />
		<link href="<c:url value='/resources/global/css/egov/header-custom.css' context='/egi'/>" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<c:url value='/resources/global/js/bootstrap/bootstrap.js' context='/egi'/>"></script>
		<decorator:head/>
	</head>
	
<script type="text/javascript" >
window.document.onkeydown = function(event) { 
   	 switch (event.keyCode) { 
        case 116 : //F5 button
            event.returnValue = false;
            event.keyCode = 0;
            return false; 
        case 82 : //R button
            if (event.ctrlKey) { //Ctrl button
                event.returnValue = false; 
                event.keyCode = 0;  
                return false; 
            } 
    }
}

</script>	
<body <decorator:getProperty property="body.id" writeEntireProperty="yes"/><decorator:getProperty property="body.class" writeEntireProperty="true"/> <decorator:getProperty property="body.onload" writeEntireProperty="true"/>  >
	
		<div class="page-container">
		    <!-- header -->
		    <egovtags:breadcrumb/> 
		    
		    <!-- pagecontent -->
		    <div class="main-content">
		       <decorator:body/>
		    </div>
		    
		    <!-- footer -->
		    <footer class="main">
			    Powered by <a href="http://egovernments.org/" target="_blank">eGovernments Foundation</a>
			</footer>
	   </div>
	   
	   <!-- loading indicator --> 
	 <div class="modal fade loader-class" data-backdrop="static">
			<div class="modal-dialog">
					<div class="modal-body">
						<div class="row spinner-margin text-center">
							<div class="col-md-12 ">
								<div class="spinner">
									<div class="rect1"></div>
									<div class="rect2"></div>
									<div class="rect3"></div>
									<div class="rect4"></div>
									<div class="rect5"></div>
								</div>
							</div>
							
							<div class="col-md-12 spinner-text">
								Processing your request. Please wait..
							</div>
						</div>
					</div>
			</div>
	 </div>
	  
	  <script>

	    // jQuery plugin to prevent double submission of forms
		jQuery.fn.preventDoubleSubmission = function() {
		jQuery(this).on('submit',function(e){
		    var $form = $(this);
		    if ($form.data('submitted') === true) {
		      // Previously submitted - don't submit again
		      e.preventDefault();
		    } else {
		      // Mark it so that the next submit can be ignored
		      $form.data('submitted', true);
		    }
		  });
		  // Keep chainability
		  return this;
		};

		jQuery("form").submit(function( event ) {
			jQuery('.loader-class').modal('show', {backdrop: 'static'});
		});
		
		jQuery('form').preventDoubleSubmission();
	  
	  </script>
	  
	</body>
</html>
