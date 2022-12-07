using DevExpress.Web;
using System;
using System.Xml;


public partial class ASPxperience_DataView_ItemCommand : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void ASPxCallback1_Callback(object source, DevExpress.Web.CallbackEventArgs e) {
        string xpath = string.Format("//items/item[@id='{0}']", e.Parameter);
        XmlNode node = XmlDataSource2.GetXmlDocument().SelectSingleNode(xpath);
        if(node != null) {
            LargeImage.ImageUrl = "Images/" + node.Attributes["FileName"].Value;
            LargeImage.AlternateText = node.Attributes["Text"].Value;
            LargeImageText.Text = node.Attributes["Text"].Value; 
        }
        e.Result = ASPxCallback.GetRenderResult(ImagePanel);
    }
}