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
    public partial class WindowLogs : Form
    {
        public WindowLogs(DataTable data)
        {
            InitializeComponent();
            loadData(data);
        }


        public void loadData(DataTable data)
        {
            this.dataGridViewLogs.DataSource = data;
            this.dataGridViewLogs.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
        }
    }
}
