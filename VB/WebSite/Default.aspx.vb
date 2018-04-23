Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Collections
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.ComponentModel
Imports DevExpress.Web.ASPxDataView
Imports System.Text
Imports DevExpress.Web.ASPxCallback
Imports System.Xml


Partial Public Class ASPxperience_DataView_ItemCommand
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub ASPxCallback1_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
		Dim xpath As String = String.Format("//items/item[@id='{0}']", e.Parameter)
		Dim node As XmlNode = XmlDataSource2.GetXmlDocument().SelectSingleNode(xpath)
		If node IsNot Nothing Then
			LargeImage.ImageUrl = "Images/" & node.Attributes("FileName").Value
			LargeImage.AlternateText = node.Attributes("Text").Value
			LargeImageText.Text = node.Attributes("Text").Value
		End If
		e.Result = ASPxCallback.GetRenderResult(ImagePanel)
	End Sub
End Class