using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

namespace GestorResidencias.Clases
{
    public class Usuario
    {
        #region Variables
        private string sIdUser;
        private string sControlNumber;
        private string sName;
        private string sFatherLastName;
        private string sMotherLastName;
        private string sPassword;
        private string sEmail;
        private string sIdDomain;
        private string sPhone;
        private string sCellphone;
        private string sSemester;
        private string sIdTypeUser;
        private string sIdTypeState;
        private string sIdCareer;
        private string sPathProfilePicture;

        private string sStreet;
        private string sOutdoorNumber;
        private string sInteriorNumber;
        private string sCologne;
        private string sState;
        private string sMunicipality;
        private string sCity;
        private string sPostalCode;

        private string sIdSocialSecurity;
        private string sOtherSocialSecurity;
        private string sNSS;

        private StringBuilder sConsulta;

        private Conexion oConexion;
        #endregion

        #region Propiedades
        public string IdUsuario
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

        public string NoControl
        {
            get
            {
                return sControlNumber;
            }
            set
            {
                sControlNumber = value;
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

        public string ApellidoPaterno
        {
            get
            {
                return sFatherLastName;
            }
            set
            {
                sFatherLastName = value;
            }
        }

        public string ApellidoMaterno
        {
            get
            {
                return sMotherLastName;
            }
            set
            {
                sMotherLastName = value;
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

        public string IdDominio
        {
            get
            {
                return sIdDomain;
            }
            set
            {
                sIdDomain = value;
            }
        }

        public string Contrasena
        {
            get
            {
                return sPassword;
            }
            set
            {
                sPassword = value;
            }
        }

        public string Telefono
        {
            get
            {
                return sPhone;
            }
            set
            {
                sPhone = value;
            }
        }

        public string TelefonoCelular
        {
            get
            {
                return sCellphone;
            }
            set
            {
                sCellphone = value;
            }
        }

        public string Semestre
        {
            get
            {
                return sSemester;
            }
            set
            {
                sSemester = value;
            }
        }

        public string IdTipoUsuario
        {
            get
            {
                return sIdTypeUser;
            }
            set
            {
                sIdTypeUser = value;
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

        public string PathFotoPerfil
        {
            get
            {
                return sPathProfilePicture;
            }
            set
            {
                sPathProfilePicture = value;
            }
        }



        public string Calle
        {
            get
            {
                return sStreet;
            }
            set
            {
                sStreet = value;
            }
        }

        public string NumeroExterior
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



        public string IdSeguridadSocial
        {
            get
            {
                return sIdSocialSecurity;
            }
            set
            {
                sIdSocialSecurity = value;
            }
        }

        public string OtraSeguridadSocial
        {
            get
            {
                return sOtherSocialSecurity;
            }
            set
            {
                sOtherSocialSecurity = value;
            }
        }

        public string NSS
        {
            get
            {
                return sNSS;
            }
            set
            {
                sNSS = value;
            }
        }
        #endregion

        #region Constructores
        public Usuario()
        {
            sIdUser = Generales.ObtieneNuevoID();
        }

        public Usuario(String _sIdUser, String _sControlNumber="")
        {
            if (_sControlNumber == "")
            {
                sIdUser = _sIdUser;
                RecuperaUsuario();
            }
            else
            {
                sControlNumber = _sControlNumber;
                RecuperaUsuarioNoControl();
            }
        }

        public Usuario(String _sIdUser, String _sControlNumber, String _sIdTypeUser)
        {
            sControlNumber = _sControlNumber;
            sIdTypeUser = _sIdTypeUser;
            RecuperaUsuarioNoControlTipoUsuario();
        }
        #endregion

        #region Funciones
        public void RecuperaUsuario()
        {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec RecuperaUsuario @sIdUser");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sIdUser", sIdUser);
            DataTable dtUsuario = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtUsuario.Rows.Count != 0)
            {
                sIdUser = dtUsuario.Rows[0]["IdUser"].ToString();
                sControlNumber = dtUsuario.Rows[0]["ControlNumber"].ToString();
                sName = dtUsuario.Rows[0]["Name"].ToString();
                sFatherLastName = dtUsuario.Rows[0]["FatherLastName"].ToString();
                sMotherLastName = dtUsuario.Rows[0]["MotherLastName"].ToString();
                sEmail = dtUsuario.Rows[0]["Email"].ToString();
                sIdDomain = dtUsuario.Rows[0]["IdDomain"].ToString();
                sPassword = FNDeCryp(dtUsuario.Rows[0]["Password"].ToString());
                sPhone = dtUsuario.Rows[0]["Phone"].ToString();
                sCellphone = dtUsuario.Rows[0]["Cellphone"].ToString();
                sSemester = dtUsuario.Rows[0]["Semester"].ToString();
                IdTipoUsuario = dtUsuario.Rows[0]["IdTypeUser"].ToString();
                IdTipoEstado = dtUsuario.Rows[0]["IdTypeState"].ToString();
                sIdCareer = dtUsuario.Rows[0]["IdCareer"].ToString();
                sPathProfilePicture = dtUsuario.Rows[0]["PathProfilePicture"].ToString();

                sStreet = dtUsuario.Rows[0]["Street"].ToString();
                sOutdoorNumber = dtUsuario.Rows[0]["OutdoorNumber"].ToString();
                sInteriorNumber = dtUsuario.Rows[0]["InteriorNumber"].ToString();
                sCologne = dtUsuario.Rows[0]["Cologne"].ToString();
                sState = dtUsuario.Rows[0]["State"].ToString();
                sMunicipality = dtUsuario.Rows[0]["Municipality"].ToString();
                sCity = dtUsuario.Rows[0]["City"].ToString();
                sPostalCode = dtUsuario.Rows[0]["PostalCode"].ToString();

                sIdSocialSecurity = dtUsuario.Rows[0]["IdSocialSecurity"].ToString();
                sOtherSocialSecurity = dtUsuario.Rows[0]["OtherSocialSecurity"].ToString();
                sNSS = dtUsuario.Rows[0]["NSS"].ToString();
            }
        }

        public void RecuperaUsuarioNoControl()
        {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec RecuperaUsuarioNoControl @sNoControl");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sNoControl", sControlNumber);
            DataTable dtUsuario = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtUsuario.Rows.Count != 0)
            {
                sIdUser = dtUsuario.Rows[0]["IdUser"].ToString();
                sControlNumber = dtUsuario.Rows[0]["ControlNumber"].ToString();
                sName = dtUsuario.Rows[0]["Name"].ToString();
                sFatherLastName = dtUsuario.Rows[0]["FatherLastName"].ToString();
                sMotherLastName = dtUsuario.Rows[0]["MotherLastName"].ToString();
                sEmail = dtUsuario.Rows[0]["Email"].ToString();
                sIdDomain = dtUsuario.Rows[0]["IdDomain"].ToString();
                sPassword = FNDeCryp(dtUsuario.Rows[0]["Password"].ToString());
                sPhone = dtUsuario.Rows[0]["Phone"].ToString();
                sCellphone = dtUsuario.Rows[0]["Cellphone"].ToString();
                sSemester = dtUsuario.Rows[0]["Semester"].ToString();
                IdTipoUsuario = dtUsuario.Rows[0]["IdTypeUser"].ToString();
                IdTipoEstado = dtUsuario.Rows[0]["IdTypeState"].ToString();
                sIdCareer = dtUsuario.Rows[0]["IdCareer"].ToString();
                sPathProfilePicture = dtUsuario.Rows[0]["PathProfilePicture"].ToString();

                sStreet = dtUsuario.Rows[0]["Street"].ToString();
                sOutdoorNumber = dtUsuario.Rows[0]["OutdoorNumber"].ToString();
                sInteriorNumber = dtUsuario.Rows[0]["InteriorNumber"].ToString();
                sCologne = dtUsuario.Rows[0]["Cologne"].ToString();
                sState = dtUsuario.Rows[0]["State"].ToString();
                sMunicipality = dtUsuario.Rows[0]["Municipality"].ToString();
                sCity = dtUsuario.Rows[0]["City"].ToString();
                sPostalCode = dtUsuario.Rows[0]["PostalCode"].ToString();

                sIdSocialSecurity = dtUsuario.Rows[0]["IdSocialSecurity"].ToString();
                sOtherSocialSecurity = dtUsuario.Rows[0]["OtherSocialSecurity"].ToString();
                sNSS = dtUsuario.Rows[0]["NSS"].ToString();
            }
        }

        public void RecuperaUsuarioNoControlTipoUsuario()
        {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec RecuperaUsuarioNoControlTipoUsuario @sNoControl, @sIdTypeUser");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sNoControl", sControlNumber);
            scParametros.Parameters.AddWithValue("@sIdTypeUser", sIdTypeUser);
            DataTable dtUsuario = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtUsuario.Rows.Count != 0)
            {
                sIdUser = dtUsuario.Rows[0]["IdUser"].ToString();
                sControlNumber = dtUsuario.Rows[0]["ControlNumber"].ToString();
                sName = dtUsuario.Rows[0]["Name"].ToString();
                sFatherLastName = dtUsuario.Rows[0]["FatherLastName"].ToString();
                sMotherLastName = dtUsuario.Rows[0]["MotherLastName"].ToString();
                sEmail = dtUsuario.Rows[0]["Email"].ToString();
                sIdDomain = dtUsuario.Rows[0]["IdDomain"].ToString();
                sPassword = FNDeCryp(dtUsuario.Rows[0]["Password"].ToString());
                sPhone = dtUsuario.Rows[0]["Phone"].ToString();
                sCellphone = dtUsuario.Rows[0]["Cellphone"].ToString();
                sSemester = dtUsuario.Rows[0]["Semester"].ToString();
                IdTipoUsuario = dtUsuario.Rows[0]["IdTypeUser"].ToString();
                IdTipoEstado = dtUsuario.Rows[0]["IdTypeState"].ToString();
                sIdCareer = dtUsuario.Rows[0]["IdCareer"].ToString();
                sPathProfilePicture = dtUsuario.Rows[0]["PathProfilePicture"].ToString();

                sStreet = dtUsuario.Rows[0]["Street"].ToString();
                sOutdoorNumber = dtUsuario.Rows[0]["OutdoorNumber"].ToString();
                sInteriorNumber = dtUsuario.Rows[0]["InteriorNumber"].ToString();
                sCologne = dtUsuario.Rows[0]["Cologne"].ToString();
                sState = dtUsuario.Rows[0]["State"].ToString();
                sMunicipality = dtUsuario.Rows[0]["Municipality"].ToString();
                sCity = dtUsuario.Rows[0]["City"].ToString();
                sPostalCode = dtUsuario.Rows[0]["PostalCode"].ToString();

                sIdSocialSecurity = dtUsuario.Rows[0]["IdSocialSecurity"].ToString();
                sOtherSocialSecurity = dtUsuario.Rows[0]["OtherSocialSecurity"].ToString();
                sNSS = dtUsuario.Rows[0]["NSS"].ToString();
            }
        }

        public void RecuperaUsuarioCorreo()
        {
            sConsulta = new StringBuilder();
            sConsulta.AppendLine("select IdUser, ControlNumber, Name, FatherLastName, MotherLastName, Email, Password, Phone, IdTypeUser,");
            sConsulta.AppendLine("	IdTypeState, IdCareer");
            sConsulta.AppendLine("from Users");
            sConsulta.AppendLine("Where Email='" + sEmail + "'");
            DataTable dtUsuario = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtUsuario.Rows.Count != 0)
            {
                sIdUser = dtUsuario.Rows[0]["IdUser"].ToString();
                sControlNumber = dtUsuario.Rows[0]["ControlNumber"].ToString();
                sName = dtUsuario.Rows[0]["Name"].ToString();
                sFatherLastName = dtUsuario.Rows[0]["FatherLastName"].ToString();
                sMotherLastName = dtUsuario.Rows[0]["MotherLastName"].ToString();
                sEmail = dtUsuario.Rows[0]["Email"].ToString();
                sPassword = dtUsuario.Rows[0]["Password"].ToString();
                sPhone = dtUsuario.Rows[0]["Phone"].ToString();
                IdTipoUsuario = dtUsuario.Rows[0]["IdTypeUser"].ToString();
                IdTipoEstado = dtUsuario.Rows[0]["IdTypeState"].ToString();
                sIdCareer = dtUsuario.Rows[0]["IdCareer"].ToString();
            }
        }

        public void InsertaActualizaUsuario()
        {
            oConexion = new Conexion();

            try
            {
                sConsulta = new StringBuilder();

                sConsulta.AppendLine("exec InsertaActualizaUsuario @sIdUser, @sControlNumber, @sName, @sFatherLastName, @sMotherLastName, @sEmail, @sIdDominio," +
                    "@sPassword, @sPhone, @sCellphone, @sSemestrer, @sIdTypeUser, @sIdTypeState, @sIdCareer, @sIdSocialSecurity, @sOtherSocialSecurity, @sNSS, @sStreet, @sOutdoorNumber, @sInteriorNumber, @sCologne, @sState, " +
                    "@sMunicipality, @sCity, @sPostalCode, @IdUserModification");


                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdUser", sIdUser);
                scParametros.Parameters.AddWithValue("@sControlNumber", (sControlNumber != "" ? sControlNumber : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sName", sName);
                scParametros.Parameters.AddWithValue("@sFatherLastName", sFatherLastName);
                scParametros.Parameters.AddWithValue("@sMotherLastName", sMotherLastName);
                scParametros.Parameters.AddWithValue("@sEmail", sEmail);
                scParametros.Parameters.AddWithValue("@sIdDominio", sIdDomain);
                scParametros.Parameters.AddWithValue("@sPassword", FNCryp(sPassword));
                scParametros.Parameters.AddWithValue("@sPhone", (sPhone != "" ? sPhone : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCellphone", (sCellphone != "" ? sCellphone : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sSemestrer", (sSemester != "" ? sSemester : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeUser", (sIdTypeUser != "" ? sIdTypeUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeState", (sIdTypeState != "" ? sIdTypeState : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdCareer", (sIdCareer != "" ? sIdCareer : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSocialSecurity", (sIdSocialSecurity != "" ? sIdSocialSecurity : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOtherSocialSecurity", (sOtherSocialSecurity != "" ? sOtherSocialSecurity : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sNSS", (sNSS != "" ? sNSS : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sStreet", (sStreet != "" ? sStreet : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOutdoorNumber", (sOutdoorNumber != "" ? sOutdoorNumber : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sInteriorNumber", (sInteriorNumber != "" ? sInteriorNumber : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCologne", (sCologne != "" ? sCologne : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sState", (sState != "" ? sState : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sMunicipality", (sMunicipality != "" ? sMunicipality : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCity", (sCity != "" ? sCity : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sPostalCode", (sPostalCode != "" ? sPostalCode : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@IdUserModification", Generales.glsUsuarioSession.IdUsuario);

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public void InsertaUsuarioSolicitarAcceso()
        {
            oConexion = new Conexion();

            try
            {
                sConsulta = new StringBuilder();
                
                sConsulta.AppendLine("exec InsertaUsuarioSolicitarAcceso @sIdUser, @sControlNumber, @sName, @sFatherLastName, @sMotherLastName, @sEmail, @sIdDominio, " +
                    "@Password, @Phone, @sCellphone, @sSemestrer, @sIdTypeUser, @sIdTypeState, @sIdCareer, @sIdSocialSecurity, @sOtherSocialSecurity, @sNSS, @sStreet, @sOutdoorNumber, @sInteriorNumber, @sCologne, @sState, " +
                    "@sMunicipality, @sCity, @sPostalCode");


                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdUser", sIdUser);
                scParametros.Parameters.AddWithValue("@sControlNumber", (sControlNumber != "" ? sControlNumber : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sName", sName);
                scParametros.Parameters.AddWithValue("@sFatherLastName", sFatherLastName);
                scParametros.Parameters.AddWithValue("@sMotherLastName", sMotherLastName);
                scParametros.Parameters.AddWithValue("@sEmail", sEmail);
                scParametros.Parameters.AddWithValue("@sIdDominio", sIdDomain);
                scParametros.Parameters.AddWithValue("@Password", FNCryp(sPassword));
                scParametros.Parameters.AddWithValue("@Phone", (sPhone != "" ? sPhone : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sCellphone", (sCellphone != "" ? sCellphone : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sSemestrer", (sSemester != "" ? sSemester : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeUser", (sIdTypeUser != "" ? sIdTypeUser : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdTypeState", (sIdTypeState != "" ? sIdTypeState : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdCareer", (sIdCareer != "" ? sIdCareer : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sIdSocialSecurity", (sIdSocialSecurity != "" ? sIdSocialSecurity : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sOtherSocialSecurity", sOtherSocialSecurity);
                scParametros.Parameters.AddWithValue("@sNSS", (sNSS != "" ? sNSS : (object)DBNull.Value));
                scParametros.Parameters.AddWithValue("@sStreet", sStreet);
                scParametros.Parameters.AddWithValue("@sOutdoorNumber", sOutdoorNumber);
                scParametros.Parameters.AddWithValue("@sInteriorNumber", sInteriorNumber);
                scParametros.Parameters.AddWithValue("@sCologne", sCologne);
                scParametros.Parameters.AddWithValue("@sState", sState);
                scParametros.Parameters.AddWithValue("@sMunicipality", sMunicipality);
                scParametros.Parameters.AddWithValue("@sCity", sCity);
                scParametros.Parameters.AddWithValue("@sPostalCode", (sPostalCode != "" ?  sPostalCode : (object)DBNull.Value));

                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(),scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }
        
        public static DataTable ObtieneUsuarios(String _sNoControl, String _sNombreCompleto, String _sIdTypeUser, String _sIdCareer, String _sIdTypeState)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneUsuariosAdministrador @sNoControl, @sNombreCompleto, @sIdTypeUser, @sIdCareer, @sIdTypeState");


            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sNoControl", _sNoControl);
            scParametros.Parameters.AddWithValue("@sNombreCompleto", _sNombreCompleto);
            scParametros.Parameters.AddWithValue("@sIdTypeUser", _sIdTypeUser);
            scParametros.Parameters.AddWithValue("@sIdCareer", _sIdCareer);
            scParametros.Parameters.AddWithValue("@sIdTypeState", _sIdTypeState);


            DataTable dtUsuarios = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtUsuarios;
        }

        public static void EliminarUsuario(String _sIdUser)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();

                sConsulta.AppendLine("exec EliminarUsuario @sIdUser");

                SqlCommand scParametros = new SqlCommand();

                scParametros.Parameters.AddWithValue("@sIdUser", _sIdUser);
                oConexion.EjecutaConsultaConParametros(sConsulta.ToString(), scParametros);
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static void ActualizaPathFotoPerfil(String _sNoControl, String _sPath)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();

                sConsulta.AppendLine("update Users");
                sConsulta.AppendLine("set PathProfilePicture='" + _sPath + "'");
                sConsulta.AppendLine("where ControlNumber='" + _sNoControl + "'");

                oConexion.EjecutaConsulta(sConsulta.ToString());
                oConexion.TerminaTransaccionSQL();
            }
            catch (Exception ex)
            {
                oConexion.DeshaceTransaccionSQL();
                throw new Exception(ex.Message);
            }
        }

        public static string FNCryp(string _sPassword)
        {
            string result = string.Empty;
            byte[] encryted =
            System.Text.Encoding.Unicode.GetBytes(_sPassword);
            result = Convert.ToBase64String(encryted);

            return result;
        }

        public static string FNDeCryp(string _sPassword)
        {
            string result = string.Empty;
            byte[] decryted =
            Convert.FromBase64String(_sPassword);
            System.Text.Encoding.Unicode.GetString(decryted, 0, decryted.ToArray().Length);
            result = System.Text.Encoding.Unicode.GetString(decryted);

            return result;
        }

        public static int ValidaUsuarioEnBaseDatos(String _sNoControl, String _sPassword)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneUsuarioNoControl @sNoControl");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sNoControl", _sNoControl);

            DataTable dtUsuario = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtUsuario.Rows.Count == 0)
            { //No encontró un usuario que coincidan                
                return Enums.TipoAcceso.Incorrecto;
            }
            else if (dtUsuario.Rows.Count > 1)
            {
                return ValidaCuentasSecundarias(_sNoControl, _sPassword);
            }
            else
            {
                if (dtUsuario.Rows[0]["ControlNumber"].ToString() == _sNoControl && dtUsuario.Rows[0]["Password"].ToString() == "")
                { //Existe Usuario pero todavia no configura contraseña
                    return Enums.TipoAcceso.SolicitarContrasena;
                }
                else if (dtUsuario.Rows[0]["ControlNumber"].ToString() == _sNoControl && dtUsuario.Rows[0]["Password"].ToString() == FNCryp(_sPassword))
                { //Usuario y contraseña validos
                    if(dtUsuario.Rows[0]["IdTypeState"].ToString() == Enums.EstatusUsuario.Inactivo.ToString())
                    {//Usuario inactivo
                        return Enums.TipoAcceso.UsuarioInactivo;
                    }
                    else if (dtUsuario.Rows[0]["IdTypeState"].ToString() == Enums.EstatusUsuario.SolictudDeAcceso.ToString())
                    {//Usuario en proceso de su solicitud de acceso
                        return Enums.TipoAcceso.SolicitudDeAcceso;
                    }
                    else
                    {//Usuario valido
                        return Enums.TipoAcceso.Correcto;
                    }
                }
                else if (dtUsuario.Rows[0]["ControlNumber"].ToString() == _sNoControl && dtUsuario.Rows[0]["Password"].ToString() != FNCryp(_sPassword))
                { //Contraseña incorrecta                    
                    return Enums.TipoAcceso.Incorrecto;
                }
                else
                {
                    return Enums.TipoAcceso.Incorrecto;
                }
            }
        }

        public static int ValidaCuentasSecundarias(String _sNoControl, String _sPassword)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneCuentasSecundariasActivas @sNoControl");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sNoControl", _sNoControl);

            DataTable dtUsuario = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtUsuario.Rows.Count == 0)
            { //No encontró un usuario que coincidan                
                return Enums.TipoAcceso.Incorrecto;
            }
            else if (dtUsuario.Rows.Count > 1)
            {
                if (dtUsuario.Rows[0]["ControlNumber"].ToString() == _sNoControl && dtUsuario.Rows[0]["Password"].ToString() == "")
                { //Existe Usuario pero todavia no configura contraseña
                    return Enums.TipoAcceso.SolicitarContrasena;
                }
                else if (dtUsuario.Rows[0]["ControlNumber"].ToString() == _sNoControl && dtUsuario.Rows[0]["Password"].ToString() == FNCryp(_sPassword))
                { //Usuario valido
                    return Enums.TipoAcceso.CuentasSecundarias;
                }
                else if (dtUsuario.Rows[0]["ControlNumber"].ToString() == _sNoControl && dtUsuario.Rows[0]["Password"].ToString() != FNCryp(_sPassword))
                { //Contraseña incorrecta                    
                    return Enums.TipoAcceso.Incorrecto;
                }
                else
                {
                    return Enums.TipoAcceso.Incorrecto;
                }
            }
            else
            {
                if (dtUsuario.Rows[0]["ControlNumber"].ToString() == _sNoControl && dtUsuario.Rows[0]["Password"].ToString() == "")
                { //Existe Usuario pero todavia no configura contraseña
                    return Enums.TipoAcceso.SolicitarContrasena;
                }
                else if (dtUsuario.Rows[0]["ControlNumber"].ToString() == _sNoControl && dtUsuario.Rows[0]["Password"].ToString() == FNCryp(_sPassword))
                { //Usuario valido
                    return Enums.TipoAcceso.Correcto;
                }
                else if (dtUsuario.Rows[0]["ControlNumber"].ToString() == _sNoControl && dtUsuario.Rows[0]["Password"].ToString() != FNCryp(_sPassword))
                { //Contraseña incorrecta                    
                    return Enums.TipoAcceso.Incorrecto;
                }
                else
                {
                    return Enums.TipoAcceso.Incorrecto;
                }
            }
        }

        public static DataTable ObtieneCuentasSecundarias(String _sNoControl)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("exec ObtieneCuentasSecundariasActivas @sNoControl");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sNoControl", _sNoControl);

            DataTable dtUsuario = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            return dtUsuario;
        }

        public static DataTable ObtieneUsuariosParaNotificar(String _sIdCareer, String _sNotificacion)
        {
            StringBuilder sConsulta = new StringBuilder();
            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from Users");
            sConsulta.AppendLine("where IdTypeState='1' and IdCareer='" + _sIdCareer + "'");

            if(_sNotificacion == "EnvioSolicitud" || _sNotificacion == "EnvioAnteproyecto")
            {
                sConsulta.AppendLine("	and (IdTypeUser='" + Enums.TipoUsuario.Administrador.ToString() + "' or IdTypeUser='" + Enums.TipoUsuario.JefeCarrera.ToString() +
                "' or IdTypeUser='" + Enums.TipoUsuario.EncargadoDeResidencias.ToString() + "')");
            }
            else if (_sNotificacion == "SolicitudAcceso")
            {
                sConsulta.AppendLine("	and (IdTypeUser='" + Enums.TipoUsuario.Administrador.ToString() + "' or IdTypeUser='" + Enums.TipoUsuario.JefeCarrera.ToString() + "')");
            }

            DataTable dtUsuario = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            return dtUsuario;
        }

        public static Boolean ValidaExisteNumeroControl(String _sControlNumber)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("exec ExisteNumeroControl @sNoControl");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sNoControl", _sControlNumber);

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static Boolean ValidaExisteNumeroEmpleadoConTipoUsuario(String _sControlNumber, String _sIdTipoUsuario)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("exec ExisteNumeroEmpleadoConTipoUsuario @sControlNumber, @IdTipoUsuario");

            SqlCommand scParametros = new SqlCommand();

            scParametros.Parameters.AddWithValue("@sControlNumber", _sControlNumber);
            scParametros.Parameters.AddWithValue("@IdTipoUsuario", _sIdTipoUsuario);

            DataTable dtDatos = Conexion.EjecutarConsultaDatatableConParametros(sConsulta.ToString(), scParametros);

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static Boolean ValidaExisteEmail(String _sEmail)
        {
            StringBuilder sConsulta = new StringBuilder();

            sConsulta.AppendLine("select *");
            sConsulta.AppendLine("from Users");
            sConsulta.AppendLine("where Email = '" + _sEmail + "'");

            DataTable dtDatos = Conexion.EjecutarConsultaDatatable(sConsulta.ToString());

            if (dtDatos.Rows.Count > 0)
            {
                return true;
            }
            return false;
        }

        public static void AceptarSolicitudDeAcceso(String _sIdUser)
        {
            Conexion oConexion = new Conexion();

            try
            {
                StringBuilder sConsulta = new StringBuilder();

                sConsulta.AppendLine("update Users");
                sConsulta.AppendLine("set IdTypeState='1'");
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
}