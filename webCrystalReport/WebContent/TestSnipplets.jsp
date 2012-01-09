<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%------------Beginning of 'Open and View Report' snippet----------------%><%
//Use the relative path to the report; the physical or full qualified URL cannot be used.
String reportName = "/CrystalReport1.rpt";

//Check if the Report Source Session Variable already exists
Object reportSource = session.getAttribute("Report1");

//if the report source has not been opened
if (reportSource == null)
{
	//---------- Create a ReportClientDocument -------------
    com.crystaldecisions.sdk.occa.report.application.ReportClientDocument reportClientDocument = new com.crystaldecisions.sdk.occa.report.application.ReportClientDocument();
    reportClientDocument.setReportAppServer(com.crystaldecisions.sdk.occa.report.application.ReportClientDocument.inprocConnectionString);

    //---------- Set the path to the location of the report source -------------

    //Open report
    reportClientDocument.open(reportName, 0);

    //Get report source
    reportSource = reportClientDocument.getReportSource();

    //Cache report source session variable
    //This will be used by the viewer to display the desired report.
    session.setAttribute("Report1", reportSource);
}    
    
//---------- Create the viewer and render the report -------------
	
//Create the CrystalReportViewer object
com.crystaldecisions.report.web.viewer.CrystalReportViewer crystalReportViewer = new com.crystaldecisions.report.web.viewer.CrystalReportViewer();

//Set the reportsource property of the viewer
crystalReportViewer.setReportSource(reportSource);

//Set viewer attributes
crystalReportViewer.setOwnPage(true);
  
//Set the CrystalReportViewer print mode
crystalReportViewer.setPrintMode(com.crystaldecisions.report.web.viewer.CrPrintMode.PDF);

//Process the report
crystalReportViewer.processHttpRequest(request, response, getServletConfig().getServletContext(), null); 
%><%------------End of 'Open and View Report' snippet----------------%>

<%------------Beginning of 'Open and Export Report to PDF' snippet----------------%><%
    // TODO Ensure that the JSP page contains no content before exporting

    com.crystaldecisions.sdk.occa.report.application.ReportClientDocument reportClientDocument = new com.crystaldecisions.sdk.occa.report.application.ReportClientDocument();
    reportClientDocument.setReportAppServer(com.crystaldecisions.sdk.occa.report.application.ReportClientDocument.inprocConnectionString);
    //Open report
    reportClientDocument.open("C:/UpldFile", 0);
    com.businessobjects.samples.CRJavaHelper.exportPDF(reportClientDocument, response, true);
%><%------------End of 'Open and Export Report to PDF' snippet----------------%>

</body>
</html>