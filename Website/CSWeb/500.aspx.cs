﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSWeb.Desktop
{
    public partial class _500 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            if (ex != null && ex.InnerException != null)
            {
                CSCore.CSLogger.Instance.LogException(ex.InnerException.Message, ex.InnerException);
            }

        }

    }
}