using Ionic.Zip;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GestorResidencias
{
    public partial class Download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String sArchivos = Request.QueryString["filename"].ToString();

            String sNombreZip = "";
            using (ZipFile zip = new ZipFile())
            {
                int iCont = 0;

                foreach (String sDoc in sArchivos.Split('|'))
                {
                    if (iCont == 0)
                    {
                        sNombreZip = sDoc;
                    }
                    else
                    {
                        if (sDoc != "")
                        {
                            zip.AddFile(sDoc, "");
                        }
                    }
                    iCont++;
                }

                sNombreZip = Path.GetTempPath() + sNombreZip + "_" + DateTime.Now.ToString("yyyy-MM-ddThh-mm-ss") + ".zip";
                zip.Save(sNombreZip);
            }

            String[] _sArchivo = sArchivos.Split('|');

            if (File.Exists(_sArchivo[1]))
            {
                File.Delete(_sArchivo[1]);
            }

            FileInfo file = new FileInfo(sNombreZip);
            if (file.Exists)
            {
                Response.ClearContent();
                Response.AddHeader("Content-Disposition", String.Format("attachment; filename={0}", file.Name));
                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = ReturnFiletype(file.Extension.ToLower());
                Response.TransmitFile(file.FullName);
                Response.End();
            }
            else
            {
                Response.ContentType = "text/plain";
            }

        }

        public static string ReturnFiletype(string fileExtension)
        {
            switch (fileExtension)
            {
                case ".htm":
                case ".html":
                case ".log":
                    return "text/HTML";
                case ".txt":
                    return "text/plain";
                case ".doc":
                    return "application/ms-word";
                case ".tiff":
                case ".tif":
                    return "image/tiff";
                case ".asf":
                    return "video/x-ms-asf";
                case ".avi":
                    return "video/avi";
                case ".zip":
                    return "application/zip";
                case ".xls":
                case ".csv":
                    return "application/vnd.ms-excel";
                case ".gif":
                    return "image/gif";
                case ".jpg":
                case "jpeg":
                    return "image/jpeg";
                case ".bmp":
                    return "image/bmp";
                case ".wav":
                    return "audio/wav";
                case ".mp3":
                    return "audio/mpeg3";
                case ".mpg":
                case "mpeg":
                    return "video/mpeg";
                case ".rtf":
                    return "application/rtf";
                case ".asp":
                    return "text/asp";
                case ".pdf":
                    return "application/pdf";
                case ".fdf":
                    return "application/vnd.fdf";
                case ".ppt":
                    return "application/mspowerpoint";
                case ".dwg":
                    return "image/vnd.dwg";
                case ".msg":
                    return "application/msoutlook";
                case ".xml":
                case ".sdxl":
                    return "application/xml";
                case ".xdp":
                    return "application/vnd.adobe.xdp+xml";
                default:
                    return "application/octet-stream";
            }
        }
    }
}