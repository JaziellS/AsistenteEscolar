using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace GestorResidencias.Clases
{
    public class Generales
    {
        #region Variables        
        public static String glsNombreApp;
        private const string UsuarioSession = "UsuarioSession";
        #endregion

        #region Propiedades
        public static Usuario glsUsuarioSession
        {
            get
            {
                if (null != HttpContext.Current.Session[UsuarioSession])
                    return HttpContext.Current.Session[UsuarioSession] as Usuario;
                else
                    return null;
            }
            set
            {
                HttpContext.Current.Session[UsuarioSession] = value;
            }
        }
        #endregion

        #region Funciones
        public static String ObtieneNuevoID()
        {
            String sId = "";

            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("Select newid() as NuevoID");

            DataTable dtId = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            sId = dtId.Rows[0]["NuevoID"].ToString();

            return sId;
        }

        public static DataTable ObtieneNotificacionesGenerales(String _sIdUser)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from NotificationsGeneral");
            sConsulta.AppendLine("where IdTypeState='1' and IdUser='" + _sIdUser + "'");
            sConsulta.AppendLine("order by DateCreation");

            DataTable dtNotificaciones = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            return dtNotificaciones;
        }

        public static void InsertaNotificacion(String _sIdUser, String _sDescripcion, String _sIdTypeNotificacion, String _sReturnView)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                
                sConsulta.AppendLine("insert NotificationsGeneral (IdNotification, IdUser, Description, IdTypeState, IdTypeNotification, ReturnView, DateCreation, IdUserCreation)");
                sConsulta.AppendLine("values('" + Generales.ObtieneNuevoID() + "', '" + _sIdUser + "', '" + _sDescripcion + "', '1', '" + _sIdTypeNotificacion + "', '" + _sReturnView + "', GETDATE(), '')");
                

                oConexion.EjecutaConsulta(sConsulta.ToString());
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static void EliminarNotificacion(String _sIdNotification)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();

                sConsulta.AppendLine("delete NotificationsGeneral");
                sConsulta.AppendLine("where IdNotification='" + _sIdNotification + "'");


                oConexion.EjecutaConsulta(sConsulta.ToString());
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static void LimpiarNotificaciones(String _sIdUser)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();

                sConsulta.AppendLine("delete NotificationsGeneral");
                sConsulta.AppendLine("where IdUser='" + _sIdUser + "'");


                oConexion.EjecutaConsulta(sConsulta.ToString());
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }
        #endregion
    }

    public class ValoresPorReferencia
    {
        #region Funciones
        public static DataTable RecuperaValorReferencia(String _sIdValor)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("select rv.IdValue, rv.Description as DescValue, rvd.IdValueDetail, rvd.Name, rvd.Description as DescValueDetail");
            sConsulta.AppendLine("from ReferenceValues rv ");
            sConsulta.AppendLine("inner join ReferenceValuesDetail rvd on rv.IdValue=rvd.IdValue");
            sConsulta.AppendLine("where rv.IdValue='" + _sIdValor + "' and rvd.IdTypeState=1");
            sConsulta.AppendLine("order by rvd.[Order] ");

            DataTable dtValores = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            return dtValores;
        }

        public static DataTable RecuperaValorReferenciaOmitiendoDato(String _sIdValor, String _sIdValorOmitir)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("select rv.IdValue, rv.Description as DescValue, rvd.IdValueDetail, rvd.Name, rvd.Description as DescValueDetail");
            sConsulta.AppendLine("from ReferenceValues rv ");
            sConsulta.AppendLine("inner join ReferenceValuesDetail rvd on rv.IdValue=rvd.IdValue");
            sConsulta.AppendLine("where rv.IdValue='" + _sIdValor + "' and rvd.IdTypeState=1 and rvd.IdValueDetail != '" + _sIdValorOmitir + "'");
            sConsulta.AppendLine("order by rvd.[Order] ");

            DataTable dtValores = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            return dtValores;
        }

        public static String ObtieneDatoValorPorReferencia(String _sIdValor, String _sIdValorDetalle)
        {
            String sValor = "";
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("select rv.IdValue, rv.Description as DescValue, rvd.IdValueDetail, rvd.Name, rvd.Description as DescValueDetail");
            sConsulta.AppendLine("from ReferenceValues rv ");
            sConsulta.AppendLine("inner join ReferenceValuesDetail rvd on rv.IdValue=rvd.IdValue");
            sConsulta.AppendLine("where rv.IdValue='" + _sIdValor + "' and rvd.IdValueDetail='" + _sIdValorDetalle + "' and rvd.IdTypeState=1");
            sConsulta.AppendLine("order by rvd.[Order] ");

            DataTable dtValores = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtValores.Rows.Count != 0)
            {
                sValor = dtValores.Rows[0]["Name"].ToString();
            }

            return sValor;
        }
        #endregion
    }
}