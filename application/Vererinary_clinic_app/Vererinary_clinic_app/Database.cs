using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Oracle.DataAccess.Client;
using System.Windows.Forms;
using System.Data;

namespace Vererinary_clinic_app
{
    public class Database
    {
        string connectionName = "Veterinary Clinic";
        string username = "projektbazy";
        string password = "bazdan";
        string hostname = "localhost";
        string port = "1521";
        string sid = "xe";

        public string GetConnectionName()
        {
            return connectionName;
        }

        public string GetUsername()
        {
            return username;
        }

        public string GetPassword()
        {
            return password;
        }

        public string GetHostname()
        {
            return hostname;
        }

        public string GetPort()
        {
            return port;
        }

        public string GetSid()
        {
            return sid;
        }

        OracleConnection con;

        public void SetConnectionPreferences(string conName, string user, string pass, string host, string p, string s)
        {
            connectionName = conName;
            username = user;
            password = pass;
            hostname = host;
            port = p;
            sid = s;
        }

        

        public bool Connect()
        {
            try
            {
                con = new OracleConnection();
                //con.ConnectionString = "Data Source=(DESCRIPTION=" + "(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=185.28.103.19)(PORT=1521)))" + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=xe)));" + "User Id=projektbazy;Password=bazdan;";

                con.ConnectionString = "Data Source=(DESCRIPTION=" + "(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=" + hostname + ")(PORT=" + port + ")))" + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=" + sid + ")));" + "User Id=" + username + ";Password=" + password + ";";

                con.Open();
                Console.WriteLine("connected to database" + con.ServerVersion);
                return true;
            }
            catch(OracleException exp)
            {
                //Console.WriteLine("Can not connect to database" + exp.Message);
                MessageBox.Show( exp.Message, "Cannot connect to database");
            }

            return false;

        }

        public bool Disconnect()
        {
            //TODO: zrobic wyjatek
            con.Close();
            con.Dispose();

            return true;
        }

        public bool GetConnectionStatus()
        {
            if(con.State == ConnectionState.Open)
                return true;
            return false;
        }


        public List<string> RequestStaff()
        {
            List<string> staff = new List<string>();
            try
            {
                OracleCommand command = new OracleCommand();
                command.Connection = con;
                command.CommandText = "SELECT osoba.imie, osoba.nazwisko FROM osoba JOIN personel on osoba.id_osoba = personel.id_osoba ";
                command.CommandType = CommandType.Text;

                OracleDataReader dr = command.ExecuteReader();
                while (dr.Read())
                {
                    staff.Add(dr.GetString(0) + " " + dr.GetString(1));              

                }
            }
            catch(OracleException exp)
            {
                //TODO: dodac wpis do logow??
                MessageBox.Show(exp.Message, "Blad zapytania");
            }

            return staff;
        }

        public DataTable Request(string request)
        {
            DataTable data = new DataTable();
            try
            {
                DataRow dataRow;
                OracleCommand command = new OracleCommand();
                command.Connection = con;
                command.CommandText = request;
                command.CommandType = CommandType.Text;

                OracleDataReader dr = command.ExecuteReader();

                for(int i = 0; i < dr.FieldCount; i++)
                {
                    if (!data.Columns.Contains(dr.GetName(i)))
                    {
                        data.Columns.Add(dr.GetName(i));
                    }
                }

                while (dr.Read())
                {
                    dataRow = data.NewRow();
                    for (int i = 0; i < dr.FieldCount; i++)
                    {
                        dataRow[dr.GetName(i)] = dr.GetValue(i).ToString();
                    }
                    data.Rows.Add(dataRow);
                }
            }
            catch (OracleException exp)
            {
                //TODO: dodac wpis do logow??
                MessageBox.Show(exp.Message, "Blad zapytania");
            }

            return data;
        }

    }
}
