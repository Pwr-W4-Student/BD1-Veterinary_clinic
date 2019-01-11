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
    public partial class WindowsConSettings : Form
    {
        Database database;
        public WindowsConSettings(Database database)
        {
            this.database = database;
            InitializeComponent();
            LoadDefaultNames();
        }

        private void LoadDefaultNames()
        {
            textBoxConName.Text = database.GetConnectionName();
            textBoxUsername.Text = database.GetUsername();
            textBoxPassword.Text = database.GetPassword();
            textBoxHostname.Text = database.GetHostname();
            textBoxPort.Text = database.GetPort();
            textBoxSid.Text = database.GetSid();
        }

        private void buttonApply_Click(object sender, EventArgs e)
        {
            database.SetConnectionPreferences(textBoxConName.Text, textBoxUsername.Text, textBoxPassword.Text, textBoxHostname.Text, textBoxPort.Text, textBoxSid.Text);
            this.Dispose(); 
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }
    }
}
