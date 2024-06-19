using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace GestorResidencias.Clases
{
    public class Empresa
    {
        #region Variables
        private string sIdCompany;
        private string sName;
        private string sIdBranch;
        private string sIdSector;
        private string sRFC;
        private string sStreetName;
        private string sOutdoorNumber;
        private string sInteriorNumber;
        private string sCologne;
        private string sMunicipality;
        private string sPostalCode;
        private string sOfficePhone;
        private string sFax;
        private string sIdSizeCompany;
        private string sMissionCompany;
        private string sOwnerName;
        private string sCity;
        private string sState;
        private string sGiro;
        private string sIdTypeState;

        StringBuilder sConsulta;

        Conexion oConexion;
        #endregion

        #region Propiedades
        public string IdCompany
        {
            get
            {
                return sIdCompany;
            }
            set
            {
                sIdCompany = value;
            }
        }

        public string Nombre
        {
            get
            {
                return sName;
            }
            set
            {
                sName = value;
            }
        }

        public string IdRamo
        {
            get
            {
                return sIdBranch;
            }
            set
            {
                sIdBranch = value;
            }
        }

        public string IdSector
        {
            get
            {
                return sIdSector;
            }
            set
            {
                sIdSector = value;
            }
        }

        public string RFC
        {
            get
            {
                return sRFC;
            }
            set
            {
                sRFC = value;
            }
        }

        public string NombreCalle
        {
            get
            {
                return sStreetName;
            }
            set
            {
                sStreetName = value;
            }
        }

        public string NumeriorExterior
        {
            get
            {
                return sOutdoorNumber;
            }
            set
            {
                sOutdoorNumber = value;
            }
        }

        public string NumeroInterior
        {
            get
            {
                return sInteriorNumber;
            }
            set
            {
                sInteriorNumber = value;
            }
        }

        public string Colonia
        {
            get
            {
                return sCologne;
            }
            set
            {
                sCologne = value;
            }
        }

        public string Municipio
        {
            get
            {
                return sMunicipality;
            }
            set
            {
                sMunicipality = value;
            }
        }

        public string NumeroPostal
        {
            get
            {
                return sPostalCode;
            }
            set
            {
                sPostalCode = value;
            }
        }

        public string TelefonoOficina
        {
            get
            {
                return sOfficePhone;
            }
            set
            {
                sOfficePhone = value;
            }
        }

        public string Fax
        {
            get
            {
                return sFax;
            }
            set
            {
                sFax = value;
            }
        }

        public string IdTamanioCompania
        {
            get
            {
                return sIdSizeCompany;
            }
            set
            {
                sIdSizeCompany = value;
            }
        }

        public string MisionEmpresa
        {
            get
            {
                return sMissionCompany;
            }
            set
            {
                sMissionCompany = value;
            }
        }

        public string NombreDuenio
        {
            get
            {
                return sOwnerName;
            }
            set
            {
                sOwnerName = value;
            }
        }

        public string Ciudad
        {
            get
            {
                return sCity;
            }
            set
            {
                sCity = value;
            }
        }

        public string Giro
        {
            get
            {
                return sGiro;
            }
            set
            {
                sGiro = value;
            }
        }

        public string Estado
        {
            get
            {
                return sState;
            }
            set
            {
                sState = value;
            }
        }

        public string IdTypeState
        {
            get
            {
                return sIdTypeState;
            }
            set
            {
                sIdTypeState = value;
            }
        }
        #endregion

        #region Constructores
        public Empresa()
        {
            sIdCompany = Generales.ObtieneNuevoID();
        }

        public Empresa(String _sIdCompany)
        {
            sIdCompany = _sIdCompany;
            RecuperaEmpresa();

        }
        #endregion

        #region Funciones
        public void RecuperaEmpresa()
        {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec RecuperaEmpresa @sIdCompany");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdCompany", (sIdCompany != "" ? sIdCompany : (object)DBNull.Value));
            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtDatos.Rows.Count != 0)
            {
                sName = dtDatos.Rows[0]["Name"].ToString();
                sIdBranch = dtDatos.Rows[0]["IdBranch"].ToString();
                sIdSector = dtDatos.Rows[0]["IdSector"].ToString();
                sRFC = dtDatos.Rows[0]["RFC"].ToString();
                sStreetName = dtDatos.Rows[0]["StreetName"].ToString();
                sOutdoorNumber = dtDatos.Rows[0]["OutdoorNumber"].ToString();
                sInteriorNumber = dtDatos.Rows[0]["InteriorNumber"].ToString();
                sCologne = dtDatos.Rows[0]["Cologne"].ToString();
                sMunicipality = dtDatos.Rows[0]["Municipality"].ToString();
                sPostalCode = dtDatos.Rows[0]["PostalCode"].ToString();
                sOfficePhone = dtDatos.Rows[0]["OfficePhone"].ToString();
                sFax = dtDatos.Rows[0]["Fax"].ToString();
                sIdSizeCompany = dtDatos.Rows[0]["IdSizeCompany"].ToString();
                sMissionCompany = dtDatos.Rows[0]["MissionCompany"].ToString();
                sOwnerName = dtDatos.Rows[0]["OwnerName"].ToString();
                sCity = dtDatos.Rows[0]["City"].ToString();
                sState = dtDatos.Rows[0]["State"].ToString();
                sIdTypeState = dtDatos.Rows[0]["IdTypeState"].ToString();
                sGiro = dtDatos.Rows[0]["Giro"].ToString();

            }
        }

        public void InsertaActualizaEmpresa()
        {
            oConexion = new Conexion();

            try
            {
                sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec InsertaActualizaEmpresa @sIdCompany, @sName, @sIdBranch, @sIdSector, @sRFC, @sStreetName, @sOutdoorNumber, @sInteriorNumber, @sCologne, @sMunicipality, @sPostalCode, @sOfficePhone," +
                    "@sFax, @sIdSizeCompany, @sMissionCompany, @sOwnerName, @sCity, @sState, @sGiro, @sIdTypeState, @sIdUserModification");


                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdCompany", (sIdCompany != "" ? sIdCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sName", (sName != "" ? sName : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdBranch", (sIdBranch != "" ? sIdBranch : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSector", (sIdSector != "" ? sIdSector : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sRFC", (sRFC != "" ? sRFC : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sStreetName", (sStreetName != "" ? sStreetName : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOutdoorNumber", (sOutdoorNumber != "" ? sOutdoorNumber : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sInteriorNumber", (sInteriorNumber != "" ? sInteriorNumber : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCologne", (sCologne != "" ? sCologne : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sMunicipality", (sMunicipality != "" ? sMunicipality : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sPostalCode", (sPostalCode != "" ? sPostalCode : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOfficePhone", (sOfficePhone != "" ? sOfficePhone : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sFax", (sFax != "" ? sFax : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSizeCompany", (sIdSizeCompany != "" ? sIdSizeCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sMissionCompany", (sMissionCompany != "" ? sMissionCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOwnerName", (sOwnerName != "" ? sOwnerName : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCity", (sCity != "" ? sCity : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sState", (sState != "" ? sState : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sGiro", (sGiro != "" ? sGiro : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeState", (sIdTypeState != "" ? sIdTypeState : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdUserModification", (Generales.glsUsuarioSession.IdUsuario != "" ? Generales.glsUsuarioSession.IdUsuario : (object)DBNull.Value));

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static void EliminarEmpresa(String _sIdCompany)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec EliminarEmpresa @sIdCompany");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdCompany", (_sIdCompany != "" ? _sIdCompany : (object)DBNull.Value));

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static DataTable ObtieneEmpresasAdministrador(String _sNombreEmpresa="", String _sDomicile="", String _sIdBranch="", String _sIdSector="", String _sIdTypeState="")
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("exec ObtieneEmpresasAdministrador @sNombreEmpresa, @sDomicile, @sIdBranch, @sIdSector, @sIdTypeState");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sNombreEmpresa", (_sNombreEmpresa != "" ? _sNombreEmpresa : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sDomicile", (_sDomicile != "" ? _sDomicile : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdBranch", (_sIdBranch != "" ? _sIdBranch : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdSector", (_sIdSector != "" ? _sIdSector : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdTypeState", (_sIdTypeState != "" ? _sIdTypeState : (object)DBNull.Value));

            DataTable dtEmpresas = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtEmpresas;
        }

        public static DataTable ObtieneEmpresasUniversidadAdministrador(String _sNombreEmpresa = "", String _sDomicile = "", String _sIdBranch = "", String _sIdSector = "", String _sIdTypeState = "")
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("exec ObtieneEmpresasUniversidadAdministrador");

            DataTable dtEmpresas = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            return dtEmpresas;
        }

        public static DataTable ObtieneEmpresasCombo()
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("exec ObtieneEmpresasCombo");

            DataTable dtEmpresas = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            return dtEmpresas;
        }

        public static Boolean ExisteUniversidad()
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from Company");
            sConsulta.AppendLine("where IdCompany='3861cc5a-5d36-4391-b904-855bb1d15242'");

            DataTable dtEmpresas = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if(dtEmpresas.Rows.Count != 0)
            {
                return true;
            }
            return false;
        }
        #endregion
    }
}