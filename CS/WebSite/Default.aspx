<%-- BeginRegion Page setup --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ASPxperience_DataView_ItemCommand" %>

<%@ Register Assembly="DevExpress.Web.v8.1" Namespace="DevExpress.Web.ASPxCallback"
    TagPrefix="dxcb" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v8.1" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dxdv" %>
<%-- EndRegion --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>How to show detail information of DataView item on Callback</title>
    <script type="text/javascript">
    function ShowImage(id) {
        if (ASPxCallback1.InCallback()) 
            return;
        document.getElementById('imageCell').innerHTML = 'Loading...';
        ASPxCallback1.SendCallback(id);
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    
    <div>
    
<table cellpadding="0" cellspacing="0">
<tr>
    <td valign="top">
        <dxdv:ASPxDataView ID="dvThumbnails" runat="server" RowPerPage="2" ColumnCount="2" DataSourceID="XmlDataSource1" BackColor="#F2F2F2">
            <ItemStyle Height="0px" Width="0px" HorizontalAlign="Center" BackColor="White" />
            <ItemTemplate>
                <div style="margin-bottom: 2px;">
                <dxe:ASPxHyperLink ID="ASPxHyperLink1" runat="server" ImageUrl='<%# "Images/Small/" + Eval("FileName") %>' Text='<%# "Image: " + Eval("id") %>' ToolTip='<%# "Click to view image: " + Eval("id") %>' NavigateUrl='<%# "javascript:ShowImage(" + Eval("id") + ");"%>' Height="120px" Width="160px"  >
                </dxe:ASPxHyperLink>
                </div>
                    <dxe:aspxlabel id="ASPxLabel1" runat="server" text='<%# Eval("Text") %>' EnableDefaultAppearance="False"></dxe:aspxlabel>
            </ItemTemplate>
        </dxdv:ASPxDataView>
    </td>
    <td id="imageCell" valign="top" style="padding-left: 16px;">
        <asp:Panel ID="Panel1" runat="server" EnableViewState="false" Visible="false">
            <asp:Panel ID="ImagePanel" runat="server" >
                            <dxe:ASPxImage ID="LargeImage" runat="server" Height="240px" Width="320px">
                                </dxe:ASPxImage><br />
                <dxe:ASPxLabel ID="LargeImageText" runat="server" Text="">
                </dxe:ASPxLabel>
            </asp:Panel>
        </asp:Panel>        
    </td>
</tr>
</table>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/Images.xml">
        </asp:XmlDataSource><asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/App_Data/Images.xml" XPath="//items/item[@id='1']">
        </asp:XmlDataSource>
        <dxcb:ASPxCallback ID="ASPxCallback1" runat="server" OnCallback="ASPxCallback1_Callback">
            <ClientSideEvents CallbackComplete="function(s, e) {
    document.getElementById('imageCell').innerHTML = e.result;
}" />
        </dxcb:ASPxCallback>
        
    </div>
    </form>
</body>
</html>
