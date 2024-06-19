using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GestorResidencias.Clases
{
    public class Enums
    {
        public class TipoAcceso
        {
            public static int Correcto = 1;
            public static int Incorrecto = 2;
            public static int SolicitarContrasena = 3;
            public static int ConfiguracionIncompleta = 4;
            public static int UsuarioInactivo = 5;
            public static int SolicitudDeAcceso = 6;
            public static int CuentasSecundarias = 7;
        }

        public class EstatusAnteproyecto
        {
            public static int Borrador = 1;
            public static int Enviado = 2;
            public static int EnProceso = 3;
            public static int RevisionesCompletas = 4;
            public static int Calificado = 5;
            public static int Aprobado = 6;
            public static int AprobadoConComentarios = 7;
            public static int NoAprobado = 8;
        }

        public class Carreras
        {
            public static int SistemasComputacionales = 1;
            public static int Civil = 2;
            public static int Electromecanica = 3;
            public static int GestionEmpresarial = 4;
            public static int Industrial = 5;
            public static int Gastronomia = 6;
            public static int Electronica = 7;
        }

        public class EstatusSolicitudes
        {
            public static int Borrador = 1;
            public static int Enviado = 2;
            public static int Calificado = 3;
            public static int Aprobado = 4;
            public static int Cancelado = 5;
        }

        public class TipoUsuario
        {
            public static int Administrador = 1;
            public static int Alumno = 2;
            public static int JefeCarrera = 3;
            public static int Maestro = 4;
            public static int EncargadoDeResidencias = 5;
        }

        public class EstatusUsuario
        {
            public static int Inactivo = 0;
            public static int Activo = 1;
            public static int SolictudDeAcceso = 2;
        }

        public class SeguridadSocial
        {
            public static int Otro = 1;
            public static int IMSS = 2;
            public static int ISSSTE = 3;
        }

        public class TipoNotificacion
        {
            public static int Hipervinculo = 1;
            public static int Texto = 2;
        }

        public class EstatusAnteproyectoCalificacion
        {
            public static int PendientePorCalificar = 1;
            public static int Aprobado = 2;
            public static int AprobadoConComentarios = 3;
            public static int NoAprobado = 4;
        }

        public class EstatusMaestrosResidenciaDetalle
        {
            public static int Inactivo = 0;
            public static int Activo = 1;
        }
    }
}