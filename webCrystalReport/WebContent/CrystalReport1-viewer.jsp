<%@ page contentType="text/html; charset=UTF-8" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="/crystal-tags-reportviewer.tld" prefix="crviewer" %>
<crviewer:viewer 
	reportSourceType="reportingComponent" 
	viewerName="CrystalReport1-viewer" 
	reportSourceVar="CrystalReport1" 
	isOwnPage="true">
		<crviewer:report reportName="Sample Reports/Consolidated Balance Sheet.rpt" />
</crviewer:viewer> 


<%@ taglib uri="/crystal-tags-reportviewer.tld" prefix="crviewer" %>
<crviewer:viewer 
	isOwnPage="true" 
	viewerName="CrystalViewer" 
	reportSourceType="reportingComponent" 
	reportSourceVar="Customer Profile Report">

		<crviewer:report reportName="/Customer Profile Report.rpt"/>

</crviewer:viewer>

  