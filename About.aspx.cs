using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //var id = Request["Id"];
            //if (id != null)
            //{
                //Declaration dec = GetDeclarationById(id);
            //}
        }

        /* PERMET DE RECUPERER DEPUIS L'API UNE DECLARATION EN FONCTION DE SON ID */
        private Declaration GetDeclarationById(string text)
        {
            WebClient proxy = new WebClient();
            string url = string.Format("http://127.0.0.1:8080/ws_declaration/{0}", text);
            byte[] _data = proxy.DownloadData(url);
            Stream _mem = new MemoryStream(_data);
            var reader = new StreamReader(_mem);
            var result = reader.ReadToEnd();

            Declaration dec = JsonConvert.DeserializeObject<Declaration>(result);
            return dec;
        }
    }
}