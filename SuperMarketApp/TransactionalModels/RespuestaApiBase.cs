using System.Text.Json;

namespace SuperMarketApp.TransactionalModels
{
    public class RespuestaApiBase
    {
        protected RespuestaApiBase(){}

        protected static readonly JsonSerializerOptions SerializerOptions = new JsonSerializerOptions
        {
            WriteIndented = true
        };
    }
}