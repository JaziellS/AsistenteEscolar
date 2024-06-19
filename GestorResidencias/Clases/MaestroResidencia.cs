using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace GestorResidencias.Clases
{
    public class MaestroResidencia
    {
        #region Variables
        private string sIdTeachers;
        private string sIdPeriod;
        private string sYear;

        StringBuilder sConsulta = new StringBuilder();

        Conexion oConexion = new Conexion();
        #endregion

        #region Propiedades
        public string IdTeachers
        {
            get
            {
                return sIdTeachers;
            }
            set
            {
                sIdTeachers = value;
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
        public MaestroResidencia()
        {
            sIdTeachers = Generales.ObtieneNuevoID();
        }

        public MaestroResidencia(String _sIdPeriod, String _sYear)
        {
            sIdPeriod = _sIdPeriod;
            sYear = _sYear;
            RecuperaMaestroResidenica();
        }
        #endregion

        #region Funciones
        public void RecuperaMaestroResidenica()
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select IdTeachers");
            sConsulta.AppendLine("from TeachersResidence tr");
            sConsulta.AppendLine("where IdPeriod='" + sIdPeriod + "' and Year='" + sYear + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                sIdTeachers = dtDatos.Rows[0]["IdTeachers"].ToString();
            }
        }

        public void InsertaPeriodoMaestrosResidencias()
        {
            oConexion = new Conexion();

            try
            {
                sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec InsertaMaestrosResidenciaPeriodo @sIdTeachers, @sIdPeriod, @sYear, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdTeachers", (sIdTeachers != "" ? sIdTeachers : (object)DBNull.Value));
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
        
        public static void InsertaMaestrosResidenciasDetalle(String _sIdTeachers, String _sIdTeachersDet, String _sidUser, String _sIdTypeState, String _sHours)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec InsertaMaestrosResidenciaDetalle @sIdTeachers, @sIdTeachersDet, @sIdUser, @sHours, @sIdTypeState, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdTeachers", (_sIdTeachers != "" ? _sIdTeachers : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTeachersDet", (_sIdTeachersDet != "" ? _sIdTeachersDet : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdUser", (_sidUser != "" ? _sidUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sHours", (_sHours != "" ? _sHours : (object)DBNull.Value));
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

        public static Boolean ValidaExistePeriodoAnio(String _sIdPeriod, String _sYear)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from TeachersResidence tr");
            sConsulta.AppendLine("where IdPeriod='" + _sIdPeriod + "' and Year='" + _sYear + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static DataTable ObtieneMaestrosEncargadosResidencia(String _sNoEmpleado, String _sNombreMaestro, String _sProyectosAsignados, String _sIdPeriod, String _sYear)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneMaestrosEncargadosResidencia @sNoEmpleado, @sNombreMaestro, @sProyectosAsignados, @sIdPeriod, @sYear");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sNoEmpleado", (_sNoEmpleado != "" ? _sNoEmpleado : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNombreMaestro", (_sNombreMaestro != "" ? _sNombreMaestro : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sProyectosAsignados", (_sProyectosAsignados != "" ? _sProyectosAsignados : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdPeriod", (_sIdPeriod != "" ? _sIdPeriod : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sYear", (_sYear != "" ? _sYear : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtDatos;
        }

        public static DataTable ObtieneMaestros(String _sIdTeachers="")
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select u.IdUser, trd.IdTeachers, trd.IdTeachersDet, u.ControlNumber as NoControl, u.Name + ' ' + u.FatherLastName + ' ' + u.MotherLastName as NombreMaestro,");
            sConsulta.AppendLine("	u.Email,  trd.IdTypeState as Asignar, tr.IdPeriod, tr.Year, trd.Hours as CantidadHoras");
            sConsulta.AppendLine("from TeachersResidenceDetail trd");
            sConsulta.AppendLine("inner join Users u on trd.IdUser=u.IdUser");
            sConsulta.AppendLine("inner join TeachersResidence tr on tr.IdTeachers=trd.IdTeachers");
            sConsulta.AppendLine("where trd.IdTeachers='" + _sIdTeachers + "'");
            
            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            return dtDatos;
        }

        public static DataTable ObtieneTodosLosMaestros()
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select IdUser");
            sConsulta.AppendLine("from Users");
            sConsulta.AppendLine("where (IdTypeUser=4 or IdTypeUser=1)");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            return dtDatos;
        }

        public static Boolean ValidaExisteMaestroEnElPeriodo(String _sIdTeachers, String _sIdUser)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from TeachersResidenceDetail");
            sConsulta.AppendLine("where IdTeachers='" + _sIdTeachers + "' and IdUser='" + _sIdUser + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static void ActualizaEstatusMaestrosDetalle(String _sIdTeacher, String _sIdTeacherDet, String _sIdTypeState)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec ActualizaEstatusMaestroDetalle @sIdTypeState, @sIdTeachers, @sIdTeachersDet, @sIdUserModification");
                
                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdTypeState", (_sIdTypeState != "" ? _sIdTypeState : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTeachers", (_sIdTeacher != "" ? _sIdTeacher : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTeachersDet", (_sIdTeacherDet != "" ? _sIdTeacherDet : (object)DBNull.Value));
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

        public static void ActualizaHorasMaestrosDetalle(String _sIdTeacher, String _sIdTeacherDetail, int _iHora)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec ActualizaHorasAsiganadasMaestros @sIdTeachers, @sIdTeachersDet, @sHours, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdTeachers", (_sIdTeacher != "" ? _sIdTeacher : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTeachersDet", (_sIdTeacherDetail != "" ? _sIdTeacherDetail : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sHours", (_iHora.ToString() != "" ? _iHora.ToString() : (object)DBNull.Value));
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

        public static DataTable ObtieneAnteproyectosMaestros(String _sIdTeachersDet, String _sIdPeriod, String _sYear, String _sNombreAnteproyecto, String _sMaestrosAsignados)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneAnteproyectosLigadosMaestros @sIdTeachersDet, @sIdPeriod, @sYear, @sNombreAnteproyecto, @sMaestrosAsignados");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdTeachersDet", (_sIdTeachersDet != "" ? _sIdTeachersDet : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdPeriod", (_sIdPeriod != "" ? _sIdPeriod : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sYear", (_sYear != "" ? _sYear : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sNombreAnteproyecto", (_sNombreAnteproyecto != "" ? _sNombreAnteproyecto : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sMaestrosAsignados", (_sMaestrosAsignados != "" ? _sMaestrosAsignados : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtDatos;
        }
        
        public static void InsertaAnteproyectosMaestros(String _sIdTeachersDet, String _sIdPreliminaryDraft)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec InsertaAnteproyectosMaestros @sIdTeachersDet, @sIdPreliminaryDraft, @sIdTypeState, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdTeachersDet", (_sIdTeachersDet != "" ? _sIdTeachersDet : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeState", (Enums.EstatusAnteproyectoCalificacion.PendientePorCalificar.ToString() != "" ? Enums.EstatusAnteproyectoCalificacion.PendientePorCalificar.ToString() : (object)DBNull.Value));
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

        public static void EliminaAnteproyectosMaestros(String _sIdTeachersDet, String _sIdPreliminaryDraft)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();

                sConsulta.AppendLine("exec EliminarAnteproyectoMaestros @sIdTeachersDet, @sIdPreliminaryDraft");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdTeachersDet", (_sIdTeachersDet != "" ? _sIdTeachersDet : (object)DBNull.Value));
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

        public static Boolean ValidarExisteAnteproyectosLigados(String _sIdTeachersDet)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from TeachersResidencePreliminaryDraft");
            sConsulta.AppendLine("where IdTeachersDet='" + _sIdTeachersDet + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static DataTable ObtieneAnteproyectosLigadosVer(String _sIdTeacher, String _sIdTeacherDet)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select tr.IdTeachers, trpd.IdTeachersDet, trpd.IdPreliminaryDraft, pd.ProjectName as NombreAnteproyecto, rvd.Name as Calificacion");
            sConsulta.AppendLine("from TeachersResidence tr");
            sConsulta.AppendLine("inner join TeachersResidenceDetail trd on tr.IdTeachers=trd.IdTeachers");
            sConsulta.AppendLine("inner join TeachersResidencePreliminaryDraft trpd on trpd.IdTeachersDet = trd.IdTeachersDet");
            sConsulta.AppendLine("inner join PreliminaryDraft pd on trpd.IdPreliminaryDraft=pd.IdPreliminaryDraft");
            sConsulta.AppendLine("inner join ReferenceValuesDetail rvd on rvd.IdValue='EstatusAnteproyectoCalificacion' and rvd.IdValueDetail=trpd.IdTypeState");
            sConsulta.AppendLine("where trd.IdTeachersDet='" + _sIdTeacherDet + "' and tr.IdTeachers='" + _sIdTeacher + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            return dtDatos;
        }

        public static DataTable ObtieneMisAnteproyectosPorCalificar(String _sIdPeriod, String _sYear, String _sIdUser)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneMisAnteproyectosPorCalificar @sIdPeriod, @sYear, @sIdUser");


            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPeriod", (_sIdPeriod != "" ? _sIdPeriod : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sYear", (_sYear != "" ? _sYear : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdUser", (_sIdUser != "" ? _sIdUser : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtDatos;
        }

        public static void InsertaActualizaComentarioMaestros(String _sIdComment, String _sIdTeachersDet, String _sidPreliminaryDraft, String _sGeneralComment, String _sIdTypeState)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec InsertaActualizaComentarioMaestro @sIdComment, @sIdTeachersDet, @sIdPreliminaryDraft, @sGeneralComment, @sIdTypeState, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdComment", (_sIdComment != "" ? _sIdComment : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTeachersDet", (_sIdTeachersDet != "" ? _sIdTeachersDet : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sidPreliminaryDraft != "" ? _sidPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sGeneralComment", (_sGeneralComment != "" ? _sGeneralComment : (object)DBNull.Value));
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

        public static Boolean ValidaExisteComentarioGuardadoMaestros(String _sIdTeachersDet, String _sidPreliminaryDraft="", String _sIdComment="")
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from PreliminaryDraftComments");
            sConsulta.AppendLine("where IdTeachersDet='" + _sIdTeachersDet + "' ");

            if(_sidPreliminaryDraft != "")
            {
                sConsulta.AppendLine(" and IdPreliminaryDraft='" + _sidPreliminaryDraft + "' ");
            }

            if (_sIdComment != "")
            {
                sConsulta.AppendLine(" and IdComment !='" + _sIdComment + "' ");
            }

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static DataTable ObtieneMisComentariosMaestros(String _sIdTeachersDet, String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneComentariosMaestro @sIdTeachersDet, @sIdPreliminaryDraft");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdTeachersDet", (_sIdTeachersDet != "" ? _sIdTeachersDet : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtDatos;
        }

        public static DataTable ObtieneComentarios(String _sIdTeachers, String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneComentarios @sIdTeachers, @sIdPreliminaryDraft");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdTeachers", (_sIdTeachers != "" ? _sIdTeachers : (object)DBNull.Value));
            scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtDatos;
        }

        public static void EliminarComentario(String _sIdComment, String _sIdTeacherDet, String _sIdPreliminaryDraft)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec EliminarComentario @sIdComment, @sIdTeacherDet, @sIdPreliminaryDraft, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdComment", (_sIdComment != "" ? _sIdComment : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTeacherDet", (_sIdTeacherDet != "" ? _sIdTeacherDet : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));
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

        public static int ObtineNumeroAnteproyectosLigados(String _sIdTeachersDet)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select count(IdTeachersDet) as Contador");
            sConsulta.AppendLine("from TeachersResidencePreliminaryDraft");
            sConsulta.AppendLine("where IdTeachersDet='" + _sIdTeachersDet + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                int sRevision = int.Parse(dtDatos.Rows[0]["Contador"].ToString());
                return sRevision;
            }
            return 0;
        }

        public static int ObtieneHorasAsignadas(String _sIdTeachersDet)
        {
            StringBuilder sConsulta = new StringBuilder();
            
            sConsulta.AppendLine("select isnull(Hours, 0) as Hours");
            sConsulta.AppendLine("from TeachersResidenceDetail");
            sConsulta.AppendLine("where IdTeachersDet='" + _sIdTeachersDet + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                int sHoras = int.Parse(dtDatos.Rows[0]["Hours"].ToString());
                return sHoras;
            }
            return 0;
        }

        public static int ObtieneMaestrosAsignadosAnteproyecto(String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select count(*) as MaestrosAsigandos");
            sConsulta.AppendLine("from TeachersResidencePreliminaryDraft");
            sConsulta.AppendLine("where IdPreliminaryDraft='" + _sIdPreliminaryDraft + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                int iMaestrosAsig = int.Parse(dtDatos.Rows[0]["MaestrosAsigandos"].ToString());
                return iMaestrosAsig;
            }
            return 0;
        }

        public static void InsertaActualizaComentarioJefeCarrera(String _sIdQualificaction, String _sidPreliminaryDraft, String _sIdTypeState, String _sGeneralComment)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec InsertaActualizaComentarioJefeCarrera @sIdPreliminaryDraft, @sIdQualification, @sIdTypeState, @sGeneralComment, @sIdUserModification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sidPreliminaryDraft != "" ? _sidPreliminaryDraft : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdQualification", (_sIdQualificaction != "" ? _sIdQualificaction : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeState", (_sIdTypeState != "" ? _sIdTypeState : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sGeneralComment", (_sGeneralComment != "" ? _sGeneralComment : (object)DBNull.Value));
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

        public static Boolean ValidaExisteComentearioJefeCarrera(String _sidPreliminaryDraft, String _sIdQualification)
        {
            StringBuilder sConsulta = new StringBuilder();
            /*Esta consulta muestra el comentario del anteproyecto conforme el IdQualification, en caso de que sea el mismo al guardado en la 
             base de datos, si se puede hacer la edicion, y en caso contrario, no se puede*/
            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from PreliminaryDraftFinalQualification");
            sConsulta.AppendLine("where IdQualification!='" + _sIdQualification + "' and IdPreliminaryDraft='" + _sidPreliminaryDraft + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static Boolean ValidaExisteComentearioJefeCarrera(String _sidPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();
            /*Esta consulta muestra el comentario del anteproyecto conforme el IdQualification, en caso de que sea el mismo al guardado en la 
             base de datos, si se puede hacer la edicion, y en caso contrario, no se puede*/
            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from PreliminaryDraftFinalQualification");
            sConsulta.AppendLine("where IdPreliminaryDraft='" + _sidPreliminaryDraft + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static Boolean ValidaPosibilidadRetirarAnteproyecto(String _sIdTeachersDet, String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from TeachersResidencePreliminaryDraft");
            sConsulta.AppendLine("where IdTeachersDet='" + _sIdTeachersDet + "' and IdPreliminaryDraft='" + _sIdPreliminaryDraft + "' " +
                "and IdTypeState='1' and IdUserCreation='" + Generales.glsUsuarioSession.IdUsuario + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static DataTable ObtieneMisComentariosJefeCarrera(String _sIdPreliminaryDraft)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("exec ObtieneComentariosJefeCarrera @sIdPreliminaryDraft");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdPreliminaryDraft", (_sIdPreliminaryDraft != "" ? _sIdPreliminaryDraft : (object)DBNull.Value));
            
            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtDatos;
        }

        public static void EliminarComentarioJefeCarrera(String _sIdQualification)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();
                sConsulta.AppendLine("exec EliminarComentarioJefeCarrera @sIdQualification");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdQualification", (_sIdQualification != "" ? _sIdQualification : (object)DBNull.Value));

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static int ObtieneMisHorasSobrantes(String _sIdPeriod, String _sYear, String _sIdUser)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select (Hours - (select COUNT(*) from TeachersResidencePreliminaryDraft where IdTeachersDet=trd.IdTeachersDet)) as Horas");
            sConsulta.AppendLine("from TeachersResidence tr");
            sConsulta.AppendLine("inner join TeachersResidenceDetail trd on tr.IdTeachers=trd.IdTeachers and trd.IdUser='" + _sIdUser + "'");
            sConsulta.AppendLine("where tr.IdPeriod='" + _sIdPeriod + "' and tr.Year='" + _sYear + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                int sHoras = int.Parse(dtDatos.Rows[0]["Horas"].ToString());
                return sHoras;
            }
            return 0;
        }
        #endregion
    }
}