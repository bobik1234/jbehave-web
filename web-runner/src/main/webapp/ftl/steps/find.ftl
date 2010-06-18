<#import "/ftl/waffle/i18n.ftl" as i>
<#import "/ftl/waffle/form.ftl" as w>
<html xmlns="http://www.w3.org/1999/xhtml">
<body>
<head>
    <title><@i.messageFor "findSteps" "Find Steps"/></title>
</head>
<#include "/ftl/navigation.ftl" parse="true">
<div id="content">
    <form action="${base}/steps/find.action">

		<#assign stepdocs = stepdocContext.stepdocs />		
		<#assign view = stepdocContext.view />
        <#if (stepdocs.size() > 0) >
        <div id="stepdocs">  
	 		 <fieldset>
	             <legend><@i.messageFor "findSteps" "Find Steps"/></legend>
                 <p><@i.messageFor "stepdocsDescription" "Patterns and methods matching the textual step (if blank all are shown)"/></p>
                 <p><@w.textarea "stepdocContext.matchingStep" "${stepdocContext.matchingStep}" "rows='4' cols='100'"/></p>
                 <p><a href="javascript:fireActionMethod('find');"><@i.messageFor "find" "Find"/></a> 
                     <@w.selectSingle "stepdocContext.view" w.asNameableValues(stepdocContext.getViews(),"name()","name()") stepdocContext.getView() 
                   "onchange=\"fireActionMethod('toggle');\"" />
                 </p>
                 <p>
                    <pre class="brush: plain">
			            <#list stepdocs as stepdoc>
	    		            ${stepdoc.startingWord} ${stepdoc.pattern}
							<#if (view == 'WITH_METHODS') >
	   		 		            ${stepdoc.methodSignature}
	    		            </#if>
	            		</#list>
                    </pre>
                </p>
	         </fieldset>           
         </div>
		</#if>	
         
    </form>
</div>
</body>
</html>