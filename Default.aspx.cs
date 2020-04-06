using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Code");
            dt.Columns.Add("Propriétaire");
            dt.Columns.Add("Adresse");
            dt.Columns.Add("Surface");

            foreach (Declaration dec in GetAllDeclarations()) {
                dt.Rows.Add(new object[] { dec.codeHabitation, dec.proprietaire, dec.adresse, dec.surface });
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        /* Permet de recuperer la liste des declarations a partir du restfull API*/
        private List<Declaration> GetAllDeclarations()
        {
            WebClient proxy = new WebClient();
            string url = "http://127.0.0.1:8080/ws_declarationsIndiv";
            byte[] _data = proxy.DownloadData(url);
            Stream _mem = new MemoryStream(_data);
            var reader = new StreamReader(_mem);
            var result = reader.ReadToEnd();

            List<Declaration> decs = JsonConvert.DeserializeObject<List<Declaration>>(result);
            return decs;
        }

        protected void GridView_PreRender(object sender, EventArgs e)
        {
            GridView gv = (GridView)sender;

            if ((gv.ShowHeader == true && gv.Rows.Count > 0)
                || (gv.ShowHeaderWhenEmpty == true))
            {
                //Force GridView to use <thead> instead of <tbody> - 11/03/2013 - MCR.
                gv.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            if (gv.ShowFooter == true && gv.Rows.Count > 0)
            {
                //Force GridView to use <tfoot> instead of <tbody> - 11/03/2013 - MCR.
                gv.FooterRow.TableSection = TableRowSection.TableFooter;
            }
        }
    }
}