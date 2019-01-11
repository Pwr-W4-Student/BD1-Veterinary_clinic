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
    public partial class WindowAddEmployee : Form
    {
        Database database;
        public WindowAddEmployee(Database data)
        {
            database = data;
            InitializeComponent();
        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable data = database.Request("select osoba_primary_key.nextval from dual");

                int id = Int32.Parse(data.Rows[0].Field<string>(0));

                String request;
                if (textBoxNrMieszkania.Text == "")
                {
                    request = "insert into OSOBA (ID_OSOBA, IMIE, NAZWISKO, MIEJSCOWOSC, ULICA, NR_DOMU) values(" + id + ", '" + textBoxImie.Text + "',' " + textBoxNazwisko.Text + "',' " + textBoxMiejscowosc.Text + "', '" + textBoxUlica.Text + "', " + Int32.Parse(textBoxNrDomu.Text) + ")";
                }
                else
                {
                    request = "insert into OSOBA (ID_OSOBA, IMIE, NAZWISKO, MIEJSCOWOSC, ULICA, NR_DOMU, NR_MIESZKANIA) values(" + id + ", '" + textBoxImie.Text + "', '" + textBoxNazwisko.Text + "', '" + textBoxMiejscowosc.Text + "', '" + textBoxUlica.Text + "', " + Int32.Parse(textBoxNrDomu.Text) + ", " + Int32.Parse(textBoxNrMieszkania.Text) + ")";
                }

                database.Request(request);

                request = "insert into PERSONEL (ID_OSOBA, ID_PRACOWNIK, STANOWISKO, WYNAGRODZENIE) VALUES(" + id + ", personel_primary_key.nextval, '" + textBoxStanowisko.Text + "', " + Int32.Parse(textBoxWynagrodzenie.Text) + ")";

                database.Request(request);
            }
            catch(FormatException exp)
            {
                MessageBox.Show(exp.Message, "Error");
            }

            //Dispose();
        }
    }
}
