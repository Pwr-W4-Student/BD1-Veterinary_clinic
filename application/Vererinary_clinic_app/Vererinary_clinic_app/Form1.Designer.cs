namespace Vererinary_clinic_app
{
    partial class Form_main
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form_main));
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.toolStripDropDownFile = new System.Windows.Forms.ToolStripDropDownButton();
            this.toolStripMenuItemDatabase = new System.Windows.Forms.ToolStripMenuItem();
            this.polaczToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.rozlaczToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.zalogujToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripDropDownEdit = new System.Windows.Forms.ToolStripDropDownButton();
            this.toolStripDropDownSettings = new System.Windows.Forms.ToolStripDropDownButton();
            this.polaczeniaZBazaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabelLoggedAs = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripLabelConStatus = new System.Windows.Forms.ToolStripStatusLabel();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.pokazLogiToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.dodajToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ToolStripMenuItemPersonelAdd = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStrip1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // toolStrip1
            // 
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripDropDownFile,
            this.toolStripDropDownEdit,
            this.toolStripDropDownSettings});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(635, 25);
            this.toolStrip1.TabIndex = 1;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // toolStripDropDownFile
            // 
            this.toolStripDropDownFile.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.toolStripDropDownFile.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItemDatabase,
            this.zalogujToolStripMenuItem});
            this.toolStripDropDownFile.Image = ((System.Drawing.Image)(resources.GetObject("toolStripDropDownFile.Image")));
            this.toolStripDropDownFile.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripDropDownFile.Name = "toolStripDropDownFile";
            this.toolStripDropDownFile.Size = new System.Drawing.Size(39, 22);
            this.toolStripDropDownFile.Text = "Plik";
            // 
            // toolStripMenuItemDatabase
            // 
            this.toolStripMenuItemDatabase.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.polaczToolStripMenuItem,
            this.rozlaczToolStripMenuItem});
            this.toolStripMenuItemDatabase.Name = "toolStripMenuItemDatabase";
            this.toolStripMenuItemDatabase.Size = new System.Drawing.Size(140, 22);
            this.toolStripMenuItemDatabase.Text = "Baza danych";
            // 
            // polaczToolStripMenuItem
            // 
            this.polaczToolStripMenuItem.Name = "polaczToolStripMenuItem";
            this.polaczToolStripMenuItem.Size = new System.Drawing.Size(113, 22);
            this.polaczToolStripMenuItem.Text = "Polacz";
            this.polaczToolStripMenuItem.Click += new System.EventHandler(this.polaczToolStripMenuItem_Click);
            // 
            // rozlaczToolStripMenuItem
            // 
            this.rozlaczToolStripMenuItem.Name = "rozlaczToolStripMenuItem";
            this.rozlaczToolStripMenuItem.Size = new System.Drawing.Size(113, 22);
            this.rozlaczToolStripMenuItem.Text = "Rozlacz";
            this.rozlaczToolStripMenuItem.Click += new System.EventHandler(this.rozlaczToolStripMenuItem_Click);
            // 
            // zalogujToolStripMenuItem
            // 
            this.zalogujToolStripMenuItem.Name = "zalogujToolStripMenuItem";
            this.zalogujToolStripMenuItem.Size = new System.Drawing.Size(140, 22);
            this.zalogujToolStripMenuItem.Text = "Zaloguj";
            this.zalogujToolStripMenuItem.Click += new System.EventHandler(this.zalogujToolStripMenuItem_Click);
            // 
            // toolStripDropDownEdit
            // 
            this.toolStripDropDownEdit.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.toolStripDropDownEdit.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.dodajToolStripMenuItem});
            this.toolStripDropDownEdit.Image = ((System.Drawing.Image)(resources.GetObject("toolStripDropDownEdit.Image")));
            this.toolStripDropDownEdit.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripDropDownEdit.Name = "toolStripDropDownEdit";
            this.toolStripDropDownEdit.Size = new System.Drawing.Size(54, 22);
            this.toolStripDropDownEdit.Text = "Edycja";
            // 
            // toolStripDropDownSettings
            // 
            this.toolStripDropDownSettings.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text;
            this.toolStripDropDownSettings.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.polaczeniaZBazaToolStripMenuItem,
            this.toolStripSeparator1,
            this.pokazLogiToolStripMenuItem});
            this.toolStripDropDownSettings.Image = ((System.Drawing.Image)(resources.GetObject("toolStripDropDownSettings.Image")));
            this.toolStripDropDownSettings.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripDropDownSettings.Name = "toolStripDropDownSettings";
            this.toolStripDropDownSettings.Size = new System.Drawing.Size(77, 22);
            this.toolStripDropDownSettings.Text = "Ustawienia";
            // 
            // polaczeniaZBazaToolStripMenuItem
            // 
            this.polaczeniaZBazaToolStripMenuItem.Name = "polaczeniaZBazaToolStripMenuItem";
            this.polaczeniaZBazaToolStripMenuItem.Size = new System.Drawing.Size(165, 22);
            this.polaczeniaZBazaToolStripMenuItem.Text = "Polaczenie z baza";
            this.polaczeniaZBazaToolStripMenuItem.Click += new System.EventHandler(this.ustawieniaPolaczeniaToolStripMenuItem_Click);
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabelLoggedAs,
            this.toolStripLabelConStatus});
            this.statusStrip1.Location = new System.Drawing.Point(0, 441);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(635, 22);
            this.statusStrip1.TabIndex = 2;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripStatusLabelLoggedAs
            // 
            this.toolStripStatusLabelLoggedAs.Name = "toolStripStatusLabelLoggedAs";
            this.toolStripStatusLabelLoggedAs.Size = new System.Drawing.Size(91, 17);
            this.toolStripStatusLabelLoggedAs.Text = "Nie zalogowany";
            // 
            // toolStripLabelConStatus
            // 
            this.toolStripLabelConStatus.Name = "toolStripLabelConStatus";
            this.toolStripLabelConStatus.Size = new System.Drawing.Size(159, 17);
            this.toolStripLabelConStatus.Text = "Nie polaczona z baza danych";
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView1.Location = new System.Drawing.Point(0, 25);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.Size = new System.Drawing.Size(635, 416);
            this.dataGridView1.TabIndex = 4;
            // 
            // pokazLogiToolStripMenuItem
            // 
            this.pokazLogiToolStripMenuItem.Name = "pokazLogiToolStripMenuItem";
            this.pokazLogiToolStripMenuItem.Size = new System.Drawing.Size(165, 22);
            this.pokazLogiToolStripMenuItem.Text = "Pokaz logi";
            this.pokazLogiToolStripMenuItem.Click += new System.EventHandler(this.pokazLogiToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(162, 6);
            // 
            // dodajToolStripMenuItem
            // 
            this.dodajToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.ToolStripMenuItemPersonelAdd});
            this.dodajToolStripMenuItem.Name = "dodajToolStripMenuItem";
            this.dodajToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.dodajToolStripMenuItem.Text = "Dodaj";
            // 
            // ToolStripMenuItemPersonelAdd
            // 
            this.ToolStripMenuItemPersonelAdd.Name = "ToolStripMenuItemPersonelAdd";
            this.ToolStripMenuItemPersonelAdd.Size = new System.Drawing.Size(152, 22);
            this.ToolStripMenuItemPersonelAdd.Text = "Personel";
            this.ToolStripMenuItemPersonelAdd.Click += new System.EventHandler(this.ToolStripMenuItemPersonelAdd_Click);
            // 
            // Form_main
            // 
            this.AccessibleRole = System.Windows.Forms.AccessibleRole.None;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnablePreventFocusChange;
            this.ClientSize = new System.Drawing.Size(635, 463);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.toolStrip1);
            this.Name = "Form_main";
            this.Text = "Veterinary clinic";
            this.Shown += new System.EventHandler(this.Form1_Load);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripDropDownButton toolStripDropDownEdit;
        private System.Windows.Forms.StatusStrip statusStrip1;
        public System.Windows.Forms.ToolStripStatusLabel toolStripLabelConStatus;
        private System.Windows.Forms.ToolStripDropDownButton toolStripDropDownFile;
        private System.Windows.Forms.ToolStripDropDownButton toolStripDropDownSettings;
        private System.Windows.Forms.ToolStripMenuItem polaczeniaZBazaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItemDatabase;
        private System.Windows.Forms.ToolStripMenuItem polaczToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem rozlaczToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem zalogujToolStripMenuItem;
        public System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabelLoggedAs;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        public System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem pokazLogiToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem dodajToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ToolStripMenuItemPersonelAdd;
    }
}

