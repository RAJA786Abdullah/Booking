<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_voucher.aspx.cs" Inherits="OnlineBooking.pages.frm_voucher" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%--<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer Visible="False" runat="server" ID="rpt_voucher" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1300px" AsyncRendering="False" Height="976px">
            <localreport reportpath="pages\rpt_voucher.rdlc">
                <datasources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSet2" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="DataSet3" />

                </datasources>
            </localreport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.bankTableAdapter" UpdateMethod="Update">
         
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.CustomerAdditional_chTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id" SessionField="CBID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.voucher_dataTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id" SessionField="CBID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>              
        <br />

        

    </div>
    </form>
</body>
</html>
