using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Vererinary_clinic_app
{
    public partial class WindowLogin : Form
    {
        Database database;
        ClinicSystem system;

        public WindowLogin(Database database, ClinicSystem system)
        {
            this.database = database;
            this.system = system;
            InitializeComponent();
            LoadEmployees();
        }

        private void LoadEmployees()
        {

            comboBoxEmployees.DataSource = database.RequestStaff();
                
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            Dispose();
        }

        private void buttonLogin_Click(object sender, EventArgs e)
        {
            system.SetLoggedAs(comboBoxEmployees.SelectedValue.ToString());
            Dispose();
        }
    }
}
