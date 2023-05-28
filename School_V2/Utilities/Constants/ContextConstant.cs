using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities.Constants
{
    static public class ContextConstant
    {
        static public string JsonFileName { get; } = "appsettings.json";
        static public string EfCoreJsonFileSqlServerConnectionStringPath { get; } = "ConnectionString:SqlServer";
        static public string DapperJsonFileSqlServerConnectionStringPath { get; } = "ConnectionString:Dapper";
        static public string? EfCoreConnectionString
        {
            get => new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile(JsonFileName, optional: false, reloadOnChange: true)
                .Build()[EfCoreJsonFileSqlServerConnectionStringPath];
        }
        static public string? DapperConnectionString
        {
            get => new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile(JsonFileName, optional: false, reloadOnChange: true)
                .Build()[EfCoreJsonFileSqlServerConnectionStringPath];
        }
    }
}
