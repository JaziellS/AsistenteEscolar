using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace GestorResidencias.Clases
{
    public class Anteproyecto
    {
        #region Variables
        private string sIdPreliminaryDraft;
        private string sIdPeriod;
        private string sYear;
        private string sProjectName;
        private string sProjectObjective;
        private string sJustification;
        private string sProjectScope;
        private string sProjectLocation;
        private string sIdTypeState;
        private string sDateSent;

        private string sNameCompany;
        private string sGiroCompany;
        private string sDepartmentCompany;
        private string sOfficePhoneCompany;
        private string sOwnerName;
        private string sAreaHeadCompany;
        private string sStreetNameCompany;
        private string sOutdoorNumberCompany;
        private string sInteriorNumberCompany;
        private string sCologneCompany;
        private string sMunicipalityCompany;
        private string sCityCompany;
        private string sPostalCodeCompany;
        private string sStateCompany;

        private string sIdUser;
        private string sControlNumberUser;
        private string sNameUser;
        private string sIdCareerUser;
        private string sCellphoneUser;
        private string sEmailUser;

        StringBuilder sConsulta = new StringBuilder();

        Conexion oConexion = new Conexion();
        #endregion

        #region Propiedades
        //Datos del Anteproyecto
        public string IdPreliminaryDraft
        {
            get
            {
                return sIdPreliminaryDraft;
            }
            set
            {
                sIdPreliminaryDraft = value;
            }
        }

        public string IdUser
        {
            get
            {
                return sIdUser;
            }
            set
            {
                sIdUser = value;
            }
        }

        public string Anio
        {
            get
            {
                return sYear;
            }
            set
            {
                sYear = value;
            }
        }

        public string IdPeriod
        {
            get
            {
                return sIdPeriod;
            }
            set
            {
                sIdPeriod = value;
            }
        }

        public string Nombre
        {
            get
            {
                return sProjectName;
            }
            set
            {
                sProjectName = value;
            }
        }

        public string Objetivo
        {
            get
            {
                return sProjectObjective;
            }
            set
            {
                sProjectObjective = value;
            }
        }

        public string Justificacion
        {
            get
            {
                return sJustification;
            }
            set
            {
                sJustification = value;
            }
        }

        public string AlcanceProyecto
        {
            get
            {
                return sProjectScope;
            }
            set
            {
                sProjectScope = value;
            }
        }

        public string Lugar
        {
            get
            {
                return sProjectLocation;
            }
            set
            {
                sProjectLocation = value;
            }
        }

        public string IdTipoEstado
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

        public string FechaEnvio
        {
            get
            {
                return sDateSent;
            }
            set
            {
                sDateSent = value;
            }
        }

        //Datos de la Empresa
        public string NombreEmpresa
        {
            get
            {
                return sNameCompany;
            }
            set
            {
                sNameCompany = value;
            }
        }

        public string GiroEmpresa
        {
            get
            {
                return sGiroCompany;
            }
            set
            {
                sGiroCompany = value;
            }
        }

        public string DepartamentoEmpresa
        {
            get
            {
                return sDepartmentCompany;
            }
            set
            {
                sDepartmentCompany = value;
            }
        }

        public string TelefonoOficinaEmpresa
        {
            get
            {
                return sOfficePhoneCompany;
            }
            set
            {
                sOfficePhoneCompany = value;
            }
        }

        public string DuenioEmpresa
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

        public string JefeAreaEmpresa
        {
            get
            {
                return sAreaHeadCompany;
            }
            set
            {
                sAreaHeadCompany = value;
            }
        }

        public string CalleEmpresa
        {
            get
            {
                return sStreetNameCompany;
            }
            set
            {
                sStreetNameCompany = value;
            }
        }

        public string NumeroExteriorEmpresa
        {
            get
            {
                return sOutdoorNumberCompany;
            }
            set
            {
                sOutdoorNumberCompany = value;
            }
        }

        public string NumeroInteriorEmpresa
        {
            get
            {
                return sInteriorNumberCompany;
            }
            set
            {
                sInteriorNumberCompany = value;
            }
        }

        public string ColoniaEmpresa
        {
            get
            {
                return sCologneCompany;
            }
            set
            {
                sCologneCompany = value;
            }
        }

        public string MunicipioEmpresa
        {
            get
            {
                return sMunicipalityCompany;
            }
            set
            {
                sMunicipalityCompany = value;
            }
        }

        public string CiudadEmpresa
        {
            get
            {
                return sCityCompany;
            }
            set
            {
                sCityCompany = value;
            }
        }

        public string CodigoPostaEmpresa
        {
            get
            {
                return sPostalCodeCompany;
            }
            set
            {
                sPostalCodeCompany = value;
            }
        }

        public string EstadoEmpresa
        {
            get
            {
                return sStateCompany;
            }
            set
            {
                sStateCompany = value;
            }
        }

        
        public string NumeroControlUsuario
        {
            get
            {
                return sControlNumberUser;
            }
            set
            {
                sControlNumberUser = value;
            }
        }

        public string NombreUsuario
        {
            get
            {
                return sNameUser;
            }
            set
            {
                sNameUser = value;
            }
        }

        public string IdCareerUsuario
        {
            get
            {
                return sIdCareerUser;
            }
            set
            {
                sIdCareerUser = value;
            }
        }

        public string CelularUsuario
        {
            get
            {
                return sCellphoneUser;
            }
            set
            {
                sCellphoneUser = value;
            }
        }

        public string EmailUsuario
        {
            get
            {
                return sEmailUser;
            }
            set
            {
                sEmailUser = value;
            }
        }

        #endregion

        #region Constructores
        public Anteproyecto()
        {
            IdPreliminaryDraft = Generales.ObtieneNuevoID();
        }

        public Anteproyecto(String _sIdPreliminaryDraft)
        {
            sIdPreliminaryDraft = _sIdPreliminaryDraft;
            RecuperaAnteproyecto();
        }

        public Anteproyecto(String _sIdPreliminaryDraft, String _sIdUser)
        {
            sIdPreliminaryDraft = _sIdPreliminaryDraft;
            sIdUser = _sIdUser;
            RecuperaAnteproyectoUsuario();
        }

        public Anteproyecto(String _sIdPreliminaryDraft, String _sIdUser, Boolean _bUnicode)
        {
            sIdPreliminaryDraft = _sIdPreliminaryDraft;
            sIdUser = _sIdUser;
            RecuperaAnteproyectoUnicode();
        }
        #endregion

        #region Funciones
        public void RecuperaAnteproyecto()
        {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec RecuperaAnteproyecto @sIdPreliminaryDraft");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (sIdPreliminaryDraft != "" ? sIdPreliminaryDraft : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtDatos.Rows.Count != 0)
            {
                sIdPreliminaryDraft = dtDatos.Rows[0]["IdPreliminaryDraft"].ToString();
                sIdPeriod = dtDatos.Rows[0]["IdPeriod"].ToString();
                sYear = dtDatos.Rows[0]["Year"].ToString();
                sProjectName = dtDatos.Rows[0]["ProjectName"].ToString();
                sProjectObjective = dtDatos.Rows[0]["ProjectObjective"].ToString();
                sJustification = dtDatos.Rows[0]["Justification"].ToString();
                sProjectScope = dtDatos.Rows[0]["ProjectScope"].ToString();
                sProjectLocation = dtDatos.Rows[0]["ProjectLocation"].ToString();
                sDateSent = dtDatos.Rows[0]["DateSent"].ToString();
                sIdTypeState = dtDatos.Rows[0]["IdTypeState"].ToString();

                sNameCompany = dtDatos.Rows[0]["NameCompany"].ToString();
                sGiroCompany = dtDatos.Rows[0]["GiroCompany"].ToString();
                sDepartmentCompany = dtDatos.Rows[0]["DepartmentCompany"].ToString();
                sOfficePhoneCompany = dtDatos.Rows[0]["OfficePhoneCompany"].ToString();
                sOwnerName = dtDatos.Rows[0]["OwnerNameCompany"].ToString();
                sAreaHeadCompany = dtDatos.Rows[0]["AreaHeadCompany"].ToString();
                sStreetNameCompany = dtDatos.Rows[0]["StreetNameCompany"].ToString();
                sOutdoorNumberCompany = dtDatos.Rows[0]["OutdoorNumberCompany"].ToString();
                sInteriorNumberCompany = dtDatos.Rows[0]["InteriorNumberCompany"].ToString();
                sCologneCompany = dtDatos.Rows[0]["CologneCompany"].ToString();
                sMunicipalityCompany = dtDatos.Rows[0]["MunicipalityCompany"].ToString();
                sCityCompany = dtDatos.Rows[0]["CityCompany"].ToString();
                sPostalCodeCompany = dtDatos.Rows[0]["PostalCodeCompany"].ToString();
                sStateCompany = dtDatos.Rows[0]["StateCompany"].ToString();
            }
        }

        public void RecuperaAnteproyectoUsuario()
        {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec RecuperaAnteproyectoUsuario @sIdPreliminaryDraft, @sIdUser");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (sIdPreliminaryDraft != "" ? sIdPreliminaryDraft : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdUser", (sIdUser != "" ? sIdUser : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtDatos.Rows.Count != 0)
            {
                sIdPreliminaryDraft = dtDatos.Rows[0]["IdPreliminaryDraft"].ToString();
                sIdUser = dtDatos.Rows[0]["IdUser"].ToString();
                sIdPeriod = dtDatos.Rows[0]["IdPeriod"].ToString();
                sYear = dtDatos.Rows[0]["Year"].ToString();
                sProjectName = dtDatos.Rows[0]["ProjectName"].ToString();
                sProjectObjective = dtDatos.Rows[0]["ProjectObjective"].ToString();
                sJustification = dtDatos.Rows[0]["Justification"].ToString();
                sProjectScope = dtDatos.Rows[0]["ProjectScope"].ToString();
                sProjectLocation = dtDatos.Rows[0]["ProjectLocation"].ToString();
                sDateSent = dtDatos.Rows[0]["DateSent"].ToString();
                sIdTypeState = dtDatos.Rows[0]["IdTypeState"].ToString();

                sNameCompany = dtDatos.Rows[0]["NameCompany"].ToString();
                sGiroCompany = dtDatos.Rows[0]["GiroCompany"].ToString();
                sDepartmentCompany = dtDatos.Rows[0]["DepartmentCompany"].ToString();
                sOfficePhoneCompany = dtDatos.Rows[0]["OfficePhoneCompany"].ToString();
                sOwnerName = dtDatos.Rows[0]["OwnerNameCompany"].ToString();
                sAreaHeadCompany = dtDatos.Rows[0]["AreaHeadCompany"].ToString();
                sStreetNameCompany = dtDatos.Rows[0]["StreetNameCompany"].ToString();
                sOutdoorNumberCompany = dtDatos.Rows[0]["OutdoorNumberCompany"].ToString();
                sInteriorNumberCompany = dtDatos.Rows[0]["InteriorNumberCompany"].ToString();
                sCologneCompany = dtDatos.Rows[0]["CologneCompany"].ToString();
                sMunicipalityCompany = dtDatos.Rows[0]["MunicipalityCompany"].ToString();
                sCityCompany = dtDatos.Rows[0]["CityCompany"].ToString();
                sPostalCodeCompany = dtDatos.Rows[0]["PostalCodeCompany"].ToString();
                sStateCompany = dtDatos.Rows[0]["StateCompany"].ToString();

                sControlNumberUser = dtDatos.Rows[0]["ControlNumberUser"].ToString();
                sNameUser = dtDatos.Rows[0]["NameUser"].ToString();
                sIdCareerUser = dtDatos.Rows[0]["IdCareerUser"].ToString();
                sCellphoneUser = dtDatos.Rows[0]["CellphoneUser"].ToString();
                sEmailUser = dtDatos.Rows[0]["EmailUser"].ToString();
            }
        }

        public void RecuperaAnteproyectoUnicode()
        {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec RecuperaAnteproyectoUnicode @sIdPreliminaryDraft, @sIdUser");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (sIdPreliminaryDraft != "" ? sIdPreliminaryDraft : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdUser", (sIdUser != "" ? sIdUser : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtDatos.Rows.Count != 0)
            {
                sIdPreliminaryDraft = dtDatos.Rows[0]["IdPreliminaryDraft"].ToString();
                sIdUser = dtDatos.Rows[0]["IdUser"].ToString();
                sIdPeriod = dtDatos.Rows[0]["IdPeriod"].ToString();
                sYear = dtDatos.Rows[0]["Year"].ToString();
                sProjectName = dtDatos.Rows[0]["NombreProyecto"].ToString();
                sProjectObjective = dtDatos.Rows[0]["ObjetivoProyecto"].ToString();
                sJustification = dtDatos.Rows[0]["JustificacionProyecto"].ToString();
                sProjectScope = dtDatos.Rows[0]["AlcanceProyecto"].ToString();
                sProjectLocation = dtDatos.Rows[0]["ProjectLocation"].ToString();
                sNameCompany = dtDatos.Rows[0]["NameCompany"].ToString();
                sGiroCompany = dtDatos.Rows[0]["Giro"].ToString();
                sDepartmentCompany = dtDatos.Rows[0]["DepartmentCompany"].ToString();
                sOfficePhoneCompany = dtDatos.Rows[0]["OfficePhoneCompany"].ToString();
                sOwnerName = dtDatos.Rows[0]["OwnerName"].ToString();
                sAreaHeadCompany = dtDatos.Rows[0]["AreaHeadCompany"].ToString();
                sStreetNameCompany = dtDatos.Rows[0]["StreetNameCompany"].ToString();
                sOutdoorNumberCompany = dtDatos.Rows[0]["OutdoorNumberCompany"].ToString();
                sInteriorNumberCompany = dtDatos.Rows[0]["InteriorNumberCompany"].ToString();
                sCologneCompany = dtDatos.Rows[0]["CologneCompany"].ToString();
                sMunicipalityCompany = dtDatos.Rows[0]["MunicipalityCompany"].ToString();
                sCityCompany = dtDatos.Rows[0]["CityCompany"].ToString();
                sPostalCodeCompany = dtDatos.Rows[0]["PostalCodeCompany"].ToString();
                sStateCompany = dtDatos.Rows[0]["StateCompany"].ToString();
                sDateSent = dtDatos.Rows[0]["DateSent"].ToString();
                sIdTypeState = dtDatos.Rows[0]["IdTypeState"].ToString();

                sControlNumberUser = dtDatos.Rows[0]["ControlNumberUser"].ToString();
                sNameUser = dtDatos.Rows[0]["NameUser"].ToString();
                sIdCareerUser = dtDatos.Rows[0]["IdCareerUser"].ToString();
                sCellphoneUser = dtDatos.Rows[0]["CellphoneUser"].ToString();
                sEmailUser = dtDatos.Rows[0]["EmailUser"].ToString();
            }
        }

        public void InsertaActualizaAnteproyecto()
        {
            oConexion = new Conexion();

            try
            {
                sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec InsertaActualizaAnteproyecto @sIdPreliminaryDraft, @sIdPeriod, @sYear, @sProjectName, @sProjectObjective, @sJustification, @sProjectScope, @sProjectLocation, @sDateSent, @sIdTypeState, @sNameCompany," +
                    "@sGiro, @sDepartment, @sOfficePhone, @sOwnerName, @sAreaHead, @sStreetName, @sOutdoorNumber, @sInteriorNumber, @sCologne, @sMunicipality, @sCity, @sPostalCode, @sState, @sIdUser, @sContorlNumber," +
                    "@sName, @sIdCareer, @sCellphone, @sEmail, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (sIdPreliminaryDraft != "" ? sIdPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdPeriod", (sIdPeriod != "" ? sIdPeriod : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sYear", (sYear != "" ? sYear : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sProjectName", (sProjectName != "" ? sProjectName : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sProjectObjective", (sProjectObjective != "" ? sProjectObjective : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sJustification", (sJustification != "" ? sJustification : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sProjectScope", (sProjectScope != "" ? sProjectScope : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sProjectLocation", (sProjectLocation != "" ? sProjectLocation : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sDateSent", (sDateSent != "" ? sDateSent : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeState", (sIdTypeState != "" ? sIdTypeState : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sNameCompany", (sNameCompany != "" ? sNameCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sGiro", (sGiroCompany != "" ? sGiroCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sDepartment", (sDepartmentCompany != "" ? sDepartmentCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOfficePhone", (sOfficePhoneCompany != "" ? sOfficePhoneCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOwnerName", (sOwnerName != "" ? sOwnerName : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sAreaHead", (sAreaHeadCompany != "" ? sAreaHeadCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sStreetName", (sStreetNameCompany != "" ? sStreetNameCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOutdoorNumber", (sOutdoorNumberCompany != "" ? sOutdoorNumberCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sInteriorNumber", (sInteriorNumberCompany != "" ? sInteriorNumberCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCologne", (sCologneCompany != "" ? sCologneCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sMunicipality", (sMunicipalityCompany != "" ? sMunicipalityCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCity", (sCityCompany != "" ? sCityCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sPostalCode", (sPostalCodeCompany != "" ? sPostalCodeCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sState", (sStateCompany != "" ? sStateCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdUser", (sIdUser != "" ? sIdUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sContorlNumber", (sControlNumberUser != "" ? sControlNumberUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sName", (sNameUser != "" ? sNameUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdCareer", (sIdCareerUser != "" ? sIdCareerUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCellphone", (sCellphoneUser != "" ? sCellphoneUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sEmail", (sEmailUser != "" ? sEmailUser : (object)DBNull.Value));
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

        public static DataTable ObtieneMisAnteproyectos(String _sIdUser)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneAnteproyectosUsuario @sIdUser");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdUser", (_sIdUser != "" ? _sIdUser : (object)DBNull.Value));

            DataTable dtAnteproyectos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);
            
            return dtAnteproyectos;
        }

        public static Boolean ValidaCrearOtroAnteproyecto(String _sIdUser)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("exec ValidaCrearOtroAnteproyecto @sIdUser");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdUser", (_sIdUser != "" ? _sIdUser : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtDatos.Rows.Count > 0)
            {
                return false;
            }
            return true;
        }

        public static void EliminarAnteproyecto(String _sIdPreliminaryDraft, String _sIdUser)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec EliminaAnteproyecto @sIdPreliminaryDraft, @sIdUser");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdUser", (_sIdUser != "" ? _sIdUser : (object)DBNull.Value));

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static DataTable ObtieneAnteproyectosAdministrador(String _sIdPeriod, String _sYear, String _sNoControl, String _sAlumno, String _sNombreProyecto, String _sNombreEmpresa, String _sIdTypeState)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneAnteproyectosAdministrador @sIdPeriod, @sYear, @sNoControl, @sAlumno, @sNombreProyecto, @sNombreEmpresa, @sIdTypeState");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPeriod", (_sIdPeriod != "" ? _sIdPeriod : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sYear", (_sYear != "" ? _sYear : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNoControl", (_sNoControl != "" ? _sNoControl : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sAlumno", (_sAlumno != "" ? _sAlumno : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNombreProyecto", (_sNombreProyecto != "" ? _sNombreProyecto : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNombreEmpresa", (_sNombreEmpresa != "" ? _sNombreEmpresa : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdTypeState", (_sIdTypeState != "" ? _sIdTypeState : (object)DBNull.Value));

            DataTable dtAnteproyectos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtAnteproyectos;

        }

        public static DataTable ObtieneAnteproyectosSeleccionar(String _sIdPeriod, String _sYear, String _sIdUser, String _sNoControl, String _sAlumno, String _sNombreProyecto, String _sNombreEmpresa, String _sRevisores)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneAnteproyectosSeleccionar @sIdPeriod, @sYear, @sIdUser, @sNoControl, @sAlumno, @sNombreProyecto, @sNombreEmpresa, @sRevisores");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPeriod", (_sIdPeriod != "" ? _sIdPeriod : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sYear", (_sYear != "" ? _sYear : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdUser", (_sIdUser != "" ? _sIdUser : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNoControl", (_sNoControl != "" ? _sNoControl : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sAlumno", (_sAlumno != "" ? _sAlumno : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNombreProyecto", (_sNombreProyecto != "" ? _sNombreProyecto : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNombreEmpresa", (_sNombreEmpresa != "" ? _sNombreEmpresa : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sRevisores", (_sRevisores != "" ? _sRevisores : (object)DBNull.Value));

            DataTable dtAnteproyectos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtAnteproyectos;

        }

        public static DataTable ObtieneEvaluadores(String _sIdTeacher, String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneEvaluadoresAnteproyecto @sIdTeachers, @sIdPreliminaryDraft");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdTeachers", (_sIdTeacher != "" ? _sIdTeacher : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));

            DataTable dtEvaluadores = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtEvaluadores;
        }

        public static void ActualizaEstatusAnteproyecto(String _sidPreliminaryDraft, String _sIdTypeState)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec ActualizaEstatusAnteproyecto @sIdPreliminaryDraft, @sIdTypeState");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sidPreliminaryDraft != "" ? _sidPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeState", (_sIdTypeState != "" ? _sIdTypeState : (object)DBNull.Value));

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static int ObtieneRevisiones(String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select cast((select count(*) from PreliminaryDraftComments where IdPreliminaryDraft=pd.IdPreliminaryDraft) as varchar(10)) as Revisiones");
            sConsulta.AppendLine("from PreliminaryDraft pd");
            sConsulta.AppendLine("where pd.IdPreliminaryDraft='" + _sIdPreliminaryDraft + "' and pd.IdTypeState!='1'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                int sRevision = int.Parse(dtDatos.Rows[0]["Revisiones"].ToString());
                return sRevision;
            }
            return 0;
        }

        public static int ObtieneRevisionesTotales(String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select cast((select count(*) from TeachersResidencePreliminaryDraft where IdPreliminaryDraft=pd.IdPreliminaryDraft) as varchar(10)) as RevisionesTotales");
            sConsulta.AppendLine("from PreliminaryDraft pd");
            sConsulta.AppendLine("where pd.IdPreliminaryDraft='" + _sIdPreliminaryDraft + "' and pd.IdTypeState!='1'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                int sRevision = int.Parse(dtDatos.Rows[0]["RevisionesTotales"].ToString());
                return sRevision;
            }
            return 0;
        }

        public static int ObtieneEstatusCalificadoJefeCarrera(String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select IdTypeState");
            sConsulta.AppendLine("from PreliminaryDraftFinalQualification");
            sConsulta.AppendLine("where IdPreliminaryDraft='" + _sIdPreliminaryDraft + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                int sRevision = int.Parse(dtDatos.Rows[0]["IdTypeState"].ToString());
                return sRevision;
            }
            return 0;
        }

        public static DataTable ObtieneMisAnteproyectosNoAprobados(String _sIdUser)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneMisAnteproyectosNoAprobados @sIdUser, @sIdTypeState");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdUser", (_sIdUser != "" ? _sIdUser : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdTypeState", (Enums.EstatusAnteproyecto.NoAprobado.ToString() != "" ? Enums.EstatusAnteproyecto.NoAprobado.ToString() : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtDatos;
        }
        #endregion
    }

    public class AnteproyectoCronograma
    {
        #region Variables
        private string sIdPreliminaryDraft;
        private string sIdSchedule;
        private string sName;
        private string sDescription;
        private string sWeek1;
        private string sWeek2;
        private string sWeek3;
        private string sWeek4;
        private string sWeek5;
        private string sWeek6;
        private string sWeek7;
        private string sWeek8;
        private string sWeek9;
        private string sWeek10;
        private string sWeek11;
        private string sWeek12;
        private string sWeek13;
        private string sWeek14;
        private string sWeek15;
        private string sWeek16;
        private string sOrder;

        StringBuilder sConsulta = new StringBuilder();

        Conexion oConexion = new Conexion();
        #endregion

        #region Propiedades
        public string IdPreliminaryDraft
        {
            get
            {
                return sIdPreliminaryDraft;
            }
            set
            {
                sIdPreliminaryDraft = value;
            }
        }

        public string IdSchedule
        {
            get
            {
                return sIdSchedule;
            }
            set
            {
                sIdSchedule = value;
            }
        }

        public string Semana1
        {
            get
            {
                return sWeek1;
            }
            set
            {
                sWeek1 = value;
            }
        }

        public string Semana2
        {
            get
            {
                return sWeek2;
            }
            set
            {
                sWeek2 = value;
            }
        }

        public string Semana3
        {
            get
            {
                return sWeek3;
            }
            set
            {
                sWeek3 = value;
            }
        }

        public string Semana4
        {
            get
            {
                return sWeek4;
            }
            set
            {
                sWeek4 = value;
            }
        }

        public string Semana5
        {
            get
            {
                return sWeek5;
            }
            set
            {
                sWeek5 = value;
            }
        }

        public string Semana6
        {
            get
            {
                return sWeek6;
            }
            set
            {
                sWeek6 = value;
            }
        }

        public string Semana7
        {
            get
            {
                return sWeek7;
            }
            set
            {
                sWeek7 = value;
            }
        }

        public string Semana8
        {
            get
            {
                return sWeek8;
            }
            set
            {
                sWeek8 = value;
            }
        }

        public string Semana9
        {
            get
            {
                return sWeek9;
            }
            set
            {
                sWeek9 = value;
            }
        }

        public string Semana10
        {
            get
            {
                return sWeek10;
            }
            set
            {
                sWeek10 = value;
            }
        }

        public string Semana11
        {
            get
            {
                return sWeek11;
            }
            set
            {
                sWeek11 = value;
            }
        }

        public string Semana12
        {
            get
            {
                return sWeek12;
            }
            set
            {
                sWeek12 = value;
            }
        }

        public string Semana13
        {
            get
            {
                return sWeek13;
            }
            set
            {
                sWeek13 = value;
            }
        }

        public string Semana14
        {
            get
            {
                return sWeek14;
            }
            set
            {
                sWeek14 = value;
            }
        }

        public string Semana15
        {
            get
            {
                return sWeek15;
            }
            set
            {
                sWeek15 = value;
            }
        }

        public string Semana16
        {
            get
            {
                return sWeek16;
            }
            set
            {
                sWeek16 = value;
            }
        }

        public string Orden
        {
            get
            {
                return sOrder;
            }
            set
            {
                sOrder = value;
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

        public string Descripcion
        {
            get
            {
                return sDescription;
            }
            set
            {
                sDescription = value;
            }
        }
        #endregion

        #region Constructores
        public AnteproyectoCronograma(String _sIdPreliminaryDraft)
        {
            sIdPreliminaryDraft = _sIdPreliminaryDraft;
            sIdSchedule = Generales.ObtieneNuevoID();
            
        }

        public AnteproyectoCronograma(String _sIdPreliminaryDraft, String _sIdSchedule)
        {
            sIdPreliminaryDraft = _sIdPreliminaryDraft;
            sIdSchedule = _sIdSchedule;
            RecuperaCronograma();
        }
        #endregion

        #region Funciones
        public void RecuperaCronograma()
        {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec RecuperaCronograma @sIdPreliminaryDraft, @sIdSchedule");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (sIdPreliminaryDraft != "" ? sIdPreliminaryDraft : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdSchedule", (sIdSchedule != "" ? sIdSchedule : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtDatos.Rows.Count != 0)
            {
                sIdPreliminaryDraft = dtDatos.Rows[0]["IdPreliminaryDraft"].ToString();
                sIdSchedule = dtDatos.Rows[0]["IdSchedule"].ToString();
                sWeek1 = dtDatos.Rows[0]["Week1"].ToString();
                sWeek2 = dtDatos.Rows[0]["Week2"].ToString();
                sWeek3 = dtDatos.Rows[0]["Week3"].ToString();
                sWeek4 = dtDatos.Rows[0]["Week4"].ToString();
                sWeek5 = dtDatos.Rows[0]["Week5"].ToString();
                sWeek6 = dtDatos.Rows[0]["Week6"].ToString();
                sWeek7 = dtDatos.Rows[0]["Week7"].ToString();
                sWeek8 = dtDatos.Rows[0]["Week8"].ToString();
                sWeek9 = dtDatos.Rows[0]["Week9"].ToString();
                sWeek10 = dtDatos.Rows[0]["Week10"].ToString();
                sWeek11 = dtDatos.Rows[0]["Week11"].ToString();
                sWeek12 = dtDatos.Rows[0]["Week12"].ToString();
                sWeek13 = dtDatos.Rows[0]["Week13"].ToString();
                sWeek14 = dtDatos.Rows[0]["Week14"].ToString();
                sWeek15 = dtDatos.Rows[0]["Week15"].ToString();
                sWeek16 = dtDatos.Rows[0]["Week16"].ToString();
            }
        }

        public void InsertaActividad()
        {
            oConexion = new Conexion();

            try
            {
                sConsulta.AppendLine("exec InsertaActividad @sIdPreliminaryDraft, @sIdSchedule, @sName, @sDescripcion, @sOrder, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (sIdPreliminaryDraft != "" ? sIdPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSchedule", (sIdSchedule != "" ? sIdSchedule : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sName", (sName != "" ? sName : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sDescripcion", (sDescription != "" ? sDescription : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOrder", (sOrder != "" ? sOrder : (object)DBNull.Value));
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

        public static DataTable ObtieneMisActividades(String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("exec ObtieneCronograma @sIdPreliminaryDraft");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));

            DataTable dtActividades = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtActividades;
        }

        public void ActualizaSemana()
        {
            oConexion = new Conexion();

            try
            {
                sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec ActualizaSemanaCronograma @sIdPreliminaryDraft, @sIdSchedule, @sWeek1, @sWeek2, @sWeek3, @sWeek4, @sWeek5, @sWeek6, @sWeek7, @sWeek8, @sWeek9, @sWeek10, @sWeek11," +
                    "@sWeek12, @sWeek13, @sWeek14, @sWeek15, @sWeek16, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (sIdPreliminaryDraft != "" ? sIdPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSchedule", (sIdSchedule != "" ? sIdSchedule : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek1", (sWeek1 != "" ? sWeek1 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek2", (sWeek2 != "" ? sWeek2 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek3", (sWeek3 != "" ? sWeek3 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek4", (sWeek4 != "" ? sWeek4 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek5", (sWeek5 != "" ? sWeek5 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek6", (sWeek6 != "" ? sWeek6 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek7", (sWeek7 != "" ? sWeek7 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek8", (sWeek8 != "" ? sWeek8 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek9", (sWeek9 != "" ? sWeek9 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek10", (sWeek10 != "" ? sWeek10 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek11", (sWeek11 != "" ? sWeek11 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek12", (sWeek12 != "" ? sWeek12 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek13", (sWeek13 != "" ? sWeek13 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek14", (sWeek14 != "" ? sWeek14 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek15", (sWeek15 != "" ? sWeek15 : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWeek16", (sWeek16 != "" ? sWeek16 : (object)DBNull.Value));
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

        public static void EliminarActividad(String _sIdPreliminaryDraft, String _sIdSchedule, String _sOrden)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec EliminarActividad @sIdPreliminaryDraft, @sIdSchedule, @sOrden");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSchedule", (_sIdSchedule != "" ? _sIdSchedule : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOrden", (_sOrden != "" ? _sOrden : (object)DBNull.Value));

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static void EliminarTodasActividades(String _sIdPreliminaryDraft)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec EliminarTodasActividades @sIdPreliminaryDraft");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static void ActualizaDescripcionActividad(String _sIdPreliminaryDraft, String _sIdSchedule, String _sDescripcion)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec ActualizaDescripcionActividad @sIdPreliminaryDraft, @sIdSchedule, @sDescripcion, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSchedule", (_sIdSchedule != "" ? _sIdSchedule : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sDescripcion", (_sDescripcion != "" ? _sDescripcion : (object)DBNull.Value));
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

        public static void MoverActividad(String _sIdPreliminaryDraft, String _sIdShedule, String _sOrdenActual, String _sOrdenNuevo)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec ActualizaOrdenActividad @sIdPreliminaryDraft, @sIdSchedule, @sOrdenActual, @sOrdenNuevo");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSchedule", (_sIdShedule != "" ? _sIdShedule : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOrdenActual", (_sOrdenActual != "" ? _sOrdenActual : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOrdenNuevo", (_sOrdenNuevo != "" ? _sOrdenNuevo : (object)DBNull.Value));

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static int ObtieneNumeroUltimoOrden(String _sIdPreliminaryDraft)
        {
            int iUltimoOrden = 0;
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneNumeroUltimoOrdenActividad @sIdPreliminaryDraft");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));

            DataTable dtUltimoNumero = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtUltimoNumero.Rows.Count != 0)
            {
                iUltimoOrden = int.Parse(dtUltimoNumero.Rows[0]["Orden"].ToString());
            }

            return iUltimoOrden;
        }

        public static void InsertaActividadesDeEjemplo(String _sidPreliminaryDraft)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec InsertaActividadesEjemplo @sIdPreliminaryDraft, @sIdSchedule1, @sIdSchedule2, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sidPreliminaryDraft != "" ? _sidPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSchedule1", (Generales.ObtieneNuevoID() != "" ? Generales.ObtieneNuevoID() : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSchedule2", (Generales.ObtieneNuevoID() != "" ? Generales.ObtieneNuevoID() : (object)DBNull.Value));
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

        public static Boolean ValidaSiExistenActividades(String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from PreliminaryDraftSchedule");
            sConsulta.AppendLine("where IdPreliminaryDraft='" + _sIdPreliminaryDraft + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static Boolean ValidaSiUnaActividadEstaVacia(String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select Description");
            sConsulta.AppendLine("from PreliminaryDraftSchedule");
            sConsulta.AppendLine("where IdPreliminaryDraft='" + _sIdPreliminaryDraft + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            foreach(DataRow dr in dtDatos.Rows)
            {
                if(dr["Description"].ToString() == "")
                {
                    return true;
                }
            }

            return false;
        }
        #endregion
    }
}