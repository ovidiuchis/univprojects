namespace Lab5
{
    partial class Form1
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.Abortbutton = new System.Windows.Forms.Button();
            this.Commitbutton = new System.Windows.Forms.Button();
            this.Beginbutton = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.Vizbutton = new System.Windows.Forms.Button();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.Cursa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.nr_locuri = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.locuri_libere = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.Rezervabutton = new System.Windows.Forms.Button();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            this.label3 = new System.Windows.Forms.Label();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.Adaugabutton = new System.Windows.Forms.Button();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.Stergebutton = new System.Windows.Forms.Button();
            this.comboBox3 = new System.Windows.Forms.ComboBox();
            this.label7 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            this.groupBox4.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.button2);
            this.groupBox1.Controls.Add(this.button1);
            this.groupBox1.Controls.Add(this.Abortbutton);
            this.groupBox1.Controls.Add(this.Commitbutton);
            this.groupBox1.Controls.Add(this.Beginbutton);
            this.groupBox1.Font = new System.Drawing.Font("Palatino Linotype", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.groupBox1.Location = new System.Drawing.Point(6, 2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(641, 86);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Tranzactie";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(438, 35);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(191, 28);
            this.button1.TabIndex = 5;
            this.button1.Text = "Monitorizare tranzactii";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // Abortbutton
            // 
            this.Abortbutton.Location = new System.Drawing.Point(329, 35);
            this.Abortbutton.Name = "Abortbutton";
            this.Abortbutton.Size = new System.Drawing.Size(87, 28);
            this.Abortbutton.TabIndex = 4;
            this.Abortbutton.Text = "Abort";
            this.Abortbutton.UseVisualStyleBackColor = true;
            this.Abortbutton.Click += new System.EventHandler(this.Abortbutton_Click);
            // 
            // Commitbutton
            // 
            this.Commitbutton.Location = new System.Drawing.Point(119, 35);
            this.Commitbutton.Name = "Commitbutton";
            this.Commitbutton.Size = new System.Drawing.Size(86, 28);
            this.Commitbutton.TabIndex = 3;
            this.Commitbutton.Text = "Validare";
            this.Commitbutton.UseVisualStyleBackColor = true;
            this.Commitbutton.Click += new System.EventHandler(this.Commitbutton_Click);
            // 
            // Beginbutton
            // 
            this.Beginbutton.Location = new System.Drawing.Point(6, 35);
            this.Beginbutton.Name = "Beginbutton";
            this.Beginbutton.Size = new System.Drawing.Size(90, 28);
            this.Beginbutton.TabIndex = 2;
            this.Beginbutton.Text = "Begin";
            this.Beginbutton.UseVisualStyleBackColor = true;
            this.Beginbutton.Click += new System.EventHandler(this.Beginbutton_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.Vizbutton);
            this.groupBox2.Controls.Add(this.dataGridView1);
            this.groupBox2.Font = new System.Drawing.Font("Palatino Linotype", 9.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.groupBox2.Location = new System.Drawing.Point(6, 108);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(358, 310);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Vizualizare curse";
            // 
            // Vizbutton
            // 
            this.Vizbutton.Location = new System.Drawing.Point(105, 275);
            this.Vizbutton.Name = "Vizbutton";
            this.Vizbutton.Size = new System.Drawing.Size(113, 29);
            this.Vizbutton.TabIndex = 1;
            this.Vizbutton.Text = "Vizualizare";
            this.Vizbutton.UseVisualStyleBackColor = true;
            this.Vizbutton.Click += new System.EventHandler(this.Vizbutton_Click);
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.BackgroundColor = System.Drawing.Color.Lavender;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Cursa,
            this.nr_locuri,
            this.locuri_libere});
            this.dataGridView1.Location = new System.Drawing.Point(6, 24);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.Size = new System.Drawing.Size(346, 245);
            this.dataGridView1.TabIndex = 0;
            // 
            // Cursa
            // 
            this.Cursa.HeaderText = "Cursa";
            this.Cursa.Name = "Cursa";
            this.Cursa.ReadOnly = true;
            // 
            // nr_locuri
            // 
            this.nr_locuri.HeaderText = "Numar locuri";
            this.nr_locuri.Name = "nr_locuri";
            this.nr_locuri.ReadOnly = true;
            // 
            // locuri_libere
            // 
            this.locuri_libere.HeaderText = "Locuri libere";
            this.locuri_libere.Name = "locuri_libere";
            this.locuri_libere.ReadOnly = true;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.Rezervabutton);
            this.groupBox3.Controls.Add(this.numericUpDown1);
            this.groupBox3.Controls.Add(this.label3);
            this.groupBox3.Controls.Add(this.comboBox2);
            this.groupBox3.Controls.Add(this.label2);
            this.groupBox3.Font = new System.Drawing.Font("Palatino Linotype", 9.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.groupBox3.Location = new System.Drawing.Point(370, 108);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(277, 136);
            this.groupBox3.TabIndex = 2;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Rezervari";
            // 
            // Rezervabutton
            // 
            this.Rezervabutton.Location = new System.Drawing.Point(128, 99);
            this.Rezervabutton.Name = "Rezervabutton";
            this.Rezervabutton.Size = new System.Drawing.Size(120, 31);
            this.Rezervabutton.TabIndex = 4;
            this.Rezervabutton.Text = "Rezerva";
            this.Rezervabutton.UseVisualStyleBackColor = true;
            this.Rezervabutton.Click += new System.EventHandler(this.Rezervabutton_Click);
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Location = new System.Drawing.Point(128, 68);
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(120, 25);
            this.numericUpDown1.TabIndex = 3;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(10, 75);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(83, 18);
            this.label3.TabIndex = 2;
            this.label3.Text = "Numar locuri";
            // 
            // comboBox2
            // 
            this.comboBox2.FormattingEnabled = true;
            this.comboBox2.Location = new System.Drawing.Point(128, 30);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(121, 26);
            this.comboBox2.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(10, 33);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(42, 18);
            this.label2.TabIndex = 0;
            this.label2.Text = "Cursa";
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.Adaugabutton);
            this.groupBox4.Controls.Add(this.textBox3);
            this.groupBox4.Controls.Add(this.textBox2);
            this.groupBox4.Controls.Add(this.label6);
            this.groupBox4.Controls.Add(this.label5);
            this.groupBox4.Controls.Add(this.textBox1);
            this.groupBox4.Controls.Add(this.label4);
            this.groupBox4.Font = new System.Drawing.Font("Palatino Linotype", 9.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.groupBox4.Location = new System.Drawing.Point(371, 250);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(276, 168);
            this.groupBox4.TabIndex = 3;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Adauga cursa";
            // 
            // Adaugabutton
            // 
            this.Adaugabutton.Location = new System.Drawing.Point(127, 136);
            this.Adaugabutton.Name = "Adaugabutton";
            this.Adaugabutton.Size = new System.Drawing.Size(120, 26);
            this.Adaugabutton.TabIndex = 6;
            this.Adaugabutton.Text = "Adauga";
            this.Adaugabutton.UseVisualStyleBackColor = true;
            this.Adaugabutton.Click += new System.EventHandler(this.Adaugabutton_Click);
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(128, 103);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(120, 25);
            this.textBox3.TabIndex = 5;
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(128, 63);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(119, 25);
            this.textBox2.TabIndex = 4;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(10, 106);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(80, 18);
            this.label6.TabIndex = 3;
            this.label6.Text = "Locuri libere";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(13, 63);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(45, 18);
            this.label5.TabIndex = 2;
            this.label5.Text = "Locuri";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(128, 22);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(120, 25);
            this.textBox1.TabIndex = 1;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(13, 25);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(42, 18);
            this.label4.TabIndex = 0;
            this.label4.Text = "Cursa";
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.Stergebutton);
            this.groupBox5.Controls.Add(this.comboBox3);
            this.groupBox5.Controls.Add(this.label7);
            this.groupBox5.Font = new System.Drawing.Font("Palatino Linotype", 9.75F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(238)));
            this.groupBox5.Location = new System.Drawing.Point(7, 418);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(640, 82);
            this.groupBox5.TabIndex = 4;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Sterge cursa";
            // 
            // Stergebutton
            // 
            this.Stergebutton.Location = new System.Drawing.Point(364, 36);
            this.Stergebutton.Name = "Stergebutton";
            this.Stergebutton.Size = new System.Drawing.Size(120, 26);
            this.Stergebutton.TabIndex = 2;
            this.Stergebutton.Text = "Sterge";
            this.Stergebutton.UseVisualStyleBackColor = true;
            this.Stergebutton.Click += new System.EventHandler(this.Stergebutton_Click);
            // 
            // comboBox3
            // 
            this.comboBox3.FormattingEnabled = true;
            this.comboBox3.Location = new System.Drawing.Point(177, 36);
            this.comboBox3.Name = "comboBox3";
            this.comboBox3.Size = new System.Drawing.Size(121, 26);
            this.comboBox3.TabIndex = 1;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(101, 41);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(42, 18);
            this.label7.TabIndex = 0;
            this.label7.Text = "Cursa";
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(224, 35);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(82, 28);
            this.button2.TabIndex = 6;
            this.button2.Text = "Scriere";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Lavender;
            this.ClientSize = new System.Drawing.Size(658, 512);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button Abortbutton;
        private System.Windows.Forms.Button Commitbutton;
        private System.Windows.Forms.Button Beginbutton;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Cursa;
        private System.Windows.Forms.DataGridViewTextBoxColumn nr_locuri;
        private System.Windows.Forms.DataGridViewTextBoxColumn locuri_libere;
        private System.Windows.Forms.Button Vizbutton;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button Rezervabutton;
        private System.Windows.Forms.NumericUpDown numericUpDown1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox comboBox2;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button Adaugabutton;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Button Stergebutton;
        private System.Windows.Forms.ComboBox comboBox3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
    }
}

