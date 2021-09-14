<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script RunAt="server">

    static void RegisterRoutes(RouteCollection routes)
    {
        //first param is unique, second param is the expected url, thrid param is the actual file/page
        //general root menu
        routes.MapPageRoute("rten", "en", "~/Default.aspx");
        routes.MapPageRoute("rtIndex", "Index", "~/Default.aspx");
        routes.MapPageRoute("rtHome", "Home", "~/Default.aspx");
        routes.MapPageRoute("rtDashbaord", "Dashboard", "~/Dashboard.aspx");
        routes.MapPageRoute("rtChanePassword", "Change-Password", "~/ChangePassword.aspx");
        routes.MapPageRoute("rtAudittrail", "Audit-Trail", "~/AuditTrail.aspx");
        routes.MapPageRoute("rtLoggedOutReport", "LoggedOut_Report", "~/LogOurReport.aspx");
        routes.MapPageRoute("rtLoggedInReport", "Loggedin_Report", "~/LoginReport.aspx");
         routes.MapPageRoute("rtUserType", "User-Type", "~/UserType.aspx");
           routes.MapPageRoute("rtDepartment", "Department", "~/Department.aspx");

         routes.MapPageRoute("rtVisitor", "Visitor", "~/Visitor.aspx");
           routes.MapPageRoute("rtEmployee", "Employee", "~/Employee.aspx");

    }
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        RegisterRoutes(RouteTable.Routes);
        //SqlServerTypes.Utilities.LoadNativeAssemblies(Server.MapPath("~/bin"));
    }
</script>