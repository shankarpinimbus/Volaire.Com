using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using CSBusiness.Web;
using System.Configuration;
using System.Web.Configuration;
using CSBusiness.DynamicVersion;
using CSCore.Utils;

namespace CSWeb
{
    public static class Routing
    {
        public static void RegisterRoutes()
        {
            VersionManager.InitializeRouting();
            AddDynamicVersions();
        }

        /// <summary>
        /// NOTE: Versions should be listed in the web.config file is possible. Avoid adding versions here unless necessary.
        /// Add all dynamic versions here to the DynamicVersions dictionary.
        /// To map a version to root just add:
        /// VersionManager.DynamicVersions.Add("[dynamic version]", string.Empty);
        /// To map a version to another physical version add:
        /// VersionManager.DynamicVersions.Add("[dynamic version]", "[physical version]");
        /// </summary>
        private static void AddDynamicVersions()
        {
            //VersionManager.DynamicVersions.Add("testVer", string.Empty);
        }
    }
}
