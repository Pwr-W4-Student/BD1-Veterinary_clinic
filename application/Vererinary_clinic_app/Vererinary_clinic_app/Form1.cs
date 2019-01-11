using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Vererinary_clinic_app
{
    public partial class Form_main : Form
    {
        ClinicSystem system;
        Database database;
        public Form_main()
        {
            InitializeComponent();

            database = new Database();
            system = new ClinicSystem(this);            
        }

        private void Form1_Load(object sender, EventArgs e)
        {


            database.Connect();
            UpdateConnectionLabel(database.GetConnectionStatus());

            if(database.GetConnectionStatus())
            {
                WindowLogin login = new WindowLogin(database, system);
                login.ShowDialog();
            }

            dataGridView1.DataSource = database.Request("SELECT * FROM  osoba");

        }


        private void ustawieniaPolaczeniaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            WindowsConSettings conSettings = new WindowsConSettings(database);
            conSettings.ShowDialog();
        }

        private void polaczToolStripMenuItem_Click(object sender, EventArgs e)
        {
            database.Connect();
            UpdateConnectionLabel(database.GetConnectionStatus());
            /*
            if (database.Connect())
            {
                toolStripLabelConStatus.Text = "Polaczono z baza danych " + database.GetConnectionName() + " jako " + database.GetUsername();
            }
            */
        }

        private void rozlaczToolStripMenuItem_Click(object sender, EventArgs e)
        {
            database.Disconnect();
            UpdateConnectionLabel(database.GetConnectionStatus());
            /*
            if (database.Disconnect())
            {
                toolStripLabelConStatus.Text = "Nie polaczona z baza danych";
            }
            */
        }

        private void zalogujToolStripMenuItem_Click(object sender, EventArgs e)
        {
            WindowLogin login = new WindowLogin(database, system);
            login.ShowDialog();
        }

        public void UpdateLoggedAsLabel(string name)
        {
            toolStripStatusLabelLoggedAs.Text = "Zalogowany jako " + name;
        }

        public void UpdateConnectionLabel(bool status)
        {
            if(status)
            {
                toolStripLabelConStatus.Text = "Polaczono z baza danych " + database.GetConnectionName() + " jako " + database.GetUsername();
            }
            else
            {
                toolStripLabelConStatus.Text = "Nie polaczona z baza danych";
            }
        }

        private void pokazLogiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            WindowLogs WLogs = new WindowLogs(database.Request("SELECT * FROM database_log"));
            WLogs.ShowDialog();
        }

        private void ToolStripMenuItemPersonelAdd_Click(object sender, EventArgs e)
        {
            WindowAddEmployee win = new WindowAddEmployee(database);
            win.ShowDialog();
        }
    }
}
