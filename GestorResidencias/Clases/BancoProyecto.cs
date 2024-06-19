using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace GestorResidencias.Clases
{
    public class BancoProyecto
    {
        #region Variables
        private string sIdBank;
        private string sNumber;
        private string sCompanyName;
        private string sGiro;
        private string sDomicile;
        private string sContactName;
        private string sReceptionArea;
        private string sWorkplace;
        private string sEmail;
        private string sProjectName;
        private string sActivities;
        private string sIdCareer;
        private string sShift;
        private string sShiftOther;
        private string sWorkingHours;
        private string sWorkingDays;
        private string sNumberResidents;
        private string sTraining;
        private string sTrainingDetail;
        private string sTrainingDate;
        private string sBenefit;
        private string sBenefitDetail;
        private string sAmount;
        private string sidTypeState;
        private string sIdPeriod;
        private string sYear;

        private StringBuilder sConsulta;

        private Conexion oConexion;
        #endregion

        #region Propiedades
        public string IdBank
        {
            get
            {
                return sIdBank;
            }
            set
            {
                sIdBank = value;
            }
        }

        public string Numero
        {
            get
            {
                return sNumber;
            }
            set
            {
                sNumber = value;
            }
        }

        public string NombreEmpresa
        {
            get
            {
                return sCompanyName;
            }
            set
            {
                sCompanyName = value;
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

        public string Domicilio
        {
            get
            {
                return sDomicile;
            }
            set
            {
                sDomicile = value;
            }
        }

        public string NombreContacto
        {
            get
            {
                return sContactName;
            }
            set
            {
                sContactName = value;
            }
        }

        public string AreaReceptora
        {
            get
            {
                return sReceptionArea;
            }
            set
            {
                sReceptionArea = value;
            }
        }

        public string Puesto
        {
            get
            {
                return sWorkplace;
            }
            set
            {
                sWorkplace = value;
            }
        }

        public string Email
        {
            get
            {
                return sEmail;
            }
            set
            {
                sEmail = value;
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

        public string Actividades
        {
            get
            {
                return sActivities;
            }
            set
            {
                sActivities = value;
            }
        }

        public string IdCarrera
        {
            get
            {
                return sIdCareer;
            }
            set
            {
                sIdCareer = value;
            }
        }

        public string Turno
        {
            get
            {
                return sShift;
            }
            set
            {
                sShift = value;
            }
        }

        public string TurnoOtro
        {
            get
            {
                return sShiftOther;
            }
            set
            {
                sShiftOther = value;
            }
        }

        public string Horario
        {
            get
            {
                return sWorkingHours;
            }
            set
            {
                sWorkingHours = value;
            }
        }

        public string DiasLaborales
        {
            get
            {
                return sWorkingDays;
            }
            set
            {
                sWorkingDays = value;
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

        public string Capacitacion
        {
            get
            {
                return sTraining;
            }
            set
            {
                sTraining = value;
            }
        }

        public string CapacitacionDet
        {
            get
            {
                return sTrainingDetail;
            }
            set
            {
                sTrainingDetail = value;
            }
        }

        public string CapacitacionFecha
        {
            get
            {
                return sTrainingDate;
            }
            set
            {
                sTrainingDate = value;
            }
        }

        public string Prestacion
        {
            get
            {
                return sBenefit;
            }
            set
            {
                sBenefit = value;
            }
        }

        public string PrestacionDet
        {
            get
            {
                return sBenefitDetail;
            }
            set
            {
                sBenefitDetail = value;
            }
        }

        public string Monto
        {
            get
            {
                return sAmount;
            }
            set
            {
                sAmount = value;
            }
        }

        public string IdTypeState
        {
            get
            {
                return sidTypeState;
            }
            set
            {
                sidTypeState = value;
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
        
        #endregion

        #region Constructores
        public BancoProyecto()
        {
            sIdBank = Generales.ObtieneNuevoID();
        }

        public BancoProyecto(String _sIdBank)
        {
            sIdBank = _sIdBank;
            RecuperaBancoProyecto();
        }
        #endregion

        #region Funciones
        public void RecuperaBancoProyecto()
        {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec RecuperaBancoProyecto @sIdBank");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdBank", (sIdBank != "" ? sIdBank : (object)DBNull.Value));

            DataTable dtBanco = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtBanco.Rows.Count != 0)
            {
                sIdBank = dtBanco.Rows[0]["IdBank"].ToString();
                sNumber = dtBanco.Rows[0]["Number"].ToString();
                sCompanyName = dtBanco.Rows[0]["CompanyName"].ToString();
                sGiro = dtBanco.Rows[0]["Giro"].ToString();
                sDomicile = dtBanco.Rows[0]["Domicile"].ToString();
                sContactName = dtBanco.Rows[0]["ContactName"].ToString();
                sReceptionArea = dtBanco.Rows[0]["ReceptionArea"].ToString();
                sWorkplace = dtBanco.Rows[0]["Workplace"].ToString();
                sEmail = dtBanco.Rows[0]["Email"].ToString();
                sProjectName = dtBanco.Rows[0]["ProjectName"].ToString();
                sActivities = dtBanco.Rows[0]["Activities"].ToString();
                sIdCareer = dtBanco.Rows[0]["IdCareer"].ToString();
                sShift = dtBanco.Rows[0]["IdShift"].ToString();
                sShiftOther = dtBanco.Rows[0]["ShiftOther"].ToString();
                sWorkingHours = dtBanco.Rows[0]["WorkingHours"].ToString();
                sWorkingDays = dtBanco.Rows[0]["WorkingDays"].ToString();
                sNumberResidents = dtBanco.Rows[0]["NumberResidents"].ToString();
                sTraining = dtBanco.Rows[0]["Training"].ToString();
                sTrainingDetail = dtBanco.Rows[0]["TrainingDetail"].ToString();
                sTrainingDate = dtBanco.Rows[0]["TrainingDate"].ToString();
                sBenefit = dtBanco.Rows[0]["Benefit"].ToString();
                sBenefitDetail = dtBanco.Rows[0]["BenefitDetail"].ToString();
                sAmount = dtBanco.Rows[0]["Amount"].ToString();
                sidTypeState = dtBanco.Rows[0]["IdTypeState"].ToString();
                sIdPeriod = dtBanco.Rows[0]["IdPeriod"].ToString();
                sYear = dtBanco.Rows[0]["Year"].ToString();
            }
        }

        public static DataTable ObtieneBancoProyectos(String _sIdPeriod, String _sYear, String _sIdCareer, String _sNombreEmpresa="", String _sNombreProyecto="", String _sNumeroResidentes="",
            String _sTurno="", String _sHorario="")
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneBancoProyectos @sIdPeriod, @sYear, @sIdCareer, @sNombreEmpresa, @sNombreProyecto, @sNumeroResidentes, @sTurno, @sHorario");


            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPeriod", (_sIdPeriod != "" ? _sIdPeriod : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sYear", (_sYear != "" ? _sYear : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdCareer", (_sIdCareer != "" ? _sIdCareer : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNombreEmpresa", (_sNombreEmpresa != "" ? _sNombreEmpresa : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNombreProyecto", (_sNombreProyecto != "" ? _sNombreProyecto : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNumeroResidentes", (_sNumeroResidentes != "" ? _sNumeroResidentes : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sTurno", (_sTurno != "" ? _sTurno : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sHorario", (_sHorario != "" ? _sHorario : (object)DBNull.Value));

            DataTable dtBanco = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtBanco;
        }

        public void InsertaActualizaBancoProyecto()
        {
            oConexion = new Conexion();

            try
            {
                sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec InsertaActualizaBancoProyectos @sIdBank, @sNumber, @sCompanyName, @sGiro, @sDomicile, @sContactName, @sReceptionArea, @sWorkplace, @sEmail, @sProjectName, @sActivities, @sIdCareer," +
                    "@sIdShift, @sShiftOther, @sWorkingHours, @sWorkingDays, @sNumberResidents, @sTraining, @sTrainingDetail, @sTrainingDate, @sBenefit, @sBenefitDetail, @sAmount, @sIdTypeState, @sIdPeriod," +
                    "@sYear, @sIdUserModification");


                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdBank", (sIdBank != "" ? sIdBank : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sNumber", (sNumber != "" ? sNumber : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCompanyName", (sCompanyName != "" ? sCompanyName : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sGiro", (sGiro != "" ? sGiro : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sDomicile", (sDomicile != "" ? sDomicile : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sContactName", (sContactName != "" ? sContactName : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sReceptionArea", (sReceptionArea != "" ? sReceptionArea : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWorkplace", (sWorkplace != "" ? sWorkplace : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sEmail", (sEmail != "" ? sEmail : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sProjectName", (sProjectName != "" ? sProjectName : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sActivities", (sActivities != "" ? sActivities : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdCareer", (sIdCareer != "" ? sIdCareer : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdShift", (sShift != "" ? sShift : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sShiftOther", (sShiftOther != "" ? sShiftOther : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWorkingHours", (sWorkingHours != "" ? sWorkingHours : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sWorkingDays", (sWorkingDays != "" ? sWorkingDays : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sNumberResidents", (sNumberResidents != "" ? sNumberResidents : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sTraining", (sTraining != "" ? sTraining : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sTrainingDetail", (sTrainingDetail != "" ? sTrainingDetail : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sTrainingDate", (sTrainingDate != "" ? sTrainingDate : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sBenefit", (sBenefit != "" ? sBenefit : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sBenefitDetail", (sBenefitDetail != "" ? sBenefitDetail : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sAmount", (sAmount != "" ? sAmount : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeState", (sidTypeState != "" ? sidTypeState : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdPeriod", (sIdPeriod != "" ? sIdPeriod : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sYear", (sYear != "" ? sYear : (object)DBNull.Value));
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

        public Boolean ValidaExisteProyectoEnBanco()
        {
            oConexion = new Conexion();
            
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("ValidaExisteProyectoEnBanco @sCompanyName, @sGiro, @sDomicile, @sContactName, @sReceptionArea, @sWorkplace, @sEmail, @sProjectName, @sActivities, @sIdCareer, @sIdShift, @sShiftOther," +
                "@sWorkingHours, @sWorkingDays, @sNumberResidents, @sTraining, @sTrainingDetail, @sTrainingDate, @sBenefit, @sBenefitDetail, @sAmount, @sIdPeriod, @sYear");


            SqlCommand scParametros = new SqlCommand();
            
            scParametros.Parameters.AddWithValue("@sCompanyName", (sCompanyName != "" ? sCompanyName : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sGiro", (sGiro != "" ? sGiro : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sDomicile", (sDomicile != "" ? sDomicile : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sContactName", (sContactName != "" ? sContactName : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sReceptionArea", (sReceptionArea != "" ? sReceptionArea : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sWorkplace", (sWorkplace != "" ? sWorkplace : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sEmail", (sEmail != "" ? sEmail : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sProjectName", (sProjectName != "" ? sProjectName : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sActivities", (sActivities != "" ? sActivities : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdCareer", (sIdCareer != "" ? sIdCareer : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdShift", (sShift != "" ? sShift : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sShiftOther", (sShiftOther != "" ? sShiftOther : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sWorkingHours", (sWorkingHours != "" ? sWorkingHours : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sWorkingDays", (sWorkingDays != "" ? sWorkingDays : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNumberResidents", (sNumberResidents != "" ? sNumberResidents : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sTraining", (sTraining != "" ? sTraining : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sTrainingDetail", (sTrainingDetail != "" ? sTrainingDetail : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sTrainingDate", (sTrainingDate != "" ? sTrainingDate : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sBenefit", (sBenefit != "" ? sBenefit : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sBenefitDetail", (sBenefitDetail != "" ? sBenefitDetail : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sAmount", (sAmount != "" ? sAmount : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdPeriod", (sIdPeriod != "" ? sIdPeriod : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sYear", (sYear != "" ? sYear : (object)DBNull.Value));

            DataTable dtExiste = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if(dtExiste.Rows.Count != 0)
            {
                return true;
            }

            return false;
        }

        public static void EliminarBancoProyectos(String _sIdBank)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();

                sConsulta.AppendLine("exec EliminarBancoProyecto @sIdBank");
                
                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdBank", (_sIdBank != "" ? _sIdBank : (object)DBNull.Value));

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static DataTable ObtieneBancoProyectosAdministrador(String _sIdPeriod, String _sYear, String _sEmpresa, String _sProyecto,
            String _sNumeroResidentes, String _sTurno, String _sCarrera, String _sEstatus)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("exec ObtieneBancoProyectoAdministrador @sIdPeriod, @sYear, @sNombreEmpresa, @sNombreProyecto, @sNumeroResidentes, @sTurno, @sCarrera, @sEstatus");


            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPeriod", _sIdPeriod);
            scParametros.Parameters.AddWithValue("@sYear", _sYear);
            scParametros.Parameters.AddWithValue("@sNombreEmpresa", _sEmpresa);
            scParametros.Parameters.AddWithValue("@sNombreProyecto", _sProyecto);
            scParametros.Parameters.AddWithValue("@sNumeroResidentes", _sNumeroResidentes);
            scParametros.Parameters.AddWithValue("@sTurno", (_sTurno != "" ? _sTurno : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sCarrera", (_sCarrera != "" ? _sCarrera : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sEstatus", (_sEstatus != "" ? _sEstatus : (object)DBNull.Value));

            DataTable dtUsuarios = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtUsuarios;
        }

        public static int ObtieneUltimoNumero(String _sIdPeriod, String _sYear, String _sIdCareer)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select Number");
            sConsulta.AppendLine("from ProjectBank");
            sConsulta.AppendLine("where IdPeriod='" + _sIdPeriod + "' and Year='" + _sYear + "' and IdCareer='" + _sIdCareer + "'");
            sConsulta.AppendLine("order by Number desc");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return int.Parse(dtDatos.Rows[0]["Number"].ToString()) + 1;
            }
            return 1;
        }
        #endregion
    }
}