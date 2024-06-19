using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Web.UI;

namespace GestorResidencias.Clases { 
    public class Mensajes {

        #region "Variables"
        private string sIdMensaje;
        private string sIdLenguaje;
        private string sMensaje;
        private Dictionary<string,string> dicMensaje;
        private StringBuilder sConsulta;        
        #endregion

        #region "Enums"
        public enum TipoMensaje {
            Precaucion,
            Error,
            Correcto,
            Informacion            
        }       
        #endregion

        #region "Propiedades"       
        public string IdMensaje {
            get {
                return sIdMensaje;
            }
        }

        public string IdLenguaje {
            get {
                return sIdLenguaje;
            }
        }

        public string Mensaje {
            get {
                return sMensaje;
            }
        }

        public Dictionary<string, string> TablaMensajes {
            get {
                return dicMensaje;
            }
        }      
        #endregion        

        #region "Funciones" 
        public string RecuperaMensaje(string _sIdMensaje, string _sIdComponente) {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("select md.IdMessage, md.Description");
            sConsulta.AppendLine("from MessagesDetail md");
            sConsulta.AppendLine("where md.IdComponent='" + _sIdComponente + "' and IdMessage='" + _sIdMensaje + "'");

            DataTable dtMsj = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());
            
            if (dtMsj.Rows.Count == 0) {
                return "!!No existe el Mensaje!!";               
            } else {
                return dtMsj.Rows[0]["Description"].ToString();
            }
        }

        public void RecuperarTablaMensajes(string _sIdComponente) {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("select md.IdComponent, md.Description");
            sConsulta.AppendLine("from MessagesDetail md");
            sConsulta.AppendLine("where md.IdMessage='" + _sIdComponente + "'");

            DataTable dtMsj = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            dicMensaje = new Dictionary<string, string>();
            foreach (DataRow dr in dtMsj.Rows) {
                dicMensaje.Add(dr["IdComponent"].ToString(), dr["Description"].ToString());
            }
        }

        public void MuestraMensaje(Page _pPagina, string _sTitulo, string _sMensaje, TipoMensaje _sTipo) {            
            sConsulta = new StringBuilder();            
            sConsulta.AppendLine("swal({");
            sConsulta.AppendLine("  title: '"+ _sTitulo + "',");
            sConsulta.AppendLine("  text: '"+ _sMensaje.Replace("'", "").Replace("\r\n", "").Replace("\n", "").Replace("\r", "") + "',");
            sConsulta.AppendLine("  textAlign: \"center\",");
            sConsulta.AppendLine("  buttons: {");            
            sConsulta.AppendLine("    Aceptar: {text: \"Aceptar\", value: true, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("  },");
            switch (_sTipo){
                case TipoMensaje.Correcto:
                    sConsulta.AppendLine("  icon: 'success'");
                    break;
                case TipoMensaje.Error:
                    sConsulta.AppendLine("  icon: 'error'");
                    break;
                case TipoMensaje.Informacion:
                    sConsulta.AppendLine("  icon: 'info'");
                    break;
                case TipoMensaje.Precaucion:
                    sConsulta.AppendLine("  icon: 'warning'");
                    break;
            }            
            sConsulta.AppendLine("});");
            
            ScriptManager.RegisterStartupScript(_pPagina, GetType(), "Popup", sConsulta.ToString(), true);            
        }
        
        public void MuestraMensajeConSaltos(Page _pPagina, string _sTitulo, string _sMensaje, TipoMensaje _sTipo) {            
            sConsulta = new StringBuilder();            
            sConsulta.AppendLine("swal({");
            sConsulta.AppendLine("  title: '"+ _sTitulo + "',");
            sConsulta.AppendLine("  text: '"+ _sMensaje.Replace("'", "") + "',");
            sConsulta.AppendLine("  textAlign: \"center\",");
            sConsulta.AppendLine("  buttons: {");            
            sConsulta.AppendLine("    Aceptar: {text: \"Aceptar\", value: true, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("  },");
            switch (_sTipo){
                case TipoMensaje.Correcto:
                    sConsulta.AppendLine("  icon: 'success'");
                    break;
                case TipoMensaje.Error:
                    sConsulta.AppendLine("  icon: 'error'");
                    break;
                case TipoMensaje.Informacion:
                    sConsulta.AppendLine("  icon: 'info'");
                    break;
                case TipoMensaje.Precaucion:
                    sConsulta.AppendLine("  icon: 'warning'");
                    break;
            }            
            sConsulta.AppendLine("});");
            
            ScriptManager.RegisterStartupScript(_pPagina, GetType(), "Popup", sConsulta.ToString(), true);            
        }

        public void MuestraMensajeConRespuesta(Page _pPagina, string _sTitulo, string _sMensaje, TipoMensaje _sTipo) {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("swal({");
            sConsulta.AppendLine("  title: '" + _sTitulo + "',");
            sConsulta.AppendLine("  text: '" + _sMensaje.Replace("'", "").Replace("\r\n", "").Replace("\n", "").Replace("\r", "") + "',");            
            sConsulta.AppendLine("  textAlign: \"center\",");
            sConsulta.AppendLine("  buttons: {");
            sConsulta.AppendLine("    Cancelar: {text: \"Cancelar\", value: null, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("    Aceptar: {text: \"Aceptar\", value: true, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("  },");
            sConsulta.AppendLine("  closeOnClickOutside: false,");
            sConsulta.AppendLine("  dangerMode: true,");            
            switch (_sTipo) {
                case TipoMensaje.Correcto:
                    sConsulta.AppendLine("  icon: 'success'");
                    break;
                case TipoMensaje.Error:
                    sConsulta.AppendLine("  icon: 'error'");
                    break;
                case TipoMensaje.Informacion:
                    sConsulta.AppendLine("  icon: 'info'");
                    break;
                case TipoMensaje.Precaucion:
                    sConsulta.AppendLine("  icon: 'warning'");
                    break;
            }            
            sConsulta.AppendLine("}).then(function (result) {");
            sConsulta.AppendLine("  if (result) {");            
            sConsulta.AppendLine("      $.ajax({");
            sConsulta.AppendLine("          type: 'POST',");
            sConsulta.AppendLine("          url: '" + _pPagina.AppRelativeVirtualPath.Replace("~/", "") + "/RespPreguntaMensaje',");
            sConsulta.AppendLine("          data: '{}',");
            sConsulta.AppendLine("          contentType: 'application/json; charset=utf-8',");
            sConsulta.AppendLine("          dataType: 'json',");
            sConsulta.AppendLine("          success: function (result) {");
            sConsulta.AppendLine("              window.location = result.d;");
            sConsulta.AppendLine("          },");
            sConsulta.AppendLine("          error: function (result) {}");                        
            sConsulta.AppendLine("      })");
            sConsulta.AppendLine("  }");
            sConsulta.AppendLine("})");

            ScriptManager.RegisterStartupScript(_pPagina, GetType(), "Popup", sConsulta.ToString(), true);
        }

        public void MuestraMensajeConRespuestaSiNo(Page _pPagina, string _sTitulo, string _sMensaje, TipoMensaje _sTipo, string _sMetodoRegreso) {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("swal({");
            sConsulta.AppendLine("  title: '" + _sTitulo + "',");
            sConsulta.AppendLine("  text: '" + _sMensaje.Replace("'", "").Replace("\r\n", "").Replace("\n", "").Replace("\r", "") + "',");            
            sConsulta.AppendLine("  textAlign: \"center\",");
            sConsulta.AppendLine("  buttons: {");
            sConsulta.AppendLine("    Cancelar: {text: \"No\", value: true, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("    Aceptar: {text: \"Si\", value: null, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("  },");
            sConsulta.AppendLine("  closeOnClickOutside: false,");
            sConsulta.AppendLine("  dangerMode: true,");            
            switch (_sTipo) {
                case TipoMensaje.Correcto:
                    sConsulta.AppendLine("  icon: 'success'");
                    break;
                case TipoMensaje.Error:
                    sConsulta.AppendLine("  icon: 'error'");
                    break;
                case TipoMensaje.Informacion:
                    sConsulta.AppendLine("  icon: 'info'");
                    break;
                case TipoMensaje.Precaucion:
                    sConsulta.AppendLine("  icon: 'warning'");
                    break;
            }            
            sConsulta.AppendLine("}).then(function (result) {");
            sConsulta.AppendLine("  if (result) {");            
            sConsulta.AppendLine("      $.ajax({");
            sConsulta.AppendLine("          type: 'POST',");
            sConsulta.AppendLine("          url: '" + _pPagina.AppRelativeVirtualPath.Replace("~/", "") + "/" + _sMetodoRegreso + "',");
            sConsulta.AppendLine("          data: '{}',");
            sConsulta.AppendLine("          contentType: 'application/json; charset=utf-8',");
            sConsulta.AppendLine("          dataType: 'json',");
            sConsulta.AppendLine("          success: function (result) {");
            sConsulta.AppendLine("              window.location = result.d;");
            sConsulta.AppendLine("          },");
            sConsulta.AppendLine("          error: function (result) {}");                        
            sConsulta.AppendLine("      })");
            sConsulta.AppendLine("  }");
            sConsulta.AppendLine("})");

            ScriptManager.RegisterStartupScript(_pPagina, GetType(), "Popup", sConsulta.ToString(), true);
        }

        public void MuestraMensajeConRespuesta(Page _pPagina, string _sTitulo, string _sMensaje, TipoMensaje _sTipo, string _sMetodoRegreso) {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("swal({");
            sConsulta.AppendLine("  title: '" + _sTitulo + "',");
            sConsulta.AppendLine("  text: '" + _sMensaje.Replace("'", "").Replace("\r\n", "").Replace("\n", "").Replace("\r", "") + "',");
            sConsulta.AppendLine("  textAlign: \"center\",");
            sConsulta.AppendLine("  buttons: {");
            sConsulta.AppendLine("    Cancelar: {text: \"Cancelar\", value: null, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("    Aceptar: {text: \"Aceptar\", value: true, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("  },");
            sConsulta.AppendLine("  closeOnClickOutside: false,");
            sConsulta.AppendLine("  dangerMode: true,");
            switch (_sTipo) {
                case TipoMensaje.Correcto:
                    sConsulta.AppendLine("  icon: 'success'");
                    break;
                case TipoMensaje.Error:
                    sConsulta.AppendLine("  icon: 'error'");
                    break;
                case TipoMensaje.Informacion:
                    sConsulta.AppendLine("  icon: 'info'");
                    break;
                case TipoMensaje.Precaucion:
                    sConsulta.AppendLine("  icon: 'warning'");
                    break;
            }
            sConsulta.AppendLine("}).then(function (result) {");
            sConsulta.AppendLine("  if (result) {");
            sConsulta.AppendLine("      $.ajax({");
            sConsulta.AppendLine("          type: 'POST',");
            sConsulta.AppendLine("          url: '" + _pPagina.AppRelativeVirtualPath.Replace("~/", "") + "/"+ _sMetodoRegreso+"',");
            sConsulta.AppendLine("          data: '{}',");
            sConsulta.AppendLine("          contentType: 'application/json; charset=utf-8',");
            sConsulta.AppendLine("          dataType: 'json',");
            sConsulta.AppendLine("          success: function (result) {");
            sConsulta.AppendLine("              window.location = result.d;");
            sConsulta.AppendLine("          },");
            sConsulta.AppendLine("          error: function (result) {}");
            sConsulta.AppendLine("      })");
            sConsulta.AppendLine("  }");
            sConsulta.AppendLine("})");

            ScriptManager.RegisterStartupScript(_pPagina, GetType(), "Popup", sConsulta.ToString(), true);
        }

        public void MuestraMensajeConRespuesta(Page _pPagina, string _sTitulo, string _sMensaje, TipoMensaje _sTipo, string _sMetodoRegreso, string _sParametros) {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("swal({");
            sConsulta.AppendLine("  title: '" + _sTitulo + "',");
            sConsulta.AppendLine("  text: '" + _sMensaje.Replace("'", "").Replace("\r\n", "").Replace("\n", "").Replace("\r", "") + "',");
            sConsulta.AppendLine("  textAlign: \"center\",");
            sConsulta.AppendLine("  buttons: {");
            sConsulta.AppendLine("    Cancelar: {text: \"Cancelar\", value: null, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("    Aceptar: {text: \"Aceptar\", value: true, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("  },");
            sConsulta.AppendLine("  closeOnClickOutside: false,");
            sConsulta.AppendLine("  dangerMode: true,");
            switch (_sTipo) {
                case TipoMensaje.Correcto:
                    sConsulta.AppendLine("  icon: 'success'");
                    break;
                case TipoMensaje.Error:
                    sConsulta.AppendLine("  icon: 'error'");
                    break;
                case TipoMensaje.Informacion:
                    sConsulta.AppendLine("  icon: 'info'");
                    break;
                case TipoMensaje.Precaucion:
                    sConsulta.AppendLine("  icon: 'warning'");
                    break;
            }
            sConsulta.AppendLine("}).then(function (result) {");
            sConsulta.AppendLine("  if (result) {");
            sConsulta.AppendLine("      $.ajax({");
            sConsulta.AppendLine("          type: 'POST',");
            sConsulta.AppendLine("          url: '" + _pPagina.AppRelativeVirtualPath.Replace("~/", "") + "/"+ _sMetodoRegreso+"',");
            String[] sValores = _sParametros.Split('|');
            string sCadena = "";
            int i = 1;
            foreach(string n in sValores)
            {
                if (i == 1)
                {
                    sCadena += "parameter" + i.ToString() + ":\"" + n + "\"";
                }
                else
                {
                    sCadena += ", parameter" + i.ToString() + ":\"" + n + "\"";
                }
                i++;
            }
            sConsulta.AppendLine("          data: JSON.stringify({ " + sCadena + " }),");
            sConsulta.AppendLine("          contentType: 'application/json; charset=utf-8',");
            sConsulta.AppendLine("          dataType: 'json',");
            sConsulta.AppendLine("          success: function (result) {");
            sConsulta.AppendLine("              window.location = result.d;");
            sConsulta.AppendLine("          },");
            sConsulta.AppendLine("          error: function (result) {}");
            sConsulta.AppendLine("      })");
            sConsulta.AppendLine("  }");
            sConsulta.AppendLine("})");

            ScriptManager.RegisterStartupScript(_pPagina, GetType(), "Popup", sConsulta.ToString(), true);
        }

        public void MuestraMensajeConRespuestaSoloAceptar(Page _pPagina, string _sTitulo, string _sMensaje, TipoMensaje _sTipo, string _sMetodoRegreso) {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("swal({");
            sConsulta.AppendLine("  title: '" + _sTitulo + "',");
            sConsulta.AppendLine("  text: '" + _sMensaje.Replace("'", "").Replace("\r\n", "").Replace("\n", "").Replace("\r", "") + "',");
            sConsulta.AppendLine("  textAlign: \"center\",");
            sConsulta.AppendLine("  buttons: {");            
            sConsulta.AppendLine("    Aceptar: {text: \"Aceptar\", value: true, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("  },");
            sConsulta.AppendLine("  closeOnClickOutside: false,");
            sConsulta.AppendLine("  dangerMode: true,");
            switch (_sTipo) {
                case TipoMensaje.Correcto:
                    sConsulta.AppendLine("  icon: 'success'");
                    break;
                case TipoMensaje.Error:
                    sConsulta.AppendLine("  icon: 'error'");
                    break;
                case TipoMensaje.Informacion:
                    sConsulta.AppendLine("  icon: 'info'");
                    break;
                case TipoMensaje.Precaucion:
                    sConsulta.AppendLine("  icon: 'warning'");
                    break;
            }
            sConsulta.AppendLine("}).then(function (result) {");
            sConsulta.AppendLine("  if (result) {");
            sConsulta.AppendLine("      $.ajax({");
            sConsulta.AppendLine("          type: 'POST',");
            sConsulta.AppendLine("          url: '" + _pPagina.AppRelativeVirtualPath.Replace("~/", "") + "/"+ _sMetodoRegreso+"',");
            sConsulta.AppendLine("          data: '{}',");
            sConsulta.AppendLine("          contentType: 'application/json; charset=utf-8',");
            sConsulta.AppendLine("          dataType: 'json',");
            sConsulta.AppendLine("          success: function (result) {");
            sConsulta.AppendLine("              window.location = result.d;");
            sConsulta.AppendLine("          },");
            sConsulta.AppendLine("          error: function (result) {}");
            sConsulta.AppendLine("      })");
            sConsulta.AppendLine("  }");
            sConsulta.AppendLine("})");

            ScriptManager.RegisterStartupScript(_pPagina, GetType(), "Popup", sConsulta.ToString(), true);
        }

        public void MensajeConRespuestaSalir(Page _pPagina, string _sTitulo, string _sMensaje, TipoMensaje _sTipo) {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("swal({");
            sConsulta.AppendLine("  title: '" + _sTitulo + "',");
            sConsulta.AppendLine("  text: '" + _sMensaje.Replace("'", "").Replace("\r\n", "").Replace("\n", "").Replace("\r", "") + "',");
            sConsulta.AppendLine("  buttons: ['Cancelar', true],");
            sConsulta.AppendLine("  closeOnClickOutside: false,");
            sConsulta.AppendLine("  dangerMode: true,");
            switch (_sTipo) {
                case TipoMensaje.Correcto:
                    sConsulta.AppendLine("  icon: 'success'");
                    break;
                case TipoMensaje.Error:
                    sConsulta.AppendLine("  icon: 'error'");
                    break;
                case TipoMensaje.Informacion:
                    sConsulta.AppendLine("  icon: 'info'");
                    break;
                case TipoMensaje.Precaucion:
                    sConsulta.AppendLine("  icon: 'warning'");
                    break;
            }
            sConsulta.AppendLine("}).then(function (result) {");
            sConsulta.AppendLine("  if (result) {");
            sConsulta.AppendLine("      $.ajax({");
            sConsulta.AppendLine("          type: 'POST',");
            sConsulta.AppendLine("          url: '" + _pPagina.AppRelativeVirtualPath.Replace("~/", "") + "/RespPreguntaSalir',");
            sConsulta.AppendLine("          data: '{}',");
            sConsulta.AppendLine("          contentType: 'application/json; charset=utf-8',");
            sConsulta.AppendLine("          dataType: 'json',");
            sConsulta.AppendLine("          success: function (result) {");
            sConsulta.AppendLine("              window.location = result.d;");
            sConsulta.AppendLine("          },");
            sConsulta.AppendLine("          error: function (result) {}");
            sConsulta.AppendLine("      })");
            sConsulta.AppendLine("  }");
            sConsulta.AppendLine("})");

            ScriptManager.RegisterStartupScript(_pPagina, GetType(), "Popup", sConsulta.ToString(), true);
        }                    

        public void MuestraMensajeHtml(Page _pPagina, string _sTitulo, string _sMensaje, TipoMensaje _sTipo) {            
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("var span = document.createElement(\"span\");");
            sConsulta.AppendLine("span.innerHTML='" + _sMensaje.Replace("'", "") + "'");
            sConsulta.AppendLine("swal({");
            sConsulta.AppendLine("  title: '"+ _sTitulo + "',");            
            sConsulta.AppendLine("  content: span,");
            //sConsulta.AppendLine("  textAlign: \"center\",");
            sConsulta.AppendLine("  buttons: {");            
            sConsulta.AppendLine("    Aceptar: {text: \"Aceptar\", value: true, className: \"sym-headerbackground\"},");
            sConsulta.AppendLine("  },");
            switch (_sTipo){
                case TipoMensaje.Correcto:
                    sConsulta.AppendLine("  icon: 'success'");
                    break;
                case TipoMensaje.Error:
                    sConsulta.AppendLine("  icon: 'error'");
                    break;
                case TipoMensaje.Informacion:
                    sConsulta.AppendLine("  icon: 'info'");
                    break;
                case TipoMensaje.Precaucion:
                    sConsulta.AppendLine("  icon: 'warning'");
                    break;
            }            
            sConsulta.AppendLine("});");
            
            ScriptManager.RegisterStartupScript(_pPagina, GetType(), "Popup", sConsulta.ToString(), true);            
        }        

        #endregion
    }
}