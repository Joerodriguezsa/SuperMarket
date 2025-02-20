using System.Net;
using System.Text.Json;

namespace SuperMarketApp.TransactionalModels
{
    public class RespuestaApiDto<T> : RespuestaApiBase
    {
        public string Mensaje { get; set; }
        public HttpStatusCode Codigo { get; set; }
        public T Result { get; set; }

        public RespuestaApiDto(string mensaje, HttpStatusCode codigo, T result)
        {
            Mensaje = mensaje;
            Codigo = codigo;
            Result = result;
        }

        public string ToJson()
        {
            return JsonSerializer.Serialize(this, SerializerOptions);
        }

        public static RespuestaApiDto<T> Success(T result)
        {
            return new RespuestaApiDto<T>("Operación exitosa", HttpStatusCode.OK, result);
        }

        public static RespuestaApiDto<T> Error(string mensaje, HttpStatusCode codigo)
        {
            T result = Activator.CreateInstance<T>();
            return new RespuestaApiDto<T>(mensaje, codigo, result);
        }
    }
}
