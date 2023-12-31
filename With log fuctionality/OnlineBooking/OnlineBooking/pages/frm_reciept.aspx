﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_reciept.aspx.cs" Inherits="OnlineBooking.Reporting.frm_reciept" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <rsweb:ReportViewer ID="rpt_reciept" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="741px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1259px">
            <LocalReport ReportPath="pages\rpt_reciept.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy" TypeName="OnlineBooking.Bind_Data_DSTableAdapters.payment_detailsTableAdapter">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="id" SessionField="BOOKID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
