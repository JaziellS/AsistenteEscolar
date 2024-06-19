using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace GestorResidencias.Clases {
    public class Conexion {
        #region "Variables"
        private SqlConnection objConexion;
        private SqlTransaction objTransaccion;
        #endregion

        #region "Constructores"
        public Conexion() {
            IniciaTransaccionSQL();
        }
        #endregion

        public static string ObtieneCadenaConexion() {            
            string sCadenaConexion = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            return sCadenaConexion;
        }        

        public static string ObtieneCadenaConexionSAP() {
            string sCadenaConexion = ConfigurationManager.ConnectionStrings["DefaultConnectionSAP"].ConnectionString;

            return sCadenaConexion;
        }

        public static DataTable EjecutarConsultaDatatable(string _sConsultaSQL, string _sTabla="Table", int _iTimeOut= 30) {
            SqlConnection oConnection = new SqlConnection();
            oConnection.ConnectionString = ObtieneCadenaConexion();
            oConnection.Open();

            SqlCommand oCommand = new SqlCommand(" set dateformat dmy SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ", oConnection);
            oCommand.ExecuteNonQuery();
            oCommand.CommandText = _sConsultaSQL;
            oCommand.CommandTimeout = _iTimeOut;

            DataSet DataSetRetorno = new DataSet();
            SqlDataAdapter SqlDataAdapter = new SqlDataAdapter(oCommand);
            SqlDataAdapter.Fill(DataSetRetorno, _sTabla);
            SqlDataAdapter.Dispose();
            oConnection.Close();

            return DataSetRetorno.Tables[0].Copy();
        }

        public static DataTable EjecutarConsultaDatatableConParametros(string _sConsultaSQL, SqlCommand _sComando, string _sTabla = "Table", int _iTimeOut = 30)
        {
            SqlConnection oConnection = new SqlConnection();
            oConnection.ConnectionString = ObtieneCadenaConexion();
            oConnection.Open();

            SqlCommand oCommand = new SqlCommand(" set dateformat dmy SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ", oConnection);
            oCommand.ExecuteNonQuery();
            oCommand.CommandText = _sConsultaSQL;
            foreach (SqlParameter spParametros in _sComando.Parameters)
            {
                oCommand.Parameters.Add(new SqlParameter(spParametros.ParameterName, spParametros.Value));

            }
            oCommand.CommandTimeout = _iTimeOut;

            DataSet DataSetRetorno = new DataSet();
            SqlDataAdapter SqlDataAdapter = new SqlDataAdapter(oCommand);
            SqlDataAdapter.Fill(DataSetRetorno, _sTabla);
            SqlDataAdapter.Dispose();
            oConnection.Close();

            return DataSetRetorno.Tables[0].Copy();
        }

        public static void EjecutarConsulta(string _sConsultaSQL, int _iTimeOut = 30) {
            SqlConnection oConnection = new SqlConnection();
            oConnection.ConnectionString = ObtieneCadenaConexion();
            oConnection.Open();

            SqlCommand oCommand = new SqlCommand("SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ", oConnection);
            oCommand.ExecuteNonQuery();
            oCommand.CommandText = _sConsultaSQL;
            oCommand.CommandTimeout = _iTimeOut;
            oCommand.ExecuteScalar();
            oCommand.Dispose();            
            oConnection.Close();            
        }

        public static String EjecutaConsultaValor(string _sConsultaSQL, int _iTimeOut = 30) {
            String _sID = null;
            SqlConnection oConnection = new SqlConnection();
            oConnection.ConnectionString = ObtieneCadenaConexion();
            oConnection.Open();

            SqlCommand oCommand = new SqlCommand("SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ", oConnection);
            oCommand.ExecuteNonQuery();
            oCommand.CommandText = _sConsultaSQL;
            oCommand.CommandTimeout = _iTimeOut;
            _sID = Convert.ToString(oCommand.ExecuteScalar());

            oCommand.Dispose();
            oConnection.Close();
            return _sID;
        }

        public void EjecutaConsulta(string parsComandoSQL, int prTimeOut = 30) {
            if (objConexion == null) {
                objConexion = new SqlConnection(ObtieneCadenaConexion());
            }

            if (objConexion.State == ConnectionState.Closed) {
                objConexion.Open();
            }

            SqlCommand oCommand = new SqlCommand("SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ", objConexion);
            if (objTransaccion != null) {
                oCommand.Transaction = objTransaccion;
            }
            oCommand.ExecuteNonQuery();
            oCommand.CommandText = parsComandoSQL;
            oCommand.CommandTimeout = prTimeOut;
            oCommand.ExecuteScalar();
            oCommand.Dispose();
            if (objTransaccion == null) {
                objConexion.Close();
            }
        }

        public void EjecutaConsultaConParametros(string parsComandoSQL, SqlCommand _sComando, int prTimeOut = 30)
        {
            if (objConexion == null)
            {
                objConexion = new SqlConnection(ObtieneCadenaConexion());
            }

            if (objConexion.State == ConnectionState.Closed)
            {
                objConexion.Open();
            }

            SqlCommand oCommand = new SqlCommand("SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ", objConexion);
            if (objTransaccion != null)
            {
                oCommand.Transaction = objTransaccion;
            }
            oCommand.ExecuteNonQuery();
            oCommand.CommandText = parsComandoSQL;
            foreach( SqlParameter spParametros in _sComando.Parameters)
            {
                oCommand.Parameters.Add(new SqlParameter(spParametros.ParameterName, spParametros.Value));

            }
            oCommand.CommandTimeout = prTimeOut;
            oCommand.ExecuteScalar();
            oCommand.Dispose();
            if (objTransaccion == null)
            {
                objConexion.Close();
            }
        }

        public DataTable EjecutaConsultaDataTable(string prConsultaSQL, string prTabla = "Table" , int prTimeOut = 30 ) {
            if (objConexion == null) {
                objConexion = new SqlConnection(ObtieneCadenaConexion());
            }

            if (objConexion.State == ConnectionState.Closed) {
                objConexion.Open();
            }

            SqlCommand oCommand = new SqlCommand("SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED ", objConexion);
            if (objTransaccion != null) {
                oCommand.Transaction = objTransaccion;
            }
            oCommand.ExecuteNonQuery();

            DataSet DataSetRetorno = new DataSet();
            SqlDataAdapter SqlDataAdapter;
            oCommand.CommandText = prConsultaSQL;
            oCommand.CommandTimeout = prTimeOut;
            SqlDataAdapter = new SqlDataAdapter(oCommand);
            SqlDataAdapter.Fill(DataSetRetorno, prTabla);
            SqlDataAdapter.Dispose();

            if (objTransaccion == null) {
                objConexion.Close();
            }
            
            return DataSetRetorno.Tables[0].Copy();
        }

        public void IniciaTransaccionSQL() {
            objConexion = new SqlConnection(ObtieneCadenaConexion());
            if (objConexion.State == ConnectionState.Closed) {
                objConexion.Open();
            }

            objTransaccion = objConexion.BeginTransaction();
        }

        public void TerminaTransaccionSQL() {
            if (objTransaccion != null) {
                objTransaccion.Commit();
                objTransaccion = null;
            }

            if (objConexion.State == ConnectionState.Open) {
                objConexion.Close();
            }
        }

        public void DeshaceTransaccionSQL() {
            if (objTransaccion != null) {
                objTransaccion.Rollback();
                objTransaccion = null;
            }

            if (objConexion.State == ConnectionState.Open) {
                objConexion.Close();
            }
        }

        public static DataTable ExecPrcAlamacenado(string _sNombre, int _iTimeOut = 30)
        {
            SqlConnection oConnection = new SqlConnection();
            oConnection.ConnectionString = ObtieneCadenaConexion();
            oConnection.Open();

            DataTable dt = new DataTable();

            SqlDataAdapter da = new SqlDataAdapter(_sNombre, oConnection);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.ExecuteNonQuery();
            da.SelectCommand.CommandTimeout = _iTimeOut;
            da.Fill(dt);

            return dt;

        }
    }
}