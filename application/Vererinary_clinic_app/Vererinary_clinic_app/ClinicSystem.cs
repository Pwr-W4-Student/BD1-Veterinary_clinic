using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Vererinary_clinic_app
{
    public class ClinicSystem
    {
        private string loggedAs = "NONE";

        Form_main form_main;

        public ClinicSystem(Form_main form)
        {
            form_main = form;
        }

        public void SetLoggedAs(string  name)
        {
            this.loggedAs = name;

            form_main.UpdateLoggedAsLabel(loggedAs);
        }
    }
}
