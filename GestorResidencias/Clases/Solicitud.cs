using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace GestorResidencias.Clases
{
    public class Solicitud
    {
        #region Variables
        private string sIdRequest;

        private string sPlace;
        private string sDate;
        private string sProjectName;
        private string sIdProjectOrigin;
        private string sNumberResidents;
        private string sIdPeriod;
        private string sYear;
        private string sIdTypeState;
        private string sDateSent;

        private string sNameCompany;
        private string sIdBranchCompany;
        private string sIdSectorCompany;
        private string sRFCCompany;
        private string sOfficePhoneCompany;
        private string sFaxCompany;
        private string sIdSizeCompany;
        private string sMissionCompany;
        private string sOwnerNameCompany;
        private string sNameExternalResidentCompany;
        private string sWorkplaceExternalResidentCompany;
        private string sStreetNameCompany;
        private string sOutdoorNumberCompany;
        private string sInteriorNumberCompany;
        private string sCologneCompany;
        private string sMunicipalityCompany;
        private string sPostalCodeCompany;

        private string sNamePFollow;
        private string sWorkplacePFollow;
        private string sEmailPFollow;
        private string sCellphonePFollow;
        private string sOfficePhonePFollow;

        private string sIdUser;
        private string sNameUser;
        private string sSemesterUser;
        private string sIdCareerUser;
        private string sControlNumberUser;
        private string sEmailUser;
        private string sIdSocialSecurityUser;
        private string sOtherSocialSecurityUser;
        private string sNSSUser;
        private string sPhoneUser;
        private string sCellphoneUser;
        private string sStreetUser;
        private string sOutdoorNumberUser;
        private string sInteriorNumberUser;
        private string sCologneUser;
        private string sMunicipalityUser;
        private string sPostalCodeUser;

        StringBuilder sConsulta = new StringBuilder();

        Conexion oConexion = new Conexion();
        #endregion

        #region Propiedades
        public string IdRequest
        {
            get
            {
                return sIdRequest;
            }
            set
            {
                sIdRequest = value;
            }
        }

        public string Lugar
        {
            get
            {
                return sPlace;
            }
            set
            {
                sPlace = value;
            }
        }

        public string Fecha
        {
            get
            {
                return sDate;
            }
            set
            {
                sDate = value;
            }
        }

        public string NombreProyecto
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

        public string IdProcedenciaProyecto
        {
            get
            {
                return sIdProjectOrigin;
            }
            set
            {
                sIdProjectOrigin = value;
            }
        }

        public string NumeroResidentes
        {
            get
            {
                return sNumberResidents;
            }
            set
            {
                sNumberResidents = value;
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

        public string IdRamoEmpresa
        {
            get
            {
                return sIdBranchCompany;
            }
            set
            {
                sIdBranchCompany = value;
            }
        }

        public string IdSectorEmpresa
        {
            get
            {
                return sIdSectorCompany;
            }
            set
            {
                sIdSectorCompany = value;
            }
        }

        public string RFCEmpresa
        {
            get
            {
                return sRFCCompany;
            }
            set
            {
                sRFCCompany = value;
            }
        }

        public string TelefonoOficEmpresa
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

        public string FaxEmpresa
        {
            get
            {
                return sFaxCompany;
            }
            set
            {
                sFaxCompany = value;
            }
        }

        public string IdTamanioEmpresa
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

        public string NombreTitularEmpresa
        {
            get
            {
                return sOwnerNameCompany;
            }
            set
            {
                sOwnerNameCompany = value;
            }
        }

        public string NombreAsesorExterno
        {
            get
            {
                return sNameExternalResidentCompany;
            }
            set
            {
                sNameExternalResidentCompany = value;
            }
        }

        public string PuestoAsesorExterno
        {
            get
            {
                return sWorkplaceExternalResidentCompany;
            }
            set
            {
                sWorkplaceExternalResidentCompany = value;
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

        public string NumExteriorEmpresa
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

        public string NumInteriorEmpresa
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

        public string CodigoPostalEmpresa
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



        public string NombrePSeguimiento
        {
            get
            {
                return sNamePFollow;
            }
            set
            {
                sNamePFollow = value;
            }
        }

        public string PuestoPSeguimiento
        {
            get
            {
                return sWorkplacePFollow;
            }
            set
            {
                sWorkplacePFollow = value;
            }
        }

        public string EmailPSeguimiento
        {
            get
            {
                return sEmailPFollow;
            }
            set
            {
                sEmailPFollow = value;
            }
        }

        public string CelularPSeguimiento
        {
            get
            {
                return sCellphonePFollow;
            }
            set
            {
                sCellphonePFollow = value;
            }
        }

        public string TelefonoOficPSeguimiento
        {
            get
            {
                return sOfficePhonePFollow;
            }
            set
            {
                sOfficePhonePFollow = value;
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

        public string SemestreUsuario
        {
            get
            {
                return sSemesterUser;
            }
            set
            {
                sSemesterUser = value;
            }
        }

        public string IdCarreraUsuario
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

        public string IdSeguroSocialUsuario
        {
            get
            {
                return sIdSocialSecurityUser;
            }
            set
            {
                sIdSocialSecurityUser = value;
            }
        }

        public string OtraSeguridadSocialUsuario
        {
            get
            {
                return sOtherSocialSecurityUser;
            }
            set
            {
                sOtherSocialSecurityUser = value;
            }
        }

        public string NSSUsuario
        {
            get
            {
                return sNSSUser;
            }
            set
            {
                sNSSUser = value;
            }
        }

        public string TelefonoUsuario
        {
            get
            {
                return sPhoneUser;
            }
            set
            {
                sPhoneUser = value;
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

        public string CalleUsuario
        {
            get
            {
                return sStreetUser;
            }
            set
            {
                sStreetUser = value;
            }
        }

        public string NumeroExteriorUsuario
        {
            get
            {
                return sOutdoorNumberUser;
            }
            set
            {
                sOutdoorNumberUser = value;
            }
        }

        public string NumeroInteriorUsuario
        {
            get
            {
                return sInteriorNumberUser;
            }
            set
            {
                sInteriorNumberUser = value;
            }
        }

        public string ColoniaUsuario
        {
            get
            {
                return sCologneUser;
            }
            set
            {
                sCologneUser = value;
            }
        }

        public string MunicipioUsuario
        {
            get
            {
                return sMunicipalityUser;
            }
            set
            {
                sMunicipalityUser = value;
            }
        }

        public string NumeroPostalUsuario
        {
            get
            {
                return sPostalCodeUser;
            }
            set
            {
                sPostalCodeUser = value;
            }
        }

        #endregion

        #region Constructores
        public Solicitud()
        {
            sIdRequest = Generales.ObtieneNuevoID();
        }

        public Solicitud(String _sIdRequest, String _sIdUser)
        {
            sIdRequest = _sIdRequest;
            sIdUser = _sIdUser;
            RecuperaSolicitud();
        }
        #endregion

        #region Funciones
        public void RecuperaSolicitud()
        {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec RecuperaSolicitud @sIdRequest, @sIdUser");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdRequest", (sIdRequest != "" ? sIdRequest : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdUser", (sIdUser != "" ? sIdUser : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtDatos.Rows.Count != 0)
            {
                sPlace = dtDatos.Rows[0]["Place"].ToString();
                sDate = dtDatos.Rows[0]["Date"].ToString();
                sProjectName = dtDatos.Rows[0]["ProjectName"].ToString();
                sIdProjectOrigin = dtDatos.Rows[0]["IdProjectOrigin"].ToString();
                sNumberResidents = dtDatos.Rows[0]["NumberResidents"].ToString();
                sIdPeriod = dtDatos.Rows[0]["IdPeriod"].ToString();
                sYear = dtDatos.Rows[0]["Year"].ToString();
                sIdTypeState = dtDatos.Rows[0]["IdTypeState"].ToString();
                sDateSent = dtDatos.Rows[0]["DateSent"].ToString();
                
                sNameCompany = dtDatos.Rows[0]["NameCompany"].ToString();
                sIdBranchCompany = dtDatos.Rows[0]["IdBranchCompany"].ToString();
                sIdSectorCompany = dtDatos.Rows[0]["IdSectorCompany"].ToString();
                sRFCCompany = dtDatos.Rows[0]["RFCCompany"].ToString();
                sOfficePhoneCompany = dtDatos.Rows[0]["OfficePhoneCompany"].ToString();
                sFaxCompany = dtDatos.Rows[0]["FaxCompany"].ToString();
                sIdSizeCompany = dtDatos.Rows[0]["IdSizeCompany"].ToString();
                sMissionCompany = dtDatos.Rows[0]["MissionCompany"].ToString();
                sOwnerNameCompany = dtDatos.Rows[0]["OwnerNameCompany"].ToString();
                sNameExternalResidentCompany = dtDatos.Rows[0]["NameExternalAdvisorCompany"].ToString();
                sWorkplaceExternalResidentCompany = dtDatos.Rows[0]["WorkplaceExternalAdvisorCompany"].ToString();
                sStreetNameCompany = dtDatos.Rows[0]["StreetNameCompany"].ToString();
                sOutdoorNumberCompany = dtDatos.Rows[0]["OutdoorNumberCompany"].ToString();
                sInteriorNumberCompany = dtDatos.Rows[0]["InteriorNumberCompany"].ToString();
                sCologneCompany = dtDatos.Rows[0]["CologneCompany"].ToString();
                sMunicipalityCompany = dtDatos.Rows[0]["MunicipalityCompany"].ToString();
                sPostalCodeCompany = dtDatos.Rows[0]["PostalCodeCompany"].ToString();

                sNamePFollow = dtDatos.Rows[0]["NamePersonFollow"].ToString();
                sWorkplacePFollow = dtDatos.Rows[0]["WorkplacePersonFollow"].ToString();
                sEmailPFollow = dtDatos.Rows[0]["EmailPersonFollow"].ToString();
                sCellphonePFollow = dtDatos.Rows[0]["CellphonePersonFollow"].ToString();
                sOfficePhonePFollow = dtDatos.Rows[0]["OfficePhonePersonFollow"].ToString();

                sNameUser = dtDatos.Rows[0]["NameUser"].ToString();
                sSemesterUser = dtDatos.Rows[0]["SemesterUser"].ToString();
                sIdCareerUser = dtDatos.Rows[0]["IdCareerUser"].ToString();
                sControlNumberUser = dtDatos.Rows[0]["ControlNumberUser"].ToString();
                sEmailUser = dtDatos.Rows[0]["EmailUser"].ToString();
                sIdSocialSecurityUser = dtDatos.Rows[0]["IdSocialSecurityUser"].ToString();
                sOtherSocialSecurityUser = dtDatos.Rows[0]["OtherSocialSecurityUser"].ToString();
                sNSSUser = dtDatos.Rows[0]["NSSUser"].ToString();
                sPhoneUser = dtDatos.Rows[0]["PhoneUser"].ToString();
                sCellphoneUser = dtDatos.Rows[0]["CellphoneUser"].ToString();
                sStreetUser = dtDatos.Rows[0]["StreetUser"].ToString();
                sOutdoorNumberUser = dtDatos.Rows[0]["OutdoorNumberUser"].ToString();
                sInteriorNumberUser = dtDatos.Rows[0]["InteriorNumberUser"].ToString();
                sCologneUser = dtDatos.Rows[0]["CologneUser"].ToString();
                sMunicipalityUser = dtDatos.Rows[0]["MunicipalityUser"].ToString();
                sPostalCodeUser = dtDatos.Rows[0]["PostalCodeUser"].ToString();
            }
        }

        public void InsertaActualizaSolicitudResidencia()
        {
            oConexion = new Conexion();

            try
            {
                sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec InsertaActualizaSolicitud @sIdRequest, @sIdUser, @sPlace, @sDate, @sProjectName, @sIdProjectOrigin, @sNumberResidents, @sIdPeriod, @sYear, @sIdTypeState, @sDateSent, @sNameCompany," +
                    "@sIdBranchCompany, @sIdSectorCompany, @sRFCCompany, @sOfficePhoneCompany, @sFaxCompany, @sIdSizeCompany, @sMissionCompany, @sOwnerNameCompany, @sNameExternalAdvisorCompany," +
                    "@sWorkPlaceExternalAdvisorCompany, @sStreetNameCompany, @sOutdoorNumberCompany, @sInteriorNumberCompany, @sCologneCompany, @sMunicipalityCompany, @sPostalCodeCompany, @sNamePersonFollow," +
                    "@sWorkplacePersonFollow, @sEmailPersonFollow, @sCellphonePersonFollow, @sOfficePhonePersonFollow, @sNameUser, @sSemesterUser, @sIdCareerUser, @sControlNumberUser, @sEmailUser," +
                    "@sIdSocialSecurityUser, @sOtherSocialSecurityUser, @sNSSUser, @sPhoneUser, @sCellphoneUser, @sStreetUser, @sOutdoorNumberUser, @sIneriorNumberUser, @sCologneUser," +
                    "@sMunicipalityUser, @sPostalCodeUser, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdRequest", (sIdRequest != "" ? sIdRequest : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdUser", (sIdUser != "" ? sIdUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sPlace", (sPlace != "" ? sPlace : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sDate", (sDate != "" ? sDate : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sProjectName", (sProjectName != "" ? sProjectName : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdProjectOrigin", (sIdProjectOrigin != "" ? sIdProjectOrigin : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sNumberResidents", (sNumberResidents != "" ? sNumberResidents : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdPeriod", (sIdPeriod != "" ? sIdPeriod : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sYear", (sYear != "" ? sYear : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeState", (sIdTypeState != "" ? sIdTypeState : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sDateSent", (sDateSent != "" ? sDateSent : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sNameCompany", (sNameCompany != "" ? sNameCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdBranchCompany", (sIdBranchCompany != "" ? sIdBranchCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSectorCompany", (sIdSectorCompany != "" ? sIdSectorCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sRFCCompany", (sRFCCompany != "" ? sRFCCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOfficePhoneCompany", (sOfficePhoneCompany != "" ? sOfficePhoneCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sFaxCompany", (sFaxCompany != "" ? sFaxCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSizeCompany", (sIdSizeCompany != "" ? sIdSizeCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sMissionCompany", (sMissionCompany != "" ? sMissionCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOwnerNameCompany", (sOwnerNameCompany != "" ? sOwnerNameCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sNameExternalAdvisorCompany", (sNameExternalResidentCompany != "" ? sNameExternalResidentCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWorkPlaceExternalAdvisorCompany", (sWorkplaceExternalResidentCompany != "" ? sWorkplaceExternalResidentCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sStreetNameCompany", (sStreetNameCompany != "" ? sStreetNameCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOutdoorNumberCompany", (sOutdoorNumberCompany != "" ? sOutdoorNumberCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sInteriorNumberCompany", (sInteriorNumberCompany != "" ? sInteriorNumberCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCologneCompany", (sCologneCompany != "" ? sCologneCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sMunicipalityCompany", (sMunicipalityCompany != "" ? sMunicipalityCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sPostalCodeCompany", (sPostalCodeCompany != "" ? sPostalCodeCompany : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sNamePersonFollow", (sNamePFollow != "" ? sNamePFollow : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWorkplacePersonFollow", (sWorkplacePFollow != "" ? sWorkplacePFollow : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sEmailPersonFollow", (sEmailPFollow != "" ? sEmailPFollow : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCellphonePersonFollow", (sCellphonePFollow != "" ? sCellphonePFollow : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOfficePhonePersonFollow", (sOfficePhonePFollow != "" ? sOfficePhonePFollow : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sNameUser", (sNameUser != "" ? sNameUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sSemesterUser", (sSemesterUser != "" ? sSemesterUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdCareerUser", (sIdCareerUser != "" ? sIdCareerUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sControlNumberUser", (sControlNumberUser != "" ? sControlNumberUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sEmailUser", (sEmailUser != "" ? sEmailUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSocialSecurityUser", (sIdSocialSecurityUser != "" ? sIdSocialSecurityUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOtherSocialSecurityUser", (sOtherSocialSecurityUser != "" ? sOtherSocialSecurityUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sNSSUser", (sNSSUser != "" ? sNSSUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sPhoneUser", (sPhoneUser != "" ? sPhoneUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCellphoneUser", (sCellphoneUser != "" ? sCellphoneUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sStreetUser", (sStreetUser != "" ? sStreetUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOutdoorNumberUser", (sOutdoorNumberUser != "" ? sOutdoorNumberUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIneriorNumberUser", (sInteriorNumberUser != "" ? sInteriorNumberUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCologneUser", (sCologneUser != "" ? sCologneUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sMunicipalityUser", (sMunicipalityUser != "" ? sMunicipalityUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sPostalCodeUser", (sPostalCodeUser != "" ? sPostalCodeUser : (object)DBNull.Value));
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

        public static DataTable ObtieneSolicitudesAdmin(String _sIdPeriod, String _sAnio, String _sNoControl = "", String _sAlumno = "", String _sNombreProyecto = "", String _sEmpresa = "", String _sEstatus = "")
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneSolicitudesAdministrador @sIdPeriod, @sYear, @sNoControl, @sAlumno, @sNombreProyecto, @sEmpresa, @sEstatus");
            
            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPeriod", (_sIdPeriod != "" ? _sIdPeriod : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sYear", (_sAnio != "" ? _sAnio : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNoControl", (_sNoControl != "" ? _sNoControl : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sAlumno", (_sAlumno != "" ? _sAlumno : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNombreProyecto", (_sNombreProyecto != "" ? _sNombreProyecto : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sEmpresa", (_sEmpresa != "" ? _sEmpresa : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sEstatus", (_sEstatus != "" ? _sEstatus : (object)DBNull.Value));

            DataTable dtObtieneSolicitudesHomeOffice = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtObtieneSolicitudesHomeOffice;
        }

        public static DataTable ObtieneMisSolicitudes(String _sIdUser)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneSolicitudesUsuario @sIdUser");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdUser", (_sIdUser != "" ? _sIdUser : (object)DBNull.Value));

            DataTable dtSolicitudes = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtSolicitudes;
        }

        public static void EliminarSolicitud(String _sIdRequest, String _sIdUser)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec EliminarSolicitud @sIdRequest, @sIdUser");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdRequest", (_sIdRequest != "" ? _sIdRequest : (object)DBNull.Value));
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

        public static Boolean ValidaCrearOtraSolicitud(String _sIdUser)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from ResidencyRequest rr");
            sConsulta.AppendLine("inner join ResidencyRequestUsers rru on rru.IdRequest=rr.IdRequest");
            sConsulta.AppendLine("where rru.IdUser='" + _sIdUser + "' and rr.IdTypeState!='5'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return false;
            }
            return true;
        }

        public static void InsertaCalificacionSolicitud(String _sIdRequest, String _sComment, String _sIdTypeState)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec InsertaCalificacionSolicitud @sIdComment, @sIdRequest, @sComment, @sIdTypeState, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdComment", Generales.ObtieneNuevoID());
                scParametros.Parameters.AddWithValue("@sIdRequest", (_sIdRequest != "" ? _sIdRequest : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sComment", (_sComment != "" ? _sComment : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeState", (_sIdTypeState != "" ? _sIdTypeState : (object)DBNull.Value));
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

        public static void ActualizaEstatusSolicitud(String _sIdRequest, String _sIdTypeState)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec ActualizaEstatusSolicitud @sIdRequest, @sIdTypeState");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdRequest", (_sIdRequest != "" ? _sIdRequest : (object)DBNull.Value));
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

        public static Boolean ValidaSiEstaCalificado(String _sIdRequest)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from ResidencyRequestComments");
            sConsulta.AppendLine("where IdRequest='" + _sIdRequest + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static void EliminarCalificacion(String _sIdRequest)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec EliminarCalificacionSolicitud @sIdRequest");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdRequest", (_sIdRequest != "" ? _sIdRequest : (object)DBNull.Value));

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();

            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static Boolean ValidaSiElAlumnoFueNotificado(String _sIdRequest)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from ResidencyRequest");
            sConsulta.AppendLine("where IdRequest='" + _sIdRequest + "' and (IdTypeState='4' or IdTypeState='5')");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static DataTable ObtieneMisSolicitudesCanceladas(String _sIdUser)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from ResidencyRequest rr");
            sConsulta.AppendLine("inner join ResidencyRequestUsers rru on rr.IdRequest=rru.IdRequest");
            sConsulta.AppendLine("where rru.IdUser='" + _sIdUser + "' and rr.IdTypeState='5'");
            sConsulta.AppendLine("order by rr.DateCreation desc");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            return dtDatos;
        }
        #endregion
    }
}